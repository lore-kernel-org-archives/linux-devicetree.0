From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 09/10] Correct locations in parser error messaes
Date: Sat,  4 Jan 2014 00:24:42 +1100
Message-ID: <1388755483-27008-10-git-send-email-david@gibson.dropbear.id.au>
References: <1388755483-27008-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388755483-27008-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The print_error() function used in several places in the parser uses the
location information in yylloc to describe the location of the error.
This is not correct in most cases.  yylloc gives the location of the
lookahead token, whereas the error is generally associated with one of
the already parsed non-terminals.

This patch corrects this, adding a location parameter to print_error() and
supplying it with the appropriate bison @N symbols.

This probably breaks yacc compatiblity, but too bad - accurate error
messages are more important.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 dtc-parser.y | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index bed857e..7ee436f 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -17,17 +17,14 @@
  *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
  *                                                                   USA
  */
-
 %{
 #include <stdio.h>
 
 #include "dtc.h"
 #include "srcpos.h"
 
-YYLTYPE yylloc;
-
 extern int yylex(void);
-extern void print_error(char const *fmt, ...);
+extern void print_error(YYLTYPE *loc, char const *fmt, ...);
 extern void yyerror(char const *s);
 
 extern struct boot_info *the_boot_info;
@@ -148,7 +145,7 @@ devicetree:
 			if (target)
 				merge_nodes(target, $3);
 			else
-				print_error("label or path, '%s', not found", $2);
+				print_error(&@2, "label or path, '%s', not found", $2);
 			$$ = $1;
 		}
 	| devicetree DT_DEL_NODE DT_REF ';'
@@ -156,7 +153,7 @@ devicetree:
 			struct node *target = get_node_by_ref($1, $3);
 
 			if (!target)
-				print_error("label or path, '%s', not found", $3);
+				print_error(&@3, "label or path, '%s', not found", $3);
 			else
 				delete_node(target);
 
@@ -276,7 +273,7 @@ arrayprefix:
 			if ((bits !=  8) && (bits != 16) &&
 			    (bits != 32) && (bits != 64))
 			{
-				print_error("Only 8, 16, 32 and 64-bit elements"
+				print_error(&@2, "Only 8, 16, 32 and 64-bit elements"
 					    " are currently supported");
 				bits = 32;
 			}
@@ -302,7 +299,7 @@ arrayprefix:
 				 * mask), all bits are one.
 				 */
 				if (($2 > mask) && (($2 | mask) != -1ULL))
-					print_error(
+					print_error(&@2,
 						"integer value out of range "
 						"%016lx (%d bits)", $1.bits);
 			}
@@ -318,7 +315,7 @@ arrayprefix:
 							  REF_PHANDLE,
 							  $2);
 			else
-				print_error("References are only allowed in "
+				print_error(&@2, "References are only allowed in "
 					    "arrays with 32-bit elements.");
 
 			$$.data = data_append_integer($1.data, val, $1.bits);
@@ -438,7 +435,7 @@ subnodes:
 		}
 	| subnode propdef
 		{
-			print_error("syntax error: properties must precede subnodes");
+			print_error(&@2, "syntax error: properties must precede subnodes");
 			YYERROR;
 		}
 	;
@@ -461,17 +458,18 @@ subnode:
 
 %%
 
-void print_error(char const *fmt, ...)
+void print_error(YYLTYPE *loc, char const *fmt, ...)
 {
 	va_list va;
 
 	va_start(va, fmt);
-	srcpos_verror(&yylloc, "Error", fmt, va);
+	srcpos_verror(loc, "Error", fmt, va);
 	va_end(va);
 
 	treesource_error = true;
 }
 
-void yyerror(char const *s) {
-	print_error("%s", s);
+void yyerror(char const *s)
+{
+	print_error(&yylloc, "%s", s);
 }
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
