From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 6/6] libfdt: Add overlay application function
Date: Mon, 11 Jul 2016 21:56:23 +0200
Message-ID: <20160711195623.12840-7-maxime.ripard@free-electrons.com>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160711195623.12840-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The device tree overlays are a good way to deal with user-modifyable
boards or boards with some kind of an expansion mechanism where we can
easily plug new board in (like the BBB, the Raspberry Pi or the CHIP).

Add a new function to merge overlays with a base device tree.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 libfdt/Makefile.libfdt    |   2 +-
 libfdt/fdt_overlay.c      | 618 ++++++++++++++++++++++++++++++++++++++++++++++
 libfdt/libfdt.h           |  30 +++
 libfdt/libfdt_env.h       |   1 +
 tests/.gitignore          |   1 +
 tests/Makefile.tests      |   3 +-
 tests/overlay.c           | 228 +++++++++++++++++
 tests/overlay_base.dts    |  21 ++
 tests/overlay_overlay.dts |  96 +++++++
 tests/run_tests.sh        |   8 +
 10 files changed, 1006 insertions(+), 2 deletions(-)
 create mode 100644 libfdt/fdt_overlay.c
 create mode 100644 tests/overlay.c
 create mode 100644 tests/overlay_base.dts
 create mode 100644 tests/overlay_overlay.dts

diff --git a/libfdt/Makefile.libfdt b/libfdt/Makefile.libfdt
index 09c322ed82ba..098b3f36e668 100644
--- a/libfdt/Makefile.libfdt
+++ b/libfdt/Makefile.libfdt
@@ -7,5 +7,5 @@ LIBFDT_soname = libfdt.$(SHAREDLIB_EXT).1
 LIBFDT_INCLUDES = fdt.h libfdt.h libfdt_env.h
 LIBFDT_VERSION = version.lds
 LIBFDT_SRCS = fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_rw.c fdt_strerror.c fdt_empty_tree.c \
-	fdt_addresses.c
+	fdt_addresses.c fdt_overlay.c
 LIBFDT_OBJS = $(LIBFDT_SRCS:%.c=%.o)
diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
new file mode 100644
index 000000000000..40ad3b86c13e
--- /dev/null
+++ b/libfdt/fdt_overlay.c
@@ -0,0 +1,618 @@
+#include "libfdt_env.h"
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "libfdt_internal.h"
+
+/**
+ * overlay_get_target_phandle - retrieves the target phandle of a fragment
+ * @fdto: pointer to the device tree overlay blob
+ * @fragment: node offset of the fragment in the overlay
+ *
+ * overlay_get_target_phandle() retrieves the target phandle of an
+ * overlay fragment when that fragment uses a phandle (target
+ * property) instead of a path (target-path property).
+ *
+ * returns:
+ *      the phandle pointed by the target property
+ *      0, if the phandle was not found
+ *	-1, if the phandle was malformed
+ */
+static uint32_t overlay_get_target_phandle(const void *fdto, int fragment)
+{
+	const uint32_t *val;
+	int len;
+
+	val = fdt_getprop(fdto, fragment, "target", &len);
+	if (!val)
+		return 0;
+
+	if ((*val == (uint32_t)-1) || (len != sizeof(*val)))
+		return (uint32_t)-1;
+
+	return fdt32_to_cpu(*val);
+}
+
+/**
+ * overlay_get_target - retrieves the target phandle of a fragment
+ * @fdt: Base device tree blob
+ * @fdto: Device tree overlay blob
+ * @fragment: node offset of the fragment in the overlay
+ *
+ * overlay_get_target() retrieves the target phandle in the base
+ * device tree of a fragment, no matter how the actual targetting is
+ * done (through a phandle or a path)
+ *
+ * returns:
+ *      the targetted node offset in the base device tree
+ *      Negative error code on error
+ */
+static int overlay_get_target(const void *fdt, const void *fdto,
+			      int fragment)
+{
+	uint32_t phandle;
+	const char *path;
+
+	/* Try first to do a phandle based lookup */
+	phandle = overlay_get_target_phandle(fdto, fragment);
+	if (phandle == (uint32_t)-1)
+		return -FDT_ERR_BADPHANDLE;
+
+	if (phandle)
+		return fdt_node_offset_by_phandle(fdt, phandle);
+
+	/* And then a path based lookup */
+	path = fdt_getprop(fdto, fragment, "target-path", NULL);
+	if (!path)
+		return -FDT_ERR_NOTFOUND;
+
+	return fdt_path_offset(fdt, path);
+}
+
+/**
+ * overlay_phandle_add_offset - Increases a phandle by an offset
+ * @fdt: Base device tree blob
+ * @node: Device tree overlay blob
+ * @name: Name of the property to modify (phandle or linux,phandle)
+ * @delta: offset to apply
+ *
+ * overlay_phandle_add_offset() increments a node phandle by a given
+ * offset.
+ *
+ * returns:
+ *      0 on success.
+ *      Negative error code on error
+ */
+static int overlay_phandle_add_offset(void *fdt, int node,
+				      const char *name, uint32_t delta)
+{
+	const uint32_t *val;
+	uint32_t adj_val;
+	int len;
+
+	val = fdt_getprop(fdt, node, name, &len);
+	if (!val)
+		return len;
+
+	if (len != sizeof(*val))
+		return -FDT_ERR_BADSTRUCTURE;
+
+	adj_val = fdt32_to_cpu(*val);
+	if ((adj_val + delta) < adj_val)
+		return -FDT_ERR_BADPHANDLE;
+
+	adj_val += delta;
+	return fdt_setprop_inplace_u32(fdt, node, name, adj_val);
+}
+
+/**
+ * overlay_adjust_node_phandles - Offsets the phandles of a node
+ * @fdto: Device tree overlay blob
+ * @node: Offset of the node we want to adjust
+ * @delta: Offset to shift the phandles of
+ *
+ * overlay_adjust_node_phandles() adds a constant to all the phandles
+ * of a given node. This is mainly use as part of the overlay
+ * application process, when we want to update all the overlay
+ * phandles to not conflict with the overlays of the base device tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_adjust_node_phandles(void *fdto, int node,
+					uint32_t delta)
+{
+	unsigned char found = 0;
+	int child;
+	int ret;
+
+	ret = overlay_phandle_add_offset(fdto, node, "phandle", delta);
+	if (ret && ret != -FDT_ERR_NOTFOUND)
+		return ret;
+
+	if (!ret)
+		found = 1;
+
+	ret = overlay_phandle_add_offset(fdto, node, "linux,phandle", delta);
+	if (ret && ret != -FDT_ERR_NOTFOUND)
+		return ret;
+
+	/*
+	 * If neither phandle nor linux,phandle have been found return
+	 * an error.
+	 */
+	if (!found && !ret)
+		return ret;
+
+	fdt_for_each_subnode(child, fdto, node)
+		overlay_adjust_node_phandles(fdto, child, delta);
+
+	return 0;
+}
+
+/**
+ * overlay_adjust_local_phandles - Adjust the phandles of a whole overlay
+ * @fdto: Device tree overlay blob
+ * @delta: Offset to shift the phandles of
+ *
+ * overlay_adjust_local_phandles() adds a constant to all the
+ * phandles of an overlay. This is mainly use as part of the overlay
+ * application process, when we want to update all the overlay
+ * phandles to not conflict with the overlays of the base device tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_adjust_local_phandles(void *fdto, uint32_t delta)
+{
+	/*
+	 * Start adjusting the phandles from the overlay root
+	 */
+	return overlay_adjust_node_phandles(fdto, 0, delta);
+}
+
+/**
+ * overlay_update_local_node_references - Adjust the overlay references
+ * @fdto: Device tree overlay blob
+ * @tree_node: Node offset of the node to operate on
+ * @fixup_node: Node offset of the matching local fixups node
+ * @delta: Offset to shift the phandles of
+ *
+ * overlay_update_local_nodes_references() update the phandles
+ * pointing to a node within the device tree overlay by adding a
+ * constant delta.
+ *
+ * This is mainly used as part of a device tree application process,
+ * where you want the device tree overlays phandles to not conflict
+ * with the ones from the base device tree before merging them.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_update_local_node_references(void *fdto,
+						int tree_node,
+						int fixup_node,
+						uint32_t delta)
+{
+	int fixup_prop;
+	int fixup_child;
+	int ret;
+
+	fdt_for_each_property_offset(fixup_prop, fdto, fixup_node) {
+		const unsigned char *fixup_val, *tree_val;
+		const char *name;
+		int fixup_len;
+		int tree_len;
+		int i;
+
+		fixup_val = fdt_getprop_by_offset(fdto, fixup_prop,
+						  &name, &fixup_len);
+		if (!fixup_val)
+			return fixup_len;
+
+		tree_val = fdt_getprop(fdto, tree_node, name, &tree_len);
+		if (!tree_val)
+			return tree_len;
+
+		for (i = 0; i < fixup_len; i += sizeof(uint32_t)) {
+			uint32_t adj_val, index;
+
+			index = *(const uint32_t *)(fixup_val + i);
+			index = fdt32_to_cpu(index);
+
+			/*
+			 * phandles to fixup can be unaligned.
+			 *
+			 * Use a memcpy for the architectures that do
+			 * not support unaligned accesses.
+			 */
+			memcpy(&adj_val, tree_val + index, sizeof(uint32_t));
+
+			adj_val = fdt32_to_cpu(adj_val);
+			adj_val += delta;
+			adj_val = cpu_to_fdt32(adj_val);
+
+			ret = fdt_setprop_inplace_namelen_partial(fdto,
+								  tree_node,
+								  name,
+								  strlen(name),
+								  index,
+								  &adj_val,
+								  sizeof(adj_val));
+			if (ret)
+				return ret;
+		}
+	}
+
+	fdt_for_each_subnode(fixup_child, fdto, fixup_node) {
+		const char *fixup_child_name = fdt_get_name(fdto, fixup_child,
+							    NULL);
+		int tree_child;
+
+		tree_child = fdt_subnode_offset(fdto, tree_node,
+						fixup_child_name);
+		if (tree_child < 0)
+			return tree_child;
+
+		ret = overlay_update_local_node_references(fdto,
+							   tree_child,
+							   fixup_child,
+							   delta);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_update_local_references - Adjust the overlay references
+ * @fdto: Device tree overlay blob
+ * @delta: Offset to shift the phandles of
+ *
+ * overlay_update_local_references() update all the phandles pointing
+ * to a node within the device tree overlay by adding a constant
+ * delta to not conflict with the base overlay.
+ *
+ * This is mainly used as part of a device tree application process,
+ * where you want the device tree overlays phandles to not conflict
+ * with the ones from the base device tree before merging them.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_update_local_references(void *fdto, uint32_t delta)
+{
+	int fixups;
+
+	fixups = fdt_path_offset(fdto, "/__local_fixups__");
+	if (fixups < 0) {
+		/* There's no local phandles to adjust, bail out */
+		if (fixups == -FDT_ERR_NOTFOUND)
+			return 0;
+
+		return fixups;
+	}
+
+	/*
+	 * Update our local references from the root of the tree
+	 */
+	return overlay_update_local_node_references(fdto, 0, fixups,
+						    delta);
+}
+
+/**
+ * overlay_fixup_one_phandle - Set an overlay phandle to the base one
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ * @symbols_off: Node offset of the symbols node in the base device tree
+ * @path: Path to a node holding a phandle in the overlay
+ * @path_len: number of path characters to consider
+ * @name: Name of the property holding the phandle reference in the overlay
+ * @name_len: number of name characters to consider
+ * @index: Index in the overlay property where the phandle is stored
+ * @label: Label of the node referenced by the phandle
+ *
+ * overlay_fixup_one_phandle() resolves an overlay phandle pointing to
+ * a node in the base device tree.
+ *
+ * This is part of the device tree overlay application process, when
+ * you want all the phandles in the overlay to point to the actual
+ * base dt nodes.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_fixup_one_phandle(void *fdt, void *fdto,
+				     int symbols_off,
+				     const char *path, uint32_t path_len,
+				     const char *name, uint32_t name_len,
+				     int index, const char *label)
+{
+	const char *symbol_path;
+	uint32_t phandle;
+	int symbol_off, fixup_off;
+	int prop_len;
+
+	symbol_path = fdt_getprop(fdt, symbols_off, label,
+				  &prop_len);
+	if (!symbol_path)
+		return -FDT_ERR_NOTFOUND;
+
+	symbol_off = fdt_path_offset(fdt, symbol_path);
+	if (symbol_off < 0)
+		return symbol_off;
+
+	phandle = fdt_get_phandle(fdt, symbol_off);
+	if (!phandle)
+		return -FDT_ERR_NOTFOUND;
+
+	fixup_off = fdt_path_offset_namelen(fdto, path, path_len);
+	if (fixup_off < 0)
+		return fixup_off;
+
+	phandle = cpu_to_fdt32(phandle);
+	return fdt_setprop_inplace_namelen_partial(fdto, fixup_off,
+						   name, name_len, index,
+						   &phandle, sizeof(phandle));
+};
+
+/**
+ * overlay_fixup_phandle - Set an overlay phandle to the base one
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ * @symbols_off: Node offset of the symbols node in the base device tree
+ * @property: Property offset in the overlay holding the list of fixups
+ *
+ * overlay_fixup_phandle() resolves all the overlay phandles pointed
+ * to in a __local_fixup__ property, and updates them to match the
+ * phandles in use in the base device tree.
+ *
+ * This is part of the device tree overlay application process, when
+ * you want all the phandles in the overlay to point to the actual
+ * base dt nodes.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
+				 int property)
+{
+	const char *value;
+	const char *label;
+	int len;
+
+	value = fdt_getprop_by_offset(fdto, property,
+				      &label, &len);
+	if (!value)
+		return len;
+
+	do {
+		const char *prop_string = value;
+		const char *path, *name;
+		uint32_t prop_len = strlen(value);
+		uint32_t path_len, name_len;
+		char *sep, *endptr;
+		int index;
+		int ret;
+
+		path = prop_string;
+		sep = memchr(prop_string, ':', prop_len);
+		if (*sep != ':')
+			return -FDT_ERR_BADSTRUCTURE;
+		path_len = sep - path;
+
+		name = sep + 1;
+		sep = memchr(name, ':', prop_len);
+		if (*sep != ':')
+			return -FDT_ERR_BADSTRUCTURE;
+		name_len = sep - name;
+
+		index = strtoul(sep + 1, &endptr, 10);
+		if ((*endptr != '\0') || (endptr <= (sep + 1)))
+			return -FDT_ERR_BADSTRUCTURE;
+
+		len -= prop_len + 1;
+		value += prop_len + 1;
+
+		ret = overlay_fixup_one_phandle(fdt, fdto, symbols_off,
+						path, path_len, name, name_len,
+						index, label);
+		if (ret)
+			return ret;
+	} while (len > 0);
+
+	return 0;
+}
+
+/**
+ * overlay_fixup_phandles - Resolve the overlay phandles to the base
+ *                          device tree
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ *
+ * overlay_fixup_phandles() resolves all the overlay phandles pointing
+ * to nodes in the base device tree.
+ *
+ * This is one of the steps of the device tree overlay application
+ * process, when you want all the phandles in the overlay to point to
+ * the actual base dt nodes.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_fixup_phandles(void *fdt, void *fdto)
+{
+	int fixups_off, symbols_off;
+	int property;
+
+	symbols_off = fdt_path_offset(fdt, "/__symbols__");
+	fixups_off = fdt_path_offset(fdto, "/__fixups__");
+
+	fdt_for_each_property_offset(property, fdto, fixups_off) {
+		int ret;
+
+		ret = overlay_fixup_phandle(fdt, fdto, symbols_off, property);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_apply_node - Merge an overlay fragment into the base device tree
+ * @fdt: Base Device Tree blob
+ * @target: Node offset in the base device tree to apply the fragment to
+ * @fdto: Device tree overlay blob
+ * @fragment: Node offset in the overlay holding the changes to merge
+ *
+ * overlay_apply_node() merges an overlay fragment into a target base
+ * device tree node pointed.
+ *
+ * This is part of the final step in the device tree overlay
+ * application process, when all the phandles have been adjusted and
+ * resolved and you just have to merge overlay into the base device
+ * tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_apply_node(void *fdt, int target,
+			      void *fdto, int fragment)
+{
+	int property;
+	int node;
+
+	fdt_for_each_property_offset(property, fdto, fragment) {
+		const char *name;
+		const void *prop;
+		int prop_len;
+		int ret;
+
+		prop = fdt_getprop_by_offset(fdto, property, &name,
+					     &prop_len);
+		if (prop_len == -FDT_ERR_NOTFOUND)
+			return -FDT_ERR_INTERNAL;
+		if (prop_len < 0)
+			return prop_len;
+
+		ret = fdt_setprop(fdt, target, name, prop, prop_len);
+		if (ret)
+			return ret;
+	}
+
+	fdt_for_each_subnode(node, fdto, fragment) {
+		const char *name = fdt_get_name(fdto, node, NULL);
+		int nnode;
+		int ret;
+
+		nnode = fdt_add_subnode(fdt, target, name);
+		if (nnode == -FDT_ERR_EXISTS)
+			nnode = fdt_subnode_offset(fdt, target, name);
+
+		if (nnode < 0)
+			return nnode;
+
+		ret = overlay_apply_node(fdt, nnode, fdto, node);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_merge - Merge an overlay into its base device tree
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ *
+ * overlay_merge() merges an overlay into its base device tree.
+ *
+ * This is the final step in the device tree overlay application
+ * process, when all the phandles have been adjusted and resolved and
+ * you just have to merge overlay into the base device tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_merge(void *fdt, void *fdto)
+{
+	int fragment;
+
+	fdt_for_each_subnode(fragment, fdto, 0) {
+		int overlay;
+		int target;
+		int ret;
+
+		target = overlay_get_target(fdt, fdto, fragment);
+		if (target < 0)
+			continue;
+
+		overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
+		if (overlay < 0)
+			return overlay;
+
+		ret = overlay_apply_node(fdt, target, fdto, overlay);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+int fdt_overlay_apply(void *fdt, void *fdto)
+{
+	uint32_t delta = fdt_get_max_phandle(fdt) + 1;
+	int ret;
+
+	FDT_CHECK_HEADER(fdt);
+	FDT_CHECK_HEADER(fdto);
+
+	ret = overlay_adjust_local_phandles(fdto, delta);
+	if (ret)
+		goto err;
+
+	ret = overlay_update_local_references(fdto, delta);
+	if (ret)
+		goto err;
+
+	ret = overlay_fixup_phandles(fdt, fdto);
+	if (ret)
+		goto err;
+
+	ret = overlay_merge(fdt, fdto);
+	if (ret)
+		goto err;
+
+	/*
+	 * The overlay has been damaged, erase its magic.
+	 */
+	fdt_set_magic(fdto, ~0);
+
+	return 0;
+
+err:
+	/*
+	 * The overlay might have been damaged, erase its magic.
+	 */
+	fdt_set_magic(fdto, ~0);
+
+	/*
+	 * The base device tree might have been damaged, erase its
+	 * magic.
+	 */
+	fdt_set_magic(fdt, ~0);
+
+	return ret;
+}
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index a22a16b6878a..a70b8767cabc 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -1745,6 +1745,36 @@ int fdt_add_subnode(void *fdt, int parentoffset, const char *name);
  */
 int fdt_del_node(void *fdt, int nodeoffset);
 
