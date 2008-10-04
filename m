From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [2/5] dtc: Simpler interface to source file management
Date: Sat,  4 Oct 2008 22:27:06 +1000 (EST)
Message-ID: <20081004122706.52552DDE09@ozlabs.org>
References: <20081004122157.GT30184@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20081004122157.GT30184-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch cleans up our handling of input files, particularly dts
source files, but also (to an extent) other input files such as those
used by /incbin/ and those used in -I dtb and -I fs modes.

We eliminate the current clunky mechanism which combines search paths
(which we don't actually use at present) with the open relative to
current source file behaviour, which we do.

Instead there's a single srcfile_relative_open() entry point for
callers which opens a new input file relative to the current source
file (which the srcpos code tracks internally).  It doesn't currently
do search paths, but we can add that later without messing with the
callers, by drawing the search path from a global (which makes sense
anyway, rather than shuffling it around the rest of the processing
code).

That suffices for non-dts input files.  For the actual dts files,
srcfile_push() and srcfile_pop() wrappers open the file while also
keeping track of it as the current source file for future opens.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

---
 convert-dtsv0-lexer.l |    6 +
 dtc-lexer.l           |   91 +++---------------------------
 dtc-parser.y          |   18 ++---
 dtc.c                 |   24 -------
 dtc.h                 |    4 -
 flattree.c            |   24 +++----
 srcpos.c              |  151 ++++++++++++++++++++++----------------------------
 srcpos.h              |   27 +++-----
 treesource.c          |    4 -
 util.c                |   24 +++++++
 util.h                |    1 
 11 files changed, 141 insertions(+), 233 deletions(-)

Index: dtc/dtc.c
===================================================================
--- dtc.orig/dtc.c	2008-10-04 12:32:01.000000000 +1000
+++ dtc/dtc.c	2008-10-04 20:15:54.000000000 +1000
@@ -31,30 +31,6 @@ int reservenum;		/* Number of memory res
 int minsize;		/* Minimum blob size */
 int padsize;		/* Additional padding to blob */
 
-char *join_path(const char *path, const char *name)
-{
-	int lenp = strlen(path);
-	int lenn = strlen(name);
-	int len;
-	int needslash = 1;
-	char *str;
-
-	len = lenp + lenn + 2;
-	if ((lenp > 0) && (path[lenp-1] == '/')) {
-		needslash = 0;
-		len--;
-	}
-
-	str = xmalloc(len);
-	memcpy(str, path, lenp);
-	if (needslash) {
-		str[lenp] = '/';
-		lenp++;
-	}
-	memcpy(str+lenp, name, lenn+1);
-	return str;
-}
-
 static void fill_fullpaths(struct node *tree, const char *prefix)
 {
 	struct node *child;
Index: dtc/convert-dtsv0-lexer.l
===================================================================
--- dtc.orig/convert-dtsv0-lexer.l	2008-10-04 15:20:52.000000000 +1000
+++ dtc/convert-dtsv0-lexer.l	2008-10-04 20:15:54.000000000 +1000
@@ -210,8 +210,10 @@ static void convert_file(const char *fna
 	memcpy(newname, fname, len);
 	memcpy(newname + len, suffix, sizeof(suffix));
 
-	srcpos_file = dtc_open_file(fname, NULL);
-	yyin = srcpos_file->file;
+	yyin = fopen(fname, "r");
+	if (!yyin)
+		die("Couldn't open input file %s: %s\n",
+		    fname, strerror(errno));
 
 	yyout = fopen(newname, "w");
 	if (!yyout)
Index: dtc/flattree.c
===================================================================
--- dtc.orig/flattree.c	2008-10-04 12:32:09.000000000 +1000
+++ dtc/flattree.c	2008-10-04 20:29:09.000000000 +1000
@@ -776,7 +776,7 @@ static struct node *unflatten_tree(struc
 
 struct boot_info *dt_from_blob(const char *fname)
 {
-	struct dtc_file *dtcf;
+	FILE *f;
 	uint32_t magic, totalsize, version, size_dt, boot_cpuid_phys;
 	uint32_t off_dt, off_str, off_mem_rsvmap;
 	int rc;
@@ -791,14 +791,14 @@ struct boot_info *dt_from_blob(const cha
 	uint32_t val;
 	int flags = 0;
 
-	dtcf = dtc_open_file(fname, NULL);
+	f = srcfile_relative_open(fname, NULL);
 
-	rc = fread(&magic, sizeof(magic), 1, dtcf->file);
-	if (ferror(dtcf->file))
+	rc = fread(&magic, sizeof(magic), 1, f);
+	if (ferror(f))
 		die("Error reading DT blob magic number: %s\n",
 		    strerror(errno));
 	if (rc < 1) {
-		if (feof(dtcf->file))
+		if (feof(f))
 			die("EOF reading DT blob magic number\n");
 		else
 			die("Mysterious short read reading magic number\n");
@@ -808,11 +808,11 @@ struct boot_info *dt_from_blob(const cha
 	if (magic != FDT_MAGIC)
 		die("Blob has incorrect magic number\n");
 
-	rc = fread(&totalsize, sizeof(totalsize), 1, dtcf->file);
-	if (ferror(dtcf->file))
+	rc = fread(&totalsize, sizeof(totalsize), 1, f);
+	if (ferror(f))
 		die("Error reading DT blob size: %s\n", strerror(errno));
 	if (rc < 1) {
-		if (feof(dtcf->file))
+		if (feof(f))
 			die("EOF reading DT blob size\n");
 		else
 			die("Mysterious short read reading blob size\n");
@@ -832,12 +832,12 @@ struct boot_info *dt_from_blob(const cha
 	p = blob + sizeof(magic)  + sizeof(totalsize);
 
 	while (sizeleft) {
-		if (feof(dtcf->file))
+		if (feof(f))
 			die("EOF before reading %d bytes of DT blob\n",
 			    totalsize);
 
-		rc = fread(p, 1, sizeleft, dtcf->file);
-		if (ferror(dtcf->file))
+		rc = fread(p, 1, sizeleft, f);
+		if (ferror(f))
 			die("Error reading DT blob: %s\n",
 			    strerror(errno));
 
@@ -900,7 +900,7 @@ struct boot_info *dt_from_blob(const cha
 
 	free(blob);
 
-	dtc_close_file(dtcf);
+	fclose(f);
 
 	return build_boot_info(reservelist, tree, boot_cpuid_phys);
 }
Index: dtc/treesource.c
===================================================================
--- dtc.orig/treesource.c	2008-10-04 12:32:01.000000000 +1000
+++ dtc/treesource.c	2008-10-04 20:15:54.000000000 +1000
@@ -32,8 +32,8 @@ struct boot_info *dt_from_source(const c
 	the_boot_info = NULL;
 	treesource_error = 0;
 
-	srcpos_file = dtc_open_file(fname, NULL);
-	yyin = srcpos_file->file;
+	srcfile_push(fname);
+	yyin = current_srcfile->f;
 
 	if (yyparse() != 0)
 		die("Unable to parse input tree\n");
Index: dtc/dtc-lexer.l
===================================================================
--- dtc.orig/dtc-lexer.l	2008-10-04 12:32:09.000000000 +1000
+++ dtc/dtc-lexer.l	2008-10-04 22:22:20.000000000 +1000
@@ -40,7 +40,7 @@ LINECOMMENT	"//".*\n
 
 #define	YY_USER_ACTION \
 	{ \
-		yylloc.file = srcpos_file; \
+		yylloc.file = current_srcfile; \
 		yylloc.first_line = yylineno; \
 	}
 
@@ -165,100 +165,29 @@ static int pop_input_file(void);
 
 %%
 
-
-/*
- * Stack of nested include file contexts.
- */
-
-struct incl_file {
-	struct dtc_file *file;
-	YY_BUFFER_STATE yy_prev_buf;
-	int yy_prev_lineno;
-	struct incl_file *prev;
-};
-
-static struct incl_file *incl_file_stack;
-
-
-/*
- * Detect infinite include recursion.
- */
-#define MAX_INCLUDE_DEPTH	(100)
-
-static int incl_depth = 0;
-
-
 static void push_input_file(const char *filename)
 {
-	struct incl_file *incl_file;
-	struct dtc_file *newfile;
-	struct search_path search, *searchptr = NULL;
-
 	assert(filename);
 
-	if (incl_depth++ >= MAX_INCLUDE_DEPTH)
-		die("Includes nested too deeply");
+	current_srcfile->lineno = yylineno;
 
-	if (srcpos_file) {
-		search.dir = srcpos_file->dir;
-		search.next = NULL;
-		search.prev = NULL;
-		searchptr = &search;
-	}
+	srcfile_push(filename);
 
-	newfile = dtc_open_file(filename, searchptr);
-
-	incl_file = xmalloc(sizeof(struct incl_file));
-
-	/*
-	 * Save current context.
-	 */
-	incl_file->yy_prev_buf = YY_CURRENT_BUFFER;
-	incl_file->yy_prev_lineno = yylineno;
-	incl_file->file = srcpos_file;
-	incl_file->prev = incl_file_stack;
-
-	incl_file_stack = incl_file;
-
-	/*
-	 * Establish new context.
-	 */
-	srcpos_file = newfile;
+	yyin = current_srcfile->f;
 	yylineno = 1;
-	yyin = newfile->file;
-	yy_switch_to_buffer(yy_create_buffer(yyin, YY_BUF_SIZE));
+
+	yypush_buffer_state(yy_create_buffer(yyin, YY_BUF_SIZE));
 }
 
 
 static int pop_input_file(void)
 {
-	struct incl_file *incl_file;
-
-	if (incl_file_stack == 0)
+	if (srcfile_pop() == 0)
 		return 0;
 
-	dtc_close_file(srcpos_file);
-
-	/*
-	 * Pop.
-	 */
-	--incl_depth;
-	incl_file = incl_file_stack;
-	incl_file_stack = incl_file->prev;
-
-	/*
-	 * Recover old context.
-	 */
-	yy_delete_buffer(YY_CURRENT_BUFFER);
-	yy_switch_to_buffer(incl_file->yy_prev_buf);
-	yylineno = incl_file->yy_prev_lineno;
-	srcpos_file = incl_file->file;
-	yyin = incl_file->file ? incl_file->file->file : NULL;
-
-	/*
-	 * Free old state.
-	 */
-	free(incl_file);
+	yypop_buffer_state();
+	yylineno = current_srcfile->lineno;
+	yyin = current_srcfile->f;
 
 	return 1;
 }
Index: dtc/dtc-parser.y
===================================================================
--- dtc.orig/dtc-parser.y	2008-10-04 17:09:06.000000000 +1000
+++ dtc/dtc-parser.y	2008-10-04 20:29:22.000000000 +1000
@@ -169,33 +169,31 @@ propdata:
 		}
 	| propdataprefix DT_INCBIN '(' DT_STRING ',' addr ',' addr ')'
 		{
-			struct search_path path = { srcpos_file->dir, NULL, NULL };
-			struct dtc_file *file = dtc_open_file($4.val, &path);
-			struct data d = empty_data;
+			FILE *f = srcfile_relative_open($4.val, NULL);
+			struct data d;
 
 			if ($6 != 0)
-				if (fseek(file->file, $6, SEEK_SET) != 0)
+				if (fseek(f, $6, SEEK_SET) != 0)
 					srcpos_error(&yyloc,
 						     "Couldn't seek to offset %llu in \"%s\": %s",
 						     (unsigned long long)$6,
 						     $4.val,
 						     strerror(errno));
 
-			d = data_copy_file(file->file, $8);
+			d = data_copy_file(f, $8);
 
 			$$ = data_merge($1, d);
-			dtc_close_file(file);
+			fclose(f);
 		}
 	| propdataprefix DT_INCBIN '(' DT_STRING ')'
 		{
-			struct search_path path = { srcpos_file->dir, NULL, NULL };
-			struct dtc_file *file = dtc_open_file($4.val, &path);
+			FILE *f = srcfile_relative_open($4.val, NULL);
 			struct data d = empty_data;
 
-			d = data_copy_file(file->file, -1);
+			d = data_copy_file(f, -1);
 
 			$$ = data_merge($1, d);
-			dtc_close_file(file);
+			fclose(f);
 		}
 	| propdata DT_LABEL
 		{
Index: dtc/dtc.h
===================================================================
--- dtc.orig/dtc.h	2008-10-04 15:19:57.000000000 +1000
+++ dtc/dtc.h	2008-10-04 20:15:54.000000000 +1000
@@ -219,8 +219,4 @@ struct boot_info *dt_from_source(const c
 
 struct boot_info *dt_from_fs(const char *dirname);
 
-/* misc */
-
-char *join_path(const char *path, const char *name);
-
 #endif /* _DTC_H */
Index: dtc/util.c
===================================================================
--- dtc.orig/util.c	2008-10-04 20:18:41.000000000 +1000
+++ dtc/util.c	2008-10-04 20:19:04.000000000 +1000
@@ -28,3 +28,27 @@ char *xstrdup(const char *s)
 
 	return dup;
 }
+
+char *join_path(const char *path, const char *name)
+{
+	int lenp = strlen(path);
+	int lenn = strlen(name);
+	int len;
+	int needslash = 1;
+	char *str;
+
+	len = lenp + lenn + 2;
+	if ((lenp > 0) && (path[lenp-1] == '/')) {
+		needslash = 0;
+		len--;
+	}
+
+	str = xmalloc(len);
+	memcpy(str, path, lenp);
+	if (needslash) {
+		str[lenp] = '/';
+		lenp++;
+	}
+	memcpy(str+lenp, name, lenn+1);
+	return str;
+}
Index: dtc/util.h
===================================================================
--- dtc.orig/util.h	2008-10-04 20:19:25.000000000 +1000
+++ dtc/util.h	2008-10-04 20:19:32.000000000 +1000
@@ -51,5 +51,6 @@ static inline void *xrealloc(void *p, si
 }
 
 extern char *xstrdup(const char *s);
+extern char *join_path(const char *path, const char *name);
 
 #endif /* _UTIL_H */
Index: dtc/srcpos.c
===================================================================
--- dtc.orig/srcpos.c	2008-10-04 17:09:06.000000000 +1000
+++ dtc/srcpos.c	2008-10-04 22:22:20.000000000 +1000
@@ -25,117 +25,102 @@
 #include "srcpos.h"
 
 
-/*
- * Like yylineno, this is the current open file pos.
- */
-struct dtc_file *srcpos_file;
+static char *dirname(const char *path)
+{
+	const char *slash = strrchr(path, '/');
 
-/*
- * The empty source position.
- */
+	if (slash) {
+		int len = slash - path;
+		char *dir = xmalloc(len + 1);
 
-struct dtc_file dtc_empty_file = {
-	.dir = NULL,
-	.name = "<no file>",
-	.file = NULL
-};
+		memcpy(dir, path, len);
+		dir[len] = '\0';
+		return dir;
+	}
+	return NULL;
+}
 
-srcpos srcpos_empty = {
-	.first_line = 0,
-	.first_column = 0,
-	.last_line = 0,
-	.last_column = 0,
-	.file = &dtc_empty_file
-};
+struct srcfile_state *current_srcfile; /* = NULL */
 
+/* Detect infinite include recursion. */
+#define MAX_SRCFILE_DEPTH     (100)
+static int srcfile_depth; /* = 0 */
 
-static int
-dtc_open_one(struct dtc_file *file, const char *search, const char *fname)
+FILE *srcfile_relative_open(const char *fname, char **fullnamep)
 {
+	FILE *f;
 	char *fullname;
 
-	if (search) {
-		fullname = xmalloc(strlen(search) + strlen(fname) + 2);
-
-		strcpy(fullname, search);
-		strcat(fullname, "/");
-		strcat(fullname, fname);
+	if (streq(fname, "-")) {
+		f = stdin;
+		fullname = xstrdup("<stdin>");
 	} else {
-		fullname = xstrdup(fname);
+		if (!current_srcfile || !current_srcfile->dir
+		    || (fname[0] == '/'))
+			fullname = xstrdup(fname);
+		else
+			fullname = join_path(current_srcfile->dir, fname);
+
+		f = fopen(fullname, "r");
+		if (!f)
+			die("Couldn't open \"%s\": %s\n", fname,
+			    strerror(errno));
 	}
 
-	file->file = fopen(fullname, "r");
-	if (!file->file) {
+	if (fullnamep)
+		*fullnamep = fullname;
+	else
 		free(fullname);
-		return 0;
-	}
 
-	file->name = fullname;
-	return 1;
+	return f;
 }
 
-
-struct dtc_file *
-dtc_open_file(const char *fname, const struct search_path *search)
+void srcfile_push(const char *fname)
 {
-	static const struct search_path default_search = { NULL, NULL, NULL };
+	struct srcfile_state *srcfile;
 
-	struct dtc_file *file;
-	const char *slash;
+	if (srcfile_depth++ >= MAX_SRCFILE_DEPTH)
+		die("Includes nested too deeply");
 
-	file = xmalloc(sizeof(struct dtc_file));
+	srcfile = xmalloc(sizeof(*srcfile));
 
-	slash = strrchr(fname, '/');
-	if (slash) {
-		char *dir = xmalloc(slash - fname + 1);
-
-		memcpy(dir, fname, slash - fname);
-		dir[slash - fname] = 0;
-		file->dir = dir;
-	} else {
-		file->dir = NULL;
-	}
-
-	if (streq(fname, "-")) {
-		file->name = "stdin";
-		file->file = stdin;
-		return file;
-	}
-
-	if (fname[0] == '/') {
-		file->file = fopen(fname, "r");
-		if (!file->file)
-			goto fail;
+	srcfile->f = srcfile_relative_open(fname, &srcfile->name);
+	srcfile->dir = dirname(srcfile->name);
+	srcfile->prev = current_srcfile;
+	current_srcfile = srcfile;
+}
 
-		file->name = xstrdup(fname);
-		return file;
-	}
+int srcfile_pop(void)
+{
+	struct srcfile_state *srcfile = current_srcfile;
 
-	if (!search)
-		search = &default_search;
+	assert(srcfile);
 
-	while (search) {
-		if (dtc_open_one(file, search->dir, fname))
-			return file;
+	current_srcfile = srcfile->prev;
 
-		if (errno != ENOENT)
-			goto fail;
+	if (fclose(srcfile->f))
+		die("Error closing \"%s\": %s\n", srcfile->name, strerror(errno));
 
-		search = search->next;
-	}
+	/* FIXME: We allow the srcfile_state structure to leak,
+	 * because it could still be referenced from a location
+	 * variable being carried through the parser somewhere.  To
+	 * fix this we could either allocate all the files from a
+	 * table, or use a pool allocator. */
 
-fail:
-	die("Couldn't open \"%s\": %s\n", fname, strerror(errno));
+	return current_srcfile ? 1 : 0;
 }
 
+/*
+ * The empty source position.
+ */
 
-void
-dtc_close_file(struct dtc_file *file)
-{
-	if (fclose(file->file))
-		die("Error closing \"%s\": %s\n", file->name, strerror(errno));
-}
-
+srcpos srcpos_empty = {
+	.first_line = 0,
+	.first_column = 0,
+	.last_line = 0,
+	.last_column = 0,
+	.file = NULL,
+};
 
 srcpos *
 srcpos_copy(srcpos *pos)
Index: dtc/srcpos.h
===================================================================
--- dtc.orig/srcpos.h	2008-10-04 12:32:09.000000000 +1000
+++ dtc/srcpos.h	2008-10-04 22:22:20.000000000 +1000
@@ -27,19 +27,27 @@
 
 #include <stdio.h>
 
-struct dtc_file {
+struct srcfile_state {
+	FILE *f;
+	char *name;
 	char *dir;
-	const char *name;
-	FILE *file;
+	int lineno;
+	struct srcfile_state *prev;
 };
 
+extern struct srcfile_state *current_srcfile; /* = NULL */
+
+FILE *srcfile_relative_open(const char *fname, char **fullnamep);
+void srcfile_push(const char *fname);
+int srcfile_pop(void);
+
 #if ! defined(YYLTYPE) && ! defined(YYLTYPE_IS_DECLARED)
 typedef struct YYLTYPE {
     int first_line;
     int first_column;
     int last_line;
     int last_column;
-    struct dtc_file *file;
+    struct srcfile_state *file;
 } YYLTYPE;
 
 #define YYLTYPE_IS_DECLARED	1
@@ -81,17 +89,6 @@ typedef YYLTYPE srcpos;
  */
 extern srcpos srcpos_empty;
 
-extern struct dtc_file *srcpos_file;
-
-struct search_path {
-	const char *dir; /* NULL for current directory */
-	struct search_path *prev, *next;
-};
-
-extern struct dtc_file *dtc_open_file(const char *fname,
-                                      const struct search_path *search);
-extern void dtc_close_file(struct dtc_file *file);
-
 extern srcpos *srcpos_copy(srcpos *pos);
 extern char *srcpos_string(srcpos *pos);
 extern void srcpos_dump(srcpos *pos);
