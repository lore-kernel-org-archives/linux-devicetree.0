From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: dtc: Automatically pick a sensible boot_cpuid_phys
Date: Fri, 19 Feb 2010 15:50:50 +1100
Message-ID: <20100219045050.GJ29038@yookeroo>
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
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently, when in -Idts -Odtb or -Ifs -Odtb modes, dtc always
defaults to using 0 as the value for the boot_cpuid_phys header field.
That's correct quite often, but there are some systems where there is
no CPU with hardware ID of 0, or where we don't want to use the CPU
with hardware ID 0 at all (e.g. for AMP-style partitioning).  The only
way to override this default currently, is with the -b command line
option.

This patch improves dtc to instead base the default boot_cpuid_phys
value on the reg property of the first listed subnode of /cpus.  This
means that dtc will get boot_cpuid_phys correct by default in a
greater proportion of cases (since the boot cpu is usually listed
first, and this way at least the boot_cpuid_phys default will match
some existing cpu node).  If the node doesn't exist or has an invalid
'reg' property (missing or not 4 bytes in length), then
boot_cpuid_phys is set to 0.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/livetree.c
===================================================================
--- dtc.orig/livetree.c	2010-02-19 15:48:36.145429911 +1100
+++ dtc/livetree.c	2010-02-19 15:48:38.109450465 +1100
@@ -318,3 +318,26 @@ cell_t get_node_phandle(struct node *roo
 
 	return node->phandle;
 }
+
+uint32_t guess_boot_cpuid(struct node *tree)
+{
+	struct node *cpus, *bootcpu;
+	struct property *reg;
+
+	cpus = get_node_by_path(tree, "/cpus");
+	if (!cpus)
+		return 0;
+
+
+	bootcpu = cpus->children;
+	if (!bootcpu)
+		return 0;
+
+	reg = get_property(bootcpu, "reg");
+	if (!reg || (reg->val.len != sizeof(uint32_t)))
+		return 0;
+
+	/* FIXME: Sanity check node? */
+
+	return propval_cell(reg);
+}
Index: dtc/dtc.h
===================================================================
--- dtc.orig/dtc.h	2010-02-19 15:48:36.113452731 +1100
+++ dtc/dtc.h	2010-02-19 15:48:38.109450465 +1100
@@ -178,6 +178,8 @@ struct node *get_node_by_phandle(struct 
 struct node *get_node_by_ref(struct node *tree, const char *ref);
 cell_t get_node_phandle(struct node *root, struct node *node);
 
+uint32_t guess_boot_cpuid(struct node *tree);
+
 /* Boot info (tree plus memreserve information */
 
 struct reserve_info {
Index: dtc/dtc-parser.y
===================================================================
--- dtc.orig/dtc-parser.y	2010-02-19 15:48:36.189449547 +1100
+++ dtc/dtc-parser.y	2010-02-19 15:48:38.109450465 +1100
@@ -85,7 +85,8 @@ static unsigned long long eval_literal(c
 sourcefile:
 	  DT_V1 ';' memreserves devicetree
 		{
-			the_boot_info = build_boot_info($3, $4, 0);
+			the_boot_info = build_boot_info($3, $4,
+							guess_boot_cpuid($4));
 		}
 	;
 
Index: dtc/fstree.c
===================================================================
--- dtc.orig/fstree.c	2010-02-19 15:48:36.153429392 +1100
+++ dtc/fstree.c	2010-02-19 15:48:38.113439869 +1100
@@ -87,6 +87,6 @@ struct boot_info *dt_from_fs(const char 
 	tree = read_fstree(dirname);
 	tree = name_node(tree, "", NULL);
 
-	return build_boot_info(NULL, tree, 0);
+	return build_boot_info(NULL, tree, guess_boot_cpuid(tree));
 }
 
Index: dtc/tests/boot-cpuid.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/boot-cpuid.dts	2010-02-19 15:48:38.113439869 +1100
@@ -0,0 +1,16 @@
+/dts-v1/;
+
+/ {
+	cpus {
+		cpu@10 {
+			device_type = "cpu";
+			compatible = "fake-cpu";
+			reg = <0x10>;
+		};
+		cpu@11 {
+			device_type = "cpu";
+			compatible = "fake-cpu";
+			reg = <0x11>;
+		};
+	};
+};
Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2010-02-19 15:48:37.469450760 +1100
+++ dtc/tests/run_tests.sh	2010-02-19 15:49:29.099425093 +1100
@@ -243,12 +243,26 @@ dtc_tests () {
     run_test incbin incbin.test.dtb
 
     # Check boot_cpuid_phys handling
-    run_dtc_test -I dts -O dtb -b 17 -o boot_cpuid.test.dtb empty.dts
-    run_test boot-cpuid boot_cpuid.test.dtb 17
-    run_dtc_test -I dtb -O dtb -b 17 -o boot_cpuid_test_tree1.test.dtb test_tree1.dtb
-    run_test boot-cpuid boot_cpuid_test_tree1.test.dtb 17
-    run_dtc_test -I dtb -O dtb -o boot_cpuid_preserved_test_tree1.test.dtb boot_cpuid_test_tree1.test.dtb
-    run_test dtbs_equal_ordered boot_cpuid_preserved_test_tree1.test.dtb boot_cpuid_test_tree1.test.dtb
+    run_dtc_test -I dts -O dtb -o boot_cpuid.test.dtb boot-cpuid.dts
+    run_test boot-cpuid boot_cpuid.test.dtb 16
+
+    run_dtc_test -I dts -O dtb -b 17 -o boot_cpuid_17.test.dtb boot-cpuid.dts
+    run_test boot-cpuid boot_cpuid_17.test.dtb 17
+
+    run_dtc_test -I dtb -O dtb -o preserve_boot_cpuid.test.dtb boot_cpuid.test.dtb
+    run_test boot-cpuid preserve_boot_cpuid.test.dtb 16
+    run_test dtbs_equal_ordered preserve_boot_cpuid.test.dtb boot_cpuid.test.dtb
+
+    run_dtc_test -I dtb -O dtb -o preserve_boot_cpuid_17.test.dtb boot_cpuid_17.test.dtb
+    run_test boot-cpuid preserve_boot_cpuid_17.test.dtb 17
+    run_test dtbs_equal_ordered preserve_boot_cpuid_17.test.dtb boot_cpuid_17.test.dtb
+
+    run_dtc_test -I dtb -O dtb -b17 -o override17_boot_cpuid.test.dtb boot_cpuid.test.dtb
+    run_test boot-cpuid override17_boot_cpuid.test.dtb 17
+
+    run_dtc_test -I dtb -O dtb -b0 -o override0_boot_cpuid_17.test.dtb boot_cpuid_17.test.dtb
+    run_test boot-cpuid override0_boot_cpuid_17.test.dtb 0
+
 
     # Check -Oasm mode
     for tree in test_tree1.dts escapes.dts references.dts path-references.dts \

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
