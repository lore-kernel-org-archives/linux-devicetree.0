From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [4/4] dtc: Cleanup YYLTYPE and YYLLOC_DEFAULT declarations
Date: Mon, 9 Feb 2009 13:58:13 +1100
Message-ID: <20090209025813.GG19864@yookeroo.seuss>
References: <20090209025446.GC19864@yookeroo.seuss>
	<20090209025601.GD19864@yookeroo.seuss>
	<20090209025647.GE19864@yookeroo.seuss>
	<20090209025740.GF19864@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090209025740.GF19864-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch makes some small cleanups to the declaration of YYLTYPE,
YYLLOC_DEFAULT and related things.

	- We used to use undocumented magic #defines for bison,
          YYLTYPE_IS_DECLARED and YYLTYPE_IS_TRIVIAL.  This may not be
          portable across bison versions.  Instead define YYLTYPE as a
          macro in terms of struct srcpos, as the info pages suggest.

	- Our kernel-derived coding style discourages typedefed
          structures.  So use 'struct srcpos' instead of 'srcpos'
          throughout'.

	- Indent the YYLLOC_DEFAULT macro according to our coding
          style (it was in GNU indent style, since it was taken from
          the example in the bison info).

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

---
 srcpos.c |   22 +++++++++----------
 srcpos.h |   70 +++++++++++++++++++++++----------------------------------------
 2 files changed, 37 insertions(+), 55 deletions(-)

Index: dtc/srcpos.h
===================================================================
--- dtc.orig/srcpos.h	2009-02-09 13:52:11.000000000 +1100
+++ dtc/srcpos.h	2009-02-09 13:52:17.000000000 +1100
@@ -20,11 +20,6 @@
 #ifndef _SRCPOS_H_
 #define _SRCPOS_H_
 
