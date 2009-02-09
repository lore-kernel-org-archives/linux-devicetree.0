From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [2/4] dtc: Cleanup line number tracking, add column number tracking
Date: Mon, 9 Feb 2009 13:56:47 +1100
Message-ID: <20090209025647.GE19864@yookeroo.seuss>
References: <20090209025446.GC19864@yookeroo.seuss>
	<20090209025601.GD19864@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090209025601.GD19864-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
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

Our YYLTYPE current carries around first and last line and first and
last column information.  However, of these, on the first line
information is actually filled in properly.

Furthermore, filling in the line number information from yylineno is
kind of clunky: we have to copy its value to the srcfile stack and
back to handle include file positioning correctly.

This patch cleans this up.  We turn off flex's yylineno option and
instead track the line and column number ourselves from
YY_USER_ACTION.  The line and column number are stored directly inside
the srcfile_state structure, so it's automatically a per-file
quantity.  We now also fill in all the yylloc from YY_USER_ACTION.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

---
 dtc-lexer.l |   11 ++++-------
 srcpos.c    |   33 ++++++++++++++++++++++++++++++++-
 srcpos.h    |    3 ++-
 3 files changed, 38 insertions(+), 9 deletions(-)

Index: dtc/srcpos.c
===================================================================
--- dtc.orig/srcpos.c	2009-02-09 13:52:06.000000000 +1100
+++ dtc/srcpos.c	2009-02-09 13:52:11.000000000 +1100
@@ -87,6 +87,10 @@ void srcfile_push(const char *fname)
 	srcfile->f = srcfile_relative_open(fname, &srcfile->name);
 	srcfile->dir = dirname(srcfile->name);
 	srcfile->prev = current_srcfile;
+
+	srcfile->lineno = 1;
+	srcfile->colno = 1;
+
 	current_srcfile = srcfile;
 }
 
@@ -99,7 +103,8 @@ int srcfile_pop(void)
 	current_srcfile = srcfile->prev;
 
 	if (fclose(srcfile->f))
-		die("Error closing \"%s\": %s\n", srcfile->name, strerror(errno));
+		die("Error closing \"%s\": %s\n", srcfile->name,
+		    strerror(errno));
 
 	/* FIXME: We allow the srcfile_state structure to leak,
 	 * because it could still be referenced from a location
@@ -122,6 +127,32 @@ srcpos srcpos_empty = {
 	.file = NULL,
 };
 
+#define TAB_SIZE      8
+
+void srcpos_update(srcpos *pos, const char *text, int len)
+{
+	int i;
+
+	pos->file = current_srcfile;
+
+	pos->first_line = current_srcfile->lineno;
+	pos->first_column = current_srcfile->colno;
+
+	for (i = 0; i < len; i++)
+		if (text[i] == '\n') {
+			current_srcfile->lineno++;
+			current_srcfile->colno = 1;
+		} else if (text[i] == '\t') {
+			current_srcfile->colno =
+				ALIGN(current_srcfile->colno, TAB_SIZE);
+		} else {
+			current_srcfile->colno++;
+		}
+
+	pos->last_line = current_srcfile->lineno;
+	pos->last_column = current_srcfile->colno;
+}
+
 srcpos *
 srcpos_copy(srcpos *pos)
 {
Index: dtc/dtc-lexer.l
===================================================================
--- dtc.orig/dtc-lexer.l	2009-02-09 13:52:06.000000000 +1100
+++ dtc/dtc-lexer.l	2009-02-09 13:52:11.000000000 +1100
@@ -18,7 +18,7 @@
  *                                                                   USA
  */
 
-%option noyywrap nounput noinput yylineno
+%option noyywrap nounput noinput
 
 %x INCLUDE
 %x BYTESTRING
@@ -38,10 +38,11 @@ LINECOMMENT	"//".*\n
 #include "srcpos.h"
 #include "dtc-parser.tab.h"
 
+
+/* CAUTION: this will stop working if we ever use yyless() or yyunput() */
 #define	YY_USER_ACTION \
 	{ \
-		yylloc.file = current_srcfile; \
-		yylloc.first_line = yylineno; \
+		srcpos_update(&yylloc, yytext, yyleng); \
 	}
 
 /*#define LEXDEBUG	1*/
@@ -169,12 +170,9 @@ static void push_input_file(const char *
 {
 	assert(filename);
 
-	current_srcfile->lineno = yylineno;
-
 	srcfile_push(filename);
 
 	yyin = current_srcfile->f;
-	yylineno = 1;
 
 	yypush_buffer_state(yy_create_buffer(yyin, YY_BUF_SIZE));
 }
@@ -186,7 +184,6 @@ static int pop_input_file(void)
 		return 0;
 
 	yypop_buffer_state();
-	yylineno = current_srcfile->lineno;
 	yyin = current_srcfile->f;
 
 	return 1;
Index: dtc/srcpos.h
===================================================================
--- dtc.orig/srcpos.h	2009-02-09 13:52:06.000000000 +1100
+++ dtc/srcpos.h	2009-02-09 13:52:11.000000000 +1100
@@ -31,7 +31,7 @@ struct srcfile_state {
 	FILE *f;
 	char *name;
 	char *dir;
-	int lineno;
+	int lineno, colno;
 	struct srcfile_state *prev;
 };
 
@@ -89,6 +89,7 @@ typedef YYLTYPE srcpos;
  */
 extern srcpos srcpos_empty;
 
+extern void srcpos_update(srcpos *pos, const char *text, int len);
 extern srcpos *srcpos_copy(srcpos *pos);
 extern char *srcpos_string(srcpos *pos);
 extern void srcpos_dump(srcpos *pos);

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
