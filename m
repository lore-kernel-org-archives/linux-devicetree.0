From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/8] arch/x86: Add support for device tree code.
Date: Fri, 16 Jul 2010 11:13:38 -0700
Message-ID: <961e55b7-170c-45ac-a491-628797a0aa5e@VA3EHSMHS006.ehs.local>
References: <1279304021-22216-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-4-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-5-git-send-email-stephen.neuendorffer@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1279304021-22216-5-git-send-email-stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

A few support device-tree related support functions that x86 didn't
have before.

Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

----

 I have no idea if continuing to add these functions to every arch is
a good thing or whether they should (for instance) be weak symbols
with a generic definition.
---
 arch/x86/include/asm/device.h |    6 ++++
 arch/x86/include/asm/irq.h    |    4 ++
 arch/x86/kernel/Makefile      |    1 +
 arch/x86/kernel/device_tree.c |   63 +++++++++++++++++++++++++++++++++++++++++
 drivers/of/platform.c         |    2 +
 include/linux/of_irq.h        |    1 +
 6 files changed, 77 insertions(+), 0 deletions(-)
 create mode 100644 arch/x86/kernel/device_tree.c

diff --git a/arch/x86/include/asm/device.h b/arch/x86/include/asm/device.h
index 029f230..01414f2 100644
--- a/arch/x86/include/asm/device.h
+++ b/arch/x86/include/asm/device.h
@@ -14,6 +14,12 @@ struct dma_map_ops *dma_ops;
 };
 
 struct pdev_archdata {
+#ifdef CONFIG_OF
+	u64 dma_mask;
+#endif
 };
 
+/* Don't override the default bus id behaviour */
+#define of_device_make_bus_id __of_device_make_bus_id
+
 #endif /* _ASM_X86_DEVICE_H */
diff --git a/arch/x86/include/asm/irq.h b/arch/x86/include/asm/irq.h
index 5458380..6c61992 100644
--- a/arch/x86/include/asm/irq.h
+++ b/arch/x86/include/asm/irq.h
@@ -10,6 +10,10 @@
 #include <asm/apicdef.h>
 #include <asm/irq_vectors.h>
 
+#define NO_IRQ (-1)
+
+#define irq_dispose_mapping(...)
+
 static inline int irq_canonicalize(int irq)
 {
 	return ((irq == 2) ? 9 : irq);
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index e77b220..a5c20e8 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -105,6 +105,7 @@ scx200-y			+= scx200_32.o
 
 obj-$(CONFIG_OLPC)		+= olpc.o
 obj-$(CONFIG_X86_MRST)		+= mrst.o
+obj-$(CONFIG_OF)		+= device_tree.o
 
 microcode-y				:= microcode_core.o
 microcode-$(CONFIG_MICROCODE_INTEL)	+= microcode_intel.o
diff --git a/arch/x86/kernel/device_tree.c b/arch/x86/kernel/device_tree.c
new file mode 100644
index 0000000..f6d27f6
--- /dev/null
+++ b/arch/x86/kernel/device_tree.c
@@ -0,0 +1,63 @@
+#undef DEBUG
+
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/pci_regs.h>
+#include <linux/module.h>
+#include <linux/ioport.h>
+#include <linux/etherdevice.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+
+struct bus_type of_platform_bus_type = {
+       .uevent	= of_device_uevent,
+};
+EXPORT_SYMBOL(of_platform_bus_type);
+
+static int __init of_bus_driver_init(void)
+{
+	return of_bus_type_init(&of_platform_bus_type, "of_platform");
+}
+postcore_initcall(of_bus_driver_init);
+
+/*
+ * The list of OF IDs below is used for matching bus types in the
+ * system whose devices are to be exposed as of_platform_devices.
+ *
+ * This is the default list valid for most platforms. This file provides
+ * functions who can take an explicit list if necessary though
+ *
+ * The search is always performed recursively looking for children of
+ * the provided device_node and recursively if such a children matches
+ * a bus type in the list
+ */
+
+const struct of_device_id of_default_bus_ids[] = {
+	{ .type = "soc", },
+	{ .compatible = "soc", },
+	{ .compatible = "simple-bus", },
+	{ .type = "plb5", },
+	{ .type = "plb4", },
+	{ .type = "opb", },
+	{ .type = "simple", },
+	{},
+};
+
+/*
+ * Interrupt remapper
+ */
+
+struct device_node *of_irq_find_parent_by_phandle(phandle p)
+{
+	return of_find_node_by_phandle(p);
+}
+
+unsigned int irq_create_of_mapping(struct device_node *controller,
+				   const u32 *intspec, unsigned int intsize)
+{
+	return intspec[0];
+}
+EXPORT_SYMBOL_GPL(irq_create_of_mapping);
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 125f2bc..3ec3147 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -18,6 +18,8 @@
 #include <linux/slab.h>
 #include <linux/of_device.h>
 #include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 
 extern struct device_attribute of_platform_device_attrs[];
 
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 5929781..25fc90d 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -7,6 +7,7 @@ struct of_irq;
 #include <linux/errno.h>
 #include <linux/ioport.h>
 #include <linux/of.h>
+#include <linux/irq.h>
 
 /*
  * irq_of_parse_and_map() is used ba all OF enabled platforms; but SPARC
-- 
1.5.6.6



This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
