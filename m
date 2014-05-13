From: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Subject: [PATCH 3/3] deps: Add option to print dependency graph as dot (Graphviz)
Date: Tue, 13 May 2014 10:54:03 +0200
Message-ID: <1399971243-18153-4-git-send-email-holler@ahsoftware.de>
References: <537151FF.8070104@ahsoftware.de>
 <1399971243-18153-1-git-send-email-holler@ahsoftware.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399971243-18153-1-git-send-email-holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add option -T do print a dependency graph in dot format for
generating a picture with Graphviz.

E.g.

	dtc -T foo.dts | dot -T svg -o foo.svg

would generate the picture foo.png with the dependency graph.

Convential dependencies (those based on the tree structure) are having
black arrows, dependencies based on the property 'dependencies' are
having cyan arrows.

Option -D to not automatically add dependencies does still work, so
you could build a classic dependency graph with

	dtc -D -T foo.dts | dot -T png -o foo_no_auto_deps.png

This works with binary blobs as input too. E.g.

	CROSS_COMPILE=gcc-foo ARCH=arm make foo.dtb
	scripts/dtc/dtc -I dtb -T arch/arm/boot/dts/foo.dtb

would print the dot file.

Signed-off-by: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
---
 dependencies.c | 48 ++++++++++++++++++++++++++++++++++++++++++------
 dtc.c          | 19 ++++++++++++++++---
 dtc.h          |  2 +-
 3 files changed, 59 insertions(+), 10 deletions(-)

diff --git a/dependencies.c b/dependencies.c
index 8fe1a8c..4579f6f 100644
--- a/dependencies.c
+++ b/dependencies.c
@@ -298,7 +298,7 @@ static void __init topological_sort(void)
 			depth_first_search(i);
 }
 
-static int __init add_dep_list(struct device_node *node)
+static int __init add_dep_list(struct device_node *node, bool print_dot)
 {
 	const __be32 *list, *list_end;
 	uint32_t ph;
@@ -328,6 +328,9 @@ static int __init add_dep_list(struct device_node *node)
 		rc = insert_edge(node->phandle, ph);
 		if (rc)
 			break;
+		if (print_dot)
+			printf("      node0x%x -> node0x%x [color=cyan]\n",
+				node->phandle, ph);
 	}
 
 	return rc;
@@ -352,9 +355,10 @@ static const char *of_prop_next_string(struct property *prop, const char *cur)
 }
 
 static int __init add_deps_lnx(struct device_node *parent,
-				struct device_node *node)
+				struct device_node *node, bool print_dot)
 {
 	struct device_node *child;
+	const char *cp;
 	int rc = 0;
 
 	if (!__of_device_is_available(node))
@@ -375,13 +379,33 @@ static int __init add_deps_lnx(struct device_node *parent,
 			return -EINVAL;
 		}
 		order.parent_by_phandle[node->phandle] = parent->phandle;
-		rc = add_dep_list(node);
+		if (print_dot) {
+			struct property *prop;
+			printf("    node0x%x [label=\"0x%x %s", node->phandle,
+						node->phandle, node->name);
+			if (node->full_name)
+				printf(" (%s)", node->full_name);
+			prop = get_property(node, "compatible");
+			if (prop) {
+				printf("\\n");
+				for (cp = of_prop_next_string(prop, NULL); cp;
+				     cp = of_prop_next_string(prop, cp)) {
+					if (cp != prop->val.val)
+						putchar(' ');
+					printf("%s", cp);
+				}
+			}
+			printf("\"];\n");
+			printf("      node0x%x -> node0x%x\n", node->phandle,
+							parent->phandle);
+		}
+		rc = add_dep_list(node, print_dot);
 		if (unlikely(rc))
 			return rc;
 		parent = node; /* change the parent only if node is a driver */
 	}
 	for_each_child_of_node(node, child) {
-		rc = add_deps_lnx(parent, child);
+		rc = add_deps_lnx(parent, child, print_dot);
 		if (unlikely(rc))
 			break;
 	}
@@ -426,7 +450,7 @@ void __init of_init_print_order(const char *name)
 	}
 }
 
