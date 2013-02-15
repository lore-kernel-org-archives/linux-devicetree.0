From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 1/3] libfdt: Add function to find regions in an FDT
Date: Fri, 15 Feb 2013 14:49:36 -0800
Message-ID: <1360968578-18443-2-git-send-email-sjg@chromium.org>
References: <1360968578-18443-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1360968578-18443-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
should be, then calls fdt_first/next_region() to make sure that it agrees.

Further tests will come as part of fdtgrep.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Move region code to separate fdt_region.c file
- Fix info->count <= info->max_regions in fdt_add_region() merge case
- Add new FDT_ERR_TOODEEP error type and use it
- Change returned error from BADLAYOUT to BADSTRUCTURE
- Return FDT_ERR_BADLAYOUT error if strings block is before structure block
- Add note that changes in node/property order can cause false hash misses
- Add more comments about the -1 return value from h_include
- Drop FDT_IS_COMPAT and pass node offset to h_include function
- Drop stale comment about names / wildcards
- Move to a model with fdt_first_region()/fdt_next_region()
- Add long comment explaining theory of operation

 libfdt/Makefile.libfdt |   3 +-
 libfdt/fdt_region.c    | 452 +++++++++++++++++++++++++++++++++++++++++++++++++
 libfdt/libfdt.h        | 213 ++++++++++++++++++++++-
 tests/.gitignore       |   1 +
 tests/Makefile.tests   |   3 +-
 tests/region_tree.c    | 336 ++++++++++++++++++++++++++++++++++++
 tests/run_tests.sh     |   5 +
 7 files changed, 1010 insertions(+), 3 deletions(-)
 create mode 100644 libfdt/fdt_region.c
 create mode 100644 tests/region_tree.c

diff --git a/libfdt/Makefile.libfdt b/libfdt/Makefile.libfdt
index 91126c0..84769a4 100644
--- a/libfdt/Makefile.libfdt
+++ b/libfdt/Makefile.libfdt
@@ -6,5 +6,6 @@
 LIBFDT_soname = libfdt.$(SHAREDLIB_EXT).1
 LIBFDT_INCLUDES = fdt.h libfdt.h libfdt_env.h
 LIBFDT_VERSION = version.lds
-LIBFDT_SRCS = fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_rw.c fdt_strerror.c fdt_empty_tree.c
+LIBFDT_SRCS = fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_region.c
+LIBFDT_SRCS += fdt_rw.c fdt_strerror.c fdt_empty_tree.c
 LIBFDT_OBJS = $(LIBFDT_SRCS:%.c=%.o)
