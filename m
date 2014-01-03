From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 10/10] Clean up parser error messages
Date: Sat,  4 Jan 2014 00:24:43 +1100
Message-ID: <1388755483-27008-11-git-send-email-david@gibson.dropbear.id.au>
References: <1388755483-27008-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388755483-27008-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Generally edit parser error messages for brevity and clarity.  Replace
the print_error() function with a a new macro for brevity and clarity in
the source.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 dtc-parser.y | 44 ++++++++++++++++++--------------------------
 1 file changed, 18 insertions(+), 26 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 7ee436f..42c4d75 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -24,8 +24,12 @@
 #include "srcpos.h"
 
 extern int yylex(void);
-extern void print_error(YYLTYPE *loc, char const *fmt, ...);
 extern void yyerror(char const *s);
+#define ERROR(loc, ...) \
+	do { \
+		srcpos_error((loc), "Error", __VA_ARGS__); \
+		treesource_error = true; \
+	} while (0)
 
 extern struct boot_info *the_boot_info;
 extern bool treesource_error;
@@ -145,17 +149,18 @@ devicetree:
 			if (target)
 				merge_nodes(target, $3);
 			else
-				print_error(&@2, "label or path, '%s', not found", $2);
+				ERROR(&@2, "Label or path %s not found", $2);
 			$$ = $1;
 		}
 	| devicetree DT_DEL_NODE DT_REF ';'
 		{
 			struct node *target = get_node_by_ref($1, $3);
 
-			if (!target)
-				print_error(&@3, "label or path, '%s', not found", $3);
-			else
+			if (target)
 				delete_node(target);
+			else
+				ERROR(&@3, "Label or path %s not found", $3);
+
 
 			$$ = $1;
 		}
@@ -271,10 +276,9 @@ arrayprefix:
 			bits = $2;
 
 			if ((bits !=  8) && (bits != 16) &&
-			    (bits != 32) && (bits != 64))
-			{
-				print_error(&@2, "Only 8, 16, 32 and 64-bit elements"
-					    " are currently supported");
+			    (bits != 32) && (bits != 64)) {
+				ERROR(&@2, "Array elements must be"
+				      " 8, 16, 32 or 64-bits");
 				bits = 32;
 			}
 
@@ -299,9 +303,8 @@ arrayprefix:
 				 * mask), all bits are one.
 				 */
 				if (($2 > mask) && (($2 | mask) != -1ULL))
-					print_error(&@2,
-						"integer value out of range "
-						"%016lx (%d bits)", $1.bits);
+					ERROR(&@2, "Value out of range for"
+					      " %d-bit array element", $1.bits);
 			}
 
 			$$.data = data_append_integer($1.data, $2, $1.bits);
@@ -315,7 +318,7 @@ arrayprefix:
 							  REF_PHANDLE,
 							  $2);
 			else
-				print_error(&@2, "References are only allowed in "
+				ERROR(&@2, "References are only allowed in "
 					    "arrays with 32-bit elements.");
 
 			$$.data = data_append_integer($1.data, val, $1.bits);
@@ -435,7 +438,7 @@ subnodes:
 		}
 	| subnode propdef
 		{
-			print_error(&@2, "syntax error: properties must precede subnodes");
+			ERROR(&@2, "Properties must precede subnodes");
 			YYERROR;
 		}
 	;
@@ -458,18 +461,7 @@ subnode:
 
 %%
 
-void print_error(YYLTYPE *loc, char const *fmt, ...)
-{
-	va_list va;
-
-	va_start(va, fmt);
-	srcpos_verror(loc, "Error", fmt, va);
-	va_end(va);
-
-	treesource_error = true;
-}
-
 void yyerror(char const *s)
 {
-	print_error(&yylloc, "%s", s);
+	ERROR(&yylloc, "%s", s);
 }
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
