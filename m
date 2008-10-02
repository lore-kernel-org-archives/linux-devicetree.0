From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [2/5] dtc: Use flex's YY_USER_ACTION feature to avoid code duplication
Date: Fri, 3 Oct 2008 00:05:56 +1000
Message-ID: <20081002140556.GF11662@yookeroo.seuss>
References: <20081002140427.GD11662@yookeroo.seuss>
	<20081002140512.GE11662@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081002140512.GE11662-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
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

Current, every lexer rule starts with some boiler plate to update the
yylloc value for use by the parser.  One of the rules, even mistakenly
has a redundant allocation to one of the members.

This patch uses the flex YY_USER_ACTION macro hook, which is executed
before every rule to avoid this duplication.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

---
 dtc-lexer.l |   36 +++++-------------------------------
 1 file changed, 5 insertions(+), 31 deletions(-)

Index: dtc/dtc-lexer.l
===================================================================
--- dtc.orig/dtc-lexer.l	2008-10-03 00:03:38.000000000 +1000
+++ dtc/dtc-lexer.l	2008-10-03 00:03:48.000000000 +1000
@@ -37,6 +37,11 @@ LINECOMMENT	"//".*\n
 #include "dtc.h"
 #include "dtc-parser.tab.h"
 
+#define	YY_USER_ACTION \
+	{ \
+		yylloc.file = srcpos_file; \
+		yylloc.first_line = yylineno; \
+	}
 
 /*#define LEXDEBUG	1*/
 
@@ -74,18 +79,13 @@ static int pop_input_file(void);
 		}
 
 <*>{STRING}	{
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
 			DPRINT("String: %s\n", yytext);
 			yylval.data = data_copy_escape_string(yytext+1,
 					yyleng-2);
-			yylloc.first_line = yylineno;
 			return DT_STRING;
 		}
 
 <*>"/dts-v1/"	{
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
 			DPRINT("Keyword: /dts-v1/\n");
 			dts_version = 1;
 			BEGIN_DEFAULT();
@@ -93,16 +93,12 @@ static int pop_input_file(void);
 		}
 
 <*>"/memreserve/"	{
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
 			DPRINT("Keyword: /memreserve/\n");
 			BEGIN_DEFAULT();
 			return DT_MEMRESERVE;
 		}
 
 <*>{LABEL}:	{
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
 			DPRINT("Label: %s\n", yytext);
 			yylval.labelref = xstrdup(yytext);
 			yylval.labelref[yyleng-1] = '\0';
@@ -110,8 +106,6 @@ static int pop_input_file(void);
 		}
 
 <INITIAL>[bodh]# {
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
 			if (*yytext == 'b')
 				yylval.cbase = 2;
 			else if (*yytext == 'o')
@@ -125,32 +119,24 @@ static int pop_input_file(void);
 		}
 
 <INITIAL>[0-9a-fA-F]+	{
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
 			yylval.literal = xstrdup(yytext);
 			DPRINT("Literal: '%s'\n", yylval.literal);
 			return DT_LEGACYLITERAL;
 		}
 
 <V1>[0-9]+|0[xX][0-9a-fA-F]+      {
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
 			yylval.literal = xstrdup(yytext);
 			DPRINT("Literal: '%s'\n", yylval.literal);
 			return DT_LITERAL;
 		}
 
 \&{LABEL}	{	/* label reference */
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
 			DPRINT("Ref: %s\n", yytext+1);
 			yylval.labelref = xstrdup(yytext+1);
 			return DT_REF;
 		}
 
 "&{/"{PATHCHAR}+\}	{	/* new-style path reference */
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
 			yytext[yyleng-1] = '\0';
 			DPRINT("Ref: %s\n", yytext+2);
 			yylval.labelref = xstrdup(yytext+2);
@@ -158,32 +144,24 @@ static int pop_input_file(void);
 		}
 
 <INITIAL>"&/"{PATHCHAR}+ {	/* old-style path reference */
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
 			DPRINT("Ref: %s\n", yytext+1);
 			yylval.labelref = xstrdup(yytext+1);
 			return DT_REF;
 		}
 
 <BYTESTRING>[0-9a-fA-F]{2} {
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
 			yylval.byte = strtol(yytext, NULL, 16);
 			DPRINT("Byte: %02x\n", (int)yylval.byte);
 			return DT_BYTE;
 		}
 
 <BYTESTRING>"]"	{
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
 			DPRINT("/BYTESTRING\n");
 			BEGIN_DEFAULT();
 			return ']';
 		}
 
 <PROPNODENAME>{PROPNODECHAR}+ {
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
 			DPRINT("PropNodeName: %s\n", yytext);
 			yylval.propnodename = xstrdup(yytext);
 			BEGIN_DEFAULT();
@@ -191,8 +169,6 @@ static int pop_input_file(void);
 		}
 
 "/incbin/"	{
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
 			DPRINT("Binary Include\n");
 			return DT_INCBIN;
 		}
@@ -202,8 +178,6 @@ static int pop_input_file(void);
 <*>{LINECOMMENT}+ /* eat C++-style comments */
 
 <*>.		{
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
 			DPRINT("Char: %c (\\x%02x)\n", yytext[0],
 				(unsigned)yytext[0]);
 			if (yytext[0] == '[') {

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
