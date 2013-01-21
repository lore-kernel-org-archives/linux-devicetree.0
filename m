From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 5/8] libfdt: Add function to find regions in an FDT
Date: Mon, 21 Jan 2013 12:59:19 -0800
Message-ID: <1358801962-21707-6-git-send-email-sjg@chromium.org>
References: <1358801962-21707-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1358801962-21707-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Given a set of nodes and properties, find the regions of the device tree
which describe those parts.

A test is provided which builds a tree while tracking where the regions
should be, then calls fdt_find_regions() to make sure that it agrees.

Further tests will come as part of fdtgrep.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 libfdt/fdt_wip.c     |  311 ++++++++++++++++++++++++++++++++++++++++++++++++
 libfdt/libfdt.h      |  142 ++++++++++++++++++++++
 tests/.gitignore     |    1 +
 tests/Makefile.tests |    3 +-
 tests/region_tree.c  |  324 ++++++++++++++++++++++++++++++++++++++++++++++++++
 tests/run_tests.sh   |    5 +
 6 files changed, 785 insertions(+), 1 deletions(-)
 create mode 100644 tests/region_tree.c

diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
index c5bbb68..ff0f940 100644
--- a/libfdt/fdt_wip.c
+++ b/libfdt/fdt_wip.c
@@ -116,3 +116,314 @@ int fdt_nop_node(void *fdt, int nodeoffset)
 			endoffset - nodeoffset);
 	return 0;
 }
