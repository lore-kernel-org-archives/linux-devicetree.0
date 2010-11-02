From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 1/4] Allow nodes to be refrenced by path at the top level.
Date: Tue, 02 Nov 2010 15:55:04 -0700
Message-ID: <20101102225504.1707.88754.stgit@riker>
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

When nodes are modified by merging device trees, nodes to be updated/merged can
be specified by a label. Specifying nodes by full path (instead of label)
doesn't quite work. This patch fixes that.

Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 dtc-lexer.l                     |    2 +-
 dtc-parser.y                    |    5 ++---
 tests/run_tests.sh              |    2 ++
 tests/test_tree1_merge_path.dts |   41 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 46 insertions(+), 4 deletions(-)
 create mode 100644 tests/test_tree1_merge_path.dts

diff --git a/dtc-lexer.l b/dtc-lexer.l
index 081e13a..e866ea5 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -115,7 +115,7 @@ static int pop_input_file(void);
 			return DT_REF;
 		}
 
-"&{/"{PATHCHAR}+\}	{	/* new-style path reference */
+<*>"&{/"{PATHCHAR}+\}	{	/* new-style path reference */
 			yytext[yyleng-1] = '\0';
 			DPRINT("Ref: %s\n", yytext+2);
 			yylval.labelref = xstrdup(yytext+2);
diff --git a/dtc-parser.y b/dtc-parser.y
index b58ba8e..5e84a67 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -131,13 +131,12 @@ devicetree:
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
 	;
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 77ce80d..a887254 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -305,6 +305,8 @@ dtc_tests () {
     run_dtc_test -I dts -O dtb -o multilabel_merge.test.dtb multilabel_merge.dts
     run_test references multilabel.test.dtb
     run_test dtbs_equal_ordered multilabel.test.dtb multilabel_merge.test.dtb
+    run_dtc_test -I dts -O dtb -o dtc_tree1_merge_path.test.dtb test_tree1_merge_path.dts
+    tree1_tests dtc_tree1_merge_path.test.dtb test_tree1.dtb
 
     # Check some checks
     check_tests dup-nodename.dts duplicate_node_names
diff --git a/tests/test_tree1_merge_path.dts b/tests/test_tree1_merge_path.dts
new file mode 100644
index 0000000..d68713b
--- /dev/null
+++ b/tests/test_tree1_merge_path.dts
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
+&{/subnode@2/subsubnode@0} {
+	compatible = "subsubnode2", "subsubnode";
+	prop-int = <0726746425>;
+};
