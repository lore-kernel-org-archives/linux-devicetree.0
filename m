From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [4/5] dtc: Cleanup yylloc type and handling
Date: Fri, 3 Oct 2008 00:07:53 +1000
Message-ID: <20081002140753.GH11662@yookeroo.seuss>
References: <20081002140427.GD11662@yookeroo.seuss>
	<20081002140512.GE11662@yookeroo.seuss>
	<20081002140556.GF11662@yookeroo.seuss>
	<20081002140652.GG11662@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081002140652.GG11662-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
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

This patch makes several cleanups to the handling of location
variables as they're carried through the parser.  Specifically:

	- (for now) remove column numbers from YYLTYPE, since we were
never correctly filling them in from the lexer in any case.

	- split the 'file' field in YYLTYPE into first and last file,
since for big parser groupings the first and last token could in
theory be in different files.

	- use plain strings to store the files in YYLTYPE, instead of
dtc_file pointer.  There's no need for the other info from dtc_file,
and the strings will have nicer lifetime properties in future patches.

	- reorganize YYLTYPE into first and last nested structure
fields, each containing a file and line number, which will be more
convenient for us later on.

	- no longer use the undocumented magic #defines
YYLTYPE_IS_DECLARED and YYLTYPE_IS_TRIVIAL.  Instead we define our own
structure for the locations and make YYLTYPE a macro expanding to it,
as described in the flex info pages.

	- reformat the YYLLOC_DEFAULT macro into the indentation style
we use everywhere else (as well as updating it to match the other
changes)

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

---
 dtc-lexer.l |    4 +--
 srcpos.c    |   11 +++++++--
 srcpos.h    |   70 ++++++++++++++++++++++--------------------------------------
 3 files changed, 37 insertions(+), 48 deletions(-)

Index: dtc/srcpos.h
===================================================================
--- dtc.orig/srcpos.h	2008-10-03 00:03:57.000000000 +1000
+++ dtc/srcpos.h	2008-10-03 00:04:07.000000000 +1000
@@ -18,60 +18,42 @@
  *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
  *                                                                   USA
  */
-
-/*
- * Augment the standard YYLTYPE with a filenum index into an
- * array of all opened filenames.
- */
-
 #include <stdio.h>
 
 char *xstrdup(const char *s);
 
+struct srcpos {
+	int line;
+	const char *file;
+};
+
+struct srcloc {
+	struct srcpos first, last;
+};
+
+#define YYLTYPE struct srcloc
+
+#define YYLLOC_DEFAULT(Cur, Rhs, N)					\
+	do {								\
+		if (N) {						\
+			(Cur).first.file = YYRHSLOC(Rhs, 1).first.file;	\
+			(Cur).first.line = YYRHSLOC(Rhs, 1).first.line; \
+			(Cur).last.file = YYRHSLOC(Rhs, N).last.file;	\
+			(Cur).last.line = YYRHSLOC(Rhs, N).last.line;	\
+		} else {						\
+			(Cur).first.line = (Cur).last.line 		\
+				= YYRHSLOC(Rhs, 0).last.line;		\
+			(Cur).first.file = (Cur).last.file		\
+				= YYRHSLOC(Rhs, 0).last.file;		\
+		}							\
+	} while (0)
+
 struct dtc_file {
 	char *dir;
 	const char *name;
 	FILE *file;
 };
 
-#if ! defined(YYLTYPE) && ! defined(YYLTYPE_IS_DECLARED)
-typedef struct YYLTYPE {
-    int first_line;
-    int first_column;
-    int last_line;
-    int last_column;
-    struct dtc_file *file;
-} YYLTYPE;
-
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
-
 void srcpos_error(YYLTYPE *loc, char const *fmt, ...)
 	__attribute__((format(printf, 2, 3)));
 
Index: dtc/dtc-lexer.l
===================================================================
--- dtc.orig/dtc-lexer.l	2008-10-03 00:03:48.000000000 +1000
+++ dtc/dtc-lexer.l	2008-10-03 00:04:07.000000000 +1000
@@ -39,8 +39,8 @@ LINECOMMENT	"//".*\n
 
 #define	YY_USER_ACTION \
 	{ \
-		yylloc.file = srcpos_file; \
-		yylloc.first_line = yylineno; \
+		yylloc.first.file = yylloc.last.file = srcpos_file->name; \
+		yylloc.first.line = yylloc.last.line = yylineno; \
 	}
 
 /*#define LEXDEBUG	1*/
Index: dtc/srcpos.c
===================================================================
--- dtc.orig/srcpos.c	2008-10-03 00:03:57.000000000 +1000
+++ dtc/srcpos.c	2008-10-03 00:04:07.000000000 +1000
@@ -29,12 +29,19 @@ char *xstrdup(const char *s)
 	return dup;
 }
 
-void srcpos_error(YYLTYPE *loc, char const *fmt, ...)
+void srcpos_error(struct srcloc *loc, char const *fmt, ...)
 {
 	va_list va;
 	va_start(va, fmt);
 
-	fprintf(stderr, "%s:%d ", loc->file->name, loc->first_line);
+	if (!streq(loc->first.file, loc->last.file))
+		fprintf(stderr, "%s:%d-%s:%d ", loc->first.file, loc->first.line,
+			loc->last.file, loc->last.line);
+	else if (loc->first.line != loc->last.line)
+		fprintf(stderr, "%s:%d-%d ", loc->first.file, loc->first.line,
+			loc->last.line);
+	else
+		fprintf(stderr, "%s:%d ", loc->first.file, loc->first.line);
 
 	vfprintf(stderr, fmt, va);
 	fprintf(stderr, "\n");


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
