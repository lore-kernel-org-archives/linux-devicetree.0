From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: [PATCH] Enhance source position implementation.
Date: Fri,  3 Oct 2008 15:47:33 -0500
Message-ID: <1223066853-5978-1-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Implemented some print and copy routines.
Made empty srcpos objects that will be used later.
Protected .h file from multiple #include's.
Added srcpos_error() and srcpos_warn().

Signed-off-by: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---

This patch is a refactoring of the yyerror() and yyerrorf(()
changes out of my proposed IR patch set back to the current
master branch.  It should be pretty close to one Gibson's [3/5]
patch where he was headed in the same direction.  This one
anticipates srcpos_warn() too.

BTW, I realize my earlier reply to his [3/5] patch was sort
of meant to be in response to his following patch as well.
Oh well.

As he was also in favor of this change with his patch set,
I'm just going to apply this one straight up.


 dtc-parser.y |   29 +++---------
 srcpos.c     |  142 ++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 srcpos.h     |   23 +++++++++-
 3 files changed, 162 insertions(+), 32 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index b2ab562..ae6f3c4 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -27,6 +27,7 @@
 #include "srcpos.h"
 
 extern int yylex(void);
+extern void yyerror(char const *s);
 
 extern struct boot_info *the_boot_info;
 extern int treesource_error;
@@ -208,9 +209,11 @@ propdata:
 
 			if ($6 != 0)
 				if (fseek(file->file, $6, SEEK_SET) != 0)
-					yyerrorf("Couldn't seek to offset %llu in \"%s\": %s",
-						 (unsigned long long)$6,
-						 $4.val, strerror(errno));
+					srcpos_error(&yyloc,
+						     "Couldn't seek to offset %llu in \"%s\": %s",
+						     (unsigned long long)$6,
+						     $4.val,
+						     strerror(errno));
 
 			d = data_copy_file(file->file, $8);
 
@@ -339,26 +342,10 @@ label:
 
 %%
 
-void yyerrorf(char const *s, ...)
+void yyerror(char const *s)
 {
-	const char *fname = srcpos_file ? srcpos_file->name : "<no-file>";
-	va_list va;
-	va_start(va, s);
-
-	if (strcmp(fname, "-") == 0)
-		fname = "stdin";
-
-	fprintf(stderr, "%s:%d ", fname, yylloc.first_line);
-	vfprintf(stderr, s, va);
-	fprintf(stderr, "\n");
-
+	srcpos_error(&yylloc, "%s", s);
 	treesource_error = 1;
-	va_end(va);
-}
-
-void yyerror (char const *s)
-{
-	yyerrorf("%s", s);
 }
 
 static unsigned long long eval_literal(const char *s, int base, int bits)
diff --git a/srcpos.c b/srcpos.c
index d5a4b2a..8bb0c02 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -17,18 +17,40 @@
  *                                                                   USA
  */
 
+#define _GNU_SOURCE
+
+#include <stdio.h>
+
 #include "dtc.h"
 #include "srcpos.h"
 
+
 /*
  * Like yylineno, this is the current open file pos.
  */
-
 struct dtc_file *srcpos_file;
 
-static int dtc_open_one(struct dtc_file *file,
-                        const char *search,
-                        const char *fname)
+/*
+ * The empty source position.
+ */
+
+struct dtc_file dtc_empty_file = {
+	.dir = NULL,
+	.name = "<no file>",
+	.file = NULL
+};
+
+srcpos srcpos_empty = {
+	.first_line = 0,
+	.first_column = 0,
+	.last_line = 0,
+	.last_column = 0,
+	.file = &dtc_empty_file
+};
+
+
+static int
+dtc_open_one(struct dtc_file *file, const char *search, const char *fname)
 {
 	char *fullname;
 
@@ -53,8 +75,8 @@ static int dtc_open_one(struct dtc_file *file,
 }
 
 
-struct dtc_file *dtc_open_file(const char *fname,
-                               const struct search_path *search)
+struct dtc_file *
+dtc_open_file(const char *fname, const struct search_path *search)
 {
 	static const struct search_path default_search = { NULL, NULL, NULL };
 
@@ -106,11 +128,113 @@ fail:
 	die("Couldn't open \"%s\": %s\n", fname, strerror(errno));
 }
 
-void dtc_close_file(struct dtc_file *file)
+
+void
+dtc_close_file(struct dtc_file *file)
 {
 	if (fclose(file->file))
 		die("Error closing \"%s\": %s\n", file->name, strerror(errno));
+}
+
+
+srcpos *
+srcpos_copy(srcpos *pos)
+{
+	srcpos *pos_new;
+
+	pos_new = xmalloc(sizeof(srcpos));
+	memcpy(pos_new, pos, sizeof(srcpos));
+
+	return pos_new;
+}
+
+
+
+void
+srcpos_dump(srcpos *pos)
+{
+	printf("file        : \"%s\"\n",
+	       pos->file ? (char *) pos->file : "<no file>");
+	printf("first_line  : %d\n", pos->first_line);
+	printf("first_column: %d\n", pos->first_column);
+	printf("last_line   : %d\n", pos->last_line);
+	printf("last_column : %d\n", pos->last_column);
+	printf("file        : %s\n", pos->file->name);
+}
+
+
+char *
+srcpos_string(srcpos *pos)
+{
+	const char *fname;
+	char col_buf[100];
+	char *pos_str;
+
+	if (!pos) {
+		fname = "<no-file>";
+	} else if (pos->file->name) {
+		fname = pos->file->name;
+		if (strcmp(fname, "-") == 0)
+			fname = "stdin";
+	} else {
+		fname = "<no-file>";
+	}
+
+	if (pos->first_line == pos->last_line) {
+		if (pos->first_column == pos->last_column) {
+			snprintf(col_buf, sizeof(col_buf),
+				 "%d:%d",
+				 pos->first_line, pos->first_column);
+		} else {
+			snprintf(col_buf, sizeof(col_buf),
+				 "%d:%d-%d",
+				 pos->first_line,
+				 pos->first_column, pos->last_column);
+		}
+
+	} else {
+		snprintf(col_buf, sizeof(col_buf),
+			 "%d:%d - %d:%d",
+			 pos->first_line, pos->first_column,
+			 pos->last_line, pos->last_column);
+	}
+
+	if (asprintf(&pos_str, "%s %s", fname, col_buf) == -1)
+		return "<unknown source position?";
+
+	return pos_str;
+}
+
+
+void
+srcpos_error(srcpos *pos, char const *fmt, ...)
+{
+	const char *srcstr;
+	va_list va;
+	va_start(va, fmt);
+
+	srcstr = srcpos_string(pos);
+
+	fprintf(stderr, "Error: %s ", srcstr);
+	vfprintf(stderr, fmt, va);
+	fprintf(stderr, "\n");
+
+	va_end(va);
+}
+
+
+void
+srcpos_warn(srcpos *pos, char const *fmt, ...)
+{
+	const char *srcstr;
+	va_list va;
+	va_start(va, fmt);
+
+	srcstr = srcpos_string(pos);
+
+	fprintf(stderr, "Warning: %s ", srcstr);
+	vfprintf(stderr, fmt, va);
+	fprintf(stderr, "\n");
 
-	free(file->dir);
-	free(file);
+	va_end(va);
 }
diff --git a/srcpos.h b/srcpos.h
index e17c7c0..a6d0077 100644
--- a/srcpos.h
+++ b/srcpos.h
@@ -17,6 +17,9 @@
  *                                                                   USA
  */
 
+#ifndef _SRCPOS_H_
+#define _SRCPOS_H_
+
 /*
  * Augment the standard YYLTYPE with a filenum index into an
  * array of all opened filenames.
@@ -69,9 +72,14 @@ typedef struct YYLTYPE {
     while (YYID (0))
 
 
+typedef YYLTYPE srcpos;
 
-extern void yyerror(char const *);
-extern void yyerrorf(char const *, ...) __attribute__((format(printf, 1, 2)));
+/*
+ * Fictional source position used for IR nodes that are
+ * created without otherwise knowing a true source position.
+ * For example,constant definitions from the command line.
+ */
+extern srcpos srcpos_empty;
 
 extern struct dtc_file *srcpos_file;
 
@@ -83,3 +91,14 @@ struct search_path {
 extern struct dtc_file *dtc_open_file(const char *fname,
                                       const struct search_path *search);
 extern void dtc_close_file(struct dtc_file *file);
+
+extern srcpos *srcpos_copy(srcpos *pos);
+extern char *srcpos_string(srcpos *pos);
+extern void srcpos_dump(srcpos *pos);
+
+extern void srcpos_error(srcpos *pos, char const *, ...)
+     __attribute__((format(printf, 2, 3)));
+extern void srcpos_warn(srcpos *pos, char const *, ...)
+     __attribute__((format(printf, 2, 3)));
+
+#endif /* _SRCPOS_H_ */
-- 
1.6.0.90.g436ed
