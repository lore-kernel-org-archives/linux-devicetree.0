From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [5/5] dtc: Clean up source file management
Date: Fri, 3 Oct 2008 00:09:39 +1000
Message-ID: <20081002140939.GI11662@yookeroo.seuss>
References: <20081002140427.GD11662@yookeroo.seuss>
	<20081002140512.GE11662@yookeroo.seuss>
	<20081002140556.GF11662@yookeroo.seuss>
	<20081002140652.GG11662@yookeroo.seuss>
	<20081002140753.GH11662@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081002140753.GH11662-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch cleans up our handling of input files, particularly dts
source files, but also (to an extent) other input files such as those
used by /incbin/ and those used in -I dtb and -I fs modes.

We eliminate the current clunky mechanism which combines search paths
(which we don't actually use at present) with the open relative to
current source file behaviour, which we do.

Instead there's a single srcfile_open() entry point for callers which
opens a new input file relative to the current source file (which the
srcpos code tracks internally).  It doesn't currently do search paths,
but we can add that later without messing with the callers, by drawing
the search path from a global (which makes sense anyway, rather than
shuffling it around the rest of the processing code).

That suffices for non-dts input files.  For the actual dts files,
srcfile_push() and srcfile_pop() wrappers open the file while also
keeping track of it as the current source file for future opens.

push_input_file() and pop_input_file() from the lexer become much
simpler, just using the srcfile_{push,pop}() functions plus flex's
yy{push,pop}_buffer_state() builtins.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

---
 convert-dtsv0-lexer.l |    6 +
 dtc-lexer.l           |   91 +++--------------------------
 dtc-parser.y          |   16 ++---
 dtc.c                 |   24 -------
 dtc.h                 |    4 -
 flattree.c            |   24 +++----
 srcpos.c              |  155 +++++++++++++++++++++++++++-----------------------
 srcpos.h              |   26 +++-----
 treesource.c          |    4 -
 9 files changed, 133 insertions(+), 217 deletions(-)

Index: dtc/srcpos.c
===================================================================
--- dtc.orig/srcpos.c	2008-10-03 00:04:07.000000000 +1000
+++ dtc/srcpos.c	2008-10-03 00:04:16.000000000 +1000
@@ -29,6 +29,45 @@ char *xstrdup(const char *s)
 	return dup;
 }
 
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
+
+static char *dirname(const char *path)
+{
+	const char *slash = strrchr(path, '/');
+
+	if (slash) {
+		int len = slash - path;
+		char *dir = xmalloc(len + 1);
+
+		memcpy(dir, path, len);
+		dir[len] = '\0';
+		return dir;
+	} else
+		return NULL;
+}
+
 void srcpos_error(struct srcloc *loc, char const *fmt, ...)
 {
 	va_list va;
@@ -49,97 +88,75 @@ void srcpos_error(struct srcloc *loc, ch
 	va_end(va);
 }
 
+struct srcfile_state *current_srcfile; /* = NULL */
 /*
- * Like yylineno, this is the current open file pos.
+ * Detect infinite include recursion.
  */
+#define MAX_SRCFILE_DEPTH	(100)
+static int srcfile_depth; /* = 0 */
 
-struct dtc_file *srcpos_file;
-
-static int dtc_open_one(struct dtc_file *file,
-                        const char *search,
-                        const char *fname)
+FILE *srcfile_open(const char *fname, char **fullnamep)
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
-struct dtc_file *dtc_open_file(const char *fname,
-                               const struct search_path *search)
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
+	srcfile->f = srcfile_open(fname, &srcfile->name);
+	srcfile->dir = dirname(srcfile->name);
+	srcfile->prev = current_srcfile;
+	current_srcfile = srcfile;
 
-		file->name = xstrdup(fname);
-		return file;
-	}
+	/* FIXME: We allow srcfile->name to leak, because there could
+	 * still be aliases to it from yylloc variables */
+}
 
-	if (!search)
-		search = &default_search;
+int srcfile_pop(void)
+{
+	struct srcfile_state *srcfile = current_srcfile;
 
-	while (search) {
-		if (dtc_open_one(file, search->dir, fname))
-			return file;
+	assert(srcfile);
 
-		if (errno != ENOENT)
-			goto fail;
+	current_srcfile = srcfile->prev;
 
-		search = search->next;
-	}
+	if (fclose(srcfile->f))
+		die("Error closing \"%s\": %s\n", srcfile->name, strerror(errno));
 
-fail:
-	die("Couldn't open \"%s\": %s\n", fname, strerror(errno));
-}
-
-void dtc_close_file(struct dtc_file *file)
-{
-	if (fclose(file->file))
-		die("Error closing \"%s\": %s\n", file->name, strerror(errno));
+	if (srcfile->dir)
+		free(srcfile->dir);
+	//free(srcfile->name); // FIXME
+	free(srcfile);
 
-	free(file->dir);
-	free(file);
+	return current_srcfile ? 1 : 0;
 }
