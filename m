From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v13 2/7] dtc: Plugin and fixup support
Date: Wed,  7 Dec 2016 14:48:18 +0200
Message-ID: <1481114903-8197-3-git-send-email-pantelis.antoniou@konsulko.com>
References: <1481114903-8197-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481114903-8197-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch enable the generation of symbols & local fixup information
for trees compiled with the -@ (--symbols) option.

Using this patch labels in the tree and their users emit information
in __symbols__ and __local_fixups__ nodes.

The __fixups__ node make possible the dynamic resolution of phandle
references which are present in the plugin tree but lie in the
tree that are applying the overlay against.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 Documentation/manual.txt |  21 +++-
 checks.c                 |   8 +-
 dtc-lexer.l              |   5 +
 dtc-parser.y             |  28 ++++-
 dtc.c                    |  33 +++++-
 dtc.h                    |  16 ++-
 flattree.c               |   2 +-
 fstree.c                 |   2 +-
 livetree.c               | 269 ++++++++++++++++++++++++++++++++++++++++++++++-
 9 files changed, 373 insertions(+), 11 deletions(-)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 398de32..74e27c4 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -119,6 +119,20 @@ Options:
 	Make space for <number> reserve map entries
 	Relevant for dtb and asm output only.
 
+    -@
+	Generates a __symbols__ node at the root node of the resulting blob
+	for any node labels used, and for any local references using phandles
+	it also generates a __local_fixups__ node that tracks them.
+
+	When using the /plugin/ tag all unresolved label references to
+	be tracked in the __fixups__ node, making dynamic resolution possible.
+
+    -A
+	Generate automatically aliases for all node labels. This is similar to
+	the -@ option (the __symbols__ node contain identical information) but
+	the semantics are slightly different since no phandles are automatically
+	generated for labeled nodes.
+
     -S <bytes>
 	Ensure the blob at least <bytes> long, adding additional
 	space if needed.
@@ -146,13 +160,18 @@ Additionally, dtc performs various sanity checks on the tree.
 Here is a very rough overview of the layout of a DTS source file:
 
 
-    sourcefile:   list_of_memreserve devicetree
+    sourcefile:   versioninfo plugindecl list_of_memreserve devicetree
 
     memreserve:   label 'memreserve' ADDR ADDR ';'
 		| label 'memreserve' ADDR '-' ADDR ';'
 
     devicetree:   '/' nodedef
 
+    versioninfo:  '/' 'dts-v1' '/' ';'
+
+    plugindecl:   '/' 'plugin' '/' ';'
+                | /* empty */
+
     nodedef:      '{' list_of_property list_of_subnode '}' ';'
 
     property:     label PROPNAME '=' propdata ';'
diff --git a/checks.c b/checks.c
index 2bd27a4..4d71884 100644
--- a/checks.c
+++ b/checks.c
@@ -487,8 +487,12 @@ static void fixup_phandle_references(struct check *c, struct boot_info *bi,
 
 			refnode = get_node_by_ref(dt, m->ref);
 			if (! refnode) {
-				FAIL(c, "Reference to non-existent node or label \"%s\"\n",
-				     m->ref);
+				if (!(bi->dtsflags & DTSF_PLUGIN))
+					FAIL(c, "Reference to non-existent node or "
+							"label \"%s\"\n", m->ref);
+				else /* mark the entry as unresolved */
+					*((cell_t *)(prop->val.val + m->offset)) =
+						cpu_to_fdt32(0xffffffff);
 				continue;
 			}
 
diff --git a/dtc-lexer.l b/dtc-lexer.l
index 790fbf6..40bbc87 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -121,6 +121,11 @@ static void lexical_error(const char *fmt, ...);
 			return DT_V1;
 		}
 