+/**
+ * fdt_overlay_apply - Applies a DT overlay on a base DT
+ * @fdt: pointer to the base device tree blob
+ * @fdto: pointer to the device tree overlay blob
+ *
+ * fdt_overlay_apply() will apply the given device tree overlay on the
+ * given base device tree.
+ *
+ * Expect the base device tree to be modified, even if the function
+ * returns an error.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there's not enough space in the base device tree
+ *	-FDT_ERR_NOTFOUND, the overlay points to some inexistant nodes or
+ *		properties in the base DT
+ *	-FDT_ERR_BADPHANDLE, the phandles in the overlay do not have the right
+ *		magic
+ *	-FDT_ERR_INTERNAL,
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADOFFSET,
+ *	-FDT_ERR_BADPATH,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_overlay_apply(void *fdt, void *fdto);
+
 /**********************************************************************/
 /* Debugging / informational functions                                */
 /**********************************************************************/
diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
index 9dea97dfff81..99f936dacc60 100644
--- a/libfdt/libfdt_env.h
+++ b/libfdt/libfdt_env.h
@@ -54,6 +54,7 @@
 
 #include <stddef.h>
 #include <stdint.h>
+#include <stdlib.h>
 #include <string.h>
 
 #ifdef __CHECKER__
diff --git a/tests/.gitignore b/tests/.gitignore
index fa4616ba28c2..6c97066c587e 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -35,6 +35,7 @@ tmp.*
 /nopulate
 /notfound
 /open_pack
