From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 07/10] Move character literal processing to the lexer
Date: Sat,  4 Jan 2014 00:24:40 +1100
Message-ID: <1388755483-27008-8-git-send-email-david@gibson.dropbear.id.au>
References: <1388755483-27008-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388755483-27008-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

To match the processing of integer literals, character literals are passed
as a strong from lexer to parser then interpreted there.  This is just as
awkward as it was for integer literals, without the excuse that we used to
need the information about the dts version to process them correctly.

So, move character literal processing back to the lexer as well, cleaning
things up.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 dtc-lexer.l  | 20 +++++++++++++++++---
 dtc-parser.y | 34 +---------------------------------
 2 files changed, 18 insertions(+), 36 deletions(-)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index ba5d150..0821bde 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -167,9 +167,23 @@ static void lexical_error(const char *fmt, ...);
 		}
 
 <*>{CHAR_LITERAL}	{
-			yytext[yyleng-1] = '\0';
-			yylval.literal = xstrdup(yytext+1);
-			DPRINT("Character literal: %s\n", yylval.literal);
+			struct data d;
+			DPRINT("Character literal: %s\n", yytext);
+
+			d = data_copy_escape_string(yytext+1, yyleng-2);
+			if (d.len == 1) {
+				lexical_error("Empty character literal");
+				yylval.integer = 0;
+				return DT_CHAR_LITERAL;
+			}
+
+			yylval.integer = (unsigned char)d.val[0];
+
+			if (d.len > 2)
+				lexical_error("Character literal has %d"
+					      " characters instead of 1",
+					      d.len - 1);
+
 			return DT_CHAR_LITERAL;
 		}
 
diff --git a/dtc-parser.y b/dtc-parser.y
index 0ce0815..efe81dd 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -32,13 +32,10 @@ extern void yyerror(char const *s);
 
 extern struct boot_info *the_boot_info;
 extern bool treesource_error;
-
-static unsigned char eval_char_literal(const char *s);
 %}
 
 %union {
 	char *propnodename;
-	char *literal;
 	char *labelref;
 	unsigned int cbase;
 	uint8_t byte;
@@ -65,7 +62,7 @@ static unsigned char eval_char_literal(const char *s);
 %token DT_DEL_NODE
 %token <propnodename> DT_PROPNODENAME
 %token <integer> DT_LITERAL
-%token <literal> DT_CHAR_LITERAL
+%token <integer> DT_CHAR_LITERAL
 %token <cbase> DT_BASE
 %token <byte> DT_BYTE
 %token <data> DT_STRING
@@ -336,9 +333,6 @@ arrayprefix:
 integer_prim:
 	  DT_LITERAL
 	| DT_CHAR_LITERAL
-		{
-			$$ = eval_char_literal($1);
-		}
 	| '(' integer_expr ')'
 		{
 			$$ = $2;
@@ -482,29 +476,3 @@ void print_error(char const *fmt, ...)
 void yyerror(char const *s) {
 	print_error("%s", s);
 }
-
-static unsigned char eval_char_literal(const char *s)
-{
-	int i = 1;
-	char c = s[0];
-
-	if (c == '\0')
-	{
-		print_error("empty character literal");
-		return 0;
-	}
-
-	/*
-	 * If the first character in the character literal is a \ then process
-	 * the remaining characters as an escape encoding. If the first
-	 * character is neither an escape or a terminator it should be the only
-	 * character in the literal and will be returned.
-	 */
-	if (c == '\\')
-		c = get_escape_char(s, &i);
-
-	if (s[i] != '\0')
-		print_error("malformed character literal");
-
-	return c;
-}
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
