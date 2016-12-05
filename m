From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v12 2/7] dtc: Plugin and fixup support
Date: Mon,  5 Dec 2016 19:05:23 +0200
Message-ID: <1480957528-8367-3-git-send-email-pantelis.antoniou@konsulko.com>
References: <1480957528-8367-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480957528-8367-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
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

While there is a new magic number for dynamic device tree/overlays blobs
it is by default enabled. Remember to use -M to generate compatible
blobs.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 Documentation/manual.txt |  29 ++++-
 checks.c                 |   8 +-
 dtc-lexer.l              |   5 +
 dtc-parser.y             |  29 ++++-
 dtc.c                    |  54 +++++++++-
 dtc.h                    |  21 +++-
 fdtdump.c                |   2 +-
 flattree.c               |  18 ++--
 fstree.c                 |   2 +-
 libfdt/fdt.c             |   2 +-
 libfdt/fdt.h             |   3 +-
 livetree.c               | 269 ++++++++++++++++++++++++++++++++++++++++++++++-
 tests/mangle-layout.c    |   7 +-
 13 files changed, 422 insertions(+), 27 deletions(-)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 398de32..92a4966 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -119,6 +119,28 @@ Options:
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
+    -M
+	Generate blobs with the old FDT magic number for device tree objects.
+	By default blobs use the DTBO FDT magic number instead.
+
+    -F
+        Suppress generation of fixups when -@ is used. This is useful for generating
+	a base tree with symbols but without fixups that take some amount of space.
+
     -S <bytes>
 	Ensure the blob at least <bytes> long, adding additional
 	space if needed.
