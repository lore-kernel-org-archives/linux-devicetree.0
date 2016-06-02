From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v8 3/3] dtc: Plugin and fixup support
Date: Thu,  2 Jun 2016 20:47:22 +0300
Message-ID: <1464889642-28080-4-git-send-email-pantelis.antoniou@konsulko.com>
References: <1464889642-28080-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464889642-28080-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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
 Documentation/manual.txt |  24 +++++-
 checks.c                 |   8 +-
 dtc-lexer.l              |   5 ++
 dtc-parser.y             |  33 ++++++-
 dtc.c                    |  23 ++++-
 dtc.h                    |  31 ++++++-
 flattree.c               |   2 +-
 fstree.c                 |   2 +-
 livetree.c               | 219 ++++++++++++++++++++++++++++++++++++++++++++++-
 treesource.c             |   1 +
 10 files changed, 332 insertions(+), 16 deletions(-)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 6d2811b..deffcdb 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -127,6 +127,20 @@ Options:
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
@@ -154,12 +168,18 @@ Additionally, dtc performs various sanity checks on the tree.
 Here is a very rough overview of the layout of a DTS source file:
 
 
-    sourcefile:   list_of_memreserve devicetree
+    sourcefile:   versioninfo plugindecl list_of_memreserve basetree overlays
+
+    versioninfo:  "/dts-v1/"
+
+    plugindecl:   "/plugin/"
 
     memreserve:   label 'memreserve' ADDR ADDR ';'
 		| label 'memreserve' ADDR '-' ADDR ';'
 
-    devicetree:   '/' nodedef
+    basetree:   '/' nodedef
+
+    overlays:   list_of_overlay_definitions (at compile time)
 
     nodedef:      '{' list_of_property list_of_subnode '}' ';'
 