+/overlay
 /parent_offset
 /path-references
 /path_offset
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 196518c83eda..4aefbbd15253 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -24,7 +24,8 @@ LIB_TESTS_L = get_mem_rsv \
 	utilfdt_test \
 	integer-expressions \
 	property_iterate \
-	subnode_iterate
+	subnode_iterate \
+	overlay
 LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREFIX)%)
 
 LIBTREE_TESTS_L = truncated_property
diff --git a/tests/overlay.c b/tests/overlay.c
new file mode 100644
index 000000000000..4637a777e50e
--- /dev/null
+++ b/tests/overlay.c
@@ -0,0 +1,228 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for DT overlays()
+ * Copyright (C) 2016 Free Electrons
+ * Copyright (C) 2016 NextThing Co.
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
+#include <stdio.h>
+
+#include <libfdt.h>
+
+#include "tests.h"
+
+#define CHECK(code) \
+	{ \
+		if (code) \
+			FAIL(#code ": %s", fdt_strerror(code)); \
+	}
+
+/* 4k ought to be enough for anybody */
+#define FDT_COPY_SIZE	(4 * 1024)
+
+static int fdt_getprop_u32_by_index(void *fdt, const char *path,
+				    const char *name, int index,
+				    unsigned long *out)
+{
+	const fdt32_t *val;
+	int node_off;
+	int len;
+
+	node_off = fdt_path_offset(fdt, path);
+	if (node_off < 0)
+		return node_off;
+
+	val = fdt_getprop(fdt, node_off, name, &len);
+	if (!val || (len < (sizeof(uint32_t) * (index + 1))))
+		return -FDT_ERR_NOTFOUND;
+
+	*out = fdt32_to_cpu(*(val + index));
+
+	return 0;
+}
+
+static int check_getprop_string_by_name(void *fdt, const char *path,
+					const char *name, const char *val)
+{
+	int node_off;
+
+	node_off = fdt_path_offset(fdt, path);
+	if (node_off < 0)
+		return node_off;
+
+	check_getprop_string(fdt, node_off, name, val);
+
+	return RC_PASS;
+}
+
+static int check_getprop_u32_by_name(void *fdt, const char *path,
+				     const char *name, uint32_t val)
+{
+	int node_off;
+
+	node_off = fdt_path_offset(fdt, path);
+	if (node_off < 0)
+		return node_off;
+
+	check_getprop_cell(fdt, node_off, name, val);
+
+	return RC_PASS;
+}
+
+static int check_getprop_null_by_name(void *fdt, const char *path,
+				      const char *name)
+{
+	int node_off;
+
+	node_off = fdt_path_offset(fdt, path);
+	if (node_off < 0)
+		return node_off;
+
+	check_property(fdt, node_off, name, 0, NULL);
+
+	return RC_PASS;
+}
+
+static int fdt_overlay_change_int_property(void *fdt)
+{
+	return check_getprop_u32_by_name(fdt, "/test-node", "test-int-property",
+					 43);
+}
+
+static int fdt_overlay_change_str_property(void *fdt)
+{
+	return check_getprop_string_by_name(fdt, "/test-node",
+					    "test-str-property", "foobar");
+}
+
+static int fdt_overlay_add_str_property(void *fdt)
+{
+	return check_getprop_string_by_name(fdt, "/test-node",
+					    "test-str-property-2", "foobar2");
+}
+
+static int fdt_overlay_add_node_by_phandle(void *fdt)
+{
+	return check_getprop_null_by_name(fdt, "/test-node/new-node",
+					  "new-property");
+}
+
+static int fdt_overlay_add_node_by_path(void *fdt)
+{
+	return check_getprop_null_by_name(fdt, "/new-node", "new-property");
+}
+
+static int fdt_overlay_add_subnode_property(void *fdt)
+{
+	check_getprop_null_by_name(fdt, "/test-node/sub-test-node",
+				   "sub-test-property");
+	check_getprop_null_by_name(fdt, "/test-node/sub-test-node",
+				   "new-sub-test-property");
+
+	return RC_PASS;
+}
+
+static int fdt_overlay_local_phandle(void *fdt)
+{
+	uint32_t local_phandle;
+	unsigned long val = 0;
+	int off;
+
+	off = fdt_path_offset(fdt, "/new-local-node");
+	CHECK(off < 0);
+
+	local_phandle = fdt_get_phandle(fdt, off);
+	CHECK(!local_phandle);
+
+	CHECK(fdt_getprop_u32_by_index(fdt, "/", "test-several-phandle",
+				       0, &val));
+	CHECK(val != local_phandle);
+
+	CHECK(fdt_getprop_u32_by_index(fdt, "/", "test-several-phandle",
+				       1, &val));
+	CHECK(val != local_phandle);
+
+	return RC_PASS;
+}
+
+static int fdt_overlay_local_phandles(void *fdt)
+{
+	uint32_t local_phandle, test_phandle;
+	unsigned long val = 0;
+	int off;
+
+	off = fdt_path_offset(fdt, "/new-local-node");
+	CHECK(off < 0);
+
+	local_phandle = fdt_get_phandle(fdt, off);
+	CHECK(!local_phandle);
+
+	off = fdt_path_offset(fdt, "/test-node");
+	CHECK(off < 0);
+
+	test_phandle = fdt_get_phandle(fdt, off);
+	CHECK(!test_phandle);
+
+	CHECK(fdt_getprop_u32_by_index(fdt, "/", "test-phandle", 0, &val));
+	CHECK(test_phandle != val);
+
+	CHECK(fdt_getprop_u32_by_index(fdt, "/", "test-phandle", 1, &val));
+	CHECK(local_phandle != val);
+
+	return RC_PASS;
+}
+
+static void *open_dt(char *path)
+{
+	void *dt, *copy;
+
+	dt = load_blob(path);
+	copy = xmalloc(FDT_COPY_SIZE);
+
+	/*
+	 * Resize our DTs to 4k so that we have room to operate on
+	 */
+	CHECK(fdt_open_into(dt, copy, FDT_COPY_SIZE));
+
+	return copy;
+}
+
+int main(int argc, char *argv[])
+{
+	void *fdt_base, *fdt_overlay;
+
+	test_init(argc, argv);
+	if (argc != 3)
+		CONFIG("Usage: %s <base dtb> <overlay dtb>", argv[0]);
+
+	fdt_base = open_dt(argv[1]);
+	fdt_overlay = open_dt(argv[2]);
+
+	/* Apply the overlay */
+	CHECK(fdt_overlay_apply(fdt_base, fdt_overlay));
+
+	fdt_overlay_change_int_property(fdt_base);
+	fdt_overlay_change_str_property(fdt_base);
+	fdt_overlay_add_str_property(fdt_base);
+	fdt_overlay_add_node_by_phandle(fdt_base);
+	fdt_overlay_add_node_by_path(fdt_base);
+	fdt_overlay_add_subnode_property(fdt_base);
+	fdt_overlay_local_phandle(fdt_base);
+	fdt_overlay_local_phandles(fdt_base);
+
+	PASS();
+}
diff --git a/tests/overlay_base.dts b/tests/overlay_base.dts
new file mode 100644
index 000000000000..2603adb6821e
--- /dev/null
+++ b/tests/overlay_base.dts
@@ -0,0 +1,21 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/dts-v1/;
+
+/ {
+	test: test-node {
+		test-int-property = <42>;
+		test-str-property = "foo";
+
+		subtest: sub-test-node {
+			sub-test-property;
+		};
+	};
+};
+
+
diff --git a/tests/overlay_overlay.dts b/tests/overlay_overlay.dts
new file mode 100644
index 000000000000..d30ecdf3661c
--- /dev/null
+++ b/tests/overlay_overlay.dts
@@ -0,0 +1,96 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/dts-v1/;
+/plugin/;
+
+/ {
+	/* Test that we can change an int by another */
+	fragment@0 {
+		target = <&test>;
+
+		__overlay__ {
+			test-int-property = <43>;
+		};
+	};
+
+	/* Test that we can replace a string by a longer one */
+	fragment@1 {
+		target = <&test>;
+
+		__overlay__ {
+			test-str-property = "foobar";
+		};
+	};
+
+	/* Test that we add a new property */
+	fragment@2 {
+		target = <&test>;
+
+		__overlay__ {
+			test-str-property-2 = "foobar2";
+		};
+	};
+
+	/* Test that we add a new node (by phandle) */
+	fragment@3 {
+		target = <&test>;
+
+		__overlay__ {
+			new-node {
+				new-property;
+			};
+		};
+	};
+
+	/* Test that we add a new node (by path) */
+	fragment@4 {
+		target-path = "/";
+
+		__overlay__ {
+			new-node {
+				new-property;
+			};
+		};
+	};
+
+	fragment@5 {
+		target-path = "/";
+
+		__overlay__ {
+			local: new-local-node {
+				new-property;
+			};
+		};
+	};
+
+	fragment@6 {
+		target-path = "/";
+
+		__overlay__ {
+			test-phandle = <&test>, <&local>;
+		};
+	};
+
+	fragment@7 {
+		target-path = "/";
+
+		__overlay__ {
+			test-several-phandle = <&local>, <&local>;
+		};
+	};
+
+	fragment@8 {
+		target = <&test>;
+
+		__overlay__ {
+			sub-test-node {
+				new-sub-test-property;
+			};
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 6a2662b2abaf..054758298de9 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -280,6 +280,14 @@ libfdt_tests () {
     run_test get_alias aliases.dtb
     run_test path_offset_aliases aliases.dtb
 
+    # Overlay tests
+    echo "/dts-v1/; / {};" | $DTC -@ > /dev/null 2>&1
+    if [ $? -eq 0 ]; then
+        run_dtc_test -@ -I dts -O dtb -o overlay_base.dtb overlay_base.dts
+        run_dtc_test -I dts -O dtb -o overlay_overlay.dtb overlay_overlay.dts
+        run_test overlay overlay_base.dtb overlay_overlay.dtb
+    fi
+
     # Specific bug tests
     run_test add_subnode_with_nops
     run_dtc_test -I dts -O dts -o sourceoutput.test.dts sourceoutput.dts
-- 
2.9.0