+<*>"/plugin/"	{
+			DPRINT("Keyword: /plugin/\n");
+			return DT_PLUGIN;
+		}
+
 <*>"/memreserve/"	{
 			DPRINT("Keyword: /memreserve/\n");
 			BEGIN_DEFAULT();
diff --git a/dtc-parser.y b/dtc-parser.y
index 14aaf2e..27d358f 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -19,6 +19,7 @@
  */
 %{
 #include <stdio.h>
+#include <inttypes.h>
 
 #include "dtc.h"
 #include "srcpos.h"
@@ -52,9 +53,11 @@ extern bool treesource_error;
 	struct node *nodelist;
 	struct reserve_info *re;
 	uint64_t integer;
+	unsigned int flags;
 }
 
 %token DT_V1
+%token DT_PLUGIN
 %token DT_MEMRESERVE
 %token DT_LSHIFT DT_RSHIFT DT_LE DT_GE DT_EQ DT_NE DT_AND DT_OR
 %token DT_BITS
@@ -71,6 +74,8 @@ extern bool treesource_error;
 
 %type <data> propdata
 %type <data> propdataprefix
+%type <flags> versioninfo
+%type <flags> plugindecl
 %type <re> memreserve
 %type <re> memreserves
 %type <array> arrayprefix
@@ -101,16 +106,33 @@ extern bool treesource_error;
 %%
 
 sourcefile:
-	  v1tag memreserves devicetree
+	  versioninfo plugindecl memreserves devicetree
 		{
-			the_boot_info = build_boot_info($2, $3,
-							guess_boot_cpuid($3));
+			the_boot_info = build_boot_info($1 | $2, $3, $4,
+							guess_boot_cpuid($4));
+		}
+	;
+
+versioninfo:
+	v1tag
+		{
+			$$ = DTSF_V1;
 		}
 	;
 
 v1tag:
 	  DT_V1 ';'
 	| DT_V1 ';' v1tag
+
+plugindecl:
+	DT_PLUGIN ';'
+		{
+			$$ = DTSF_PLUGIN;
+		}
+	| /* empty */
+		{
+			$$ = 0;
+		}
 	;
 
 memreserves:
diff --git a/dtc.c b/dtc.c
index 9dcf640..ab16ab4 100644
--- a/dtc.c
+++ b/dtc.c
@@ -32,6 +32,9 @@ int minsize;		/* Minimum blob size */
 int padsize;		/* Additional padding to blob */
 int alignsize;		/* Additional padding to blob accroding to the alignsize */
 int phandle_format = PHANDLE_BOTH;	/* Use linux,phandle or phandle properties */
+int generate_symbols;	/* enable symbols & fixup support */
+int generate_fixups;		/* suppress generation of fixups on symbol support */
+int auto_label_aliases;		/* auto generate labels -> aliases */
 
 static int is_power_of_2(int x)
 {
@@ -59,7 +62,7 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
 #define FDT_VERSION(version)	_FDT_VERSION(version)
 #define _FDT_VERSION(version)	#version
 static const char usage_synopsis[] = "dtc [options] <input file>";
-static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:hv";
+static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:@Ahv";
 static struct option const usage_long_opts[] = {
 	{"quiet",            no_argument, NULL, 'q'},
 	{"in-format",         a_argument, NULL, 'I'},
@@ -78,6 +81,8 @@ static struct option const usage_long_opts[] = {
 	{"phandle",           a_argument, NULL, 'H'},
 	{"warning",           a_argument, NULL, 'W'},
 	{"error",             a_argument, NULL, 'E'},
+	{"symbols",	     no_argument, NULL, '@'},
+	{"auto-alias",       no_argument, NULL, 'A'},
 	{"help",             no_argument, NULL, 'h'},
 	{"version",          no_argument, NULL, 'v'},
 	{NULL,               no_argument, NULL, 0x0},
@@ -109,6 +114,8 @@ static const char * const usage_opts_help[] = {
 	 "\t\tboth   - Both \"linux,phandle\" and \"phandle\" properties",
 	"\n\tEnable/disable warnings (prefix with \"no-\")",
 	"\n\tEnable/disable errors (prefix with \"no-\")",
+	"\n\tEnable generation of symbols",
+	"\n\tEnable auto-alias of labels",
 	"\n\tPrint this help and exit",
 	"\n\tPrint version and exit",
 	NULL,
@@ -249,6 +256,13 @@ int main(int argc, char *argv[])
 			parse_checks_option(false, true, optarg);
 			break;
 
+		case '@':
+			generate_symbols = 1;
+			break;
+		case 'A':
+			auto_label_aliases = 1;
+			break;
+
 		case 'h':
 			usage(NULL);
 		default:
@@ -306,6 +320,23 @@ int main(int argc, char *argv[])
 	fill_fullpaths(bi->dt, "");
 	process_checks(force, bi);
 
+	/* on a plugin, generate by default */
+	if (bi->dtsflags & DTSF_PLUGIN) {
+		generate_symbols = 1;
+		generate_fixups = 1;
+	}
+
+	if (auto_label_aliases)
+		generate_label_tree(bi, "aliases", false);
+
+	if (generate_symbols)
+		generate_label_tree(bi, "__symbols__", true);
+
+	if (generate_fixups) {
+		generate_fixups_tree(bi, "__fixups__");
+		generate_local_fixups_tree(bi, "__local_fixups__");
+	}
+
 	if (sort)
 		sort_tree(bi);
 
diff --git a/dtc.h b/dtc.h
index 32009bc..2ca8601 100644
--- a/dtc.h
+++ b/dtc.h
@@ -55,6 +55,9 @@ extern int minsize;		/* Minimum blob size */
 extern int padsize;		/* Additional padding to blob */
 extern int alignsize;		/* Additional padding to blob accroding to the alignsize */
 extern int phandle_format;	/* Use linux,phandle or phandle properties */
+extern int generate_symbols;	/* generate symbols for nodes with labels */
+extern int generate_fixups;	/* generate fixups */
+extern int auto_label_aliases;	/* auto generate labels -> aliases */
 
 #define PHANDLE_LEGACY	0x1
 #define PHANDLE_EPAPR	0x2
@@ -202,6 +205,8 @@ void delete_property(struct property *prop);
 void add_child(struct node *parent, struct node *child);
 void delete_node_by_name(struct node *parent, char *name);
 void delete_node(struct node *node);
+void append_to_property(struct node *node,
+			char *name, const void *data, int len);
 
 const char *get_unitname(struct node *node);
 struct property *get_property(struct node *node, const char *propname);
@@ -237,14 +242,23 @@ struct reserve_info *add_reserve_entry(struct reserve_info *list,
 
 
 struct boot_info {
+	unsigned int dtsflags;
 	struct reserve_info *reservelist;
 	struct node *dt;		/* the device tree */
 	uint32_t boot_cpuid_phys;
 };
 
-struct boot_info *build_boot_info(struct reserve_info *reservelist,
+/* DTS version flags definitions */
+#define DTSF_V1		0x0001	/* /dts-v1/ */
+#define DTSF_PLUGIN	0x0002	/* /plugin/ */
+
+struct boot_info *build_boot_info(unsigned int dtsflags,
+				  struct reserve_info *reservelist,
 				  struct node *tree, uint32_t boot_cpuid_phys);
 void sort_tree(struct boot_info *bi);
+void generate_label_tree(struct boot_info *bi, char *name, bool allocph);
+void generate_fixups_tree(struct boot_info *bi, char *name);
+void generate_local_fixups_tree(struct boot_info *bi, char *name);
 
 /* Checks */
 
diff --git a/flattree.c b/flattree.c
index a9d9520..99c2c71 100644
--- a/flattree.c
+++ b/flattree.c
@@ -942,5 +942,5 @@ struct boot_info *dt_from_blob(const char *fname)
 
 	fclose(f);
 
-	return build_boot_info(reservelist, tree, boot_cpuid_phys);
+	return build_boot_info(DTSF_V1, reservelist, tree, boot_cpuid_phys);
 }
diff --git a/fstree.c b/fstree.c
index 6d1beec..e67fd9f 100644
--- a/fstree.c
+++ b/fstree.c
@@ -86,6 +86,6 @@ struct boot_info *dt_from_fs(const char *dirname)
 	tree = read_fstree(dirname);
 	tree = name_node(tree, "");
 
-	return build_boot_info(NULL, tree, guess_boot_cpuid(tree));
+	return build_boot_info(DTSF_V1, NULL, tree, guess_boot_cpuid(tree));
 }
 
diff --git a/livetree.c b/livetree.c
index 3dc7559..df1bc04 100644
--- a/livetree.c
+++ b/livetree.c
@@ -296,6 +296,23 @@ void delete_node(struct node *node)
 	delete_labels(&node->labels);
 }
 
+void append_to_property(struct node *node,
+				    char *name, const void *data, int len)
+{
+	struct data d;
+	struct property *p;
+
+	p = get_property(node, name);
+	if (p) {
+		d = data_append_data(p->val, data, len);
+		p->val = d;
+	} else {
+		d = data_append_data(empty_data, data, len);
+		p = build_property(name, d);
+		add_property(node, p);
+	}
+}
+
 struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
 {
 	struct reserve_info *new = xmalloc(sizeof(*new));
@@ -335,12 +352,14 @@ struct reserve_info *add_reserve_entry(struct reserve_info *list,
 	return list;
 }
 
-struct boot_info *build_boot_info(struct reserve_info *reservelist,
+struct boot_info *build_boot_info(unsigned int dtsflags,
+				  struct reserve_info *reservelist,
 				  struct node *tree, uint32_t boot_cpuid_phys)
 {
 	struct boot_info *bi;
 
 	bi = xmalloc(sizeof(*bi));
+	bi->dtsflags = dtsflags;
 	bi->reservelist = reservelist;
 	bi->dt = tree;
 	bi->boot_cpuid_phys = boot_cpuid_phys;
@@ -709,3 +728,251 @@ void sort_tree(struct boot_info *bi)
 	sort_reserve_entries(bi);
 	sort_node(bi->dt);
 }
+
+/* utility helper to avoid code duplication */
+static struct node *build_and_name_child_node(struct node *parent, char *name)
+{
+	struct node *node;
+
+	node = build_node(NULL, NULL);
+	name_node(node, xstrdup(name));
+	add_child(parent, node);
+
+	return node;
+}
+
+static struct node *build_root_node(struct node *dt, char *name)
+{
+	struct node *an;
+
+	an = get_subnode(dt, name);
+	if (!an)
+		an = build_and_name_child_node(dt, name);
+
+	if (!an)
+		die("Could not build root node /%s\n", name);
+
+	return an;
+}
+
+static bool any_label_tree(struct boot_info *bi, struct node *node)
+{
+	struct node *c;
+
+	if (node->labels)
+		return true;
+
+	for_each_child(node, c)
+		if (any_label_tree(bi, c))
+			return true;
+
+	return false;
+}
+
+static void generate_label_tree_internal(struct boot_info *bi,
+					 struct node *an, struct node *node,
+					 bool allocph)
+{
+	struct node *dt = bi->dt;
+	struct node *c;
+	struct property *p;
+	struct label *l;
+
+	/* if there are labels */
+	if (node->labels) {
+
+		/* now add the label in the node */
+		for_each_label(node->labels, l) {
+
+			/* check whether the label already exists */
+			p = get_property(an, l->label);
+			if (p) {
+				fprintf(stderr, "WARNING: label %s already"
+					" exists in /%s", l->label,
+					an->name);
+				continue;
+			}
+
+			/* insert it */
+			p = build_property(l->label,
+				data_copy_mem(node->fullpath,
+						strlen(node->fullpath) + 1));
+			add_property(an, p);
+		}
+
+		/* force allocation of a phandle for this node */
+		if (allocph)
+			(void)get_node_phandle(dt, node);
+	}
+
+	for_each_child(node, c)
+		generate_label_tree_internal(bi, an, c, allocph);
+}
+
+static bool any_fixup_tree(struct boot_info *bi, struct node *node)
+{
+	struct node *c;
+	struct property *prop;
+	struct marker *m;
+
+	for_each_property(node, prop) {
+		m = prop->val.markers;
+		for_each_marker_of_type(m, REF_PHANDLE) {
+			if (!get_node_by_ref(bi->dt, m->ref))
+				return true;
+		}
+	}
+
+	for_each_child(node, c) {
+		if (any_fixup_tree(bi, c))
+			return true;
+	}
+
+	return false;
+}
+
+static void add_fixup_entry(struct boot_info *bi, struct node *fn,
+			    struct node *node, struct property *prop,
+			    struct marker *m)
+{
+	char *entry;
+
+	/* m->ref can only be a REF_PHANDLE, but check anyway */
+	assert(m->type == REF_PHANDLE);
+
+	/* there shouldn't be any ':' in the arguments */
+	if (strchr(node->fullpath, ':') || strchr(prop->name, ':'))
+		die("arguments should not contain ':'\n");
+
+	xasprintf(&entry, "%s:%s:%u",
+			node->fullpath, prop->name, m->offset);
+	append_to_property(fn, m->ref, entry, strlen(entry) + 1);
+}
+
+static void generate_fixups_tree_internal(struct boot_info *bi,
+					  struct node *fn,
+					  struct node *node)
+{
+	struct node *dt = bi->dt;
+	struct node *c;
+	struct property *prop;
+	struct marker *m;
+	struct node *refnode;
+
+	for_each_property(node, prop) {
+		m = prop->val.markers;
+		for_each_marker_of_type(m, REF_PHANDLE) {
+			refnode = get_node_by_ref(dt, m->ref);
+			if (!refnode)
+				add_fixup_entry(bi, fn, node, prop, m);
+		}
+	}
+
+	for_each_child(node, c)
+		generate_fixups_tree_internal(bi, fn, c);
+}
+
+static bool any_local_fixup_tree(struct boot_info *bi, struct node *node)
+{
+	struct node *c;
+	struct property *prop;
+	struct marker *m;
+
+	for_each_property(node, prop) {
+		m = prop->val.markers;
+		for_each_marker_of_type(m, REF_PHANDLE) {
+			if (get_node_by_ref(bi->dt, m->ref))
+				return true;
+		}
+	}
+
+	for_each_child(node, c) {
+		if (any_local_fixup_tree(bi, c))
+			return true;
+	}
+
+	return false;
+}
+
+static void add_local_fixup_entry(struct boot_info *bi,
+		struct node *lfn, struct node *node,
+		struct property *prop, struct marker *m,
+		struct node *refnode)
+{
+	struct node *wn, *nwn;	/* local fixup node, walk node, new */
+	uint32_t value_32;
+	char **compp;
+	int i, depth;
+
+	/* walk back retreiving depth */
+	depth = 0;
+	for (wn = node; wn; wn = wn->parent)
+		depth++;
+
+	/* allocate name array */
+	compp = xmalloc(sizeof(*compp) * depth);
+
+	/* store names in the array */
+	for (wn = node, i = depth - 1; wn; wn = wn->parent, i--)
+		compp[i] = wn->name;
+
+	/* walk the path components creating nodes if they don't exist */
+	for (wn = lfn, i = 1; i < depth; i++, wn = nwn) {
+		/* if no node exists, create it */
+		nwn = get_subnode(wn, compp[i]);
+		if (!nwn)
+			nwn = build_and_name_child_node(wn, compp[i]);
+	}
+
+	free(compp);
+
+	value_32 = cpu_to_fdt32(m->offset);
+	append_to_property(wn, prop->name, &value_32, sizeof(value_32));
+}
+
+static void generate_local_fixups_tree_internal(struct boot_info *bi,
+						struct node *lfn,
+						struct node *node)
+{
+	struct node *dt = bi->dt;
+	struct node *c;
+	struct property *prop;
+	struct marker *m;
+	struct node *refnode;
+
+	for_each_property(node, prop) {
+		m = prop->val.markers;
+		for_each_marker_of_type(m, REF_PHANDLE) {
+			refnode = get_node_by_ref(dt, m->ref);
+			if (refnode)
+				add_local_fixup_entry(bi, lfn, node, prop, m, refnode);
+		}
+	}
+
+	for_each_child(node, c)
+		generate_local_fixups_tree_internal(bi, lfn, c);
+}
+
+void generate_label_tree(struct boot_info *bi, char *name, bool allocph)
+{
+	if (!any_label_tree(bi, bi->dt))
+		return;
+	generate_label_tree_internal(bi, build_root_node(bi->dt, name),
+				     bi->dt, allocph);
+}
+
+void generate_fixups_tree(struct boot_info *bi, char *name)
+{
+	if (!any_fixup_tree(bi, bi->dt))
+		return;
+	generate_fixups_tree_internal(bi, build_root_node(bi->dt, name),
+				      bi->dt);
+}
+
+void generate_local_fixups_tree(struct boot_info *bi, char *name)
+{
+	if (!any_local_fixup_tree(bi, bi->dt))
+		return;
+	generate_local_fixups_tree_internal(bi, build_root_node(bi->dt, name),
+					    bi->dt);
+}
-- 
2.1.4