diff --git a/checks.c b/checks.c
index 1829f0e..355bef9 100644
--- a/checks.c
+++ b/checks.c
@@ -482,8 +482,12 @@ static void fixup_phandle_references(struct check *c, struct node *dt,
 
 			refnode = get_node_by_ref(dt, m->ref);
 			if (! refnode) {
-				FAIL(c, "Reference to non-existent node or label \"%s\"\n",
-				     m->ref);
+				if (!(tree_get_versionflags(dt) & VF_PLUGIN))
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
index e0d7212..bb89631 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -19,6 +19,7 @@
  */
 %{
 #include <stdio.h>
+#include <inttypes.h>
 
 #include "dtc.h"
 #include "srcpos.h"
@@ -33,6 +34,7 @@ extern void yyerror(char const *s);
 
 extern struct dt_info *parser_output;
 extern bool treesource_error;
+extern unsigned int the_versionflags;
 %}
 
 %union {
@@ -54,9 +56,11 @@ extern bool treesource_error;
 	struct overlay *overlaylist;
 	struct reserve_info *re;
 	uint64_t integer;
+	unsigned int flags;
 }
 
 %token DT_V1
+%token DT_PLUGIN
 %token DT_MEMRESERVE
 %token DT_LSHIFT DT_RSHIFT DT_LE DT_GE DT_EQ DT_NE DT_AND DT_OR
 %token DT_BITS
@@ -73,6 +77,8 @@ extern bool treesource_error;
 
 %type <data> propdata
 %type <data> propdataprefix
+%type <flags> versioninfo
+%type <flags> plugindecl
 %type <re> memreserve
 %type <re> memreserves
 %type <array> arrayprefix
@@ -106,16 +112,37 @@ extern bool treesource_error;
 %%
 
 sourcefile:
-	  v1tag memreserves basetree overlays
+	  versioninfo plugindecl memreserves basetree overlays
 		{
-			parser_output = build_dt_info($2, $3, $4,
-						      guess_boot_cpuid($3));
+			assert(($1 | $2) == the_versionflags);
+			parser_output = build_dt_info($1 | $2, $3, $4, $5,
+							guess_boot_cpuid($4));
+		}
+	;
+
+versioninfo:
+	v1tag
+		{
+			the_versionflags |= VF_DT_V1;
+			$$ = VF_DT_V1;
 		}
 	;
 
 v1tag:
 	  DT_V1 ';'
 	| DT_V1 ';' v1tag
+	| DT_V1
+
+plugindecl:
+	DT_PLUGIN ';'
+		{
+			the_versionflags |= VF_PLUGIN;
+			$$ = the_versionflags;
+		}
+	| /* empty */
+		{
+			$$ = 0;
+		}
 	;
 
 memreserves:
diff --git a/dtc.c b/dtc.c
index 43ba19d..8b716ad 100644
--- a/dtc.c
+++ b/dtc.c
@@ -31,6 +31,8 @@ int reservenum;		/* Number of memory reservation slots */
 int minsize;		/* Minimum blob size */
 int padsize;		/* Additional padding to blob */
 int phandle_format = PHANDLE_BOTH;	/* Use linux,phandle or phandle properties */
+int symbol_fixup_support;
+int auto_label_aliases;
 
 static void fill_fullpaths(struct node *tree, const char *prefix)
 {
@@ -63,7 +65,7 @@ static void resolve_overlays(struct dt_info *dti)
 #define FDT_VERSION(version)	_FDT_VERSION(version)
 #define _FDT_VERSION(version)	#version
 static const char usage_synopsis[] = "dtc [options] <input file>";
-static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:fb:i:H:sW:E:hv";
+static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:fb:i:H:sW:E:@Ahv";
 static struct option const usage_long_opts[] = {
 	{"quiet",            no_argument, NULL, 'q'},
 	{"in-format",         a_argument, NULL, 'I'},
@@ -81,6 +83,8 @@ static struct option const usage_long_opts[] = {
 	{"phandle",           a_argument, NULL, 'H'},
 	{"warning",           a_argument, NULL, 'W'},
 	{"error",             a_argument, NULL, 'E'},
+	{"symbols",	     no_argument, NULL, '@'},
+	{"auto-alias",       no_argument, NULL, 'A'},
 	{"help",             no_argument, NULL, 'h'},
 	{"version",          no_argument, NULL, 'v'},
 	{NULL,               no_argument, NULL, 0x0},
@@ -111,6 +115,8 @@ static const char * const usage_opts_help[] = {
 	 "\t\tboth   - Both \"linux,phandle\" and \"phandle\" properties",
 	"\n\tEnable/disable warnings (prefix with \"no-\")",
 	"\n\tEnable/disable errors (prefix with \"no-\")",
+	"\n\tEnable symbols/fixup support",
+	"\n\tEnable auto-alias of labels",
 	"\n\tPrint this help and exit",
 	"\n\tPrint version and exit",
 	NULL,
@@ -247,7 +253,12 @@ int main(int argc, char *argv[])
 		case 'E':
 			parse_checks_option(false, true, optarg);
 			break;
-
+		case '@':
+			symbol_fixup_support = 1;
+			break;
+		case 'A':
+			auto_label_aliases = 1;
+			break;
 		case 'h':
 			usage(NULL);
 		default:
@@ -308,6 +319,14 @@ int main(int argc, char *argv[])
 
 	process_checks(force, dti);
 
+	if (auto_label_aliases)
+		generate_label_tree(dti->dt, "aliases", false);
+
+	if (symbol_fixup_support) {
+		generate_label_tree(dti->dt, "__symbols__", true);
+		generate_fixups_tree(dti->dt);
+	}
+
 	if (sort)
 		sort_tree(dti);
 
diff --git a/dtc.h b/dtc.h
index fa66dca..a9fac44 100644
--- a/dtc.h
+++ b/dtc.h
@@ -54,6 +54,12 @@ extern int reservenum;		/* Number of memory reservation slots */
 extern int minsize;		/* Minimum blob size */
 extern int padsize;		/* Additional padding to blob */
 extern int phandle_format;	/* Use linux,phandle or phandle properties */
+extern int symbol_fixup_support;/* enable symbols & fixup support */
+extern int auto_label_aliases;	/* auto generate labels -> aliases */
+
+/*
+ * Tree source globals
+ */
 
 #define PHANDLE_LEGACY	0x1
 #define PHANDLE_EPAPR	0x2
@@ -142,6 +148,8 @@ struct property {
 	struct label *labels;
 };
 
+struct dt_info;
+
 struct node {
 	bool deleted;
 	char *name;
@@ -158,6 +166,9 @@ struct node {
 	int addr_cells, size_cells;
 
 	struct label *labels;
+
+	/* only for the root (parent == NULL) */
+	struct dt_info *dti;
 };
 
 struct overlay {
@@ -200,6 +211,7 @@ struct node *build_node_delete(void);
 struct node *name_node(struct node *node, char *name);
 struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
+void add_orphan_node(struct node *old_node, struct node *new_node, char *ref);
 
 void add_property(struct node *node, struct property *prop);
 void delete_property_by_name(struct node *node, char *name);
@@ -207,6 +219,8 @@ void delete_property(struct property *prop);
 void add_child(struct node *parent, struct node *child);
 void delete_node_by_name(struct node *parent, char *name);
 void delete_node(struct node *node);
+struct property *append_to_property(struct node *node,
+				    char *name, const void *data, int len);
 
 struct overlay *build_overlay(char *target, struct node *dt);
 struct overlay *chain_overlay(struct overlay *first, struct overlay *list);
@@ -246,6 +260,7 @@ struct reserve_info *add_reserve_entry(struct reserve_info *list,
 
 
 struct dt_info {
+	unsigned int versionflags;
 	struct reserve_info *reservelist;
 	uint32_t boot_cpuid_phys;
 
@@ -253,11 +268,25 @@ struct dt_info {
 	struct overlay *overlays;
 };
 
-struct dt_info *build_dt_info(struct reserve_info *reservelist,
+/* version flags definitions */
+#define VF_DT_V1	0x0001	/* /dts-v1/ */
+#define VF_PLUGIN	0x0002	/* /plugin/ */
+
+static inline unsigned int tree_get_versionflags(struct node *dt)
+{
+	if (!dt || !dt->dti)
+		return 0;
+	return dt->dti->versionflags;
+}
+
+struct dt_info *build_dt_info(unsigned int versionflags,
+			      struct reserve_info *reservelist,
 			      struct node *basetree,
 			      struct overlay *overlays,
 			      uint32_t boot_cpuid_phys);
 void sort_tree(struct dt_info *dti);
+void generate_label_tree(struct node *dt, char *gen_node_name, bool allocph);
+void generate_fixups_tree(struct node *dt);
 
 /* Checks */
 
diff --git a/flattree.c b/flattree.c
index 59bdc7d..b674cbf 100644
--- a/flattree.c
+++ b/flattree.c
@@ -930,5 +930,5 @@ struct dt_info *dt_from_blob(const char *fname)
 
 	fclose(f);
 
-	return build_dt_info(reservelist, tree, NULL, boot_cpuid_phys);
+	return build_dt_info(VF_DT_V1, reservelist, tree, NULL, boot_cpuid_phys);
 }
diff --git a/fstree.c b/fstree.c
index 0ef96a8..4f1a69d 100644
--- a/fstree.c
+++ b/fstree.c
@@ -86,5 +86,5 @@ struct dt_info *dt_from_fs(const char *dirname)
 	tree = read_fstree(dirname);
 	tree = name_node(tree, "");
 
-	return build_dt_info(NULL, tree, NULL, guess_boot_cpuid(tree));
+	return build_dt_info(VF_DT_V1, NULL, tree, NULL, guess_boot_cpuid(tree));
 }
diff --git a/livetree.c b/livetree.c
index 9a44214..10a81eb 100644
--- a/livetree.c
+++ b/livetree.c
@@ -216,6 +216,31 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 	return old_node;
 }
 
+void add_orphan_node(struct node *dt, struct node *new_node, char *ref)
+{
+	static unsigned int next_orphan_fragment = 0;
+	struct node *node = xmalloc(sizeof(*node));
+	struct property *p;
+	struct data d = empty_data;
+	char *name;
+
+	memset(node, 0, sizeof(*node));
+
+	d = data_add_marker(d, REF_PHANDLE, ref);
+	d = data_append_integer(d, 0xffffffff, 32);
+
+	p = build_property("target", d);
+	add_property(node, p);
+
+	xasprintf(&name, "fragment@%u",
+			next_orphan_fragment++);
+	name_node(node, name);
+	name_node(new_node, "__overlay__");
+
+	add_child(dt, node);
+	add_child(node, new_node);
+}
+
 struct node *chain_node(struct node *first, struct node *list)
 {
 	assert(first->next_sibling == NULL);
@@ -318,9 +343,14 @@ void apply_overlay(struct node *base, struct overlay *overlay)
 {
 	struct node *target = get_node_by_ref(base, overlay->target);
 
-	if (!target)
-		die("Couldn't find label or path %s for overlay\n",
-		    overlay->target);
+	if (!target) {
+		if (base->dti->versionflags & VF_PLUGIN)
+			add_orphan_node(base, overlay->dt, overlay->target);
+		else
+			die("Couldn't find label or path %s for overlay\n",
+				overlay->target);
+		return;
+	}
 
 	if (!overlay->dt)
 		/* Deletion */
@@ -329,6 +359,24 @@ void apply_overlay(struct node *base, struct overlay *overlay)
 		merge_nodes(target, overlay->dt);
 }
 
+struct property *append_to_property(struct node *node,
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
+	return p;
+}
+
 struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
 {
 	struct reserve_info *new = xmalloc(sizeof(*new));
@@ -368,7 +416,8 @@ struct reserve_info *add_reserve_entry(struct reserve_info *list,
 	return list;
 }
 
-struct dt_info *build_dt_info(struct reserve_info *reservelist,
+struct dt_info *build_dt_info(unsigned int versionflags,
+			      struct reserve_info *reservelist,
 			      struct node *basetree,
 			      struct overlay *overlays,
 			      uint32_t boot_cpuid_phys)
@@ -376,10 +425,12 @@ struct dt_info *build_dt_info(struct reserve_info *reservelist,
 	struct dt_info *dti;
 
 	dti = xmalloc(sizeof(*dti));
+	dti->versionflags = versionflags;
 	dti->reservelist = reservelist;
 	dti->boot_cpuid_phys = boot_cpuid_phys;
 	dti->dt = basetree;
 	dti->overlays = overlays;
+	basetree->dti = dti;
 
 	return dti;
 }
@@ -745,3 +796,163 @@ void sort_tree(struct dt_info *dti)
 	sort_reserve_entries(dti);
 	sort_node(dti->dt);
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
+static void generate_label_tree_internal(struct node *dt, struct node *node,
+					 struct node *an, bool allocph)
+{
+	struct node *c;
+	struct property *p;
+	struct label *l;
+
+	/* if if there are labels */
+	if (node->labels) {
+		/* now add the label in the node */
+		for_each_label(node->labels, l) {
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
+				data_copy_escape_string(node->fullpath,
+						strlen(node->fullpath)));
+			add_property(an, p);
+		}
+
+		/* force allocation of a phandle for this node */
+		if (allocph)
+			(void)get_node_phandle(dt, node);
+	}
+
+	for_each_child(node, c)
+		generate_label_tree_internal(dt, c, an, allocph);
+}
+
+void generate_label_tree(struct node *dt, char *gen_node_name, bool allocph)
+{
+	struct node *an;
+
+	an = build_and_name_child_node(dt, gen_node_name);
+	if (!an)
+		die("Could not build label node /%s\n", gen_node_name);
+
+	generate_label_tree_internal(dt, dt, an, allocph);
+}
+
+static char *fixups_name = "__fixups__";
+static char *local_fixups_name = "__local_fixups__";
+
+static void add_fixup_entry(struct node *dt, struct node *node,
+		struct property *prop, struct marker *m)
+{
+	struct node *fn;	/* fixup node */
+	char *entry;
+
+	/* m->ref can only be a REF_PHANDLE, but check anyway */
+	assert(m->type == REF_PHANDLE);
+
+	/* fn is the node we're putting entries in */
+	fn = get_subnode(dt, fixups_name);
+	assert(fn != NULL);
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
+static void add_local_fixup_entry(struct node *dt, struct node *node,
+		struct property *prop, struct marker *m,
+		struct node *refnode)
+{
+	struct node *lfn, *wn, *nwn;	/* local fixup node, walk node, new */
+	uint32_t value_32;
+	char *s, *e, *comp;
+	int len;
+
+	/* fn is the node we're putting entries in */
+	lfn = get_subnode(dt, local_fixups_name);
+	assert(lfn != NULL);
+
+	/* walk the path components creating nodes if they don't exist */
+	comp = xmalloc(strlen(node->fullpath) + 1);
+	/* start skipping the first / */
+	s = node->fullpath + 1;
+	wn = lfn;
+	while (*s) {
+		/* retrieve path component */
+		e = strchr(s, '/');
+		if (e == NULL)
+			e = s + strlen(s);
+		len = e - s;
+		memcpy(comp, s, len);
+		comp[len] = '\0';
+
+		/* if no node exists, create it */
+		nwn = get_subnode(wn, comp);
+		if (!nwn)
+			nwn = build_and_name_child_node(wn, comp);
+		wn = nwn;
+
+		/* last path component */
+		if (!*e)
+			break;
+
+		/* next path component */
+		s = e + 1;
+	}
+	free(comp);
+
+	value_32 = cpu_to_fdt32(m->offset);
+	append_to_property(wn, prop->name, &value_32, sizeof(value_32));
+}
+
+static void generate_fixups_tree_internal(struct node *dt, struct node *node)
+{
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
+				add_fixup_entry(dt, node, prop, m);
+			else
+				add_local_fixup_entry(dt, node, prop, m,
+						refnode);
+		}
+	}
+
+	for_each_child(node, c)
+		generate_fixups_tree_internal(dt, c);
+}
+
+void generate_fixups_tree(struct node *dt)
+{
+	build_and_name_child_node(dt, fixups_name);
+	build_and_name_child_node(dt, local_fixups_name);
+	generate_fixups_tree_internal(dt, dt);
+}
diff --git a/treesource.c b/treesource.c
index c9d8967..0c84f02 100644
--- a/treesource.c
+++ b/treesource.c
@@ -27,6 +27,7 @@ extern YYLTYPE yylloc;
 
 struct dt_info *parser_output;
 bool treesource_error;
+unsigned int the_versionflags;
 
 struct dt_info *dt_from_source(const char *fname)
 {
-- 
1.7.12
