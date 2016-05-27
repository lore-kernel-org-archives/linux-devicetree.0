From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 4/4] libfdt: Add overlay application function
Date: Fri, 27 May 2016 10:28:49 +0200
Message-ID: <1464337729-7821-6-git-send-email-maxime.ripard@free-electrons.com>
References: <1464337729-7821-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464337729-7821-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The device tree overlays are a good way to deal with user-modifyable
boards or boards with some kind of an expansion mechanism where we can
easily plug new board in (like the BBB, the Raspberry Pi or the CHIP).

Add a new function to merge overlays with a base device tree.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 libfdt/Makefile.libfdt |   2 +-
 libfdt/fdt_overlay.c   | 414 +++++++++++++++++++++++++++++++++++++++++++++++++
 libfdt/libfdt.h        |  30 ++++
 libfdt/libfdt_env.h    |   1 +
 4 files changed, 446 insertions(+), 1 deletion(-)
 create mode 100644 libfdt/fdt_overlay.c

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
index 000000000000..1e68e903c734
--- /dev/null
+++ b/libfdt/fdt_overlay.c
@@ -0,0 +1,414 @@
+#include "libfdt_env.h"
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "libfdt_internal.h"
+
+static uint32_t fdt_overlay_get_target_phandle(const void *fdto, int node)
+{
+	const uint32_t *val;
+	int len;
+
+	val = fdt_getprop(fdto, node, "target", &len);
+	if (!val || (len != sizeof(*val)))
+		return 0;
+
+	return fdt32_to_cpu(*val);
+}
+
+static int fdt_overlay_get_target(const void *fdt, const void *fdto,
+				  int fragment)
+{
+	uint32_t phandle;
+	const char *path;
+
+	/* Try first to do a phandle based lookup */
+	phandle = fdt_overlay_get_target_phandle(fdto, fragment);
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
+static int fdt_overlay_adjust_node_phandles(void *fdto, int node,
+					    uint32_t delta)
+{
+	int property;
+	int child;
+
+	fdt_for_each_property(fdto, node, property) {
+		const uint32_t *val;
+		const char *name;
+		uint32_t adj_val;
+		int len;
+		int ret;
+
+		val = fdt_getprop_by_offset(fdto, property,
+					    &name, &len);
+		if (!val || (len != sizeof(*val)))
+			continue;
+
+		if (strcmp(name, "phandle") && strcmp(name, "linux,phandle"))
+			continue;
+
+		adj_val = fdt32_to_cpu(*val);
+		adj_val += delta;
+		ret = fdt_setprop_inplace_u32(fdto, node, name, adj_val);
+		if (ret)
+			return ret;
+	}
+
+	fdt_for_each_subnode(fdto, child, node)
+		fdt_overlay_adjust_node_phandles(fdto, child, delta);
+
+	return 0;
+}
+
+static int fdt_overlay_adjust_local_phandles(void *fdto, uint32_t delta)
+{
+	int root;
+
+	root = fdt_path_offset(fdto, "/");
+	if (root < 0)
+		return root;
+
+	return fdt_overlay_adjust_node_phandles(fdto, root, delta);
+}
+
+static int _fdt_overlay_update_local_references(void *fdto,
+						int tree_node,
+						int fixup_node,
+						uint32_t delta)
+{
+	int fixup_prop;
+	int fixup_child;
+
+	fdt_for_each_property(fdto, fixup_node, fixup_prop) {
+		const char *fixup_name, *tree_name;
+		const uint32_t *val = NULL;
+		uint32_t adj_val;
+		int fixup_len;
+		int tree_prop;
+		int tree_len;
+		int ret;
+
+		fdt_getprop_by_offset(fdto, fixup_prop,
+				      &fixup_name, &fixup_len);
+
+		if (!strcmp(fixup_name, "phandle") ||
+		    !strcmp(fixup_name, "linux,phandle"))
+			continue;
+
+		fdt_for_each_property(fdto, tree_node, tree_prop) {
+			val = fdt_getprop_by_offset(fdto, tree_prop,
+						    &tree_name, &tree_len);
+
+			if (!strcmp(tree_name, fixup_name))
+				break;
+		}
+
+		if (!val || !tree_len)
+			return -FDT_ERR_NOTFOUND;
+
+		if (!tree_name)
+			return -FDT_ERR_NOTFOUND;
+
+		if (tree_len != 4)
+			return -FDT_ERR_NOTFOUND;
+
+		adj_val = fdt32_to_cpu(*val);
+		adj_val += delta;
+		ret = fdt_setprop_inplace_u32(fdto, tree_node, fixup_name,
+					      adj_val);
+		if (ret)
+			return ret;
+	}
+
+	fdt_for_each_subnode(fdto, fixup_child, fixup_node) {
+		const char *fixup_child_name = fdt_get_name(fdto,
+							    fixup_child, NULL);
+		int tree_child;
+
+		fdt_for_each_subnode(fdto, tree_child, tree_node) {
+			const char *tree_child_name = fdt_get_name(fdto,
+								   tree_child,
+								   NULL);
+
+			if (!strcmp(fixup_child_name, tree_child_name))
+				break;
+		}
+
+		_fdt_overlay_update_local_references(fdto,
+						     tree_child,
+						     fixup_child,
+						     delta);
+	}
+
+	return 0;
+}
+
+static int fdt_overlay_update_local_references(void *dto, uint32_t delta)
+{
+	int root, fixups;
+
+	root = fdt_path_offset(dto, "/");
+	if (root < 0)
+		return root;
+
+	fixups = fdt_path_offset(dto, "/__local_fixups__");
+	if (root < 0)
+		return root;
+
+	return _fdt_overlay_update_local_references(dto, root, fixups,
+						    delta);
+}
+
+static int _fdt_overlay_fixup_phandle(void *fdt, void *fdto,
+				      int symbols_off,
+				      const char *path, const char *name,
+				      int index, const char *label)
+{
+	const uint32_t *prop_val;
+	const char *symbol_path;
+	uint32_t *fixup_val;
+	uint32_t phandle;
+	int symbol_off, fixup_off;
+	int prop_len;
+	int ret;
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
+	fixup_off = fdt_path_offset(fdto, path);
+	if (fixup_off < 0)
+		return fixup_off;
+
+	prop_val = fdt_getprop(fdto, fixup_off, name,
+			       &prop_len);
+	if (!prop_val)
+		return -FDT_ERR_NOTFOUND;
+
+	fixup_val = malloc(prop_len);
+	if (!fixup_val)
+		return -FDT_ERR_INTERNAL;
+	memcpy(fixup_val, prop_val, prop_len);
+
+	if (fdt32_to_cpu(fixup_val[index]) != 0xdeadbeef) {
+		ret = -FDT_ERR_BADPHANDLE;
+		goto out;
+	}
+
+	fixup_val[index] = cpu_to_fdt32(phandle);
+	ret = fdt_setprop_inplace(fdto, fixup_off,
+				  name, fixup_val,
+				  prop_len);
+
+out:
+	free(fixup_val);
+	return ret;
+};
+
+static int fdt_overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
+				     int property)
+{
+	const char *value, *tmp_value;
+	const char *label;
+	int tmp_len, len, next;
+	int table = 0;
+	int i;
+
+	value = fdt_getprop_by_offset(fdto, property,
+				      &label, &len);
+	tmp_value = value;
+	tmp_len = len;
+
+	do {
+		next = strlen(tmp_value) + 1;
+		tmp_len -= next;
+		tmp_value += next;
+		table++;
+	} while (tmp_len > 0);
+
+	for (i = 0; i < table; i++) {
+		const char *prop_string = value;
+		const char *path, *name;
+		char *prop_cpy, *prop_tmp;
+		int index, stlen;
+		char *sep;
+
+		stlen = strlen(prop_string);
+		prop_cpy = malloc(stlen + 1);
+		if (!prop_cpy)
+			return -FDT_ERR_INTERNAL;
+
+		strncpy(prop_cpy, prop_string, stlen);
+		prop_cpy[stlen] = '\0';
+
+		for (prop_tmp = prop_cpy; (sep = strchr(prop_tmp, ':'));
+		     prop_tmp += ((sep - prop_tmp) + 1))
+			*sep = '\0';
+
+		prop_tmp = prop_cpy;
+		path = prop_tmp;
+		prop_tmp += strlen(prop_tmp) + 1;
+
+		name = prop_tmp;
+		prop_tmp += strlen(prop_tmp) + 1;
+
+		index = strtol(prop_tmp, NULL, 10);
+		prop_tmp += strlen(prop_tmp) + 1;
+
+		value += stlen + 1;
+		len -= stlen + 1;
+
+		_fdt_overlay_fixup_phandle(fdt, fdto, symbols_off,
+					   path, name, index, label);
+
+		free(prop_cpy);
+	}
+
+	return 0;
+}
+
+static int fdt_overlay_fixup_phandles(void *dt, void *dto)
+{
+	int fixups_off, symbols_off;
+	int property;
+
+	symbols_off = fdt_path_offset(dt, "/__symbols__");
+	fixups_off = fdt_path_offset(dto, "/__fixups__");
+
+	fdt_for_each_property(dto, fixups_off, property)
+		fdt_overlay_fixup_phandle(dt, dto, symbols_off, property);
+
+	return 0;
+}
+
+static int fdt_apply_overlay_node(void *dt, void *dto,
+				  int target, int overlay)
+{
+	int property;
+	int node;
+
+	fdt_for_each_property(dto, overlay, property) {
+		const char *name;
+		const void *prop;
+		int prop_len;
+		int ret;
+
+		prop = fdt_getprop_by_offset(dto, property, &name,
+					     &prop_len);
+		if (!prop)
+			return -FDT_ERR_INTERNAL;
+
+		ret = fdt_setprop(dt, target, name, prop, prop_len);
+		if (ret)
+			return ret;
+	}
+
+	fdt_for_each_subnode(dto, node, overlay) {
+		const char *name = fdt_get_name(dto, node, NULL);
+		int nnode;
+		int ret;
+
+		nnode = fdt_add_subnode(dt, target, name);
+		if (nnode < 0)
+			return nnode;
+
+		ret = fdt_apply_overlay_node(dt, dto, nnode, node);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int fdt_overlay_merge(void *dt, void *dto)
+{
+	int root, fragment;
+
+	root = fdt_path_offset(dto, "/");
+	if (root < 0)
+		return root;
+
+	fdt_for_each_subnode(dto, fragment, root) {
+		const char *name = fdt_get_name(dto, fragment, NULL);
+		uint32_t target;
+		int overlay;
+		int ret;
+
+		if (strncmp(name, "fragment", 8))
+			continue;
+
+		target = fdt_overlay_get_target(dt, dto, fragment);
+		if (target < 0)
+			return target;
+
+		overlay = fdt_subnode_offset(dto, fragment, "__overlay__");
+		if (overlay < 0)
+			return overlay;
+
+		ret = fdt_apply_overlay_node(dt, dto, target, overlay);
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
+	void *fdto_copy;
+	int ret;
+
+	FDT_CHECK_HEADER(fdt);
+	FDT_CHECK_HEADER(fdto);
+
+	/*
+	 * We're going to modify the overlay so that we can apply it.
+	 *
+	 * Make sure sure we don't destroy the original
+	 */
+	fdto_copy = malloc(fdt_totalsize(fdto));
+	if (!fdto_copy)
+		return -FDT_ERR_INTERNAL;
+
+	ret = fdt_move(fdto, fdto_copy, fdt_totalsize(fdto));
+	if (ret)
+		goto out;
+
+	ret = fdt_overlay_adjust_local_phandles(fdto_copy, delta);
+	if (ret)
+		goto out;
+
+	ret = fdt_overlay_update_local_references(fdto_copy, delta);
+	if (ret)
+		goto out;
+
+	ret = fdt_overlay_fixup_phandles(fdt, fdto_copy);
+	if (ret)
+		goto out;
+
+	ret = fdt_overlay_merge(fdt, fdto_copy);
+
+out:
+	free(fdto_copy);
+	return ret;
+}
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 7156b264b1e9..ebee808a7f92 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -1716,6 +1716,36 @@ int fdt_add_subnode(void *fdt, int parentoffset, const char *name);
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
-- 
2.8.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
