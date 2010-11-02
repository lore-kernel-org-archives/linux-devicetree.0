From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 4/4] Allow nodes at the root to be specified by path as well
	as by label.
Date: Tue, 02 Nov 2010 15:55:30 -0700
Message-ID: <20101102225530.1707.29792.stgit@riker>
References: <20101102225243.1707.23433.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101102225243.1707.23433.stgit@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
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

 dtc-lexer.l  |   24 +++++++++++++++++++++++
 dtc-parser.y |   60 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 dtc.h        |    2 ++
 livetree.c   |   48 +++++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 133 insertions(+), 1 deletions(-)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index 4b07236..087a51f 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -127,6 +127,23 @@ static int pop_input_file(void);
 			return DT_REF;
 		}
 
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
+			return DT_REF;
+		}
+
 <*>"&{/"{PATHCHAR}+\}	{	/* new-style path reference */
 			yytext[yyleng-1] = '\0';
 			DPRINT("Ref: %s\n", yytext+2);
@@ -146,6 +163,13 @@ static int pop_input_file(void);
 			return ']';
 		}
 
+<PROPNODENAME>"aliases" {
+			DPRINT("Aliases: %s\n", yytext);
+			yylval.propnodename = xstrdup(yytext);
+			BEGIN_DEFAULT();
+			return DT_ALIASES;
+		}
+
 <PROPNODENAME>{PROPNODECHAR}+ {
 			DPRINT("PropNodeName: %s\n", yytext);
 			yylval.propnodename = xstrdup(yytext);
diff --git a/dtc-parser.y b/dtc-parser.y
index 2a9736a..8718f07 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -60,6 +60,7 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
 %token DT_REMOVENODE
 %token <propnodename> DT_REMOVEPROP
 %token <propnodename> DT_PROPNODENAME
+%token <propnodename> DT_ALIASES
 %token <literal> DT_LITERAL
 %token <cbase> DT_BASE
 %token <byte> DT_BYTE
@@ -77,10 +78,13 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
 %type <cell> cellval
 %type <data> bytestring
 %type <prop> propdef
+%type <prop> aliasespropdef
 %type <proplist> proplist
+%type <proplist> aliasesproplist
 
 %type <node> devicetree
 %type <node> nodedef
+%type <node> aliasesnodedef
 %type <node> subnode
 %type <nodelist> subnodes
 
@@ -128,11 +132,33 @@ addr:
 devicetree:
 	  '/' nodedef
 		{
+			/*
+			 * We need to wait until the whole tree is parsed so we
+			 * can assign aliases as labels on forward reference
+			 * nodes.
+			 */
+			struct node *aliases_node = get_node_by_ref($2, "/aliases");
+
+			if (aliases_node) {
+				make_aliases_labels($2, aliases_node);
+			}
+
 			$$ = name_node($2, "");
 		}
 	| devicetree '/' nodedef
 		{
 			$$ = merge_nodes($1, $3);
+
+			/*
+			 * We need to wait until the whole tree is parsed so we
+			 * can assign aliases as labels on forward reference
+			 * nodes.
+			 */
+			struct node *aliases_node = get_node_by_ref($$, "/aliases");
+
+			if (aliases_node) {
+				make_aliases_labels($$, aliases_node);
+			}
 		}
 	| devicetree DT_REF nodedef
 		{
@@ -162,6 +188,13 @@ nodedef:
 		}
 	;
 
+aliasesnodedef:
+	  '{' aliasesproplist '}' ';'
+		{
+			$$ = build_node($2, NULL);
+		}
+	;
+
 proplist:
 	  /* empty */
 		{
@@ -173,6 +206,17 @@ proplist:
 		}
 	;
 
+aliasesproplist:
+	  /* empty */
+		{
+			$$ = NULL;
+		}
+	| aliasesproplist aliasespropdef
+		{
+			$$ = chain_property($2, $1);
+		}
+	;
+
 propdef:
 	  DT_PROPNODENAME '=' propdata ';'
 		{
@@ -195,6 +239,18 @@ propdef:
 		}
 	;
 
+aliasespropdef:
+	  DT_PROPNODENAME '=' DT_REF ';'
+		{
+			struct data d = empty_data;
+
+			d = data_add_marker(d, REF_PATH, $3);
+			$$ = build_property($1, d);
+
+			strtbl_insert(&label_table, $1, srcpos_copy(&yylloc));
+		}
+	;
+
 propdata:
 	  propdataprefix DT_STRING
 		{
@@ -323,6 +379,10 @@ subnode:
 		{
 			$$ = name_node($2, $1);
 		}
+	| DT_ALIASES aliasesnodedef
+		{
+			$$ = name_node($2, "aliases");
+		}
 	| DT_LABEL subnode
 		{
 			strtbl_insert(&label_table, $1, srcpos_copy(&yylloc));
diff --git a/dtc.h b/dtc.h
index 764b3a9..1c3632c 100644
--- a/dtc.h
+++ b/dtc.h
@@ -179,6 +179,8 @@ struct node *name_node(struct node *node, char *name);
 struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
 
+void make_aliases_labels(struct node *root, struct node *aliases);
+
 void add_property(struct node *node, struct property *prop);
 void remove_property(struct node *node, struct property *prop);
 void add_child(struct node *parent, struct node *child);
diff --git a/livetree.c b/livetree.c
index f1b235c..357d762 100644
--- a/livetree.c
+++ b/livetree.c
@@ -473,8 +473,54 @@ struct node *get_node_by_ref(struct node *tree, const char *ref)
 {
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
+		char *ref_cpy = xstrdup(ref);
+		char *p = strchr(ref_cpy, '/');
+		struct node *node;
+
+		if (p) {
+			*p = '\0';
+			node = get_node_by_label(tree, ref_cpy);
+			*p = '/';
+			node = get_node_by_path(node, p+1);
+
+			free(ref_cpy);
+
+			return node;
+		}
+
 		return get_node_by_label(tree, ref);
+	}
+}
+
+void make_aliases_labels(struct node *root, struct node *aliases) {
+	struct property *prop;
+	
+	for_each_property(aliases, prop) {
+		struct marker *m = prop->val.markers;
+		struct node *refnode;
+
+		for_each_marker_of_type(m, REF_PATH) {
+			refnode = get_node_by_ref(root, m->ref);
+			if (refnode)
+				/*
+				 * Right here we might be insertting labels
+				 * with illegal characters, but we won't be
+				 * able to reference them in the dts file
+				 * (sytnax error).
+				 *
+				 * We could possibly check for this and spit
+				 * out a warning.
+				 */
+				add_label(&refnode->labels, prop->name);
+		}
+	}
 }
 
 cell_t get_node_phandle(struct node *root, struct node *node)