diff --git a/libfdt/fdt_region.c b/libfdt/fdt_region.c
new file mode 100644
index 0000000..a830526
--- /dev/null
+++ b/libfdt/fdt_region.c
@@ -0,0 +1,452 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ * Copyright (C) 2013 Google, Inc
+ *
+ * libfdt is dual licensed: you can use it either under the terms of
+ * the GPL, or the BSD license, at your option.
+ *
+ *  a) This library is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This library is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ *     You should have received a copy of the GNU General Public
+ *     License along with this library; if not, write to the Free
+ *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
+ *     MA 02110-1301 USA
+ *
+ * Alternatively,
+ *
+ *  b) Redistribution and use in source and binary forms, with or
+ *     without modification, are permitted provided that the following
+ *     conditions are met:
+ *
+ *     1. Redistributions of source code must retain the above
+ *        copyright notice, this list of conditions and the following
+ *        disclaimer.
+ *     2. Redistributions in binary form must reproduce the above
+ *        copyright notice, this list of conditions and the following
+ *        disclaimer in the documentation and/or other materials
+ *        provided with the distribution.
+ *
+ *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
+ *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
+ *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+ *     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+ *     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
+ *     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ *     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
+ *     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+ *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+ *     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ *     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
+ *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
+ *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include "libfdt_env.h"
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "libfdt_internal.h"
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
+static int fdt_add_region(struct fdt_region_state *info, int offset, int size)
+{
+	struct fdt_region *reg = &info->region[info->count - 1];
+
+	if (info->can_merge && info->count &&
+			info->count <= info->max_regions &&
+			offset <= reg->offset + reg->size) {
+		reg->size = offset + size - reg->offset;
+	} else if (info->count++ < info->max_regions) {
+		reg++;
+		reg->offset = offset;
+		reg->size = size;
+	} else {
+		return -1;
+	}
+
+	return 0;
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
+static int fdt_include_supernodes(struct fdt_region_state *info, int depth)
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
+			if (fdt_add_region(info, base + start,
+					stop_at - start))
+				return -1;
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
+
+	return 0;
+}
+
+enum {
+	FDT_DONE_NOTHING,
+	FDT_DONE_MEM_RSVMAP,
+	FDT_DONE_STRUCT,
+	FDT_DONE_END,
+	FDT_DONE_STRINGS,
+	FDT_DONE_ALL,
+};
+
+int fdt_first_region(const void *fdt,
+		int (*h_include)(void *priv, const void *fdt, int offset,
+				 int type, const char *data, int size),
+		void *priv, struct fdt_region *region,
+		char *path, int path_len, int flags,
+		struct fdt_region_state *info)
+{
+	struct fdt_region_ptrs *p = &info->ptrs;
+
+	/* Set up our state */
+	info->fdt = fdt;
+	info->can_merge = 1;
+	info->max_regions = 1;
+	info->start = -1;
+	p->want = WANT_NOTHING;
+	p->end = path;
+	*p->end = '\0';
+	p->nextoffset = 0;
+	p->depth = -1;
+	p->done = FDT_DONE_NOTHING;
+
+	return fdt_next_region(fdt, h_include, priv, region,
+			       path, path_len, flags, info);
+}
+
+/*
+ * Theory of operation
+ *
+ *
+ *
+
+Note: in this description 'included' means that a node (or other part of
+the tree) should be included in the region list, i.e. it will have a region
+which covers its part of the tree.
+
+This function maintains some state from the last time it is called. It
+checks the next part of the tree that it is supposed to look at
+(p.nextoffset) to see if that should be included or not. When it finds
+something to include, it sets info->start to its offset. This marks the
+start of the region we want to include.
+
+Once info->start is set to the start (i.e. not -1), we continue scanning
+until we find something that we don't want included. This will be the end
+of a region. At this point we can close off the region and add it to the
+list. So we do so, and reset info->start to -1.
+
+One complication here is that we want to merge regions. So when we come to
+add another region later, we may in fact merge it with the previous one if
+one ends where the other starts.
+
+The function fdt_add_region() will return -1 if it fails to add the region,
+because we already have a region ready to be returned, and the new one
+cannot be merged in with it. In this case, we must return the region we
+found, and wait for another call to this function. When it comes, we will
+repeat the processing of the tag and again try to add a region. This time it
+will succeed.
+
+The current state of the pointers (stack, offset, etc.) is maintained in
+a ptrs member. At the start of every loop iteration we make a copy of it.
+The copy is then updated as the tag is processed. Only if we get to the end
+of the loop iteration (and successfully call fdt_add_region() if we need
+to) can we commit the changes we have made to these pointers. For example,
+if we see an FDT_END_NODE tag we will decrement the depth value. But if we
+need to add a region for this tag (let's say because the previous tag is
+included and this FDT_END_NODE tag is not included) then we will only commit
+the result if we were able to add the region. That allows us to retry again
+next time.
+
+We keep track of a variable called 'want' which tells us what we want to
+include when there is no specific information provided by the h_include
+function for a particular property. This basically handles the inclusion of
+properties which are pulled in by virtue of the node they are in. So if you
+include a node, its properties are also included. In this case 'want' will
+be WANT_NODES_AND_PROPS. The FDT_REG_DIRECT_SUBNODES feature also makes use
+of 'want'. While we are inside the subnode, 'want' will be set to
+WANT_NODES_ONLY, so that only the subnode's FDT_BEGIN_NODE and FDT_END_NODE
+tags will be included, and properties will be skipped. If WANT_NOTHING is
+selected, then we will just rely on what the h_include() function tells us.
+
+Using 'want' we work out 'include', which tells us whether this current tag
+should be included or not. As you can imagine, if the value of 'include'
+changes, that means we are on a boundary between nodes to include and nodes
+to exclude. At this point we either close off a previous region and add it
+to the list, or mark the start of a new region.
+
+Apart from the nodes, we have mem_rsvmap, the FDT_END tag and the string
+list. Each of these dealt with as a whole (i.e. we create a region for each
+if it is to be included). For mem_rsvmap we don't allow it to merge with
+the first struct region. For the stringlist we don't allow it to merge with
+the last struct region (which contains at minimum the FDT_END tag).
+*/
+int fdt_next_region(const void *fdt,
+		int (*h_include)(void *priv, const void *fdt, int offset,
+				 int type, const char *data, int size),
+		void *priv, struct fdt_region *region,
+		char *path, int path_len, int flags,
+		struct fdt_region_state *info)
+{
+	int base = fdt_off_dt_struct(fdt);
+	const char *str;
+
+	info->region = region;
+	info->count = 0;
+	if (info->ptrs.done < FDT_DONE_MEM_RSVMAP &&
+			(flags & FDT_REG_ADD_MEM_RSVMAP)) {
+		/* Add the memory reserve map into its own region */
+		if (fdt_add_region(info, fdt_off_mem_rsvmap(fdt),
+		    fdt_off_dt_struct(fdt) - fdt_off_mem_rsvmap(fdt)))
+			return 0;
+		info->can_merge = 0;	/* Don't allow merging with this */
+		info->ptrs.done = FDT_DONE_MEM_RSVMAP;
+	}
+
+	/*
+	 * Work through the tags one by one, deciding whether each needs to
+	 * be included or not. We set the variable 'include' to indicate our
+	 * decision. 'want' is used to track what we want to include - it
+	 * allows us to pick up all the properties (and/or subnode tags) of
+	 * a node.
+	 */
+	while (info->ptrs.done < FDT_DONE_STRUCT) {
+		const struct fdt_property *prop;
+		struct fdt_region_ptrs p;
+		const char *name;
+		int include = 0;
+		int stop_at = 0;
+		uint32_t tag;
+		int offset;
+		int val;
+		int len;
+
+		/*
+		 * Make a copy of our pointers. If we make it to the end of
+		 * this block then we will commit them back to info->ptrs.
+		 * Otherwise we can try again from the same starting state
+		 * next time we are called.
+		 */
+		p = info->ptrs;
+
+		/*
+		 * Find the tag, and the offset of the next one. If we need to
+		 * stop including tags, then by default we stop *after*
+		 * including the current tag
+		 */
+		offset = p.nextoffset;
+		tag = fdt_next_tag(fdt, offset, &p.nextoffset);
+		stop_at = p.nextoffset;
+
+		switch (tag) {
+		case FDT_PROP:
+			stop_at = offset;
+			prop = fdt_get_property_by_offset(fdt, offset, NULL);
+			str = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
+			val = h_include(priv, fdt, offset, FDT_IS_PROP, str,
+					    strlen(str) + 1);
+			if (val == -1) {
+				include = p.want == WANT_NODES_AND_PROPS;
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
+						!p.want)
+					p.want = WANT_NODES_ONLY;
+			}
+
+			/* Value grepping is not yet supported */
+			break;
+
+		case FDT_NOP:
+			include = p.want == WANT_NODES_AND_PROPS;
+			stop_at = offset;
+			break;
+
+		case FDT_BEGIN_NODE:
+			p.depth++;
+			if (p.depth == FDT_MAX_DEPTH)
+				return -FDT_ERR_TOODEEP;
+			name = fdt_get_name(fdt, offset, &len);
+			if (p.end - path + 2 + len >= path_len)
+				return -FDT_ERR_NOSPACE;
+
+			/* Build the full path of this node */
+			if (p.end != path + 1)
+				*p.end++ = '/';
+			strcpy(p.end, name);
+			p.end += len;
+			info->stack[p.depth].want = p.want;
+			info->stack[p.depth].offset = offset;
+
+			/*
+			 * If we are not intending to include this node, make
+			 * sure we stop *before* its tag.
+			 */
+			if (p.want == WANT_NODES_ONLY ||
+					!(flags & FDT_REG_DIRECT_SUBNODES)) {
+				stop_at = offset;
+				p.want = WANT_NOTHING;
+			}
+			val = h_include(priv, fdt, offset, FDT_IS_NODE, path,
+					p.end - path + 1);
+
+			/* Include this if requested */
+			if (val)
+				p.want = WANT_NODES_AND_PROPS;
+
+			/* If not requested, decay our 'p.want' value */
+			else if (p.want)
+				p.want--;
+
+			/* Not including this tag, so stop now */
+			else
+				stop_at = offset;
+
+			/*
+			 * Decide whether to include this tag, and update our
+			 * stack with the state for this node
+			 */
+			include = p.want;
+			info->stack[p.depth].included = include;
+			break;
+
+		case FDT_END_NODE:
+			include = p.want;
+			if (p.depth < 0)
+				return -FDT_ERR_BADSTRUCTURE;
+
+			/*
+			 * If we don't p.want this node, stop right away, unless
+			 * we are including subnodes
+			 */
+			if (!p.want && !(flags & FDT_REG_DIRECT_SUBNODES))
+				stop_at = offset;
+			p.want = info->stack[p.depth].want;
+			p.depth--;
+			while (p.end > path && *--p.end != '/')
+				;
+			*p.end = '\0';
+			break;
+
+		case FDT_END:
+			/* We always include the end tag */
+			include = 1;
+			p.done = FDT_DONE_STRUCT;
+			break;
+		}
+
+		/* If this tag is to be included, mark it as region start */
+		if (include && info->start == -1) {
+			/* Include any supernodes required by this one */
+			if (flags & FDT_REG_SUPERNODES) {
+				if (fdt_include_supernodes(info, p.depth))
+					return 0;
+			}
+			info->start = offset;
+		}
+
+		/*
+		 * If this tag is not to be included, finish up the current
+		 * region.
+		 */
+		if (!include && info->start != -1) {
+			if (fdt_add_region(info, base + info->start,
+				       stop_at - info->start))
+				return 0;
+			info->start = -1;
+			info->can_merge = 1;
+		}
+
+		/* If we have made it this far, we can commit our pointers */
+		info->ptrs = p;
+	}
+
+	/* Add a region for the END tag and a separate one for string table */
+	if (info->ptrs.done < FDT_DONE_END) {
+		if (info->ptrs.nextoffset != fdt_size_dt_struct(fdt))
+			return -FDT_ERR_BADSTRUCTURE;
+
+		if (fdt_add_region(info, base + info->start,
+			       info->ptrs.nextoffset - info->start))
+			return 0;
+		info->ptrs.done++;
+	}
+	if (info->ptrs.done < FDT_DONE_STRINGS &&
+			(flags & FDT_REG_ADD_STRING_TAB)) {
+		info->can_merge = 0;
+		if (fdt_off_dt_strings(fdt) < base + info->ptrs.nextoffset)
+			return -FDT_ERR_BADLAYOUT;
+		if (fdt_add_region(info, fdt_off_dt_strings(fdt),
+			       fdt_size_dt_strings(fdt)))
+			return 0;
+		info->ptrs.done++;
+	}
+
+	return info->count > 0 ? 0 : -FDT_ERR_NOTFOUND;
+}
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 130789a..fa62ad6 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -116,7 +116,12 @@
 	 * Should never be returned, if it is, it indicates a bug in
 	 * libfdt itself. */
 
