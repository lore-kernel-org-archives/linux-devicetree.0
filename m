From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH 08/11] arm-dt: parse memory info from DT
Date: Tue, 22 Dec 2009 18:54:56 +0800
Message-ID: <1261479296.248065.310822124208.8.gpush@pororo>
References: <1261479296.245235.191110925832.0.gpush@pororo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1261479296.245235.191110925832.0.gpush@pororo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Move the early_init_dt hooks into a new file, and populate the
_alloc_memory and _add_memory functions.

Signed-off-by: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

---
 arch/arm/kernel/devtree.c |   42 ++++++++++++++++++++++++++++++++++++++
 arch/arm/kernel/setup.c   |   23 --------------------
 2 files changed, 42 insertions(+), 23 deletions(-)

diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
index 864eab5..a8496f6 100644
--- a/arch/arm/kernel/devtree.c
+++ b/arch/arm/kernel/devtree.c
@@ -8,6 +8,48 @@
  * published by the Free Software Foundation.
  */
 
+#include <linux/init.h>
+#include <linux/errno.h>
+#include <linux/types.h>
+#include <linux/bootmem.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+
+#include <asm/setup.h>
+#include <asm/page.h>
+
+struct device_node *of_chosen;
+
+void __init early_init_dt_scan_chosen_arch(unsigned long node) { }
+
+void __init early_init_dt_setup_initrd_arch(unsigned long start,
+					    unsigned long end) { }
+
+void __init early_init_devtree_arch(void) { }
+
+int __init early_init_dt_scan_memory_arch(unsigned long node,
+					    const char *uname,
+					    int depth, void *data)
+{
+	return -EINVAL;
+}
+
+void __init early_init_dt_add_memory(u64 base, u64 size)
+{
+	arm_add_memory(base, size);
+}
+
+u64 __init early_init_dt_alloc_memory(u64 size, u64 align)
+{
+	return __pa(__alloc_bootmem(size, align, __pa(MAX_DMA_ADDRESS)));
+}
+
+int __init early_init_dt_scan_cpus(unsigned long node, const char *uname,
+			    int depth, void *data)
+{
+	return 0;
+}
+
 struct machine_desc * __init parse_devicetree(void *devtree)
 {
 	return NULL;
diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 8abb4be..88d4def 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -676,29 +676,6 @@ static int __init customize_machine(void)
 }
 arch_initcall(customize_machine);
 
-/* arch-specific device tree handling */
-#ifdef CONFIG_ARM_DEVTREE
-void early_init_dt_scan_chosen_arch(unsigned long node) { }
-
-void early_init_dt_setup_initrd_arch(unsigned long start, unsigned long_end) { }
-
-void early_init_devtree_arch(void) { }
-
-int early_init_dt_scan_memory(unsigned long node, const char *uname,
-			      int depth, void *data)
-{
-	return 0;
-}
-
-int early_init_dt_scan_cpus(unsigned long node, const char *uname,
-			    int depth, void *data)
-{
-	return 0;
-}
-
-struct device_node *of_chosen;
-#endif /* CONFIG_ARM_DEVTREE */
-
 void __init setup_arch(char **cmdline_p)
 {
 	struct tag *tags = (struct tag *)&init_tags;