+
+/* Maximum depth that we can grep */
+#define FDT_MAX_DEPTH	32
+
+/* Decribes what we want to include from the current tag */
+enum want_t {
+	WANT_NOTHING,
+	WANT_NODES_ONLY,
+	WANT_NODES_AND_PROPS,
+};
+
+/* Keeps track of the state at parent nodes */
+struct fdt_subnode_stack {
+	int offset;		/* Offset of node */
+	enum want_t want;	/* The 'want' value here */
+	int included;		/* 1 if we included this node, 0 if not */
+};
+
+/* The state of our finding algortihm */
+struct find_reg {
+	struct fdt_subnode_stack stack[FDT_MAX_DEPTH];	/* node stack */
+	struct fdt_region *region;	/* Contains list of regions found */
+	int count;			/* Numnber of regions found */
+	const void *fdt;		/* FDT blob */
+	int max_regions;		/* Maximum regions to find */
+	int can_merge;		/* 1 if we can merge with previous region */
+};
+
+/**
+ * fdt_add_region() - Add a new region to our list
+ *
+ * The region is added if there is space, but in any case we increment the
+ * count. If permitted, and the new region overlaps the last one, we merge
+ * them.
+ *
+ * @info: State information
+ * @offset: Start offset of region
+ * @size: Size of region
+ */
+static void fdt_add_region(struct find_reg *info, int offset, int size)
+{
+	struct fdt_region *reg = &info->region[info->count - 1];
+
+	if (info->can_merge && info->count &&
+			info->count < info->max_regions &&
+			offset <= reg->offset + reg->size) {
+		reg->size = offset + size - reg->offset;
+	} else if (info->count < info->max_regions) {
+		reg++;
+		reg->offset = offset;
+		reg->size = size;
+		info->count++;
+	}
+}
+
+/**
+ * fdt_include_supernodes() - Include supernodes required by this node
+ *
+ * When we decided to include a node or property which is not at the top
+ * level, this function forces the inclusion of higher level nodes. For
+ * example, given this tree:
+ *
+ * / {
+ *     testing {
+ *     }
+ * }
+ *
+ * If we decide to include testing then we need the root node to have a valid
+ * tree. This function adds those regions.
+ *
+ * @info: State information
+ * @depth: Current stack depth
+ */
+static void fdt_include_supernodes(struct find_reg *info, int depth)
+{
+	int base = fdt_off_dt_struct(info->fdt);
+	int start, stop_at;
+	int i;
+
+	/*
+	 * Work down the stack looking for supernodes that we didn't include.
+	 * The algortihm here is actually pretty simple, since we know that
+	 * no previous subnode had to include these nodes, or if it did, we
+	 * marked them as included (on the stack) already.
+	 */
+	for (i = 0; i <= depth; i++) {
+		if (!info->stack[i].included) {
+			start = info->stack[i].offset;
+
+			/* Add the FDT_BEGIN_NODE tag of this supernode */
+			fdt_next_tag(info->fdt, start, &stop_at);
+			fdt_add_region(info, base + start, stop_at - start);
+
+			/* Remember that this supernode is now included */
+			info->stack[i].included = 1;
+			info->can_merge = 1;
+		}
+
+		/* Force (later) generation of the FDT_END_NODE tag */
+		if (!info->stack[i].want)
+			info->stack[i].want = WANT_NODES_ONLY;
+	}
+}
+
+int fdt_find_regions(const void *fdt,
+		int (*h_include)(void *priv, int type, const char *data,
+			int size),
+		void *priv,
+		struct fdt_region region[], int max_regions,
+		char *path, int path_len, int flags)
+{
+	int base = fdt_off_dt_struct(fdt);
+	struct find_reg info;
+	int nextoffset;
+	int start = -1;
+	int depth = -1;
+	const char *str;
+	enum want_t want = WANT_NOTHING;
+	uint32_t tag;
+	char *end;
+
+	/* Set up our state */
+	info.fdt = fdt;
+	info.can_merge = 1;
+	info.count = 0;
+	info.region = region;
+	info.max_regions = max_regions;
+
+	/* Add the memory reserve map into its own region */
+	if (flags & FDT_REG_ADD_MEM_RSVMAP) {
+		fdt_add_region(&info, fdt_off_mem_rsvmap(fdt),
+			fdt_off_dt_struct(fdt) - fdt_off_mem_rsvmap(fdt));
+		info.can_merge = 0;	/* Don't allow merging with this */
+	}
+
+	end = path;
+	*end = '\0';
+	nextoffset = 0;
+
+	/*
+	 * Work through the tags one by one, deciding whether each needs to
+	 * be included or not. We set the variable 'include' to indicate our
+	 * decision. 'want' is used to track what we want to include - it
+	 * allows us to pick up all the properties (and/or subnode tags) of
+	 * a node.
+	 */
+	do {
+		const struct fdt_property *prop;
+		const char *name;
+		int include = 0;
+		int stop_at = 0;
+		int offset;
+		int val;
+		int len;
+
+		/*
+		 * Find the tag, and the offset of the next one. If we need to
+		 * stop including tags, then by default we stop *after*
+		 * including the current tag
+		 */
+		offset = nextoffset;
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+		stop_at = nextoffset;
+
+		switch (tag) {
+		case FDT_PROP:
+			stop_at = offset;
+			prop = fdt_get_property_by_offset(fdt, offset, NULL);
+			str = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
+			val = h_include(priv, FDT_IS_PROP, str,
+					    strlen(str) + 1);
+			if (val == -1) {
+				include = want == WANT_NODES_AND_PROPS;
+			} else {
+				include = val;
+				/*
+				 * Make sure we include the } for this block.
+				 * It might be more correct to put this done
+				 * by the call to fdt_include_supernodes() in
+				 * the case where it adds the node we are
+				 * currently in, but this is fairly
+				 * equivalent.
+				 */
+				if ((flags & FDT_REG_SUPERNODES) && val &&
+						!want)
+					want = WANT_NODES_ONLY;
+			}
+
+			/* Value grepping is not yet supported */
+			break;
+
+		case FDT_NOP:
+			include = want == WANT_NODES_AND_PROPS;
+			stop_at = offset;
+			break;
+
+		case FDT_BEGIN_NODE:
+			depth++;
+			if (depth == FDT_MAX_DEPTH)
+				return -FDT_ERR_BADSTRUCTURE;
+			name = fdt_get_name(fdt, offset, &len);
+			if (end - path + 2 + len >= path_len)
+				return -FDT_ERR_NOSPACE;
+
+			/* Build the full path of this node */
+			if (end != path + 1)
+				*end++ = '/';
+			strcpy(end, name);
+			end += len;
+			info.stack[depth].want = want;
+			info.stack[depth].offset = offset;
+
+			/*
+			 * If we are not intending to include this node, make
+			 * sure we stop *before* its tag
+			 */
+			if (want == WANT_NODES_ONLY ||
+					!(flags & FDT_REG_DIRECT_SUBNODES)) {
+				stop_at = offset;
+				want = WANT_NOTHING;
+			}
+			val = h_include(priv, FDT_IS_NODE, path,
+					end - path + 1);
+
+			/*
+			 * If no information about this, try the compatible
+			 * property. Here we are looking ahead in the tree.
+			 */
+			if (val == -1) {
+				str = fdt_getprop(fdt, offset,
+						  "compatible", &len);
+				val = h_include(priv, FDT_IS_COMPAT, str,
+						    len);
+			}
+
+			/* Include this if requested */
+			if (val)
+				want = WANT_NODES_AND_PROPS;
+
+			/* If not requested, decay our 'want' value */
+			else if (want)
+				want--;
+
+			/* Not including this tag, so stop now */
+			else
+				stop_at = offset;
+
+			/*
+			 * Decide whether to include this tag, and update our
+			 * stack with the state for this node
+			 */
+			include = want;
+			info.stack[depth].included = include;
+			break;
+
+		case FDT_END_NODE:
+			include = want;
+			if (depth < 0)
+				return -FDT_ERR_BADSTRUCTURE;
+
+			/*
+			 * If we don't want this node, stop right away, unless
+			 * we are including subnodes
+			 */
+			if (!want && !(flags & FDT_REG_DIRECT_SUBNODES))
+				stop_at = offset;
+			want = info.stack[depth].want;
+			depth--;
+			while (end > path && *--end != '/')
+				;
+			*end = '\0';
+			break;
+
+		case FDT_END:
+			/* We always include the end tag */
+			include = 1;
+			break;
+		}
+
+		/* If this tag is to be included, mark it as region start */
+		if (include && start == -1) {
+			/* Include any supernodes required by this one */
+			if (flags & FDT_REG_SUPERNODES)
+				fdt_include_supernodes(&info, depth);
+			start = offset;
+		}
+
+		/*
+		 * If this tag is not to be included, finish up the current
+		 * region
+		 */
+		if (!include && start != -1) {
+			fdt_add_region(&info, base + start, stop_at - start);
+			start = -1;
+			info.can_merge = 1;
+		}
+	} while (tag != FDT_END);
+
+	if (nextoffset != fdt_size_dt_struct(fdt))
+		return -FDT_ERR_BADLAYOUT;
+
+	/* Add a region for the END tag and a separate one for string table */
+	fdt_add_region(&info, base + start, nextoffset - start);
+	if (flags & FDT_REG_ADD_STRING_TAB) {
+		info.can_merge = 0;
+		fdt_add_region(&info, fdt_off_dt_strings(fdt),
+			       fdt_size_dt_strings(fdt));
+	}
+
+	return info.count;
+}
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index c0075e7..0b3eacf 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -1489,4 +1489,146 @@ int fdt_del_node(void *fdt, int nodeoffset);
 
 const char *fdt_strerror(int errval);
 
