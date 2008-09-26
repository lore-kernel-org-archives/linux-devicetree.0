From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: [PATCH 3/9 V3] Enhance source position implementation.
Date: Fri, 26 Sep 2008 15:25:42 -0500
Message-ID: <1222460748-20127-4-git-send-email-jdl@jdl.com>
References: <1222460748-20127-1-git-send-email-jdl@jdl.com>
	<1222460748-20127-2-git-send-email-jdl@jdl.com>
	<1222460748-20127-3-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1222460748-20127-3-git-send-email-jdl-CYoMK+44s/E@public.gmane.org>
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

Signed-off-by: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 srcpos.c |   95 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 srcpos.h |   19 ++++++++++++
 2 files changed, 107 insertions(+), 7 deletions(-)

diff --git a/srcpos.c b/srcpos.c
index 9641b76..59d1835 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -23,12 +23,29 @@
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
 
@@ -53,8 +70,8 @@ static int dtc_open_one(struct dtc_file *file,
 }
 
 
-struct dtc_file *dtc_open_file(const char *fname,
-                               const struct search_path *search)
+struct dtc_file *
+dtc_open_file(const char *fname, const struct search_path *search)
 {
 	static const struct search_path default_search = { NULL, NULL, NULL };
 
@@ -106,7 +123,9 @@ fail:
 	die("Couldn't open \"%s\": %s\n", fname, strerror(errno));
 }
 
-void dtc_close_file(struct dtc_file *file)
+
+void
+dtc_close_file(struct dtc_file *file)
 {
 	if (fclose(file->file))
 		die("Error closing \"%s\": %s\n", file->name, strerror(errno));
@@ -114,3 +133,65 @@ void dtc_close_file(struct dtc_file *file)
 	free(file->dir);
 	free(file);
 }
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
+#	define POS_BUF_SIZE	(100)
+
+	const char *fname;
+	char buf[POS_BUF_SIZE];
+
+	if (pos->file && pos->file->name)
+		fname = pos->file->name;
+	else
+		fname = "<no-file>";
+
+	if (pos->first_line == pos->last_line) {
+		if (pos->first_column == pos->last_column) {
+			snprintf(buf, POS_BUF_SIZE, "%s %d:%d",
+				 fname, pos->first_line, pos->first_column);
+		} else {
+			snprintf(buf, POS_BUF_SIZE, "%s %d:%d-%d",
+				 fname, pos->first_line,
+				 pos->first_column, pos->last_column);
+		}
+
+	} else {
+		snprintf(buf, POS_BUF_SIZE, "%s %d:%d - %d:%d",
+			 fname,
+			 pos->first_line, pos->first_column,
+			 pos->last_line, pos->last_column);
+	}
+
+	return strdup(buf);
+
+#	undef POS_BUF_SIZE
+}
diff --git a/srcpos.h b/srcpos.h
index e17c7c0..3c39dd0 100644
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
@@ -69,6 +72,16 @@ typedef struct YYLTYPE {
     while (YYID (0))
 
 
+typedef YYLTYPE srcpos;
+
+/*
+ * Fictional source position used for IR nodes that are
+ * created without otherwise knowing a true source position.
+ * For example,constant definitions from the command line.
+ */
+extern srcpos srcpos_empty;
+
+
 
 extern void yyerror(char const *);
 extern void yyerrorf(char const *, ...) __attribute__((format(printf, 1, 2)));
@@ -83,3 +96,9 @@ struct search_path {
 extern struct dtc_file *dtc_open_file(const char *fname,
                                       const struct search_path *search);
 extern void dtc_close_file(struct dtc_file *file);
+
+extern srcpos *srcpos_copy(srcpos *pos);
+extern char *srcpos_string(srcpos *pos);
+extern void srcpos_dump(srcpos *pos);
+
+#endif /* _SRCPOS_H_ */
-- 
1.6.0.90.g436ed
