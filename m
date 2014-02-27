From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 07/10] Implement labels within property values as bytestring expressions
Date: Thu, 27 Feb 2014 22:21:36 +1100
Message-ID: <1393500099-28544-8-git-send-email-david@gibson.dropbear.id.au>
References: <1393500099-28544-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393500099-28544-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This re-implements labels within property values as a form of bytestring
expression.  The grammar gets a little hairy to handle the fact that
labels are allowed both at the beginning and end of property values without
introducing parser conflicts.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 dtc-parser.y | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index fcc3b4d..bff22d9 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -93,6 +93,7 @@ static struct data expr_bytestring(struct expression *expr);
 
 %type <expr> expr_incbin
 %type <expr> expr_prim
+%type <expr> expr_prelabel
 %type <expr> expr_unary
 %type <expr> expr_mul
 %type <expr> expr_add
@@ -105,6 +106,7 @@ static struct data expr_bytestring(struct expression *expr);
 %type <expr> expr_and
 %type <expr> expr_or
 %type <expr> expr_conditional
+%type <expr> expr_postlabel
 %type <expr> expr
 
 %%
@@ -221,10 +223,6 @@ propdata:
 		{
 			$$ = data_add_marker($1, REF_PATH, $2);
 		}
-	| propdata DT_LABEL
-		{
-			$$ = data_add_marker($1, LABEL, $2);
-		}
 	;
 
 propdataprefix:
@@ -236,10 +234,6 @@ propdataprefix:
 		{
 			$$ = $1;
 		}
-	| propdataprefix DT_LABEL
-		{
-			$$ = data_add_marker($1, LABEL, $2);
-		}
 	;
 
 array:
@@ -338,7 +332,19 @@ expr_prim:
 	;
 
 expr:
-	expr_conditional
+	  expr_postlabel
+	;
+
+expr_postlabel:
+	  expr_conditional
+	| expr_conditional DT_LABEL
+		{
+			struct data d = data_add_marker(empty_data, LABEL, $2);
+			struct expression *label;
+
+			label = expression_bytestring_constant(&@2, d);
+			$$ = expression_join(&@$, $1, label);
+		}
 	;
 
 expr_conditional:
@@ -408,12 +414,24 @@ expr_mul:
 	;
 
 expr_unary:
-	  expr_prim
+	  expr_prelabel
 	| '-' expr_unary { $$ = UNOP(@$, negate, $2); }
 	| '~' expr_unary { $$ = UNOP(@$, bit_not, $2); }
 	| '!' expr_unary { $$ = UNOP(@$, logic_not, $2); }
 	;
 
+expr_prelabel:
+	  expr_prim
+	| DT_LABEL expr_prelabel
+		{
+			struct data d = data_add_marker(empty_data, LABEL, $1);
+			struct expression *label;
+
+			label = expression_bytestring_constant(&@1, d);
+			$$ = expression_join(&@$, label, $2);
+		}
+	;
+
 bytestring_literal:
 	  /* empty */
 		{
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