@@ -146,13 +168,18 @@ Additionally, dtc performs various sanity checks on the tree.
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
index 2bd27a4..56c231a 100644
--- a/checks.c
+++ b/checks.c
@@ -487,8 +487,12 @@ static void fixup_phandle_references(struct check *c, struct boot_info *bi,
 
 			refnode = get_node_by_ref(dt, m->ref);
 			if (! refnode) {
-				FAIL(c, "Reference to non-existent node or label \"%s\"\n",
-				     m->ref);
+				if (!(bi->dtsversionflags & DTSVF_PLUGIN))
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
index 14aaf2e..aaacb97 100644
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
@@ -101,16 +106,34 @@ extern bool treesource_error;
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
+			$$ = DTSVF_V1;
 		}
 	;
 
 v1tag:
 	  DT_V1 ';'
+	| DT_V1
 	| DT_V1 ';' v1tag
+
+plugindecl:
+	DT_PLUGIN ';'
+		{
+			$$ = DTSVF_PLUGIN;
+		}
+	| /* empty */
+		{
+			$$ = 0;
+		}
 	;
 
 memreserves:
diff --git a/dtc.c b/dtc.c
index 9dcf640..d35e0da 100644
--- a/dtc.c
+++ b/dtc.c
@@ -32,6 +32,10 @@ int minsize;		/* Minimum blob size */
 int padsize;		/* Additional padding to blob */
 int alignsize;		/* Additional padding to blob accroding to the alignsize */
 int phandle_format = PHANDLE_BOTH;	/* Use linux,phandle or phandle properties */
+int generate_symbols;	/* enable symbols & fixup support */
+int generate_fixups;		/* suppress generation of fixups on symbol support */
+int auto_label_aliases;		/* auto generate labels -> aliases */
+int no_dtbo_magic;		/* use old FDT magic values for objects */
 
 static int is_power_of_2(int x)
 {
@@ -59,7 +63,7 @@ static void fill_fullpaths(struct node *tree, const char *prefix)
 #define FDT_VERSION(version)	_FDT_VERSION(version)
 #define _FDT_VERSION(version)	#version
 static const char usage_synopsis[] = "dtc [options] <input file>";
-static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:hv";
+static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:@FAMhv";
 static struct option const usage_long_opts[] = {
 	{"quiet",            no_argument, NULL, 'q'},
 	{"in-format",         a_argument, NULL, 'I'},
@@ -78,6 +82,10 @@ static struct option const usage_long_opts[] = {
 	{"phandle",           a_argument, NULL, 'H'},
 	{"warning",           a_argument, NULL, 'W'},
 	{"error",             a_argument, NULL, 'E'},
+	{"symbols",	     no_argument, NULL, '@'},
+	{"fixups",	     no_argument, NULL, 'F'},
+	{"auto-alias",       no_argument, NULL, 'A'},
+	{"no-dtbo-magic",    no_argument, NULL, 'M'},
 	{"help",             no_argument, NULL, 'h'},
 	{"version",          no_argument, NULL, 'v'},
 	{NULL,               no_argument, NULL, 0x0},
@@ -109,6 +117,10 @@ static const char * const usage_opts_help[] = {
 	 "\t\tboth   - Both \"linux,phandle\" and \"phandle\" properties",
 	"\n\tEnable/disable warnings (prefix with \"no-\")",
 	"\n\tEnable/disable errors (prefix with \"no-\")",
+	"\n\tEnable generation of symbols",
+	"\n\tEnable generation of fixups",
+	"\n\tEnable auto-alias of labels",
+	"\n\tDo not use DTBO magic value for plugin objects",
 	"\n\tPrint this help and exit",
 	"\n\tPrint version and exit",
 	NULL,
@@ -153,7 +165,7 @@ static const char *guess_input_format(const char *fname, const char *fallback)
 	fclose(f);
 
 	magic = fdt32_to_cpu(magic);
-	if (magic == FDT_MAGIC)
+	if (magic == FDT_MAGIC || magic == FDT_MAGIC_DTBO)
 		return "dtb";
 
 	return guess_type_by_name(fname, fallback);
@@ -172,6 +184,7 @@ int main(int argc, char *argv[])
 	FILE *outf = NULL;
 	int outversion = DEFAULT_FDT_VERSION;
 	long long cmdline_boot_cpuid = -1;
+	fdt32_t out_magic = FDT_MAGIC;
 
 	quiet      = 0;
 	reservenum = 0;
@@ -249,6 +262,19 @@ int main(int argc, char *argv[])
 			parse_checks_option(false, true, optarg);
 			break;
 
+		case '@':
+			generate_symbols = 1;
+			break;
+		case 'F':
+			generate_fixups = 1;
+			break;
+		case 'A':
+			auto_label_aliases = 1;
+			break;
+		case 'M':
+			no_dtbo_magic = 1;
+			break;
+
 		case 'h':
 			usage(NULL);
 		default:
@@ -306,6 +332,23 @@ int main(int argc, char *argv[])
 	fill_fullpaths(bi->dt, "");
 	process_checks(force, bi);
 
+	/* on a plugin, generate by default */
+	if (bi->dtsversionflags & DTSVF_PLUGIN) {
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
 
@@ -318,12 +361,15 @@ int main(int argc, char *argv[])
 			    outname, strerror(errno));
 	}
 
+	if (!no_dtbo_magic && (bi->dtsversionflags & DTSVF_PLUGIN))
+		out_magic = FDT_MAGIC_DTBO;
+
 	if (streq(outform, "dts")) {
 		dt_to_source(outf, bi);
 	} else if (streq(outform, "dtb")) {
-		dt_to_blob(outf, bi, outversion);
+		dt_to_blob(outf, bi, out_magic, outversion);
 	} else if (streq(outform, "asm")) {
-		dt_to_asm(outf, bi, outversion);
+		dt_to_asm(outf, bi, out_magic, outversion);
 	} else if (streq(outform, "null")) {
 		/* do nothing */
 	} else {
diff --git a/dtc.h b/dtc.h
index 32009bc..6aa82eb 100644
--- a/dtc.h
+++ b/dtc.h
@@ -55,6 +55,10 @@ extern int minsize;		/* Minimum blob size */
 extern int padsize;		/* Additional padding to blob */
 extern int alignsize;		/* Additional padding to blob accroding to the alignsize */
 extern int phandle_format;	/* Use linux,phandle or phandle properties */
+extern int generate_symbols;	/* generate symbols for nodes with labels */
+extern int generate_fixups;	/* generate fixups */
+extern int auto_label_aliases;	/* auto generate labels -> aliases */
+extern int no_dtbo_magic;	/* use old FDT magic values for objects */
 
 #define PHANDLE_LEGACY	0x1
 #define PHANDLE_EPAPR	0x2
@@ -202,6 +206,8 @@ void delete_property(struct property *prop);
 void add_child(struct node *parent, struct node *child);
 void delete_node_by_name(struct node *parent, char *name);
 void delete_node(struct node *node);
+void append_to_property(struct node *node,
+			char *name, const void *data, int len);
 
 const char *get_unitname(struct node *node);
 struct property *get_property(struct node *node, const char *propname);
@@ -237,14 +243,23 @@ struct reserve_info *add_reserve_entry(struct reserve_info *list,
 
 
 struct boot_info {
+	unsigned int dtsversionflags;
 	struct reserve_info *reservelist;
 	struct node *dt;		/* the device tree */
 	uint32_t boot_cpuid_phys;
 };
 
-struct boot_info *build_boot_info(struct reserve_info *reservelist,
+/* DTS version flags definitions */
+#define DTSVF_V1	0x0001	/* /dts-v1/ */
+#define DTSVF_PLUGIN	0x0002	/* /plugin/ */
+
+struct boot_info *build_boot_info(unsigned int dtsversionflags,
+				  struct reserve_info *reservelist,
 				  struct node *tree, uint32_t boot_cpuid_phys);
 void sort_tree(struct boot_info *bi);
+void generate_label_tree(struct boot_info *bi, char *name, bool allocph);
+void generate_fixups_tree(struct boot_info *bi, char *name);
+void generate_local_fixups_tree(struct boot_info *bi, char *name);
 
 /* Checks */
 
@@ -253,8 +268,8 @@ void process_checks(bool force, struct boot_info *bi);
 
 /* Flattened trees */
 
-void dt_to_blob(FILE *f, struct boot_info *bi, int version);
-void dt_to_asm(FILE *f, struct boot_info *bi, int version);
+void dt_to_blob(FILE *f, struct boot_info *bi, fdt32_t magic, int version);
+void dt_to_asm(FILE *f, struct boot_info *bi, fdt32_t magic, int version);
 
 struct boot_info *dt_from_blob(const char *fname);
 
diff --git a/fdtdump.c b/fdtdump.c
index a9a2484..dd63ac2 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -201,7 +201,7 @@ int main(int argc, char *argv[])
 			p = memchr(p, smagic[0], endp - p - FDT_MAGIC_SIZE);
 			if (!p)
 				break;
-			if (fdt_magic(p) == FDT_MAGIC) {
+			if (fdt_magic(p) == FDT_MAGIC || fdt_magic(p) == FDT_MAGIC_DTBO) {
 				/* try and validate the main struct */
 				off_t this_len = endp - p;
 				fdt32_t max_version = 17;
diff --git a/flattree.c b/flattree.c
index a9d9520..5ddde45 100644
--- a/flattree.c
+++ b/flattree.c
@@ -335,6 +335,7 @@ static struct data flatten_reserve_list(struct reserve_info *reservelist,
 }
 
 static void make_fdt_header(struct fdt_header *fdt,
+			    fdt32_t magic,
 			    struct version_info *vi,
 			    int reservesize, int dtsize, int strsize,
 			    int boot_cpuid_phys)
@@ -345,7 +346,7 @@ static void make_fdt_header(struct fdt_header *fdt,
 
 	memset(fdt, 0xff, sizeof(*fdt));
 
-	fdt->magic = cpu_to_fdt32(FDT_MAGIC);
+	fdt->magic = cpu_to_fdt32(magic);
 	fdt->version = cpu_to_fdt32(vi->version);
 	fdt->last_comp_version = cpu_to_fdt32(vi->last_comp_version);
 
@@ -366,7 +367,7 @@ static void make_fdt_header(struct fdt_header *fdt,
 		fdt->size_dt_struct = cpu_to_fdt32(dtsize);
 }
 
-void dt_to_blob(FILE *f, struct boot_info *bi, int version)
+void dt_to_blob(FILE *f, struct boot_info *bi, fdt32_t magic, int version)
 {
 	struct version_info *vi = NULL;
 	int i;
@@ -390,7 +391,7 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int version)
 	reservebuf = flatten_reserve_list(bi->reservelist, vi);
 
 	/* Make header */
-	make_fdt_header(&fdt, vi, reservebuf.len, dtbuf.len, strbuf.len,
+	make_fdt_header(&fdt, magic, vi, reservebuf.len, dtbuf.len, strbuf.len,
 			bi->boot_cpuid_phys);
 
 	/*
@@ -467,7 +468,7 @@ static void dump_stringtable_asm(FILE *f, struct data strbuf)
 	}
 }
 
-void dt_to_asm(FILE *f, struct boot_info *bi, int version)
+void dt_to_asm(FILE *f, struct boot_info *bi, fdt32_t magic, int version)
 {
 	struct version_info *vi = NULL;
 	int i;
@@ -830,6 +831,7 @@ struct boot_info *dt_from_blob(const char *fname)
 	struct node *tree;
 	uint32_t val;
 	int flags = 0;
+	unsigned int dtsversionflags = DTSVF_V1;
 
 	f = srcfile_relative_open(fname, NULL);
 
@@ -845,9 +847,12 @@ struct boot_info *dt_from_blob(const char *fname)
 	}
 
 	magic = fdt32_to_cpu(magic);
-	if (magic != FDT_MAGIC)
+	if (magic != FDT_MAGIC && magic != FDT_MAGIC_DTBO)
 		die("Blob has incorrect magic number\n");
 
+	if (magic == FDT_MAGIC_DTBO)
+		dtsversionflags |= DTSVF_PLUGIN;
+
 	rc = fread(&totalsize, sizeof(totalsize), 1, f);
 	if (ferror(f))
 		die("Error reading DT blob size: %s\n", strerror(errno));
@@ -942,5 +947,6 @@ struct boot_info *dt_from_blob(const char *fname)
 
 	fclose(f);
 
-	return build_boot_info(reservelist, tree, boot_cpuid_phys);
+	return build_boot_info(dtsversionflags, reservelist, tree,
+			       boot_cpuid_phys);
 }
diff --git a/fstree.c b/fstree.c
index 6d1beec..c4f1ccf 100644
--- a/fstree.c
+++ b/fstree.c
@@ -86,6 +86,6 @@ struct boot_info *dt_from_fs(const char *dirname)
 	tree = read_fstree(dirname);
 	tree = name_node(tree, "");
 
-	return build_boot_info(NULL, tree, guess_boot_cpuid(tree));
+	return build_boot_info(DTSVF_V1, NULL, tree, guess_boot_cpuid(tree));
 }
 
diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index 22286a1..28d422c 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -57,7 +57,7 @@
 
 int fdt_check_header(const void *fdt)
 {
-	if (fdt_magic(fdt) == FDT_MAGIC) {
+	if (fdt_magic(fdt) == FDT_MAGIC || fdt_magic(fdt) == FDT_MAGIC_DTBO) {
 		/* Complete tree */
 		if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
 			return -FDT_ERR_BADVERSION;
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index 526aedb..493cd55 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -55,7 +55,7 @@
 #ifndef __ASSEMBLY__
 
 struct fdt_header {
-	fdt32_t magic;			 /* magic word FDT_MAGIC */
+	fdt32_t magic;			 /* magic word FDT_MAGIC[|_DTBO] */
 	fdt32_t totalsize;		 /* total size of DT block */
 	fdt32_t off_dt_struct;		 /* offset to structure */
 	fdt32_t off_dt_strings;		 /* offset to strings */
@@ -93,6 +93,7 @@ struct fdt_property {
 #endif /* !__ASSEMBLY */
 
 #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
+#define FDT_MAGIC_DTBO	0xd00dfdb0	/* DTBO magic */
 #define FDT_TAGSIZE	sizeof(fdt32_t)
 
 #define FDT_BEGIN_NODE	0x1		/* Start node: full name */
diff --git a/livetree.c b/livetree.c
index 3dc7559..54a16ba 100644
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
+struct boot_info *build_boot_info(unsigned int dtsversionflags,
+				  struct reserve_info *reservelist,
 				  struct node *tree, uint32_t boot_cpuid_phys)
 {
 	struct boot_info *bi;
 
 	bi = xmalloc(sizeof(*bi));
+	bi->dtsversionflags = dtsversionflags;
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
diff --git a/tests/mangle-layout.c b/tests/mangle-layout.c
index a76e51e..d29ebc6 100644
--- a/tests/mangle-layout.c
+++ b/tests/mangle-layout.c
@@ -42,7 +42,8 @@ static void expand_buf(struct bufstate *buf, int newsize)
 	buf->size = newsize;
 }
 
-static void new_header(struct bufstate *buf, int version, const void *fdt)
+static void new_header(struct bufstate *buf, fdt32_t magic, int version,
+		       const void *fdt)
 {
 	int hdrsize;
 
@@ -56,7 +57,7 @@ static void new_header(struct bufstate *buf, int version, const void *fdt)
 	expand_buf(buf, hdrsize);
 	memset(buf->buf, 0, hdrsize);
 
-	fdt_set_magic(buf->buf, FDT_MAGIC);
+	fdt_set_magic(buf->buf, magic);
 	fdt_set_version(buf->buf, version);
 	fdt_set_last_comp_version(buf->buf, 16);
 	fdt_set_boot_cpuid_phys(buf->buf, fdt_boot_cpuid_phys(fdt));
@@ -145,7 +146,7 @@ int main(int argc, char *argv[])
 	if (fdt_version(fdt) < 17)
 		CONFIG("Input tree must be v17");
 
-	new_header(&buf, version, fdt);
+	new_header(&buf, FDT_MAGIC, version, fdt);
 
 	while (*blockorder) {
 		add_block(&buf, version, *blockorder, fdt);
-- 
2.1.4