Index: dtc/dtc.c
===================================================================
--- dtc.orig/dtc.c	2008-10-03 00:03:38.000000000 +1000
+++ dtc/dtc.c	2008-10-03 00:04:16.000000000 +1000
@@ -30,30 +30,6 @@ int reservenum;		/* Number of memory res
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
--- dtc.orig/convert-dtsv0-lexer.l	2008-10-03 00:03:38.000000000 +1000
+++ dtc/convert-dtsv0-lexer.l	2008-10-03 00:04:16.000000000 +1000
@@ -229,8 +229,10 @@ static void convert_file(const char *fna
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
--- dtc.orig/flattree.c	2008-10-03 00:03:38.000000000 +1000
+++ dtc/flattree.c	2008-10-03 00:04:16.000000000 +1000
@@ -775,7 +775,7 @@ static struct node *unflatten_tree(struc
 
 struct boot_info *dt_from_blob(const char *fname)
 {
-	struct dtc_file *dtcf;
+	FILE *f;
 	uint32_t magic, totalsize, version, size_dt, boot_cpuid_phys;
 	uint32_t off_dt, off_str, off_mem_rsvmap;
 	int rc;
@@ -790,14 +790,14 @@ struct boot_info *dt_from_blob(const cha
 	uint32_t val;
 	int flags = 0;
 
-	dtcf = dtc_open_file(fname, NULL);
+	f = srcfile_open(fname, NULL);
 
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
@@ -807,11 +807,11 @@ struct boot_info *dt_from_blob(const cha
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
@@ -831,12 +831,12 @@ struct boot_info *dt_from_blob(const cha
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
 
@@ -899,7 +899,7 @@ struct boot_info *dt_from_blob(const cha
 
 	free(blob);
 
-	dtc_close_file(dtcf);
+	fclose(f);
 
 	return build_boot_info(reservelist, tree, boot_cpuid_phys);
 }
Index: dtc/srcpos.h
===================================================================
--- dtc.orig/srcpos.h	2008-10-03 00:04:07.000000000 +1000
+++ dtc/srcpos.h	2008-10-03 00:04:16.000000000 +1000
@@ -21,6 +21,7 @@
 #include <stdio.h>
 
 char *xstrdup(const char *s);
+char *join_path(const char *path, const char *name);
 
 struct srcpos {
 	int line;
@@ -48,24 +49,21 @@ struct srcloc {
 		}							\
 	} while (0)
 
-struct dtc_file {
-	char *dir;
-	const char *name;
-	FILE *file;
-};
-
 void srcpos_error(YYLTYPE *loc, char const *fmt, ...)
 	__attribute__((format(printf, 2, 3)));
 
-extern struct dtc_file *srcpos_file;
-
-struct search_path {
-	const char *dir; /* NULL for current directory */
-	struct search_path *prev, *next;
+struct srcfile_state {
+	FILE *f;
+	char *name;
+	char *dir;
+	int lineno;
+	struct srcfile_state *prev;
 };
 
-extern struct dtc_file *dtc_open_file(const char *fname,
-                                      const struct search_path *search);
-extern void dtc_close_file(struct dtc_file *file);
+extern struct srcfile_state *current_srcfile; /* = NULL */
+
+FILE *srcfile_open(const char *fname, char **fullnamep);
+void srcfile_push(const char *fname);
+int srcfile_pop(void);
 
 #endif /* _SRCPOS_H */
Index: dtc/treesource.c
===================================================================
--- dtc.orig/treesource.c	2008-10-03 00:03:38.000000000 +1000
+++ dtc/treesource.c	2008-10-03 00:04:16.000000000 +1000
@@ -31,8 +31,8 @@ struct boot_info *dt_from_source(const c
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
--- dtc.orig/dtc-lexer.l	2008-10-03 00:04:07.000000000 +1000
+++ dtc/dtc-lexer.l	2008-10-03 00:04:16.000000000 +1000
@@ -39,7 +39,7 @@ LINECOMMENT	"//".*\n
 
 #define	YY_USER_ACTION \
 	{ \
-		yylloc.first.file = yylloc.last.file = srcpos_file->name; \
+		yylloc.first.file = yylloc.last.file = current_srcfile->name; \
 		yylloc.first.line = yylloc.last.line = yylineno; \
 	}
 
@@ -194,100 +194,29 @@ static int pop_input_file(void);
 
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
--- dtc.orig/dtc-parser.y	2008-10-03 00:03:57.000000000 +1000
+++ dtc/dtc-parser.y	2008-10-03 00:04:16.000000000 +1000
@@ -202,12 +202,11 @@ propdata:
 		}
 	| propdataprefix DT_INCBIN '(' DT_STRING ',' addr ',' addr ')'
 		{
-			struct search_path path = { srcpos_file->dir, NULL, NULL };
-			struct dtc_file *file = dtc_open_file($4.val, &path);
+			FILE *f = srcfile_open($4.val, NULL);
 			struct data d = empty_data;
 
 			if ($6 != 0)
-				if (fseek(file->file, $6, SEEK_SET) != 0) {
+				if (fseek(f, $6, SEEK_SET) != 0) {
 					srcpos_error(&yylloc, "Couldn't seek to"
 						     " offset %llu in \"%s\": %s",
 						     (unsigned long long)$6,
@@ -215,21 +214,20 @@ propdata:
 					treesource_error = 1;
 				}
 
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
+			FILE *f = srcfile_open($4.val, NULL);
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
--- dtc.orig/dtc.h	2008-10-03 00:03:38.000000000 +1000
+++ dtc/dtc.h	2008-10-03 00:04:16.000000000 +1000
@@ -241,8 +241,4 @@ struct boot_info *dt_from_source(const c
 
 struct boot_info *dt_from_fs(const char *dirname);
 
-/* misc */
-
-char *join_path(const char *path, const char *name);
-
 #endif /* _DTC_H */

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