-/*
- * Augment the standard YYLTYPE with a filenum index into an
- * array of all opened filenames.
- */
-
 #include <stdio.h>
 
 struct srcfile_state {
@@ -41,62 +36,49 @@ FILE *srcfile_relative_open(const char *
 void srcfile_push(const char *fname);
 int srcfile_pop(void);
 
-#if ! defined(YYLTYPE) && ! defined(YYLTYPE_IS_DECLARED)
-typedef struct YYLTYPE {
+struct srcpos {
     int first_line;
     int first_column;
     int last_line;
     int last_column;
     struct srcfile_state *file;
-} YYLTYPE;
+};
 
-#define YYLTYPE_IS_DECLARED	1
-#define YYLTYPE_IS_TRIVIAL	1
-#endif
-
-/* Cater to old parser templates. */
-#ifndef YYID
-#define YYID(n)	(n)
-#endif
-
-#define YYLLOC_DEFAULT(Current, Rhs, N)					\
-    do									\
-      if (YYID (N))							\
-	{								\
-	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
-	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
-	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
-	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
-	  (Current).file         = YYRHSLOC (Rhs, N).file;		\
-	}								\
-      else								\
-	{								\
-	  (Current).first_line   = (Current).last_line   =		\
-	    YYRHSLOC (Rhs, 0).last_line;				\
-	  (Current).first_column = (Current).last_column =		\
-	    YYRHSLOC (Rhs, 0).last_column;				\
-	  (Current).file         = YYRHSLOC (Rhs, 0).file;		\
-	}								\
-    while (YYID (0))
+#define YYLTYPE struct srcpos
 
+#define YYLLOC_DEFAULT(Current, Rhs, N)						\
+	do {									\
+		if (N) {							\
+			(Current).first_line = YYRHSLOC(Rhs, 1).first_line;	\
+			(Current).first_column = YYRHSLOC(Rhs, 1).first_column;	\
+			(Current).last_line = YYRHSLOC(Rhs, N).last_line;	\
+			(Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
+			(Current).file = YYRHSLOC(Rhs, N).file;			\
+		} else {							\
+			(Current).first_line = (Current).last_line =		\
+				YYRHSLOC(Rhs, 0).last_line;			\
+			(Current).first_column = (Current).last_column =	\
+				YYRHSLOC(Rhs, 0).last_column;			\
+			(Current).file = YYRHSLOC (Rhs, 0).file;		\
+		}								\
+	} while (0)
 
-typedef YYLTYPE srcpos;
 
 /*
  * Fictional source position used for IR nodes that are
  * created without otherwise knowing a true source position.
  * For example,constant definitions from the command line.
  */
-extern srcpos srcpos_empty;
+extern struct srcpos srcpos_empty;
 
-extern void srcpos_update(srcpos *pos, const char *text, int len);
-extern srcpos *srcpos_copy(srcpos *pos);
-extern char *srcpos_string(srcpos *pos);
-extern void srcpos_dump(srcpos *pos);
+extern void srcpos_update(struct srcpos *pos, const char *text, int len);
+extern struct srcpos *srcpos_copy(struct srcpos *pos);
+extern char *srcpos_string(struct srcpos *pos);
+extern void srcpos_dump(struct srcpos *pos);
 
-extern void srcpos_error(srcpos *pos, char const *, ...)
+extern void srcpos_error(struct srcpos *pos, char const *, ...)
      __attribute__((format(printf, 2, 3)));
-extern void srcpos_warn(srcpos *pos, char const *, ...)
+extern void srcpos_warn(struct srcpos *pos, char const *, ...)
      __attribute__((format(printf, 2, 3)));
 
 #endif /* _SRCPOS_H_ */
Index: dtc/srcpos.c
===================================================================
--- dtc.orig/srcpos.c	2009-02-09 13:52:14.000000000 +1100
+++ dtc/srcpos.c	2009-02-09 13:52:17.000000000 +1100
@@ -119,7 +119,7 @@ int srcfile_pop(void)
  * The empty source position.
  */
 
-srcpos srcpos_empty = {
+struct srcpos srcpos_empty = {
 	.first_line = 0,
 	.first_column = 0,
 	.last_line = 0,
@@ -129,7 +129,7 @@ srcpos srcpos_empty = {
 
 #define TAB_SIZE      8
 
-void srcpos_update(srcpos *pos, const char *text, int len)
+void srcpos_update(struct srcpos *pos, const char *text, int len)
 {
 	int i;
 
@@ -153,13 +153,13 @@ void srcpos_update(srcpos *pos, const ch
 	pos->last_column = current_srcfile->colno;
 }
 
-srcpos *
-srcpos_copy(srcpos *pos)
+struct srcpos *
+srcpos_copy(struct srcpos *pos)
 {
-	srcpos *pos_new;
+	struct srcpos *pos_new;
 
-	pos_new = xmalloc(sizeof(srcpos));
-	memcpy(pos_new, pos, sizeof(srcpos));
+	pos_new = xmalloc(sizeof(struct srcpos));
+	memcpy(pos_new, pos, sizeof(struct srcpos));
 
 	return pos_new;
 }
@@ -167,7 +167,7 @@ srcpos_copy(srcpos *pos)
 
 
 void
-srcpos_dump(srcpos *pos)
+srcpos_dump(struct srcpos *pos)
 {
 	printf("file        : \"%s\"\n",
 	       pos->file ? (char *) pos->file : "<no file>");
@@ -180,7 +180,7 @@ srcpos_dump(srcpos *pos)
 
 
 char *
-srcpos_string(srcpos *pos)
+srcpos_string(struct srcpos *pos)
 {
 	const char *fname = "<no-file>";
 	char *pos_str;
@@ -210,7 +210,7 @@ srcpos_string(srcpos *pos)
 
 
 void
-srcpos_error(srcpos *pos, char const *fmt, ...)
+srcpos_error(struct srcpos *pos, char const *fmt, ...)
 {
 	const char *srcstr;
 	va_list va;
@@ -227,7 +227,7 @@ srcpos_error(srcpos *pos, char const *fm
 
 
 void
-srcpos_warn(srcpos *pos, char const *fmt, ...)
+srcpos_warn(struct srcpos *pos, char const *fmt, ...)
 {
 	const char *srcstr;
 	va_list va;


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
