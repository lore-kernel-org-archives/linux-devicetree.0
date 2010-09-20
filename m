From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] Add merging of labelled subnodes. This patch allows the
	following
Date: Mon, 20 Sep 2010 16:33:34 -0600
Message-ID: <20100920223334.32480.44239.stgit@angua>
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
To: jdl-CYoMK+44s/E@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

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

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 dtc-lexer.l                         |    2 +-
 dtc-parser.y                        |   28 ++++++++++++++----------
 tests/nonexist-node-ref2.dts        |   10 +++++++++
 tests/run_tests.sh                  |    3 +++
 tests/test_tree1.dts                |    2 +-
 tests/test_tree1_merge.dts          |    4 +--
 tests/test_tree1_merge_labelled.dts |   41 +++++++++++++++++++++++++++++++++++
 7 files changed, 73 insertions(+), 17 deletions(-)
 create mode 100644 tests/nonexist-node-ref2.dts
 create mode 100644 tests/test_tree1_merge_labelled.dts

diff --git a/dtc-lexer.l b/dtc-lexer.l
index f8953f4..081e13a 100644
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
index dea19c1..0aaf8e8 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -75,7 +75,6 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
 %type <proplist> proplist
 
 %type <node> devicetree
-%type <node> devicetrees
 %type <node> nodedef
 %type <node> subnode
 %type <nodelist> subnodes
@@ -83,7 +82,7 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
 %%
 
 sourcefile:
-	  DT_V1 ';' memreserves devicetrees
+	  DT_V1 ';' memreserves devicetree
 		{
 			the_boot_info = build_boot_info($3, $4,
 							guess_boot_cpuid($4));
@@ -120,21 +119,26 @@ addr:
 		}
 	  ;
 
-devicetrees:
-	  devicetree
+devicetree:
+	  '/' nodedef
 		{
-			$$ = $1;
+			$$ = name_node($2, "");
 		}
-	| devicetrees devicetree
+	| devicetree '/' nodedef
 		{
-			$$ = merge_nodes($1, $2);
+			$$ = merge_nodes($1, $3);
 		}
-	;
-
-devicetree:
-	  '/' nodedef
+	| devicetree DT_REF nodedef
 		{
-			$$ = name_node($2, "");
+			struct node *target;
+
+			target = get_node_by_label($1, $2);
+			if (target)
+				merge_nodes(target, $3);
+			else
+				yyerror("label does not exist in "
+					" node redefinition");
+			$$ = $1;
 		}
 	;
 
diff --git a/tests/nonexist-node-ref2.dts b/tests/nonexist-node-ref2.dts
new file mode 100644
index 0000000..44b4ebe
--- /dev/null
+++ b/tests/nonexist-node-ref2.dts
@@ -0,0 +1,10 @@
+/dts-v1/;
+
+/ {
+	label: node {
+	};
+};
+
+/* Try to redefine a node using a non-existent label */
+&nosuchnode {
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 4cec62c..7437add 100755
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
@@ -312,6 +314,7 @@ dtc_tests () {
     check_tests minusone-phandle.dts explicit_phandles
     run_sh_test dtc-checkfails.sh phandle_references -- -I dts -O dtb nonexist-node-ref.dts
     run_sh_test dtc-checkfails.sh phandle_references -- -I dts -O dtb nonexist-label-ref.dts
+    run_sh_test dtc-fatal.sh -I dts -O dtb nonexist-node-ref2.dts
     check_tests bad-name-property.dts name_properties
 
     check_tests bad-ncells.dts address_cells_is_cell size_cells_is_cell interrupt_cells_is_cell
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
