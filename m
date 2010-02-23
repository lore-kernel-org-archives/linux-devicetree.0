From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Remove obsolete references_dts0 test
Date: Wed, 24 Feb 2010 01:23:37 +1100
Message-ID: <20100223142337.GA8747@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The only purpose of the dtc_references_dts0 testcase was to check
handling of references in the old dts v0 syntax.  Since we no longer
support the old syntax, and the references_dts0.dts has been converted
to the new format, it's entirely redundant.  This patch removes it.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/tests/references_dts0.dts
===================================================================
--- dtc.orig/tests/references_dts0.dts	2010-02-23 20:24:49.244957063 +1100
+++ /dev/null	1970-01-01 00:00:00.000000000 +0000
@@ -1,26 +0,0 @@
-/dts-v1/;
-
-/ {
-	/* Explicit phandles */
-	n1: node1 {
-		linux,phandle = <0x2000>;
-		ref = <&{/node2}>; /* reference precedes target */
-		lref = <&n2>;
-	};
-	n2: node2 {
-		linux,phandle = <0x1>;
-		ref = <&{/node1}>; /* reference after target */
-		lref = <&n1>;
-	};
-
-	/* Implicit phandles */
-	n3: node3 {
-		ref = <&{/node4}>;
-		lref = <&n4>;
-	};
-	n4: node4 {
-	};
-	n5: node5 {
-		linux,phandle = <&n5>;
-	};
-};
Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2010-02-23 20:24:28.127978782 +1100
+++ dtc/tests/run_tests.sh	2010-02-23 20:24:40.728871486 +1100
@@ -213,9 +213,6 @@ dtc_tests () {
     run_dtc_test -I dts -O dtb -o dtc_references.test.dtb references.dts
     run_test references dtc_references.test.dtb
 
-    run_dtc_test -I dts -O dtb -o dtc_references_dts0.test.dtb references_dts0.dts
-    run_test references dtc_references_dts0.test.dtb
-
     run_dtc_test -I dts -O dtb -o dtc_path-references.test.dtb path-references.dts
     run_test path-references dtc_path-references.test.dtb
 


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