+struct fdt_region {
+	int offset;
+	int size;
+};
+
+/*
+ * Flags for fdt_find_regions()
+ *
+ * Add a region for the string table (always the last region)
+ */
+#define FDT_REG_ADD_STRING_TAB		(1 << 0)
+
+/* Add the FDT_BEGIN_NODE tags of subnodes, including their names */
+#define FDT_REG_DIRECT_SUBNODES	(1 << 1)
+
+/*
+ * Add all supernodes of a matching node/property, useful for creating a
+ * valid subset tree
+ */
+#define FDT_REG_SUPERNODES		(1 << 2)
+
+/* Add a region for the mem_rsvmap table (always the first region) */
+#define FDT_REG_ADD_MEM_RSVMAP		(1 << 3)
+
+/* Indicates what an fdt part is (node, property, value, compatible) */
+#define FDT_IS_NODE			(1 << 0)
+#define FDT_IS_PROP			(1 << 1)
+#define FDT_IS_VALUE			(1 << 2)	/* not supported */
+#define FDT_IS_COMPAT			(1 << 3)
+
+#define FDT_IS_ANY			15
+
+/**
+ * fdt_find_regions() - find regions in device tree
+ *
+ * Given a nodes and properties to include and properties to exclude, find
+ * the regions of the device tree which describe those included parts.
+ *
+ * The use for this function is twofold. Firstly it provides a convenient
+ * way of performing a structure-aware grep of the tree. For example it is
+ * possible to grep for a node and get all the properties associated with
+ * that node. Trees can be subsetted easily, by specifying the nodes that
+ * are required, and then writing out the regions returned by this function.
+ * This is useful for small resource-constrained systems, such as boot
+ * loaders, which want to use an FDT but do not need to know about all of
+ * it.
+ *
+ * Secondly it makes it easy to hash parts of the tree and detect changes.
+ * The intent is to get a list of regions which will be invariant provided
+ * those parts are invariant. For example, if you request a list of regions
+ * for all nodes but exclude the property "data", then you will get the
+ * same region contents regardless of any change to "data" properties.
+ *
+ * This function can be used to produce a byte-stream to send to a hashing
+ * function to verify that critical parts of the FDT have not changed.
+ *
+ * The nodes/properties to include/exclude are defined by a function
+ * provided by the caller. This function is called for each node and
+ * property, and must return:
+ *
+ *    0 - to exclude this part
+ *    1 - to include this part
+ *   -1 - if no information is available
+ *
+ * For nodes, the function may be called twice, once with FDT_IS_NODE to check
+ * the node name. If this returns -1 then the function is immediately called
+ * again with FDT_IS_COMPAT to check the compatible string. Note that if
+ * there is no compatible string, then data == NULL and size == 0. This means
+ * that the inclusion of a node can be controlled either by a node name or
+ * its compatible string.
+ *
+ * There is no special handling of unit addresses, so the entire name must
+ * be given for nodes. Wildcards are not supported.
+ *
+ * As an example, including node "/" means to include the root node and all
+ * root properties. A flag provides a way of also including supernodes (of
+ * which there is none for the root node), and another flag includes
+ * immediate subnodes, so in this case we would get the FDT_BEGIN_NODE and
+ * FDT_END_NODE of all subnodes of /.
+ *
+ * The subnode feature helps in a hashing situation since it prevents the
+ * root node from changing at all. Any change to non-excluded properties,
+ * names of subnodes or number of subnodes would be detected.
+ *
+ * When used with FITs this provides the ability to hash and sign parts of
+ * the FIT based on different configurations in the FIT. Then it is
+ * impossible to change anything about that configuration (include images
+ * attached to the configuration), but it may be possible to add new
+ * configurations, new images or new signatures within the existing
+ * framework.
+ *
+ * Adding new properties to a device tree may result in the string table
+ * being extended (if the new property names are different from those
+ * already added). This function can optionally include a region for
+ * the string table so that this can be part of the hash too. This is always
+ * the last region.
+ *
+ * The FDT also has a mem_rsvmap table which can also be included, and is
+ * always the first region if so.
+ *
+ * The device tree header is not included in the region list. Since the
+ * contents of the FDT are changing (shrinking, often), the caller will need
+ * to regenerate the header anyway.
+ *
+ * @fdt:	Device tree to check
+ * @h_include:	Function to call to determine whether to include a part or
+ *		not:
+ *
+ *		@priv: Private pointer as passed to fdt_find_regions()
+ *		@type: Type of this part, FDT_IS_...
+ *		@data: Pointer to data (node name, property name, compatible
+ *			string, value (not yet supported)
+ *		@size: Size of data, or 0 if none
+ *		@return 0 to exclude, 1 to include, -1 if no information is
+ *		available
+ * @priv:	Private pointer passed to h_include
+ * @region:	Returns list of regions, sorted by offset
+ * @max_regions: Maximum length of region list
+ * @path:	Pointer to a temporary string for the function to use for
+ *		building path names
+ * @path_len:	Length of path, must be large enough to hold the longest
+ *		path in the tree
+ * @flags:	Various flags that control the region algortihm, see
+ *		FDT_REG_...
+ * @return number of regions in list. If this is >max_regions then the
+ * region array was exhausted. You should increase max_regions and try
+ * the call again. Only the first max_regions elements are available in the
+ * array.
+ *
+ * On error a -ve value is return, which can be:
+ *
+ *	-FDT_ERR_BADSTRUCTURE (too deep or more END tags than BEGIN tags
+ *	-FDT_ERR_BADLAYOUT
+ *	-FDT_ERR_NOSPACE (path area is too small)
+ */
+int fdt_find_regions(const void *fdt,
+		     int (*h_include)(void *priv, int type, const char *data,
+				      int size),
+		     void *priv,
+		     struct fdt_region region[], int max_regions,
+		     char *path, int path_len, int flags);
+
 #endif /* _LIBFDT_H */
