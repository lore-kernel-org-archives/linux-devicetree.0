From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 1/2] of/flattree: Eliminate need to provide
	early_init_dt_scan_chosen_arch
Date: Wed, 13 Oct 2010 00:44:11 -0600
Message-ID: <20101013064352.2743.80378.stgit@localhost6.localdomain6>
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
To: benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, dediao-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch refactors the early init parsing of the chosen node so that
architectures aren't forced to provide an empty implementation of
early_init_dt_scan_chosen_arch.  Instead, if an architecture wants to
do something different, it can either use a wrapper function around
early_init_dt_scan_chosen(), or it can replace it altogether.

This patch was written in preparation to adding device tree support to
both x86 ad MIPS.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 arch/microblaze/kernel/prom.c |    5 -----
 arch/powerpc/kernel/prom.c    |   12 ++++++++++--
 drivers/of/fdt.c              |    2 --
 include/linux/of_fdt.h        |    2 +-
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/microblaze/kernel/prom.c b/arch/microblaze/kernel/prom.c
index 427b13b..bacbd3d 100644
--- a/arch/microblaze/kernel/prom.c
+++ b/arch/microblaze/kernel/prom.c
@@ -42,11 +42,6 @@
 #include <asm/sections.h>
 #include <asm/pci-bridge.h>
 
-void __init early_init_dt_scan_chosen_arch(unsigned long node)
-{
-	/* No Microblaze specific code here */
-}
-
 void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 {
 	memblock_add(base, size);
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index fed9bf6..e296aae 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -363,10 +363,15 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 	return 0;
 }
 
-void __init early_init_dt_scan_chosen_arch(unsigned long node)
+int __init early_init_dt_scan_chosen_ppc(unsigned long node, const char *uname,
+					 int depth, void *data)
 {
 	unsigned long *lprop;
 
+	/* Use common scan routine to determine if this is the chosen node */
+	if (early_init_dt_scan_chosen(node, uname, depth, data) == 0)
+		return 0;
+
 #ifdef CONFIG_PPC64
 	/* check if iommu is forced on or off */
 	if (of_get_flat_dt_prop(node, "linux,iommu-off", NULL) != NULL)
@@ -398,6 +403,9 @@ void __init early_init_dt_scan_chosen_arch(unsigned long node)
 	if (lprop)
 		crashk_res.end = crashk_res.start + *lprop - 1;
 #endif
+
+	/* break now */
+	return 1;
 }
 
 #ifdef CONFIG_PPC_PSERIES
@@ -679,7 +687,7 @@ void __init early_init_devtree(void *params)
 	 * device-tree, including the platform type, initrd location and
 	 * size, TCE reserve, and more ...
 	 */
-	of_scan_flat_dt(early_init_dt_scan_chosen, NULL);
+	of_scan_flat_dt(early_init_dt_scan_chosen_ppc, NULL);
 
 	/* Scan memory nodes and rebuild MEMBLOCKs */
 	memblock_init();
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 65da5ae..c1360e0 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -533,8 +533,6 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 		strlcpy(cmd_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
 #endif /* CONFIG_CMDLINE */
 
-	early_init_dt_scan_chosen_arch(node);
-
 	pr_debug("Command line is: %s\n", cmd_line);
 
 	/* break now */
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 71e1a91..7bbf5b3 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -72,7 +72,7 @@ extern void *of_get_flat_dt_prop(unsigned long node, const char *name,
 				 unsigned long *size);
 extern int of_flat_dt_is_compatible(unsigned long node, const char *name);
 extern unsigned long of_get_flat_dt_root(void);
-extern void early_init_dt_scan_chosen_arch(unsigned long node);
+
 extern int early_init_dt_scan_chosen(unsigned long node, const char *uname,
 				     int depth, void *data);
 extern void early_init_dt_check_for_initrd(unsigned long node);
