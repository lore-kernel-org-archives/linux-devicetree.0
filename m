From: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Subject: [PATCH 1/3] deps: Automatically add new property 'dependencies' which contains a list of referenced phandles
Date: Tue, 13 May 2014 10:54:01 +0200
Message-ID: <1399971243-18153-2-git-send-email-holler@ahsoftware.de>
References: <537151FF.8070104@ahsoftware.de>
 <1399971243-18153-1-git-send-email-holler@ahsoftware.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399971243-18153-1-git-send-email-holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

During the step from .dts to .dtb the information about dependcies contained
in the .dts through phandle references is lost. This makes it impossible to
use the binary blob to create a dependency graph without knowing the semantic
of all cell arrays.

Therefor automatically add a new property called 'dependencies' to all nodes
which have phandle references in one of their properties.

This new property will contain an array of phandles with one value for every
phandle referenced by other properties in the node.

If such a property already exists (e.g. to manually add dependencies through
the .dts), the existing list will be expanded.

Added phandles will be the phandle of either the referenced node itself (if
it has a property named 'compatible', or of the next parent of the referenced
node which as property named 'compatible'. This ensures only dependencies to
drivers will be added.

References to phandles of parent or child nodes will not be added to this
property, because this information is already contained in the blob (in the
form of the tree itself).

No dependencies to disabled nodes will be added.

Signed-off-by: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
---
 Makefile.dtc   |   1 +
 dependencies.c | 108 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 dtc.c          |  12 ++++++-
 dtc.h          |   3 ++
 4 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 dependencies.c

diff --git a/Makefile.dtc b/Makefile.dtc
index bece49b..5fb5343 100644
--- a/Makefile.dtc
+++ b/Makefile.dtc
@@ -6,6 +6,7 @@
 DTC_SRCS = \
 	checks.c \
 	data.c \
+	dependencies.c \
 	dtc.c \
 	flattree.c \
 	fstree.c \
diff --git a/dependencies.c b/dependencies.c
new file mode 100644
index 0000000..dd4658c
--- /dev/null
+++ b/dependencies.c
@@ -0,0 +1,108 @@
+/*
+ * Code to add a property which contains dependencies (used phandle references)
+ * to all (driver) nodes which are having phandle references.
+ *
+ * Copyright (C) 2014 Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#include <dtc.h>
+
+/* Searches upwards for a node with a property 'compatible' */
+static struct node *find_compatible_not_disabled(struct node *node)
+{
+	struct property *prop;
+
+	while (node) {
+		prop = get_property(node, "compatible");
+		if (prop) {
+			prop = get_property(node, "status");
+			if (prop)
+				if (!prop->val.len ||
+					(strcmp(prop->val.val, "okay") &&
+						strcmp(prop->val.val, "ok")))
+					return NULL; /* disabled */
+			return node;
+		}
+		node = node->parent;
+	}
+	return NULL;
+}
+
+static bool is_parent_of(struct node *node1, struct node *node2)
+{
+	while (node2) {
+		if (node2->parent == node1)
+			return true;
+		node2 = node2->parent;
+	}
+	return false;
+
+}
+
+static void add_deps(struct node *dt, struct node *node, struct property *prop)
+{
+	struct marker *m = prop->val.markers;
+	struct node *refnode;
+	cell_t phandle;
+	struct property *prop_deps;
+	unsigned i;
+	cell_t *cell;
+	struct node *source;
+	struct node *target;
+
+	for_each_marker_of_type(m, REF_PHANDLE) {
+		assert(m->offset + sizeof(cell_t) <= prop->val.len);
+
+		refnode = get_node_by_ref(dt, m->ref);
+		if (!refnode) {
+			fprintf(stderr,
+				"ERROR: Reference to non-existent node or label \"%s\"\n",
+				m->ref);
+			continue;
+		}
+
+		source = find_compatible_not_disabled(node);
+		target = find_compatible_not_disabled(refnode);
+		if (!source || !target || source == target ||
+				is_parent_of(source, target) ||
+				is_parent_of(target, source))
+			continue;
+		phandle = get_node_phandle(dt, target);
+		prop_deps = get_property(source, "dependencies");
+		if (!prop_deps) {
+			add_property(source,
+			     build_property("dependencies",
+				data_append_cell(empty_data, phandle)));
+			continue;
+		}
+		cell = (cell_t *)prop_deps->val.val;
+		for (i = 0; i < prop_deps->val.len/4; ++i)
+			if (*cell++ == cpu_to_fdt32(phandle))
+				break;
+		if (i < prop_deps->val.len/4)
+			continue; /* avoid duplicates */
+		prop_deps->val = data_append_cell(prop_deps->val, phandle);
+	}
+}
+
+static void process_nodes_props(struct node *dt, struct node *node)
+{
+	struct node *child;
+	struct property *prop;
+
+	for_each_property(node, prop)
+		add_deps(dt, node, prop);
+
+	for_each_child(node, child)
+		process_nodes_props(dt, child);
+}
+
+void add_dependencies(struct boot_info *bi)
+{
+	process_nodes_props(bi->dt, bi->dt);
+}
diff --git a/dtc.c b/dtc.c
index d36ccdc..c0647da 100644
--- a/dtc.c
+++ b/dtc.c
@@ -49,7 +49,7 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
 
 /* Usage related data. */
 static const char usage_synopsis[] = "dtc [options] <input file>";
-static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:fb:i:H:sW:E:hv";
+static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:fb:i:H:sDW:E:hv";
 static struct option const usage_long_opts[] = {
 	{"quiet",            no_argument, NULL, 'q'},
 	{"in-format",         a_argument, NULL, 'I'},
@@ -64,6 +64,7 @@ static struct option const usage_long_opts[] = {
 	{"force",            no_argument, NULL, 'f'},
 	{"include",           a_argument, NULL, 'i'},
 	{"sort",             no_argument, NULL, 's'},
+	{"no-dependencies",  no_argument, NULL, 'D'},
 	{"phandle",           a_argument, NULL, 'H'},
 	{"warning",           a_argument, NULL, 'W'},
 	{"error",             a_argument, NULL, 'E'},
@@ -91,6 +92,7 @@ static const char * const usage_opts_help[] = {
 	"\n\tTry to produce output even if the input tree has errors",
 	"\n\tAdd a path to search for include files",
 	"\n\tSort nodes and properties before outputting (useful for comparing trees)",
+	"\n\tDo not automatically add dependencies for phandle references",
 	"\n\tValid phandle formats are:\n"
 	 "\t\tlegacy - \"linux,phandle\" properties only\n"
 	 "\t\tepapr  - \"phandle\" properties only\n"
@@ -110,6 +112,7 @@ int main(int argc, char *argv[])
 	const char *outname = "-";
 	const char *depname = NULL;
 	bool force = false, sort = false;
+	bool dependencies = true;
 	const char *arg;
 	int opt;
 	FILE *outf = NULL;
@@ -177,6 +180,10 @@ int main(int argc, char *argv[])
 			sort = true;
 			break;
 
+		case 'D':
+			dependencies = false;
+			break;
+
 		case 'W':
 			parse_checks_option(true, false, optarg);
 			break;
@@ -234,6 +241,9 @@ int main(int argc, char *argv[])
 	if (sort)
 		sort_tree(bi);
 
+	if (dependencies)
+		add_dependencies(bi);
+
 	if (streq(outname, "-")) {
 		outf = stdout;
 	} else {
diff --git a/dtc.h b/dtc.h
index 20de073..fa84017 100644
--- a/dtc.h
+++ b/dtc.h
@@ -266,4 +266,7 @@ struct boot_info *dt_from_source(const char *f);
 
 struct boot_info *dt_from_fs(const char *dirname);
 
+/* Dependencies */
+void add_dependencies(struct boot_info *bi);
+
 #endif /* _DTC_H */
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
