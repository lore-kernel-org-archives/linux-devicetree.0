From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 3/4] Implements a new feature for deleting existing properties
	in device tree nodes.
Date: Tue, 02 Nov 2010 15:55:21 -0700
Message-ID: <20101102225521.1707.50854.stgit@riker>
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

When updating existing nodes in a device tree merge operation, properties
can be removed by using
	/remove-prop/ <property>;

If a property has been removed, it is treated the same as if it had not been
declared.

Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 dtc-lexer.l             |    6 ++++++
 dtc-parser.y            |    6 ++++++
 dtc.h                   |    3 +++
 flattree.c              |    3 +++
 livetree.c              |   31 ++++++++++++++++++++++++++-----
 tests/dtc-checkfails.sh |    2 +-
 tests/run_tests.sh      |    2 ++
 7 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/dtc-lexer.l b/dtc-lexer.l
index bcabbfe..4b07236 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -102,6 +102,12 @@ static int pop_input_file(void);
 			return DT_REMOVENODE;
 		}
 
+<*>"/remove-prop/"	{
+			DPRINT("Keyword: /undef-prop/\n");
+			BEGIN(PROPNODENAME);
+			return DT_REMOVEPROP;
+		}
+
 <*>{LABEL}:	{
 			DPRINT("Label: %s\n", yytext);
 			yylval.labelref = xstrdup(yytext);
diff --git a/dtc-parser.y b/dtc-parser.y
index 4814d34..2a9736a 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -58,6 +58,7 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
 %token DT_V1
 %token DT_MEMRESERVE
 %token DT_REMOVENODE
+%token <propnodename> DT_REMOVEPROP
 %token <propnodename> DT_PROPNODENAME
 %token <literal> DT_LITERAL
 %token <cbase> DT_BASE
@@ -181,6 +182,11 @@ propdef:
 		{
 			$$ = build_property($1, empty_data);
 		}
+	| DT_REMOVEPROP propdef
+		{
+			$2->undefined = 1;
+			$$ = $2;
+		}
 	| DT_LABEL propdef
 		{
 			strtbl_insert(&label_table, $1, srcpos_copy(&yylloc));
diff --git a/dtc.h b/dtc.h
index 95e3bd1..764b3a9 100644
--- a/dtc.h
+++ b/dtc.h
@@ -132,6 +132,8 @@ struct label {
 };
 
 struct property {
+	int undefined;  /* when this feild is set to 1, the property is to be
+	                   treated as undefined */
 	char *name;
 	struct data val;
 
@@ -178,6 +180,7 @@ struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
 
 void add_property(struct node *node, struct property *prop);
+void remove_property(struct node *node, struct property *prop);
 void add_child(struct node *parent, struct node *child);
 void remove_child(struct node *parent, struct node *child);
 
diff --git a/flattree.c b/flattree.c
index ead0332..00439e9 100644
--- a/flattree.c
+++ b/flattree.c
@@ -275,6 +275,9 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 	for_each_property(tree, prop) {
 		int nameoff;
 
+		if (prop->undefined)
+			continue;
+
 		if (streq(prop->name, "name"))
 			seen_name_prop = 1;
 
diff --git a/livetree.c b/livetree.c
index 88de3c3..f1b235c 100644
--- a/livetree.c
+++ b/livetree.c
@@ -123,11 +123,15 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 		/* Look for a collision, set new value if there is */
 		for_each_property(old_node, old_prop) {
 			if (streq(old_prop->name, new_prop->name)) {
-				/* Add new labels to old property */
-				for_each_label(new_prop->labels, l)
-					add_label(&old_prop->labels, l->label);
-
-				old_prop->val = new_prop->val;
+				if (new_prop->undefined) {
+					remove_property(old_node, old_prop);
+				} else {
+					/* Add new labels to old property */
+					for_each_label(new_prop->labels, l)
+						add_label(&old_prop->labels, l->label);
+
+					old_prop->val = new_prop->val;
+				}
 				free(new_prop);
 				new_prop = NULL;
 				break;
@@ -190,6 +194,23 @@ void add_property(struct node *node, struct property *prop)
 	*p = prop;
 }
 
+void remove_property(struct node *node, struct property *prop)
+{
+	struct property **p;
+
+	p = &node->proplist;
+	while (*p) {
+		if (*p == prop) {
+			*p = (*p)->next;
+			return;
+		}
+		p = &((*p)->next);
+	}
+	/* property not in the node? it's probably an error, so flag it. */
+	assert(0);
+}
+
+
 void add_child(struct node *parent, struct node *child)
 {
 	struct node **p;
diff --git a/tests/dtc-checkfails.sh b/tests/dtc-checkfails.sh
index c58694f..a13eb28 100755
--- a/tests/dtc-checkfails.sh
+++ b/tests/dtc-checkfails.sh
@@ -23,7 +23,7 @@ if [ "$ret" -gt 127 ]; then
 fi
 
 for c in $CHECKS; do
-    if ! grep -E "^(ERROR)|(Warning) \($c\):" $LOG > /dev/null; then
+    if ! grep -E "^(ERROR)|(Error)|(Warning) \($c\):" $LOG > /dev/null; then
 	FAIL "Failed to trigger check \"$c\""
     fi
 done
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 495e759..912a19b 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -309,6 +309,8 @@ dtc_tests () {
     tree1_tests dtc_tree1_merge_path.test.dtb test_tree1.dtb
     run_dtc_test -I dts -O dtb -o dtc_tree1_merge_remove.test.dtb test_tree1_merge_remove.dts
     tree1_tests dtc_tree1_merge_remove.test.dtb test_tree1.dtb
+    run_dtc_test -I dts -O dtb -o dtc_tree1_merge_remove_prop.test.dtb test_tree1_merge_remove_prop.dts
+    tree1_tests dtc_tree1_merge_remove_prop.test.dtb test_tree1.dtb
 
     # Check some checks
     check_tests dup-nodename.dts duplicate_node_names
