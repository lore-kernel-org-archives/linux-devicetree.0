From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] Add merging of labelled subnodes. This patch allows the
	following
Date: Fri, 26 Feb 2010 12:07:28 -0700
Message-ID: <20100226190651.5143.12956.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
List-Id: devicetree@vger.kernel.org

syntax:

/ {
	child {
		label: subchild {
		};
	};
};

&label {
	prop = "value";
};

which will result in the following tree:
/ {
	child {
		label: subchild {
			prop = "value";
		};
	};
};

---

Hi Jon and David

This patch isn't quite finished yet, but I'm getting it out there for
feedback.  In particular, I'm don't know how best to handle errors in
livetree.c.  The way I'm currently handling it is calling yyerror()
from livetree.c, which results in a compile warning.

I also don't yet have a test case for referencing a label that doesn't
exist in the main tree.

I could use some help on how I should be implementing the error
handling.

Thanks,
g.
---

 dtc-lexer.l                         |    2 +-
 dtc-parser.y                        |   13 +++++++++++
 dtc.h                               |    1 +
 livetree.c                          |   30 ++++++++++++++++++++++++++
 tests/run_tests.sh                  |    2 ++
 tests/test_tree1.dts                |    2 +-
 tests/test_tree1_merge.dts          |    4 +--
 tests/test_tree1_merge_labelled.dts |   41 +++++++++++++++++++++++++++++++++++
 8 files changed, 90 insertions(+), 5 deletions(-)
 create mode 100644 tests/test_tree1_merge_labelled.dts

diff --git a/dtc-lexer.l b/dtc-lexer.l
index 3c3434c..5a7e476 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -109,7 +109,7 @@ static int pop_input_file(void);
 			return DT_LITERAL;
 		}
 
-\&{LABEL}	{	/* label reference */
+<*>\&{LABEL}	{	/* label reference */
 			DPRINT("Ref: %s\n", yytext+1);
 			yylval.labelref = xstrdup(yytext+1);
 			return DT_REF;
diff --git a/dtc-parser.y b/dtc-parser.y
index dea19c1..be86e5b 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -76,6 +76,7 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
 
 %type <node> devicetree
 %type <node> devicetrees
+%type <node> labelledtree
 %type <node> nodedef
 %type <node> subnode
 %type <nodelist> subnodes
@@ -129,6 +130,10 @@ devicetrees:
 		{
 			$$ = merge_nodes($1, $2);
 		}
+	| devicetrees labelledtree
+		{
+			$$ = merge_labelled_node($1, $2);
+		}
 	;
 
 devicetree:
@@ -138,6 +143,14 @@ devicetree:
 		}
 	;
 
+labelledtree:
+	  DT_REF nodedef
+		{
+			add_label(&$2->labels, $1);
+			$$ = $2;
+		}
+	;
+
 nodedef:
 	  '{' proplist subnodes '}' ';'
 		{
diff --git a/dtc.h b/dtc.h
index b36ac5d..af5e28c 100644
--- a/dtc.h
+++ b/dtc.h
@@ -175,6 +175,7 @@ struct node *build_node(struct property *proplist, struct node *children);
 struct node *name_node(struct node *node, char *name);
 struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
+struct node *merge_labelled_node(struct node *tree, struct node *labelled_node);
 
 void add_property(struct node *node, struct property *prop);
 void add_child(struct node *parent, struct node *child);
diff --git a/livetree.c b/livetree.c
index 13c5f10..0c8a24d 100644
--- a/livetree.c
+++ b/livetree.c
@@ -167,6 +167,36 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 	return old_node;
 }
 
+struct node *merge_labelled_node(struct node *tree, struct node *labelled_node)
+{
+	struct node *child, *rn;
+	struct label *tree_label, *child_label;
+
+	/* First, check if this node matches */
+	for_each_label(tree->labels, tree_label) {
+		for_each_label(labelled_node->labels, child_label) {
+			if (streq(tree_label->label, child_label->label))
+				return merge_nodes(tree, labelled_node);
+		}
+	}
+
+	/* Otherwise, recursivelly search the children for something matching */
+	for_each_child(tree, child) {
+		rn = merge_labelled_node(child, labelled_node);
+		if (rn)
+			return tree;
+	}
+
+	/* Nothing matched.  If this is the root node, then this is an error */
+	if (!tree->parent) {
+		yyerror("parse error: undefined label in node redefinition");
+		return tree;
+	}
+
+	/* return NULL so that recursive call knows nothing matched */
+	return NULL;
+}
+
 struct node *chain_node(struct node *first, struct node *list)
 {
 	assert(first->next_sibling == NULL);
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 43b9d44..80a1e3c 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -300,6 +300,8 @@ dtc_tests () {
     # Check merge/overlay functionality
     run_dtc_test -I dts -O dtb -o dtc_tree1_merge.test.dtb test_tree1_merge.dts
     tree1_tests dtc_tree1_merge.test.dtb test_tree1.dtb
+    run_dtc_test -I dts -O dtb -o dtc_tree1_merge_labelled.test.dtb test_tree1_merge_labelled.dts
+    tree1_tests dtc_tree1_merge_labelled.test.dtb test_tree1.dtb
     run_dtc_test -I dts -O dtb -o multilabel_merge.test.dtb multilabel_merge.dts
     run_test references multilabel.test.dtb
     run_test dtbs_equal_ordered multilabel.test.dtb multilabel_merge.test.dtb
diff --git a/tests/test_tree1.dts b/tests/test_tree1.dts
index 218c382..4f0ce45 100644
--- a/tests/test_tree1.dts
+++ b/tests/test_tree1.dts
@@ -25,7 +25,7 @@
 		linux,phandle = <0x2000>;
 		prop-int = <123456789>;
 
-		subsubnode@0 {
+		ssn0: subsubnode@0 {
 			phandle = <0x2001>;
 			compatible = "subsubnode2", "subsubnode";
 			prop-int = <0726746425>;
diff --git a/tests/test_tree1_merge.dts b/tests/test_tree1_merge.dts
index f580da8..fc191fd 100644
--- a/tests/test_tree1_merge.dts
+++ b/tests/test_tree1_merge.dts
@@ -34,12 +34,10 @@
 		prop-int = [deadbeef];
 	};
 	subnode@2 {
-		subsubnode@0 {
+		ssn0: subsubnode@0 {
 			phandle = <0x2001>;
 			compatible = "subsubnode2", "subsubnode";
 			prop-int = <0726746425>;
 		};
 	};
 };
-
-
diff --git a/tests/test_tree1_merge_labelled.dts b/tests/test_tree1_merge_labelled.dts
new file mode 100644
index 0000000..46a6840
--- /dev/null
+++ b/tests/test_tree1_merge_labelled.dts
@@ -0,0 +1,41 @@
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+/memreserve/ 123456789 010000;
+
+/ {
+	compatible = "test_tree1";
+	prop-int = <0xdeadbeef>;
+	prop-str = "hello world";
+
+	subnode@1 {
+		compatible = "subnode1";
+		prop-int = [deadbeef];
+
+		subsubnode {
+			compatible = "subsubnode1", "subsubnode";
+			prop-int = <0xdeadbeef>;
+		};
+
+		ss1 {
+		};
+	};
+
+	subnode@2 {
+		linux,phandle = <0x2000>;
+		prop-int = <123456789>;
+
+		ssn0: subsubnode@0 {
+			phandle = <0x2001>;
+			prop-int = <0xbad>;
+		};
+
+		ss2 {
+		};
+	};
+};
+
+&ssn0 {
+	compatible = "subsubnode2", "subsubnode";
+	prop-int = <0726746425>;
+};
