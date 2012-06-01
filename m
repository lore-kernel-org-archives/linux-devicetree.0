From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 1/3] Remove test_tree1_dts0 testcases
Date: Fri,  1 Jun 2012 14:12:36 +1000
Message-ID: <1338523958-16909-2-git-send-email-david@gibson.dropbear.id.au>
References: <1338523958-16909-1-git-send-email-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1338523958-16909-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: jdl-CYoMK+44s/E@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The testcases based on test_tree1_dts0.dts were added purely to test dtc's
backwards compatibility handling of the old dts-v0 format.  Since that
support has been removed, the dts has been updated to use the current
dts-v1 syntax, which makes the testcases pass, but be completely useless.

This patch removes the now obsolete testcases.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 tests/run_tests.sh        |    4 ----
 tests/test_tree1_dts0.dts |   37 -------------------------------------
 2 files changed, 41 deletions(-)
 delete mode 100644 tests/test_tree1_dts0.dts

diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index ab8133c..9a2a7d9 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -254,10 +254,6 @@ dtc_tests () {
     tree1_tests_rw dtc_tree1.test.dtb
     run_test dtbs_equal_ordered dtc_tree1.test.dtb test_tree1.dtb
 
-    run_dtc_test -I dts -O dtb -o dtc_tree1_dts0.test.dtb test_tree1_dts0.dts
-    tree1_tests dtc_tree1_dts0.test.dtb
-    tree1_tests_rw dtc_tree1_dts0.test.dtb
-
     run_dtc_test -I dts -O dtb -o dtc_escapes.test.dtb escapes.dts
     run_test string_escapes dtc_escapes.test.dtb
 
diff --git a/tests/test_tree1_dts0.dts b/tests/test_tree1_dts0.dts
deleted file mode 100644
index 032d540..0000000
--- a/tests/test_tree1_dts0.dts
+++ /dev/null
@@ -1,37 +0,0 @@
-/dts-v1/;
-
-/memreserve/ 0xdeadbeef00000000 0x0000000000100000;
-/memreserve/ 0x00000000075bcd15 0x0000000000001000;
-
-/ {
-	compatible = "test_tree1";
-	prop-int = <0xdeadbeef>;
-	prop-str = "hello world";
-
-	subnode@1 {
-		compatible = "subnode1";
-		prop-int = [deadbeef];
-
-		subsubnode {
-			compatible = "subsubnode1", "subsubnode";
-			prop-int = < 0xdeadbeef>;
-		};
-
-		ss1 {
-		};
-	};
-
-	subnode@2 {
-		linux,phandle = <0x2000>;
-		prop-int = < 123456789>;
-
-		subsubnode@0 {
-			linux,phandle = <0x2001>;
-			compatible = "subsubnode2", "subsubnode";
-			prop-int = < 0726746425>;
-		};
-
-		ss2 {
-		};
-	};
-};
-- 
1.7.10
