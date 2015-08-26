From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 1/2] dtc: Plugin and fixup support
Date: Wed, 26 Aug 2015 21:44:33 +0300
Message-ID: <1440614674-7055-2-git-send-email-pantelis.antoniou@konsulko.com>
References: <1440614674-7055-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440614674-7055-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
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

panto: The original alternative syntax patch required the use of an empty node
which is no longer required.
Numbering of fragments in sequence was also implemented.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 Documentation/manual.txt |  16 ++++
 checks.c                 |  18 ++++-
 dtc-lexer.l              |   5 ++
 dtc-parser.y             |  54 +++++++++++--
 dtc.c                    |  21 ++++-
 dtc.h                    |  13 ++-
 livetree.c               | 202 +++++++++++++++++++++++++++++++++++++++++++++++
 treesource.c             |   3 +
 8 files changed, 321 insertions(+), 11 deletions(-)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 398de32..29682df 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -119,6 +119,20 @@ Options:
 	Make space for <number> reserve map entries
 	Relevant for dtb and asm output only.
 
+    -@
+        Generates a __symbols__ node at the root node of the resulting blob
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
@@ -153,6 +167,8 @@ Here is a very rough overview of the layout of a DTS source file:
 
     devicetree:   '/' nodedef
 
+    plugindecl:   '/' 'plugin' '/' ';'
+
     nodedef:      '{' list_of_property list_of_subnode '}' ';'
 
     property:     label PROPNAME '=' propdata ';'
diff --git a/checks.c b/checks.c
index 0c03ac9..65bf6fd 100644
--- a/checks.c
+++ b/checks.c
@@ -466,8 +466,12 @@ static void fixup_phandle_references(struct check *c, struct node *dt,
 
 		refnode = get_node_by_ref(dt, m->ref);
 		if (! refnode) {
-			FAIL(c, "Reference to non-existent node or label \"%s\"\n",
-			     m->ref);
+			if (!source_is_plugin)
+				FAIL(c, "Reference to non-existent node or "
+						"label \"%s\"\n", m->ref);
+			else /* mark the entry as unresolved */
+				*((cell_t *)(prop->val.val + m->offset)) =
+					cpu_to_fdt32(0xffffffff);
 			continue;
 		}
 
@@ -652,6 +656,15 @@ static void check_obsolete_chosen_interrupt_controller(struct check *c,
 }
 TREE_WARNING(obsolete_chosen_interrupt_controller, NULL);
 
+static void check_deprecated_plugin_syntax(struct check *c,
+					   struct node *dt)
+{
+	if (deprecated_plugin_syntax_warning)
+		FAIL(c, "Use '/dts-v1/ /plugin/'; syntax. /dts-v1/; /plugin/; "
+				"is going to be removed in next versions");
+}
+TREE_WARNING(deprecated_plugin_syntax, NULL);
+
 static struct check *check_table[] = {
 	&duplicate_node_names, &duplicate_property_names,
 	&node_name_chars, &node_name_format, &property_name_chars,
@@ -669,6 +682,7 @@ static struct check *check_table[] = {
 
 	&avoid_default_addr_size,
 	&obsolete_chosen_interrupt_controller,
+	&deprecated_plugin_syntax,
 
 	&always_fail,
 };
diff --git a/dtc-lexer.l b/dtc-lexer.l
index 0ee1caf..dd44ba2 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -113,6 +113,11 @@ static void lexical_error(const char *fmt, ...);
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
index 5a897e3..accccba 100644
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
+	bool is_plugin;
 }
 
 %token DT_V1
+%token DT_PLUGIN
 %token DT_MEMRESERVE
 %token DT_LSHIFT DT_RSHIFT DT_LE DT_GE DT_EQ DT_NE DT_AND DT_OR
 %token DT_BITS
@@ -71,6 +74,7 @@ extern bool treesource_error;
 
 %type <data> propdata
 %type <data> propdataprefix
+%type <is_plugin> plugindecl
 %type <re> memreserve
 %type <re> memreserves
 %type <array> arrayprefix
@@ -101,10 +105,39 @@ extern bool treesource_error;
 %%
 
 sourcefile:
-	  DT_V1 ';' memreserves devicetree
+	    basesource
+	  | pluginsource
+	  ;
+
+basesource:
+	  DT_V1 ';' plugindecl memreserves devicetree
+		{
+			source_is_plugin = $3;
+			if (source_is_plugin)
+				deprecated_plugin_syntax_warning = true;
+			the_boot_info = build_boot_info($4, $5,
+							guess_boot_cpuid($5));
+		}
+	;
+
+plugindecl:
+	/* empty */
+		{
+			$$ = false;
+		}
+	| DT_PLUGIN ';'
+		{
+			$$ = true;
+		}
+	;
+
+pluginsource:
+	DT_V1 DT_PLUGIN ';' memreserves devicetree
 		{
-			the_boot_info = build_boot_info($3, $4,
-							guess_boot_cpuid($4));
+			source_is_plugin = true;
+			deprecated_plugin_syntax_warning = false;
+			the_boot_info = build_boot_info($4, $5,
+							guess_boot_cpuid($5));
 		}
 	;
 
@@ -156,10 +189,14 @@ devicetree:
 		{
 			struct node *target = get_node_by_ref($1, $2);
 
-			if (target)
+			if (target) {
 				merge_nodes(target, $3);
-			else
-				ERROR(&@2, "Label or path %s not found", $2);
+			} else {
+				if (symbol_fixup_support)
+					add_orphan_node($1, $3, $2);
+				else
+					ERROR(&@2, "Label or path %s not found", $2);
+			}
 			$$ = $1;
 		}
 	| devicetree DT_DEL_NODE DT_REF ';'
@@ -174,6 +211,11 @@ devicetree:
 
 			$$ = $1;
 		}
