From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 09/10] Re-implement "," in property definitions as a bytestring operator
Date: Thu, 27 Feb 2014 22:21:38 +1100
Message-ID: <1393500099-28544-10-git-send-email-david@gibson.dropbear.id.au>
References: <1393500099-28544-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393500099-28544-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We've already introduced an internal "join" operator which appends
bytestring expressions together.  This uses it to implement the "," syntax
in property values as expressions.

This is the last piece of property value syntax to be converted to use
the expression infrastructure, so all (non-empty) property values can now
be implemented as a single expression.  For now we still just immediately
evaluate the expression though.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 dtc-parser.y | 37 ++++++++++++++-----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 7e1251d..61cdf66 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -76,8 +76,6 @@ static struct data expr_bytestring(struct expression *expr);
 %token <labelref> DT_REF
 %token DT_INCBIN
 
-%type <data> propdata
-%type <data> propdataprefix
 %type <re> memreserve
 %type <re> memreserves
 %type <array> array
@@ -107,6 +105,7 @@ static struct data expr_bytestring(struct expression *expr);
 %type <expr> expr_or
 %type <expr> expr_conditional
 %type <expr> expr_postlabel
+%type <expr> expr_join
 %type <expr> expr
 
 %%
@@ -194,9 +193,11 @@ proplist:
 	;
 
 propdef:
-	  DT_PROPNODENAME '=' propdata ';'
+	  DT_PROPNODENAME '=' expr ';'
 		{
-			$$ = build_property($1, $3);
+			struct data d = expr_bytestring($3);
+
+			$$ = build_property($1, d);
 		}
 	| DT_PROPNODENAME ';'
 		{
@@ -213,25 +214,6 @@ propdef:
 		}
 	;
 
-propdata:
-	  propdataprefix expr
-		{
-			struct data d = expr_bytestring($2);
-			$$ = data_merge($1, d);
-		}
-	;
-
-propdataprefix:
-	  /* empty */
-		{
-			$$ = empty_data;
-		}
-	| propdata ','
-		{
-			$$ = $1;
-		}
-	;
-
 array:
 	  arrayprefix '>'	{ $$ = $1; }
 	;
@@ -328,7 +310,15 @@ expr_prim:
 	;
 
 expr:
+	  expr_join
+	;
+
+expr_join:
 	  expr_postlabel
+	| expr_join ',' expr_postlabel
+		{
+			$$ = expression_join(&@$, $1, $3);
+		}
 	;
 
 expr_postlabel:
@@ -343,6 +333,7 @@ expr_postlabel:
 		}
 	;
 
+
 expr_conditional:
 	  expr_or
 	| DT_REF
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
