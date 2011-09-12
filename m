From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: dtc: Remove gcc 4.6 "set but not used" warnings
Date: Mon, 12 Sep 2011 11:18:43 +1000
Message-ID: <20110912011843.GK9025@yookeroo.fritz.box>
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
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

A number of the dtc testcases trigger the new "variable set but not
used" warning from gcc 4.6.  That is they have variables which are
assigned, but then never read after that point.

In a couple of cases this is just because the variables aren't needed,
so this patch removes them.  In subnode_offset.c, it's because one
pair of variables we clearly intended to test we don't actually test.
This patch also adds this missing check.

This patch makes the testsuite compile clean with gcc 4.6.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

---

Jon, please apply.

Index: dtc/tests/notfound.c
===================================================================
--- dtc.orig/tests/notfound.c	2011-09-12 11:12:31.089861742 +1000
+++ dtc/tests/notfound.c	2011-09-12 11:12:31.765865100 +1000
@@ -37,27 +37,25 @@ static void check_error(const char *s, i
 
 int main(int argc, char *argv[])
 {
-	const struct fdt_property *prop;
 	void *fdt;
 	int offset;
 	int subnode1_offset;
-	const void *val;
 	int lenerr;
 
 	test_init(argc, argv);
 	fdt = load_blob_arg(argc, argv);
 
-	prop = fdt_get_property(fdt, 0, "nonexistant-property", &lenerr);
+	fdt_get_property(fdt, 0, "nonexistant-property", &lenerr);
 	check_error("fdt_get_property(\"nonexistant-property\")", lenerr);
 
-	val = fdt_getprop(fdt, 0, "nonexistant-property", &lenerr);
+	fdt_getprop(fdt, 0, "nonexistant-property", &lenerr);
 	check_error("fdt_getprop(\"nonexistant-property\"", lenerr);
 
 	subnode1_offset = fdt_subnode_offset(fdt, 0, "subnode@1");
 	if (subnode1_offset < 0)
 		FAIL("Couldn't find subnode1: %s", fdt_strerror(subnode1_offset));
 
-	val = fdt_getprop(fdt, subnode1_offset, "prop-str", &lenerr);
+	fdt_getprop(fdt, subnode1_offset, "prop-str", &lenerr);
 	check_error("fdt_getprop(\"prop-str\")", lenerr);
 
 	offset = fdt_subnode_offset(fdt, 0, "nonexistant-subnode");
Index: dtc/tests/path_offset.c
===================================================================
--- dtc.orig/tests/path_offset.c	2011-09-12 11:12:31.109861849 +1000
+++ dtc/tests/path_offset.c	2011-09-12 11:12:31.765865100 +1000
@@ -104,5 +104,9 @@ int main(int argc, char *argv[])
 		FAIL("Mismatch between subnode_offset (%d) and path_offset (%d)",
 		     subsubnode2_offset, subsubnode2_offset_p);
 
+	if (subsubnode2_offset2 != subsubnode2_offset2_p)
+		FAIL("Mismatch between subnode_offset (%d) and path_offset (%d)",
+		     subsubnode2_offset2, subsubnode2_offset2_p);
+
 	PASS();
 }
Index: dtc/tests/subnode_offset.c
===================================================================
--- dtc.orig/tests/subnode_offset.c	2011-09-12 11:12:31.133861968 +1000
+++ dtc/tests/subnode_offset.c	2011-09-12 11:12:31.765865100 +1000
@@ -60,7 +60,7 @@ int main(int argc, char *argv[])
 	void *fdt;
 	int subnode1_offset, subnode2_offset;
 	int subsubnode1_offset, subsubnode2_offset, subsubnode2_offset2;
-	int ss11_off, ss12_off, ss21_off, ss22_off;
+	int ss12_off, ss21_off;
 
 	test_init(argc, argv);
 	fdt = load_blob_arg(argc, argv);
@@ -85,7 +85,7 @@ int main(int argc, char *argv[])
 	if (subsubnode2_offset != subsubnode2_offset2)
 		FAIL("Different offsets with and without unit address");
 
-	ss11_off = check_subnode(fdt, subnode1_offset, "ss1");
+	check_subnode(fdt, subnode1_offset, "ss1");
 	ss21_off = fdt_subnode_offset(fdt, subnode2_offset, "ss1");
 	if (ss21_off != -FDT_ERR_NOTFOUND)
 		FAIL("Incorrectly found ss1 in subnode2");
@@ -93,7 +93,7 @@ int main(int argc, char *argv[])
 	ss12_off = fdt_subnode_offset(fdt, subnode1_offset, "ss2");
 	if (ss12_off != -FDT_ERR_NOTFOUND)
 		FAIL("Incorrectly found ss2 in subnode1");
-	ss22_off = check_subnode(fdt, subnode2_offset, "ss2");
+	check_subnode(fdt, subnode2_offset, "ss2");
 
 	PASS();
 }

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