+	| /* empty */
+		{
+			/* build empty node */
+			$$ = name_node(build_node(NULL, NULL), "");
+		}
 	;
 
 nodedef:
diff --git a/dtc.c b/dtc.c
index 5fa23c4..ee37be9 100644
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
@@ -53,7 +55,7 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
 #define FDT_VERSION(version)	_FDT_VERSION(version)
 #define _FDT_VERSION(version)	#version
 static const char usage_synopsis[] = "dtc [options] <input file>";
-static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:fb:i:H:sW:E:hv";
+static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:fb:i:H:sW:E:@Ahv";
 static struct option const usage_long_opts[] = {
 	{"quiet",            no_argument, NULL, 'q'},
 	{"in-format",         a_argument, NULL, 'I'},
@@ -71,6 +73,8 @@ static struct option const usage_long_opts[] = {
 	{"phandle",           a_argument, NULL, 'H'},
 	{"warning",           a_argument, NULL, 'W'},
 	{"error",             a_argument, NULL, 'E'},
+	{"symbols",	     no_argument, NULL, '@'},
+	{"auto-alias",       no_argument, NULL, 'A'},
 	{"help",             no_argument, NULL, 'h'},
 	{"version",          no_argument, NULL, 'v'},
 	{NULL,               no_argument, NULL, 0x0},
@@ -101,6 +105,8 @@ static const char * const usage_opts_help[] = {
 	 "\t\tboth   - Both \"linux,phandle\" and \"phandle\" properties",
 	"\n\tEnable/disable warnings (prefix with \"no-\")",
 	"\n\tEnable/disable errors (prefix with \"no-\")",
+	"\n\tEnable symbols/fixup support",
+	"\n\tEnable auto-alias of labels",
 	"\n\tPrint this help and exit",
 	"\n\tPrint version and exit",
 	NULL,
@@ -233,7 +239,12 @@ int main(int argc, char *argv[])
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
@@ -294,6 +305,12 @@ int main(int argc, char *argv[])
 	if (sort)
 		sort_tree(bi);
 
+	if (symbol_fixup_support || auto_label_aliases)
+		generate_label_node(bi->dt, bi->dt);
+
+	if (symbol_fixup_support)
+		generate_fixups_node(bi->dt, bi->dt);
+
 	if (streq(outname, "-")) {
 		outf = stdout;
 	} else {
diff --git a/dtc.h b/dtc.h
index 56212c8..d025111 100644
--- a/dtc.h
+++ b/dtc.h
@@ -20,7 +20,7 @@
  *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
  *                                                                   USA
  */
-
+#define _GNU_SOURCE
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
@@ -54,6 +54,14 @@ extern int reservenum;		/* Number of memory reservation slots */
 extern int minsize;		/* Minimum blob size */
 extern int padsize;		/* Additional padding to blob */
 extern int phandle_format;	/* Use linux,phandle or phandle properties */
+extern int symbol_fixup_support;/* enable symbols & fixup support */
+extern int auto_label_aliases;	/* auto generate labels -> aliases */
+
+/*
+ * Tree source globals
+ */
+extern bool source_is_plugin;
+extern bool deprecated_plugin_syntax_warning;
 
 #define PHANDLE_LEGACY	0x1
 #define PHANDLE_EPAPR	0x2
@@ -194,6 +202,7 @@ struct node *build_node_delete(void);
 struct node *name_node(struct node *node, char *name);
 struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
+void add_orphan_node(struct node *old_node, struct node *new_node, char *ref);
 
 void add_property(struct node *node, struct property *prop);
 void delete_property_by_name(struct node *node, char *name);
@@ -244,6 +253,8 @@ struct boot_info {
 struct boot_info *build_boot_info(struct reserve_info *reservelist,
 				  struct node *tree, uint32_t boot_cpuid_phys);
 void sort_tree(struct boot_info *bi);
+void generate_label_node(struct node *node, struct node *dt);
+void generate_fixups_node(struct node *node, struct node *dt);
 
 /* Checks */
 
diff --git a/livetree.c b/livetree.c
index e229b84..1ef9fc4 100644
--- a/livetree.c
+++ b/livetree.c
@@ -216,6 +216,34 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 	return old_node;
 }
 
+void add_orphan_node(struct node *dt, struct node *new_node, char *ref)
+{
+	static unsigned int next_orphan_fragment = 0;
+	struct node *ovl = xmalloc(sizeof(*ovl));
+	struct property *p;
+	struct data d = empty_data;
+	char *name;
+	int ret;
+
+	memset(ovl, 0, sizeof(*ovl));
+
+	d = data_add_marker(d, REF_PHANDLE, ref);
+	d = data_append_integer(d, 0xffffffff, 32);
+
+	p = build_property("target", d);
+	add_property(ovl, p);
+
+	ret = asprintf(&name, "fragment@%u",
+			next_orphan_fragment++);
+	if (ret == -1)
+		die("asprintf() failed\n");
+	name_node(ovl, name);
+	name_node(new_node, "__overlay__");
+
+	add_child(dt, ovl);
+	add_child(ovl, new_node);
+}
+
 struct node *chain_node(struct node *first, struct node *list)
 {
 	assert(first->next_sibling == NULL);
@@ -709,3 +737,177 @@ void sort_tree(struct boot_info *bi)
 	sort_reserve_entries(bi);
 	sort_node(bi->dt);
 }
+
+void generate_label_node(struct node *node, struct node *dt)
+{
+	struct node *c, *an;
+	struct property *p;
+	struct label *l;
+	int has_label;
+	char *gen_node_name;
+
+	if (auto_label_aliases)
+		gen_node_name = "aliases";
+	else
+		gen_node_name = "__symbols__";
+
+	/* Make sure the label isn't already there */
+	has_label = 0;
+	for_each_label(node->labels, l) {
+		has_label = 1;
+		break;
+	}
+
+	if (has_label) {
+
+		/* an is the aliases/__symbols__ node */
+		an = get_subnode(dt, gen_node_name);
+		/* if no node exists, create it */
+		if (!an) {
+			an = build_node(NULL, NULL);
+			name_node(an, gen_node_name);
+			add_child(dt, an);
+		}
+
+		/* now add the label in the node */
+		for_each_label(node->labels, l) {
+			/* check whether the label already exists */
+			p = get_property(an, l->label);
+			if (p) {
+				fprintf(stderr, "WARNING: label %s already"
+					" exists in /%s", l->label,
+					gen_node_name);
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
+		if (symbol_fixup_support)
+			(void)get_node_phandle(dt, node);
+	}
+
+	for_each_child(node, c)
+		generate_label_node(c, dt);
+}
+
+static void add_fixup_entry(struct node *dt, struct node *node,
+		struct property *prop, struct marker *m)
+{
+	struct node *fn;	/* local fixup node */
+	struct property *p;
+	char *fixups_name = "__fixups__";
+	struct data d;
+	char *entry;
+	int ret;
+
+	/* fn is the node we're putting entries in */
+	fn = get_subnode(dt, fixups_name);
+	/* if no node exists, create it */
+	if (!fn) {
+		fn = build_node(NULL, NULL);
+		name_node(fn, fixups_name);
+		add_child(dt, fn);
+	}
+
+	ret = asprintf(&entry, "%s:%s:%u",
+			node->fullpath, prop->name, m->offset);
+	if (ret == -1)
+		die("asprintf() failed\n");
+
+	p = get_property(fn, m->ref);
+	d = data_append_data(p ? p->val : empty_data, entry, strlen(entry) + 1);
+	if (!p)
+		add_property(fn, build_property(m->ref, d));
+	else
+		p->val = d;
+}
+
+static void add_local_fixup_entry(struct node *dt, struct node *node,
+		struct property *prop, struct marker *m,
+		struct node *refnode)
+{
+	struct node *lfn, *wn, *nwn;	/* local fixup node, walk node, new */
+	struct property *p;
+	struct data d;
+	char *local_fixups_name = "__local_fixups__";
+	char *s, *e, *comp;
+	int len;
+
+	/* fn is the node we're putting entries in */
+	lfn = get_subnode(dt, local_fixups_name);
+	/* if no node exists, create it */
+	if (!lfn) {
+		lfn = build_node(NULL, NULL);
+		name_node(lfn, local_fixups_name);
+		add_child(dt, lfn);
+	}
+
+	/* walk the path components creating nodes if they don't exist */
+	comp = NULL;
+	/* start skipping the first / */
+	s = node->fullpath + 1;
+	wn = lfn;
+	while (*s) {
+		/* retrieve path component */
+		e = strchr(s, '/');
+		if (e == NULL)
+			e = s + strlen(s);
+		len = e - s;
+		comp = xrealloc(comp, len + 1);
+		memcpy(comp, s, len);
+		comp[len] = '\0';
+
+		/* if no node exists, create it */
+		nwn = get_subnode(wn, comp);
+		if (!nwn) {
+			nwn = build_node(NULL, NULL);
+			name_node(nwn, strdup(comp));
+			add_child(wn, nwn);
+		}
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
+	p = get_property(wn, prop->name);
+	d = data_append_cell(p ? p->val : empty_data, (cell_t)m->offset);
+	if (!p)
+		add_property(wn, build_property(prop->name, d));
+	else
+		p->val = d;
+}
+
+void generate_fixups_node(struct node *node, struct node *dt)
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
+		generate_fixups_node(c, dt);
+}
diff --git a/treesource.c b/treesource.c
index a55d1d1..e1d6657 100644
--- a/treesource.c
+++ b/treesource.c
@@ -28,6 +28,9 @@ extern YYLTYPE yylloc;
 struct boot_info *the_boot_info;
 bool treesource_error;
 
+bool source_is_plugin;
+bool deprecated_plugin_syntax_warning;
+
 struct boot_info *dt_from_source(const char *fname)
 {
 	the_boot_info = NULL;
-- 
1.7.12