-int __init of_init_build_order(struct device_node *root)
+int __init of_init_build_order(struct device_node *root, const char *print_dot)
 {
 	struct device_node *child;
 	int rc = 0;
@@ -438,12 +462,24 @@ int __init of_init_build_order(struct device_node *root)
 	calc_max_phandle(root);
 	order.old_max_phandle = order.max_phandle;
 
+	if (print_dot) {
+		printf("digraph G {\n");
+		printf("    node0x%x [label=\"0x%x root (/)\"];\n",
+			order.max_phandle+1 , order.max_phandle+1);
+	}
+
 	for_each_child_of_node(root, child) {
-		rc = add_deps_lnx(root, child);
+		rc = add_deps_lnx(root, child, print_dot);
 		if (unlikely(rc))
 			break;
 	}
 
+	if (print_dot) {
+		printf("  graph [label=\"Dependency Graph for %s (%u nodes, %u edges)\"];\n",
+			print_dot, graph.nvertices, graph.nedges);
+		printf("}\n");
+	}
+
 	of_node_put(root);
 	topological_sort();
 
diff --git a/dtc.c b/dtc.c
index c732bca..69aebf4 100644
--- a/dtc.c
+++ b/dtc.c
@@ -49,7 +49,7 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
 
 /* Usage related data. */
 static const char usage_synopsis[] = "dtc [options] <input file>";
-static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:fb:i:H:sDtW:E:hv";
+static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:fb:i:H:sDtTW:E:hv";
 static struct option const usage_long_opts[] = {
 	{"quiet",            no_argument, NULL, 'q'},
 	{"in-format",         a_argument, NULL, 'I'},
@@ -66,6 +66,7 @@ static struct option const usage_long_opts[] = {
 	{"sort",             no_argument, NULL, 's'},
 	{"no-dependencies",  no_argument, NULL, 'D'},
 	{"print-init-order", no_argument, NULL, 't'},
+	{"print-dot",        no_argument, NULL, 'T'},
 	{"phandle",           a_argument, NULL, 'H'},
 	{"warning",           a_argument, NULL, 'W'},
 	{"error",             a_argument, NULL, 'E'},
@@ -95,6 +96,7 @@ static const char * const usage_opts_help[] = {
 	"\n\tSort nodes and properties before outputting (useful for comparing trees)",
 	"\n\tDo not automatically add dependencies for phandle references",
 	"\n\tPrint (default) initialization order",
+	"\n\tPrint dot with dependency graph (for use with Graphviz)",
 	"\n\tValid phandle formats are:\n"
 	 "\t\tlegacy - \"linux,phandle\" properties only\n"
 	 "\t\tepapr  - \"phandle\" properties only\n"
@@ -116,6 +118,7 @@ int main(int argc, char *argv[])
 	bool force = false, sort = false;
 	bool dependencies = true;
 	bool init_order = false;
+	bool print_dot = false;
 	const char *arg;
 	int opt;
 	FILE *outf = NULL;
@@ -191,6 +194,10 @@ int main(int argc, char *argv[])
 			init_order = true;
 			break;
 
+		case 'T':
+			print_dot = true;
+			break;
+
 		case 'W':
 			parse_checks_option(true, false, optarg);
 			break;
@@ -252,12 +259,18 @@ int main(int argc, char *argv[])
 		add_dependencies(bi);
 
 	if (init_order) {
-		if (of_init_build_order(bi->dt))
+		if (of_init_build_order(bi->dt, 0))
 			exit(2);
 		of_init_print_order(arg);
 		exit(0);
 	}
 
+	if (print_dot) {
+		if (of_init_build_order(bi->dt, arg))
+			exit(2);
+		exit(0);
+	}
+
 	if (streq(outname, "-")) {
 		outf = stdout;
 	} else {
@@ -284,7 +297,7 @@ int main(int argc, char *argv[])
 	 * This is done after the output was saved because it
 	 * changes the tree slightly.
 	 */
-	if (of_init_build_order(bi->dt))
+	if (of_init_build_order(bi->dt, 0))
 		exit(2);
 
 	exit(0);
diff --git a/dtc.h b/dtc.h
index e4097d4..d8a882a 100644
--- a/dtc.h
+++ b/dtc.h
@@ -269,6 +269,6 @@ struct boot_info *dt_from_fs(const char *dirname);
 /* Dependencies */
 void add_dependencies(struct boot_info *bi);
 void of_init_print_order(const char *name);
-int of_init_build_order(struct node *root);
+int of_init_build_order(struct node *root, const char *print_dot);
 
 #endif /* _DTC_H */
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