-#define FDT_ERR_MAX		13
+#define FDT_ERR_TOODEEP		14
+	/* FDT_ERR_TOODEEP: The depth of a node has exceeded the internal
+	 * libfdt limit. This can happen if you have more than
+	 * FDT_MAX_DEPTH nested nodes. */
+
+#define FDT_ERR_MAX		14
 
 /**********************************************************************/
 /* Low-level functions (you probably don't need these)                */
@@ -1489,4 +1494,210 @@ int fdt_del_node(void *fdt, int nodeoffset);
 
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
+/* Indicates what an fdt part is (node, property, value) */
+#define FDT_IS_NODE			(1 << 0)
+#define FDT_IS_PROP			(1 << 1)
+#define FDT_IS_VALUE			(1 << 2)	/* not supported */
+#define FDT_IS_COMPAT			(1 << 3)	/* used internally */
+
+#define FDT_IS_ANY			15
+
+/* We set a reasonable limit on the number of nested nodes */
+#define FDT_MAX_DEPTH			32
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
+struct fdt_region_ptrs {
+	int depth;			/* Current tree depth */
+	int done;			/* What we have completed scanning */
+	enum want_t want;		/* What we are currently including */
+	char *end;			/* Pointer to end of full node path */
+	int nextoffset;			/* Next node offset to check */
+};
+
+/* The state of our finding algortihm */
+struct fdt_region_state {
+	struct fdt_subnode_stack stack[FDT_MAX_DEPTH];	/* node stack */
+	struct fdt_region *region;	/* Contains list of regions found */
+	int count;			/* Numnber of regions found */
+	const void *fdt;		/* FDT blob */
+	int max_regions;		/* Maximum regions to find */
+	int can_merge;		/* 1 if we can merge with previous region */
+	int start;			/* Start position of current region */
+	struct fdt_region_ptrs ptrs;	/* Pointers for what we are up to */
+};
+
+/**
+ * fdt_first_region() - find regions in device tree
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
+ * Note that semantically null changes in order could still cause false
+ * hash misses. Such reordering might happen if the tree is regenerated
+ * from source, and nodes are reordered (the bytes-stream will be emitted
+ * in a different order and mnay hash functions will detect this). However
+ * if an existing tree is modified using libfdt functions, such as
+ * fdt_add_subnode() and fdt_setprop(), then this problem is avoided.
+ *
+ * The nodes/properties to include/exclude are defined by a function
+ * provided by the caller. This function is called for each node and
+ * property, and must return:
+ *
+ *    0 - to exclude this part
+ *    1 - to include this part
+ *   -1 - for FDT_IS_PROP only: no information is available, so include
+ *		if its containing node is included
+ *
+ * The last case is only used to deal with properties. Often a property is
+ * included if its containing node is included - this is the case where
+ * -1 is returned.. However if the property is specifically required to be
+ * included/excluded, then 0 or 1 can be returned. Note that including a
+ * property when the FDT_REG_SUPERNODES flag is given will force its
+ * containing node to be included since it is not valid to have a property
+ * that is not in a node.
+ *
+ * Using the information provided, the inclusion of a node can be controlled
+ * either by a node name or its compatible string, or any other property
+ * that the function can determine.
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
+ *		@fdt: Pointer to FDT blob
+ *		@offset: Offset of this node / property
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
+int fdt_first_region(const void *fdt,
+		int (*h_include)(void *priv, const void *fdt, int offset,
+				 int type, const char *data, int size),
+		void *priv, struct fdt_region *region,
+		char *path, int path_len, int flags,
+		struct fdt_region_state *info);
+
+/** fdt_next_region() - find next region
+ *
+ * See fdt_first_region() for full description. This function finds the
+ * next region according to the provided parameters, which must be the same
+ * as passed to fdt_first_region().
+ *
+ * This function can additionally return -FDT_ERR_NOTFOUND when there are no
+ * more regions
+ */
+int fdt_next_region(const void *fdt,
+		int (*h_include)(void *priv, const void *fdt, int offset,
+				 int type, const char *data, int size),
+		void *priv, struct fdt_region *region,
+		char *path, int path_len, int flags,
+		struct fdt_region_state *info);
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
index 0000000..55ab2d5
--- /dev/null
+++ b/tests/region_tree.c
@@ -0,0 +1,336 @@
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
+static int h_include(void *priv, const void *fdt, int offset, int type,
+		     const char *data, int size)
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
+	struct fdt_region_state state;
+	struct fdt_region reg;
+	int err, ret = 0;
+	char path[1024];
+	int count;
+	int i;
+
+	ret = fdt_first_region(fdt, h_include, NULL, &reg,
+			       path, sizeof(path), flags, &state);
+	if (ret < 0)
+		CHECK(ret);
+
+	verbose_printf("Regions: %d\n", count);
+	for (i = 0; ; i++) {
+		struct fdt_region *exp = &expect[i];
+
+		verbose_printf("%d:  %-10x  %-10x\n", i, reg.offset,
+		       reg.offset + reg.size);
+		if (memcmp(exp, &reg, sizeof(reg))) {
+			ret = -1;
+			verbose_printf("exp: %-10x  %-10x\n", exp->offset,
+				exp->offset + exp->size);
+		}
+
+		ret = fdt_next_region(fdt, h_include, NULL, &reg,
+				      path, sizeof(path), flags, &state);
+		if (ret < 0) {
+			if (ret == -FDT_ERR_NOTFOUND)
+				ret = 0;
+			CHECK(ret);
+			break;
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
index b56b626..372acdd 100755
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
1.8.1.3
