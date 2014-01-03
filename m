From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 06/10] Move integer literal processing back to the lexer
Date: Sat,  4 Jan 2014 00:24:39 +1100
Message-ID: <1388755483-27008-7-git-send-email-david@gibson.dropbear.id.au>
References: <1388755483-27008-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388755483-27008-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

At the moment integer literals are passed from the lexer to the parser as
a string, where it's evaluated into an integer by eval_literal().  That
strange approach happened because we needed to know whether we were
processing dts-v0 or dts-v1 - only known at the parser level - to know
how to interpret the literal properly.

dts-v0 support has been gone for some time now, and the base and bits
parameters to eval_literal() are essentially useless.

So, clean things up by moving the literal interpretation back to the lexer.
This also introduces a new lexical_error() function to report malformed
literals and set the treesource_error flag so that they'll cause a parse
failure at the top level.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 dtc-lexer.l  | 30 ++++++++++++++++++++++++++++--
 dtc-parser.y | 42 ++++++++++--------------------------------
 2 files changed, 38 insertions(+), 34 deletions(-)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index 0cd7e67..ba5d150 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -40,6 +40,7 @@ LINECOMMENT	"//".*\n
 #include "dtc-parser.tab.h"
 
 YYLTYPE yylloc;
+extern bool treesource_error;
 
 /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
 #define	YY_USER_ACTION \
@@ -62,6 +63,7 @@ static int dts_version = 1;
 
 static void push_input_file(const char *filename);
 static bool pop_input_file(void);
+static void lexical_error(const char *fmt, ...);
 %}
 
 %%
@@ -146,8 +148,21 @@ static bool pop_input_file(void);
 		}
 
 <V1>([0-9]+|0[xX][0-9a-fA-F]+)(U|L|UL|LL|ULL)? {
-			yylval.literal = xstrdup(yytext);
-			DPRINT("Literal: '%s'\n", yylval.literal);
+			char *e;
+			DPRINT("Integer Literal: '%s'\n", yytext);
+
+			errno = 0;
+			yylval.integer = strtoull(yytext, &e, 0);
+
+			assert(!(*e) || !e[strspn(e, "UL")]);
+
+			if (errno == ERANGE)
+				lexical_error("Integer literal '%s' out of range",
+					      yytext);
+			else
+				/* ERANGE is the only strtoull error triggerable
+				 *  by strings matching the pattern */
+				assert(errno == 0);
 			return DT_LITERAL;
 		}
 
@@ -248,3 +263,14 @@ static bool pop_input_file(void)
 
 	return true;
 }
+
+static void lexical_error(const char *fmt, ...)
+{
+	va_list ap;
+
+	va_start(ap, fmt);
+	srcpos_verror(&yylloc, "Lexical error", fmt, ap);
+	va_end(ap);
+
+	treesource_error = true;
+}
diff --git a/dtc-parser.y b/dtc-parser.y
index 2bcef1b..0ce0815 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -33,7 +33,6 @@ extern void yyerror(char const *s);
 extern struct boot_info *the_boot_info;
 extern bool treesource_error;
 
-static unsigned long long eval_literal(const char *s, int base, int bits);
 static unsigned char eval_char_literal(const char *s);
 %}
 
@@ -65,7 +64,7 @@ static unsigned char eval_char_literal(const char *s);
 %token DT_DEL_PROP
 %token DT_DEL_NODE
 %token <propnodename> DT_PROPNODENAME
-%token <literal> DT_LITERAL
+%token <integer> DT_LITERAL
 %token <literal> DT_CHAR_LITERAL
 %token <cbase> DT_BASE
 %token <byte> DT_BYTE
@@ -274,18 +273,20 @@ propdataprefix:
 arrayprefix:
 	DT_BITS DT_LITERAL '<'
 		{
-			$$.data = empty_data;
-			$$.bits = eval_literal($2, 0, 7);
+			unsigned long long bits;
+
+			bits = $2;
 
-			if (($$.bits !=  8) &&
-			    ($$.bits != 16) &&
-			    ($$.bits != 32) &&
-			    ($$.bits != 64))
+			if ((bits !=  8) && (bits != 16) &&
+			    (bits != 32) && (bits != 64))
 			{
 				print_error("Only 8, 16, 32 and 64-bit elements"
 					    " are currently supported");
-				$$.bits = 32;
+				bits = 32;
 			}
+
+			$$.data = empty_data;
+			$$.bits = bits;
 		}
 	| '<'
 		{
@@ -334,9 +335,6 @@ arrayprefix:
 
 integer_prim:
 	  DT_LITERAL
-		{
-			$$ = eval_literal($1, 0, 64);
-		}
 	| DT_CHAR_LITERAL
 		{
 			$$ = eval_char_literal($1);
@@ -485,26 +483,6 @@ void yyerror(char const *s) {
 	print_error("%s", s);
 }
 
-static unsigned long long eval_literal(const char *s, int base, int bits)
-{
-	unsigned long long val;
-	char *e;
-
-	errno = 0;
-	val = strtoull(s, &e, base);
-	if (*e) {
-		size_t uls = strspn(e, "UL");
-		if (e[uls])
-			print_error("bad characters in literal");
-	}
-	if ((errno == ERANGE)
-		 || ((bits < 64) && (val >= (1ULL << bits))))
-		print_error("literal out of range");
-	else if (errno != 0)
-		print_error("bad literal");
-	return val;
-}
-
 static unsigned char eval_char_literal(const char *s)
 {
 	int i = 1;
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
