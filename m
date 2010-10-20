From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 3/4] Allow nodes at the root to be specified by path as well
	as by label.
Date: Wed, 20 Oct 2010 14:45:13 -0700
Message-ID: <20101020214513.2985.76446.stgit@riker>
References: <20101020214419.2985.51068.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101020214419.2985.51068.stgit@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Changes to allow us to specify a node by it's path. A path can be used in
place of a label.

This is particularly useful when overriding existing nodes.
This way we don't have to label every possible node in a device tree we know
is a base device tree for a class of systems, and we know the tree will be
modified for the specific systems.

Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 dtc-lexer.l  |   26 ++++++++++++++++++++++----
 dtc-parser.y |   10 ++++------
 livetree.c   |   20 +++++++++++++++++++-
 3 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index 80a886a..216a3d2 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -115,13 +115,31 @@ static int pop_input_file(void);
 			return DT_LITERAL;
 		}
 
-<*>\&{LABEL}	{	/* label reference */
-			DPRINT("Ref: %s\n", yytext+1);
-			yylval.labelref = xstrdup(yytext+1);
+
+<*>\&{LABEL}    {       /* label reference without the braces*/
+                        DPRINT("Ref: %s\n", yytext+1);
+                        yylval.labelref = xstrdup(yytext+1);
+                        return DT_REF;
+		}
+
+<*>"&{"{LABEL}{PATHCHAR}*\} { /* label and/or path refererence with braces */
+			/*
+			 * Possibly this could be parsed by the parser rather
+			 * than as a lexical element.
+			 *
+			 * What is intended here is to support the following
+			 * type of references:
+			 * a) &{/path/to/the/node/reference}
+			 * b) &{label}
+			 * c) &{label/path/from/labeled/node/to/reference}
+			 */
+			yytext[yyleng-1] = '\0';
+			DPRINT("Ref: %s\n", yytext+2);
+			yylval.labelref = xstrdup(yytext+2);
 			return DT_REF;
 		}
 
-"&{/"{PATHCHAR}+\}	{	/* new-style path reference */
+<*>"&{/"{PATHCHAR}+\}	{	/* new-style path reference (with braces) */
 			yytext[yyleng-1] = '\0';
 			DPRINT("Ref: %s\n", yytext+2);
 			yylval.labelref = xstrdup(yytext+2);
diff --git a/dtc-parser.y b/dtc-parser.y
index 1ba0478..0a74c86 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -132,24 +132,22 @@ devicetree:
 		}
 	| devicetree DT_REF nodedef
 		{
-			struct node *target;
+			struct node *target = get_node_by_ref($1, $2);
 
-			target = get_node_by_label($1, $2);
 			if (target)
 				merge_nodes(target, $3);
 			else
-				print_error("label, '%s' not found", $2);
+				print_error("label or path, '%s', not found", $2);
 			$$ = $1;
 		}
 	| devicetree DT_REMOVENODE DT_REF ';'
 		{
-			struct node *target;
+			struct node *target = get_node_by_ref($1, $3);
 
-			target = get_node_by_label($1, $3);
 			if (target)
 				remove_child(target->parent, target);
 			else
-				print_error("label, '%s' not found", $3);
+				print_error("label or path, '%s', not found", $3);
 		}
 	;
 
diff --git a/livetree.c b/livetree.c
index 21a4c48..bf8796b 100644
--- a/livetree.c
+++ b/livetree.c
@@ -429,10 +429,28 @@ struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
 
 struct node *get_node_by_ref(struct node *tree, const char *ref)
 {
+	struct node *node;
+
 	if (ref[0] == '/')
 		return get_node_by_path(tree, ref);
-	else
+	else {
+		/*
+		 * Support finding a node reference that is rooted by
+		 * a label reference.
+		 *
+		 * References rooted by a label have a '/' in them.
+		 */
+		char *p = strchr(ref, '/');
+
+		if (p) {
+			*p = '\0';
+			node = get_node_by_label(tree, ref);
+			*p = '/';
+			return get_node_by_path(node, p+1);
+		}
+
 		return get_node_by_label(tree, ref);
+	}
 }
 
 cell_t get_node_phandle(struct node *root, struct node *node)
