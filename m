From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Add merging of labelled subnodes. This patch allows
	the following
Date: Mon, 1 Mar 2010 17:22:02 +1100
Message-ID: <20100301062202.GC23435@yookeroo>
References: <20100226190651.5143.12956.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100226190651.5143.12956.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 26, 2010 at 12:07:28PM -0700, Grant Likely wrote:
> syntax:
> 
> / {
> 	child {
> 		label: subchild {
> 		};
> 	};
> };
> 
> &label {
> 	prop = "value";
> };
> 
> which will result in the following tree:
> / {
> 	child {
> 		label: subchild {
> 			prop = "value";
> 		};
> 	};
> };
> 
> ---
> 
> Hi Jon and David
> 
> This patch isn't quite finished yet, but I'm getting it out there for
> feedback.  In particular, I'm don't know how best to handle errors in
> livetree.c.  The way I'm currently handling it is calling yyerror()
> from livetree.c, which results in a compile warning.

Hrm, that's a bit ugly.

> I also don't yet have a test case for referencing a label that doesn't
> exist in the main tree.

Ah, yeah.  Testcases for incorrect input are often the fiddliest.

So, here's my counter-proposal.  By rearranging the grammar a little,
and putting the labelled merge logic into dtc-parser.y itself, it
accomplishes the same thing without the warning, and with a bit less
code.

Index: dtc/dtc-lexer.l
===================================================================
--- dtc.orig/dtc-lexer.l	2010-02-09 10:26:06.840350087 +1100
+++ dtc/dtc-lexer.l	2010-03-01 14:22:26.927391539 +1100
@@ -109,7 +109,7 @@ static int pop_input_file(void);
 			return DT_LITERAL;
 		}
 
-\&{LABEL}	{	/* label reference */
+<*>\&{LABEL}	{	/* label reference */
 			DPRINT("Ref: %s\n", yytext+1);
 			yylval.labelref = xstrdup(yytext+1);
 			return DT_REF;
Index: dtc/dtc-parser.y
===================================================================
--- dtc.orig/dtc-parser.y	2010-02-26 10:40:00.136001074 +1100
+++ dtc/dtc-parser.y	2010-03-01 17:15:59.779380861 +1100
@@ -74,7 +74,6 @@ static unsigned long long eval_literal(c
 %type <prop> propdef
 %type <proplist> proplist
 
-%type <node> devicetree
 %type <node> devicetrees
 %type <node> nodedef
 %type <node> subnode
@@ -121,20 +120,25 @@ addr:
 	  ;
 
 devicetrees:
-	  devicetree
+	  '/' nodedef
 		{
-			$$ = $1;
+			$$ = name_node($2, "");
 		}
-	| devicetrees devicetree
+	| devicetrees '/' nodedef
 		{
-			$$ = merge_nodes($1, $2);
+			$$ = merge_nodes($1, $3);
 		}
-	;
-
-devicetree:
-	  '/' nodedef
+	| devicetrees DT_REF nodedef
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
 
Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2010-03-01 14:21:48.607391244 +1100
+++ dtc/tests/run_tests.sh	2010-03-01 14:22:26.931385551 +1100
@@ -301,6 +301,8 @@ dtc_tests () {
     # Check merge/overlay functionality
     run_dtc_test -I dts -O dtb -o dtc_tree1_merge.test.dtb test_tree1_merge.dts
     tree1_tests dtc_tree1_merge.test.dtb test_tree1.dtb
+    run_dtc_test -I dts -O dtb -o dtc_tree1_merge_labelled.test.dtb test_tree1_merge_labelled.dts
+    tree1_tests dtc_tree1_merge_labelled.test.dtb test_tree1.dtb
     run_dtc_test -I dts -O dtb -o multilabel_merge.test.dtb multilabel_merge.dts
     run_test references multilabel.test.dtb
     run_test dtbs_equal_ordered multilabel.test.dtb multilabel_merge.test.dtb
Index: dtc/tests/test_tree1.dts
===================================================================
--- dtc.orig/tests/test_tree1.dts	2009-11-27 08:45:46.000000000 +1100
+++ dtc/tests/test_tree1.dts	2010-03-01 14:22:26.959424732 +1100
@@ -25,7 +25,7 @@
 		linux,phandle = <0x2000>;
 		prop-int = <123456789>;
 
-		subsubnode@0 {
+		ssn0: subsubnode@0 {
 			phandle = <0x2001>;
 			compatible = "subsubnode2", "subsubnode";
 			prop-int = <0726746425>;
Index: dtc/tests/test_tree1_merge.dts
===================================================================
--- dtc.orig/tests/test_tree1_merge.dts	2010-02-26 10:40:00.136001074 +1100
+++ dtc/tests/test_tree1_merge.dts	2010-03-01 14:22:26.967424771 +1100
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
Index: dtc/tests/test_tree1_merge_labelled.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/test_tree1_merge_labelled.dts	2010-03-01 14:22:26.967424771 +1100
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


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