diff --git a/tests/.gitignore b/tests/.gitignore
index e2aa24a..ecac691 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -41,6 +41,7 @@ tmp.*
 /phandle_format
 /propname_escapes
 /references
+/region_tree
 /root_node
 /rw_tree1
 /set_name
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index d59bff8..10bbf1b 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -20,7 +20,8 @@ LIB_TESTS_L = get_mem_rsv \
 	dtb_reverse dtbs_equal_unordered \
 	add_subnode_with_nops path_offset_aliases \
 	utilfdt_test \
-	integer-expressions
+	integer-expressions \
+	region_tree
 LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREFIX)%)
 
 LIBTREE_TESTS_L = truncated_property
diff --git a/tests/region_tree.c b/tests/region_tree.c
new file mode 100644
index 0000000..7a5f09b
--- /dev/null
+++ b/tests/region_tree.c
@@ -0,0 +1,324 @@
+/*
+ * hash_tree - Testcase for fdt_find_regions()
+ *
+ * Copyright (c) 2013, Google Inc.
+ *
+ * Copyright (C) 2006 David Gibson, IBM Corporation.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public License
+ * as published by the Free Software Foundation; either version 2.1 of
+ * the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ */
+
+#include <ctype.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <libfdt_env.h>
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "tests.h"
+#include "testdata.h"
+
+#define SPACE	65536
+
+#define CHECK(code) \
+	{ \
+		err = (code); \
+		if (err) \
+			FAIL(#code ": %s", fdt_strerror(err)); \
+	}
+
+/*
+ * Regions we expect to see returned from fdt_find_regions(). We build up a
+ * list of these as we make the tree, then check the results of
+ * fdt_find_regions() once we are done.
+ */
+static struct fdt_region expect[20];
+
+/* Number of expected regions */
+int expect_count;
+
+/* Mark the start of a new region */
+static void start(void *fdt)
+{
+	expect[expect_count].offset = fdt_size_dt_struct(fdt);
+	verbose_printf("[%d: %x ", expect_count,
+	       fdt_off_dt_struct(fdt) + expect[expect_count].offset);
+}
+
+/* Mark the end of a region */
+static void stop(void *fdt)
+{
+	expect[expect_count].size = fdt_size_dt_struct(fdt) -
+			expect[expect_count].offset;
+	expect[expect_count].offset += fdt_off_dt_struct(fdt);
+	verbose_printf("%x]\n", expect[expect_count].offset +
+			expect[expect_count].size);
+	expect_count++;
+}
+
+/**
+ * build_tree() - Build a tree
+ *
+ * @fdt:	Pointer to place to put tree, assumed to be large enough
+ * @flags:	Flags to control the tree creation (FDT_REG_...)
+ * @space:	Amount of space to create for later tree additions
+ *
+ * This creates a tree modelled on a U-Boot FIT image, with various nodes
+ * and properties which are useful for testing the hashing features of
+ * fdt_find_regions().
+ */
+static void build_tree(void *fdt, int flags, int space)
+{
+	int direct_subnodes = flags & FDT_REG_DIRECT_SUBNODES;
+	int supernodes = flags & FDT_REG_SUPERNODES;
+	int either = direct_subnodes || supernodes;
+	int err;
+
+	CHECK(fdt_create(fdt, SPACE));
+
+	CHECK(fdt_add_reservemap_entry(fdt, TEST_ADDR_1, TEST_SIZE_1));
+	CHECK(fdt_add_reservemap_entry(fdt, TEST_ADDR_2, TEST_SIZE_2));
+	CHECK(fdt_finish_reservemap(fdt));
+
+	start(fdt);	/* region 0 */
+	CHECK(fdt_begin_node(fdt, ""));
+	CHECK(fdt_property_string(fdt, "description", "kernel image"));
+	CHECK(fdt_property_u32(fdt, "#address-cells", 1));
+
+	/* /images */
+	if (!either)
+		stop(fdt);
+	CHECK(fdt_begin_node(fdt, "images"));
+	if (either)
+		stop(fdt);
+	CHECK(fdt_property_u32(fdt, "image-prop", 1));
+
+	/* /images/kernel@1 */
+	start(fdt);	/* region 1 */
+	CHECK(fdt_begin_node(fdt, "kernel@1"));
+	CHECK(fdt_property_string(fdt, "description", "exynos kernel"));
+	stop(fdt);
+	CHECK(fdt_property_string(fdt, "data", "this is the kernel image"));
+	start(fdt);	/* region 2 */
+
+	/* /images/kernel/hash@1 */
+	CHECK(fdt_begin_node(fdt, "hash@1"));
+	CHECK(fdt_property_string(fdt, "algo", "sha1"));
+	CHECK(fdt_end_node(fdt));
+
+	/* /images/kernel/hash@2 */
+	if (!direct_subnodes)
+		stop(fdt);
+	CHECK(fdt_begin_node(fdt, "hash@2"));
+	if (direct_subnodes)
+		stop(fdt);
+	CHECK(fdt_property_string(fdt, "algo", "sha1"));
+	if (direct_subnodes)
+		start(fdt);	/* region 3 */
+	CHECK(fdt_end_node(fdt));
+	if (!direct_subnodes)
+		start(fdt);	/* region 3 */
+
+	CHECK(fdt_end_node(fdt));
+
+	/* /images/fdt@1 */
+	CHECK(fdt_begin_node(fdt, "fdt@1"));
+	CHECK(fdt_property_string(fdt, "description", "snow FDT"));
+	stop(fdt);
+	CHECK(fdt_property_string(fdt, "data", "FDT data"));
+	start(fdt);	/* region 4 */
+
+	/* /images/kernel/hash@1 */
+	CHECK(fdt_begin_node(fdt, "hash@1"));
+	CHECK(fdt_property_string(fdt, "algo", "sha1"));
+	CHECK(fdt_end_node(fdt));
+
+	CHECK(fdt_end_node(fdt));
+
+	if (!either)
+		stop(fdt);
+	CHECK(fdt_end_node(fdt));
+
+	/* /configurations */
+	CHECK(fdt_begin_node(fdt, "configurations"));
+	if (either)
+		stop(fdt);
+	CHECK(fdt_property_string(fdt, "default", "conf@1"));
+
+	/* /configurations/conf@1 */
+	start(fdt);	/* region 6 */
+	CHECK(fdt_begin_node(fdt, "conf@1"));
+	CHECK(fdt_property_string(fdt, "kernel", "kernel@1"));
+	CHECK(fdt_property_string(fdt, "fdt", "fdt@1"));
+	CHECK(fdt_end_node(fdt));
+	stop(fdt);
+
+	/* /configurations/conf@2 */
+	CHECK(fdt_begin_node(fdt, "conf@2"));
+	CHECK(fdt_property_string(fdt, "kernel", "kernel@1"));
+	CHECK(fdt_property_string(fdt, "fdt", "fdt@2"));
+	CHECK(fdt_end_node(fdt));
+
+	if (either)
+		start(fdt);	/* region 7 */
+	CHECK(fdt_end_node(fdt));
+	if (!either)
+		start(fdt);	/* region 7 */
+
+	CHECK(fdt_end_node(fdt));
+
+	CHECK(fdt_finish(fdt));
+	stop(fdt);
+
+	/* Add in the strings */
+	if (flags & FDT_REG_ADD_STRING_TAB) {
+		expect[expect_count].offset = fdt_off_dt_strings(fdt);
+		expect[expect_count].size = fdt_size_dt_strings(fdt);
+		expect_count++;
+	}
+
+	/* Make a bit of space */
+	if (space)
+		CHECK(fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + space));
+
+	verbose_printf("Completed tree, totalsize = %d\n", fdt_totalsize(fdt));
+}
+
+/**
+ * strlist_contains() - Returns 1 if a string is contained in a list
+ *
+ * @list:	List of strings
+ * @count:	Number of strings in list
+ * @str:	String to search for
+ */
+static int strlist_contains(const char * const list[], int count,
+			    const char *str)
+{
+	int i;
+
+	for (i = 0; i < count; i++)
+		if (!strcmp(list[i], str))
+			return 1;
+
+	return 0;
+}
+
+/**
+ * h_include() - Our include handler for fdt_find_regions()
+ *
+ * This is very simple - we have a list of nodes we are looking for, and
+ * one property that we want to exclude.
+ */
+static int h_include(void *priv, int type, const char *data, int size)
+{
+	const char * const inc[] = {
+		"/",
+		"/images/kernel@1",
+		"/images/fdt@1",
+		"/configurations/conf@1",
+		"/images/kernel@1/hash@1",
+		"/images/fdt@1/hash@1",
+	};
+
+	switch (type) {
+	case FDT_IS_NODE:
+		return strlist_contains(inc, 6, data);
+	case FDT_IS_PROP:
+		return !strcmp(data, "data") ? 0 : -1;
+	}
+
+	return 0;
+}
+
+/**
+ * check_regions() - Check that the regions are as we expect
+ *
+ * Call fdt_find_regions() and check that the results are as we expect them,
+ * matching the list of expected regions we created at the same time as
+ * the tree.
+ *
+ * @fdt:	Pointer to device tree to check
+ * @flags:	Flags value (FDT_REG_...)
+ * @return 0 if ok, -1 on failure
+ */
+static int check_regions(const void *fdt, int flags)
+{
+	int count;
+	struct fdt_region region[20];
+	char path[1024];
+	int ret = 0;
+	int i;
+
+	count = fdt_find_regions(fdt, h_include, NULL, region,
+				 ARRAY_SIZE(region), path, sizeof(path),
+				 flags);
+	verbose_printf("Regions: %d\n", count);
+	for (i = 0; i < count; i++) {
+		struct fdt_region *reg = &region[i];
+		struct fdt_region *exp = &expect[i];
+
+		verbose_printf("%d:  %-10x  %-10x\n", i, reg->offset,
+		       reg->offset + reg->size);
+		if (memcmp(exp, reg, sizeof(*reg))) {
+			ret = -1;
+			verbose_printf("exp: %-10x  %-10x\n", exp->offset,
+				exp->offset + exp->size);
+		}
+	}
+
+	return ret;
+}
+
+int main(int argc, char *argv[])
+{
+	const char *fname = NULL;
+	int flags = 0;
+	int space = 0;
+	void *fdt;
+
+	test_init(argc, argv);
+	if (argc < 2) {
+		verbose_printf("Usage: %s <flag value> [<space>]"
+				" [<output_fname.dtb>]", argv[0]);
+		FAIL();
+	}
+	flags = atoi(argv[1]);
+	if (argc >= 3)
+		space = atoi(argv[2]);
+	if (argc >= 4)
+		fname = argv[3];
+
+	/*
+	 * Allocate space for the tree and build it, creating a list of
+	 * expected regions.
+	 */
+	fdt = xmalloc(SPACE);
+	build_tree(fdt, flags, space);
+
+	/* Write the tree out if required */
+	if (fname)
+		save_blob(fname, fdt);
+
+	/* Check the regions are what we expect */
+	if (check_regions(fdt, flags))
+		FAIL();
+	else
+		PASS();
+
+	return 0;
+}
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index e04512c..59b6055 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -246,6 +246,11 @@ libfdt_tests () {
 
     # Specific bug tests
     run_test add_subnode_with_nops
+
+    # Tests for fdt_find_regions()
+    for flags in 0 1 2 3 4 5 6 7; do
+	run_test region_tree ${flags}
+    done
 }
 
 dtc_tests () {
-- 
1.7.7.3
