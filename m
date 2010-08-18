From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 12/14] ARM: vexpress: add board support for DT probing
Date: Wed, 18 Aug 2010 19:59:58 +0100
Message-ID: <1282158000-23081-13-git-send-email-lorenzo.pieralisi@arm.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-8-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-9-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-10-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-11-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-12-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-12-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, philippe.robin-5wv7dgnIgG8@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Discussion is under way to decide if a set of machine ids is allocated
to ARM platforms based on device tree initialization.
Init code for a given platform should be split in a static init version
and a device tree init version. The Versatile Express ARM board requires
the initialization of motherboard and daughterboard in separate steps,
so the split between static init and DT init is doubled in terms of
files. Common code should be factored out in common C files to avoid code
duplication.

This patch refactors the Versatile Express init code in order
to split it in DT and non-DT versions, compiled in accordingly depending
on kernel configuration options. Clock look-up for the DT version is
still work in progress waiting for a definitive clock binding spec so
device names are not really DT compliant at the moment in the dts.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/mach-vexpress/core.h                  |   15 ++-
 arch/arm/mach-vexpress/ct-ca9x4-base.c         |  108 +++++++++++++
 arch/arm/mach-vexpress/ct-ca9x4-of.c           |  192 +++++++++++++++++++++++
 arch/arm/mach-vexpress/ct-ca9x4.c              |   93 -----------
 arch/arm/mach-vexpress/include/mach/ct-ca9x4.h |    2 +
 arch/arm/mach-vexpress/v2m-base.c              |  197 ++++++++++++++++++++++++
 arch/arm/mach-vexpress/v2m-of.c                |   94 +++++++++++
 arch/arm/mach-vexpress/v2m.c                   |  178 +---------------------
 8 files changed, 610 insertions(+), 269 deletions(-)
 create mode 100644 arch/arm/mach-vexpress/ct-ca9x4-base.c
 create mode 100644 arch/arm/mach-vexpress/ct-ca9x4-of.c
 create mode 100644 arch/arm/mach-vexpress/v2m-base.c
 create mode 100644 arch/arm/mach-vexpress/v2m-of.c

diff --git a/arch/arm/mach-vexpress/core.h b/arch/arm/mach-vexpress/core.h
index 57dd95c..b8430eb 100644
--- a/arch/arm/mach-vexpress/core.h
+++ b/arch/arm/mach-vexpress/core.h
@@ -20,7 +20,20 @@ struct amba_device name##_device = {		\
 
 struct map_desc;
 
-void v2m_map_io(struct map_desc *tile, size_t num);
+extern void v2m_map_io(struct map_desc *tile, size_t num);
+extern void v2m_power_off(void);
+extern void v2m_restart(char str, const char *cmd);
+
 extern struct sys_timer v2m_timer;
+extern struct mmci_platform_data v2m_mmci_data;
+extern struct flash_platform_data v2m_flash_data;
 
 extern void __iomem *gic_cpu_base_addr;
+
+extern const struct clk_ops clk_v2m_ops;
+
+#ifndef CONFIG_OF
+static inline int v2m_timer_probe_dt(void) { return -ENODEV; }
+#else
+extern int v2m_timer_probe_dt(void);
+#endif
diff --git a/arch/arm/mach-vexpress/ct-ca9x4-base.c b/arch/arm/mach-vexpress/ct-ca9x4-base.c
new file mode 100644
index 0000000..44ec683
--- /dev/null
+++ b/arch/arm/mach-vexpress/ct-ca9x4-base.c
@@ -0,0 +1,108 @@
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/amba/bus.h>
+#include <linux/amba/clcd.h>
+
+#include <asm/mach/map.h>
+
+#include <mach/ct-ca9x4.h>
+#include <mach/motherboard.h>
+
+#include "core.h"
+
+
+#define V2M_PA_CS7	0x10000000
+
+static struct map_desc ct_ca9x4_io_desc[] __initdata = {
+	{
+		.virtual	= __MMIO_P2V(CT_CA9X4_MPIC),
+		.pfn		= __phys_to_pfn(CT_CA9X4_MPIC),
+		.length		= SZ_16K,
+		.type		= MT_DEVICE,
+	}, {
+		.virtual	= __MMIO_P2V(CT_CA9X4_SP804_TIMER),
+		.pfn		= __phys_to_pfn(CT_CA9X4_SP804_TIMER),
+		.length		= SZ_4K,
+		.type		= MT_DEVICE,
+	}, {
+		.virtual	= __MMIO_P2V(CT_CA9X4_L2CC),
+		.pfn		= __phys_to_pfn(CT_CA9X4_L2CC),
+		.length		= SZ_4K,
+		.type		= MT_DEVICE,
+	},
+};
+
+void __init ct_ca9x4_map_io(void)
+{
+	v2m_map_io(ct_ca9x4_io_desc, ARRAY_SIZE(ct_ca9x4_io_desc));
+}
+
+static struct clcd_panel xvga_panel = {
+	.mode		= {
+		.name		= "XVGA",
+		.refresh	= 60,
+		.xres		= 1024,
+		.yres		= 768,
+		.pixclock	= 15384,
+		.left_margin	= 168,
+		.right_margin	= 8,
+		.upper_margin	= 29,
+		.lower_margin	= 3,
+		.hsync_len	= 144,
+		.vsync_len	= 6,
+		.sync		= 0,
+		.vmode		= FB_VMODE_NONINTERLACED,
+	},
+	.width		= -1,
+	.height		= -1,
+	.tim2		= TIM2_BCD | TIM2_IPC,
+	.cntl		= CNTL_LCDTFT | CNTL_BGR | CNTL_LCDVCOMP(1),
+	.bpp		= 16,
+};
+
+static void ct_ca9x4_clcd_enable(struct clcd_fb *fb)
+{
+	v2m_cfg_write(SYS_CFG_MUXFPGA | SYS_CFG_SITE_DB1, 0);
+	v2m_cfg_write(SYS_CFG_DVIMODE | SYS_CFG_SITE_DB1, 2);
+}
+
+static int ct_ca9x4_clcd_setup(struct clcd_fb *fb)
+{
+	unsigned long framesize = 1024 * 768 * 2;
+	dma_addr_t dma;
+
+	fb->panel = &xvga_panel;
+
+	fb->fb.screen_base = dma_alloc_writecombine(&fb->dev->dev, framesize,
+				&dma, GFP_KERNEL);
+	if (!fb->fb.screen_base) {
+		printk(KERN_ERR "CLCD: unable to map frame buffer\n");
+		return -ENOMEM;
+	}
+	fb->fb.fix.smem_start = dma;
+	fb->fb.fix.smem_len = framesize;
+
+	return 0;
+}
+
+static int ct_ca9x4_clcd_mmap(struct clcd_fb *fb, struct vm_area_struct *vma)
+{
+	return dma_mmap_writecombine(&fb->dev->dev, vma, fb->fb.screen_base,
+		fb->fb.fix.smem_start, fb->fb.fix.smem_len);
+}
+
+static void ct_ca9x4_clcd_remove(struct clcd_fb *fb)
+{
+	dma_free_writecombine(&fb->dev->dev, fb->fb.fix.smem_len,
+		fb->fb.screen_base, fb->fb.fix.smem_start);
+}
+
+struct clcd_board ct_ca9x4_clcd_data = {
+	.name		= "CT-CA9X4",
+	.check		= clcdfb_check,
+	.decode		= clcdfb_decode,
+	.enable		= ct_ca9x4_clcd_enable,
+	.setup		= ct_ca9x4_clcd_setup,
+	.mmap		= ct_ca9x4_clcd_mmap,
+	.remove		= ct_ca9x4_clcd_remove,
+};
diff --git a/arch/arm/mach-vexpress/ct-ca9x4-of.c b/arch/arm/mach-vexpress/ct-ca9x4-of.c
new file mode 100644
index 0000000..b259ad2
--- /dev/null
+++ b/arch/arm/mach-vexpress/ct-ca9x4-of.c
@@ -0,0 +1,192 @@
+/*
+ * Versatile Express DT Core Tile Cortex A9x4 Support
+ */
+#include <linux/init.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/amba/bus.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <asm/clkdev.h>
+#include <asm/hardware/arm_timer.h>
+#include <asm/hardware/cache-l2x0.h>
+#include <asm/hardware/gic.h>
+#include <asm/mach-types.h>
+
+#include <mach/clkdev.h>
+#include <mach/ct-ca9x4.h>
+
+#include <plat/timer-sp.h>
+
+#include <asm/mach/arch.h>
+#include <asm/mach/time.h>
+
+#include "core.h"
+
+#include <mach/motherboard.h>
+
+#define V2M_PA_CS7	0x10000000
+
+void __iomem *gic_cpu_base_addr;
+
+static int __init gic_cpu_addr(void)
+{
+	struct device_node *node;
+	struct resource r;
+	int err = -ENODEV;
+
+	node = of_find_compatible_node(NULL, NULL, "arm,"
+			"gic-cpu-interrupt-controller");
+	if (node) {
+		err = of_address_to_resource(node, 0, &r);
+		if (err)
+			pr_warn("git-cpu: Could not get resource for "
+				"device tree node '%s'", node->full_name);
+		else
+			gic_cpu_base_addr = MMIO_P2V(r.start);
+
+		of_node_put(node);
+	}
+
+	return err;
+}
+
+static int __init gic_init_dt(void)
+{
+	struct device_node *node;
+	struct resource r;
+	int err = -ENODEV;
+
+	if (gic_cpu_addr() < 0)
+		goto out;
+
+	node = of_find_compatible_node(NULL, NULL,
+			"arm,gic-dist-interrupt-controller");
+	if (node) {
+		const u32 *prop;
+		int irq_start = 29;
+
+		err = of_address_to_resource(node, 0, &r);
+		if (err) {
+			pr_warn("gic-dist: Could not get resource for "
+				"device tree node '%s'", node->full_name);
+		} else {
+			prop = of_get_property(node, "irq-start", NULL);
+			if (prop)
+				irq_start = of_read_number(prop, 1);
+			else
+				pr_warn("gic-dist: Could not get irq-start "
+					"property" " initialized to default"
+					"%d\n", irq_start);
+			gic_dist_init(0, MMIO_P2V(r.start), irq_start);
+			gic_cpu_init(0, gic_cpu_base_addr);
+		}
+		of_node_put(node);
+	}
+out:
+	return err;
+}
+
+static void __init ct_ca9x4_dt_init_irq(void)
+{
+	if (gic_init_dt() < 0) {
+		gic_cpu_base_addr = MMIO_P2V(A9_MPCORE_GIC_CPU);
+		gic_dist_init(0, MMIO_P2V(A9_MPCORE_GIC_DIST), 29);
+		gic_cpu_init(0, gic_cpu_base_addr);
+	}
+}
+
+
+static struct clk_v2m osc1_clk =
+	INIT_CLK_V2M(24000000, SYS_CFG_OSC | SYS_CFG_SITE_DB1 | 1);
+static struct clk_lookup lookups[] = {
+	{	/* CLCD */
+		.dev_id		= "clcd@0",
+		.clk		= &osc1_clk.clk,
+	},
+};
+
+
+static int __init arm_vexpress_dt_probe(unsigned long dt)
+{
+	if (!of_flat_dt_is_compatible(dt, "arm,versatile-express"))
+		return 0;
+
+	return 1;
+}
+
+static int ca9x4_notifier(struct device *device)
+{
+	struct device_node *dn = device->of_node;
+
+	if (of_device_is_compatible(dn, "arm,clcd-pl11x")) {
+		device->platform_data =	&ct_ca9x4_clcd_data;
+		pr_info("initialized clcd-pl11x platform_data\n");
+	}
+	if (of_device_is_compatible(dn, "arm,mmc-pl18x")) {
+		device->platform_data =	&v2m_mmci_data;
+		pr_info("initialized mmc-pl18x platform_data\n");
+	}
+	if (of_device_is_compatible(dn, "arm,arm-flash")) {
+		device->platform_data =	&v2m_flash_data;
+		pr_info("initialized arm-flash platform_data\n");
+	}
+	return 0;
+}
+
+static int __init l2x0_init_dt(void)
+{
+	struct device_node *node;
+	int err = -ENODEV;
+
+	node = of_find_compatible_node(NULL, NULL, "arm,"
+			"pl310-cache-controller");
+	if (node) {
+		struct resource r;
+
+		err = of_address_to_resource(node, 0, &r);
+		if (err)
+			pr_warn("pl-310: Could not get resource for "
+					"device tree node '%s'",
+					node->full_name);
+		else
+			l2x0_init(MMIO_P2V(r.start), 0x00000000, 0xfe0fffff);
+
+		of_node_put(node);
+	}
+
+	return err;
+}
+
+static void ct_ca9x4_dt_init(void)
+{
+	struct device_node *node;
+#ifdef CONFIG_CACHE_L2X0
+	if (l2x0_init_dt() < 0)
+		l2x0_init(MMIO_P2V(CT_CA9X4_L2CC), 0x00000000, 0xfe0fffff);
+#endif
+	platform_notify = ca9x4_notifier;
+
+	clkdev_add_table(lookups, ARRAY_SIZE(lookups));
+
+	node = of_find_node_by_path("/amba");
+	if (node)
+		amba_parse_dt_node(node);
+
+	of_platform_bus_probe(NULL, NULL, NULL);
+}
+
+DT_MACHINE_START(VEXPRESS, "ARM-Versatile Express CA9x4 DT")
+	.boot_params	= PHYS_OFFSET + 0x00000100,
+	.map_io		= ct_ca9x4_map_io,
+	.init_irq	= ct_ca9x4_dt_init_irq,
+#if 0
+	.timer		= &ct_ca9x4_timer,
+#else
+	.timer		= &v2m_timer,
+#endif
+	.init_machine	= ct_ca9x4_dt_init,
+	.probe_dt	= arm_vexpress_dt_probe,
+MACHINE_END
diff --git a/arch/arm/mach-vexpress/ct-ca9x4.c b/arch/arm/mach-vexpress/ct-ca9x4.c
index 3419da5..97b7b17 100644
--- a/arch/arm/mach-vexpress/ct-ca9x4.c
+++ b/arch/arm/mach-vexpress/ct-ca9x4.c
@@ -23,7 +23,6 @@
 #include <plat/timer-sp.h>
 
 #include <asm/mach/arch.h>
-#include <asm/mach/map.h>
 #include <asm/mach/time.h>
 
 #include "core.h"
@@ -32,29 +31,6 @@
 
 #define V2M_PA_CS7	0x10000000
 
-static struct map_desc ct_ca9x4_io_desc[] __initdata = {
-	{
-		.virtual	= __MMIO_P2V(CT_CA9X4_MPIC),
-		.pfn		= __phys_to_pfn(CT_CA9X4_MPIC),
-		.length		= SZ_16K,
-		.type		= MT_DEVICE,
-	}, {
-		.virtual	= __MMIO_P2V(CT_CA9X4_SP804_TIMER),
-		.pfn		= __phys_to_pfn(CT_CA9X4_SP804_TIMER),
-		.length		= SZ_4K,
-		.type		= MT_DEVICE,
-	}, {
-		.virtual	= __MMIO_P2V(CT_CA9X4_L2CC),
-		.pfn		= __phys_to_pfn(CT_CA9X4_L2CC),
-		.length		= SZ_4K,
-		.type		= MT_DEVICE,
-	},
-};
-
-static void __init ct_ca9x4_map_io(void)
-{
-	v2m_map_io(ct_ca9x4_io_desc, ARRAY_SIZE(ct_ca9x4_io_desc));
-}
 
 void __iomem *gic_cpu_base_addr;
 
@@ -80,75 +56,6 @@ static struct sys_timer ct_ca9x4_timer = {
 };
 #endif
 
-static struct clcd_panel xvga_panel = {
-	.mode		= {
-		.name		= "XVGA",
-		.refresh	= 60,
-		.xres		= 1024,
-		.yres		= 768,
-		.pixclock	= 15384,
-		.left_margin	= 168,
-		.right_margin	= 8,
-		.upper_margin	= 29,
-		.lower_margin	= 3,
-		.hsync_len	= 144,
-		.vsync_len	= 6,
-		.sync		= 0,
-		.vmode		= FB_VMODE_NONINTERLACED,
-	},
-	.width		= -1,
-	.height		= -1,
-	.tim2		= TIM2_BCD | TIM2_IPC,
-	.cntl		= CNTL_LCDTFT | CNTL_BGR | CNTL_LCDVCOMP(1),
-	.bpp		= 16,
-};
-
-static void ct_ca9x4_clcd_enable(struct clcd_fb *fb)
-{
-	v2m_cfg_write(SYS_CFG_MUXFPGA | SYS_CFG_SITE_DB1, 0);
-	v2m_cfg_write(SYS_CFG_DVIMODE | SYS_CFG_SITE_DB1, 2);
-}
-
-static int ct_ca9x4_clcd_setup(struct clcd_fb *fb)
-{
-	unsigned long framesize = 1024 * 768 * 2;
-	dma_addr_t dma;
-
-	fb->panel = &xvga_panel;
-
-	fb->fb.screen_base = dma_alloc_writecombine(&fb->dev->dev, framesize,
-				&dma, GFP_KERNEL);
-	if (!fb->fb.screen_base) {
-		printk(KERN_ERR "CLCD: unable to map frame buffer\n");
-		return -ENOMEM;
-	}
-	fb->fb.fix.smem_start = dma;
-	fb->fb.fix.smem_len = framesize;
-
-	return 0;
-}
-
-static int ct_ca9x4_clcd_mmap(struct clcd_fb *fb, struct vm_area_struct *vma)
-{
-	return dma_mmap_writecombine(&fb->dev->dev, vma, fb->fb.screen_base,
-		fb->fb.fix.smem_start, fb->fb.fix.smem_len);
-}
-
-static void ct_ca9x4_clcd_remove(struct clcd_fb *fb)
-{
-	dma_free_writecombine(&fb->dev->dev, fb->fb.fix.smem_len,
-		fb->fb.screen_base, fb->fb.fix.smem_start);
-}
-
-static struct clcd_board ct_ca9x4_clcd_data = {
-	.name		= "CT-CA9X4",
-	.check		= clcdfb_check,
-	.decode		= clcdfb_decode,
-	.enable		= ct_ca9x4_clcd_enable,
-	.setup		= ct_ca9x4_clcd_setup,
-	.mmap		= ct_ca9x4_clcd_mmap,
-	.remove		= ct_ca9x4_clcd_remove,
-};
 
 static AMBA_DEVICE(clcd, "ct:clcd", CT_CA9X4_CLCDC, &ct_ca9x4_clcd_data);
 static AMBA_DEVICE(dmc, "ct:dmc", CT_CA9X4_DMC, NULL);
diff --git a/arch/arm/mach-vexpress/include/mach/ct-ca9x4.h b/arch/arm/mach-vexpress/include/mach/ct-ca9x4.h
index 8650f04..65870d8 100644
--- a/arch/arm/mach-vexpress/include/mach/ct-ca9x4.h
+++ b/arch/arm/mach-vexpress/include/mach/ct-ca9x4.h
@@ -44,4 +44,6 @@
 #define IRQ_CT_CA9X4_PMU_CPU2	94
 #define IRQ_CT_CA9X4_PMU_CPU3	95
 
+extern struct clcd_board ct_ca9x4_clcd_data;
+extern void __init ct_ca9x4_map_io(void);
 #endif
diff --git a/arch/arm/mach-vexpress/v2m-base.c b/arch/arm/mach-vexpress/v2m-base.c
new file mode 100644
index 0000000..3d24d5b
--- /dev/null
+++ b/arch/arm/mach-vexpress/v2m-base.c
@@ -0,0 +1,197 @@
+/*
+ * Versatile Express V2M Motherboard Support
+ */
+#include <linux/amba/mmci.h>
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/spinlock.h>
+#include <linux/sysdev.h>
+
+#include <asm/clkdev.h>
+#include <asm/sizes.h>
+#include <asm/mach/flash.h>
+#include <asm/mach/map.h>
+#include <asm/mach/time.h>
+#include <asm/hardware/arm_timer.h>
+
+#include <mach/clkdev.h>
+#include <mach/motherboard.h>
+
+#include <plat/timer-sp.h>
+
+#include "core.h"
+
+#define V2M_PA_CS0	0x40000000
+#define V2M_PA_CS1	0x44000000
+#define V2M_PA_CS2	0x48000000
+#define V2M_PA_CS3	0x4c000000
+#define V2M_PA_CS7	0x10000000
+
+static struct map_desc v2m_io_desc[] __initdata = {
+	{
+		.virtual	= __MMIO_P2V(V2M_PA_CS7),
+		.pfn		= __phys_to_pfn(V2M_PA_CS7),
+		.length		= SZ_128K,
+		.type		= MT_DEVICE,
+	},
+};
+
+void __init v2m_map_io(struct map_desc *tile, size_t num)
+{
+	iotable_init(v2m_io_desc, ARRAY_SIZE(v2m_io_desc));
+	iotable_init(tile, num);
+}
+
+
+static void v2m_timer_init(void)
+{
+	if (v2m_timer_probe_dt() == -ENODEV) {
+
+		writel(0, MMIO_P2V(V2M_TIMER0) + TIMER_CTRL);
+		writel(0, MMIO_P2V(V2M_TIMER1) + TIMER_CTRL);
+
+		sp804_clocksource_init(MMIO_P2V(V2M_TIMER1));
+		sp804_clockevents_init(MMIO_P2V(V2M_TIMER0), IRQ_V2M_TIMER0);
+	}
+}
+
+struct sys_timer v2m_timer = {
+	.init	= v2m_timer_init,
+};
+
+
+static DEFINE_SPINLOCK(v2m_cfg_lock);
+
+int v2m_cfg_write(u32 devfn, u32 data)
+{
+	/* Configuration interface broken? */
+	u32 val;
+
+	printk("%s: writing %08x to %08x\n", __func__, data, devfn);
+
+	devfn |= SYS_CFG_START | SYS_CFG_WRITE;
+
+	spin_lock(&v2m_cfg_lock);
+	val = readl(MMIO_P2V(V2M_SYS_CFGSTAT));
+	writel(val & ~SYS_CFG_COMPLETE, MMIO_P2V(V2M_SYS_CFGSTAT));
+
+	writel(data, MMIO_P2V(V2M_SYS_CFGDATA));
+	writel(devfn, MMIO_P2V(V2M_SYS_CFGCTRL));
+
+	do {
+		val = readl(MMIO_P2V(V2M_SYS_CFGSTAT));
+	} while (val == 0);
+	spin_unlock(&v2m_cfg_lock);
+
+	return !!(val & SYS_CFG_ERR);
+}
+
+int v2m_cfg_read(u32 devfn, u32 *data)
+{
+	u32 val;
+
+	devfn |= SYS_CFG_START;
+
+	spin_lock(&v2m_cfg_lock);
+	writel(0, MMIO_P2V(V2M_SYS_CFGSTAT));
+	writel(devfn, MMIO_P2V(V2M_SYS_CFGCTRL));
+
+	mb();
+
+	do {
+		cpu_relax();
+		val = readl(MMIO_P2V(V2M_SYS_CFGSTAT));
+	} while (val == 0);
+
+	*data = readl(MMIO_P2V(V2M_SYS_CFGDATA));
+	spin_unlock(&v2m_cfg_lock);
+
+	return !!(val & SYS_CFG_ERR);
+}
+
+
+static unsigned int v2m_mmci_status(struct device *dev)
+{
+	return !(readl(MMIO_P2V(V2M_SYS_MCI)) & (1 << 0));
+}
+
+struct mmci_platform_data v2m_mmci_data = {
+	.ocr_mask	= MMC_VDD_32_33|MMC_VDD_33_34,
+	.status		= v2m_mmci_status,
+};
+
+static int v2m_flash_init(void)
+{
+	writel(0, MMIO_P2V(V2M_SYS_FLASH));
+	return 0;
+}
+
+static void v2m_flash_exit(void)
+{
+	writel(0, MMIO_P2V(V2M_SYS_FLASH));
+}
+
+static void v2m_flash_set_vpp(int on)
+{
+	writel(on != 0, MMIO_P2V(V2M_SYS_FLASH));
+}
+
+struct flash_platform_data v2m_flash_data = {
+	.map_name	= "cfi_probe",
+	.width		= 4,
+	.init		= v2m_flash_init,
+	.exit		= v2m_flash_exit,
+	.set_vpp	= v2m_flash_set_vpp,
+};
+
+#define to_clk_v2m(c) (container_of(c, struct clk_v2m, clk))
+
+static long clk_v2m_round_rate(struct clk *clk, unsigned long rate)
+{
+	return rate;
+}
+
+static int clk_v2m_set_rate(struct clk *_clk, unsigned long rate)
+{
+	struct clk_v2m *clk = to_clk_v2m(_clk);
+	int ret;
+
+	ret = v2m_cfg_write(clk->config, rate);
+	if (!ret)
+		clk->rate = rate;
+	return ret;
+}
+
+static void clk_v2m_put(struct clk *_clk)
+{
+}
+
+static int clk_v2m_get(struct clk *_clk)
+{
+	return 1;
+}
+
+static unsigned long clk_v2m_get_rate(struct clk *clk)
+{
+	return to_clk_v2m(clk)->rate;
+}
+
+const struct clk_ops clk_v2m_ops = {
+	.round_rate = clk_v2m_round_rate,
+	.get_rate = clk_v2m_get_rate,
+	.set_rate = clk_v2m_set_rate,
+	.get = clk_v2m_get,
+	.put = clk_v2m_put,
+};
+
+void v2m_power_off(void)
+{
+	if (v2m_cfg_write(SYS_CFG_SHUTDOWN | SYS_CFG_SITE_MB, 0))
+		printk(KERN_EMERG "Unable to shutdown\n");
+}
+
+void v2m_restart(char str, const char *cmd)
+{
+	if (v2m_cfg_write(SYS_CFG_REBOOT | SYS_CFG_SITE_MB, 0))
+		printk(KERN_EMERG "Unable to reboot\n");
+}
diff --git a/arch/arm/mach-vexpress/v2m-of.c b/arch/arm/mach-vexpress/v2m-of.c
new file mode 100644
index 0000000..acc058c
--- /dev/null
+++ b/arch/arm/mach-vexpress/v2m-of.c
@@ -0,0 +1,94 @@
+/*
+ * Versatile Express V2M Motherboard DT init
+ */
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+
+#include <asm/clkdev.h>
+#include <asm/hardware/arm_timer.h>
+
+#include <mach/clkdev.h>
+#include <mach/motherboard.h>
+
+#include <plat/timer-sp.h>
+
+#include "core.h"
+
+static inline void v2m_timer_init_ce(void __iomem *va, unsigned int irq)
+{
+	if (irq != NO_IRQ)
+		sp804_clockevents_init(va, irq);
+	else
+		sp804_clocksource_init(va);
+}
+
+int v2m_timer_probe_dt(void)
+{
+	struct device_node *node;
+	int irq, err = -ENODEV;
+
+	for_each_compatible_node(node, NULL, "arm,arm-sp804") {
+		struct resource r[2];
+
+		err = of_address_to_resource(node, 0, &r[0]);
+		if (err) {
+			pr_warn("Could not get " "resource for device tree"
+					"node '%s'", node->full_name);
+			goto put_node;
+		} else {
+			writel(0, MMIO_P2V(r[0].start) + TIMER_CTRL);
+			irq = of_irq_to_resource(node, 0, &r[1]);
+			v2m_timer_init_ce(MMIO_P2V(r[0].start), irq);
+			pr_info("Initializing timer %s start @0x%x irq %d\n",
+					node->name, r[0].start, irq);
+		}
+	}
+
+	return err;
+put_node:
+	of_node_put(node);
+	return err;
+}
+
+static struct clk_v2m osc1_clk =
+	INIT_CLK_V2M(24000000, SYS_CFG_OSC | SYS_CFG_SITE_MB | 1);
+
+static struct clk_fixed osc2_clk = INIT_CLK_FIXED(24000000);
+
+static struct clk_lookup v2m_lookups[] = {
+	{	/* FDT uart 0 */
+		.dev_id		= "uart@0",
+		.clk		= &osc2_clk.clk,
+	}, {	/* FDT uart 1 */
+		.dev_id		= "uart@1",
+		.clk		= &osc2_clk.clk,
+	}, {	/* FDT kbd    */
+		.dev_id		= "kbd@0",
+		.clk		= &osc2_clk.clk,
+	}, {	/* FDT mouse  */
+		.dev_id		= "ps2@0",
+		.clk		= &osc2_clk.clk,
+	}, {	/* FDT mouse  */
+		.dev_id		= "mmci@0",
+		.clk		= &osc2_clk.clk,
+	}, {	/* FDT mb clcd  */
+		.dev_id		= "clcd@1",
+		.clk		= &osc1_clk.clk,
+	}
+};
+
+static int __init v2m_init_dt(void)
+{
+	clkdev_add_table(v2m_lookups, ARRAY_SIZE(v2m_lookups));
+
+	pm_power_off = v2m_power_off;
+	arm_pm_restart = v2m_restart;
+
+	return 0;
+}
+arch_initcall(v2m_init_dt);
diff --git a/arch/arm/mach-vexpress/v2m.c b/arch/arm/mach-vexpress/v2m.c
index 06d6914..b9e46cd 100644
--- a/arch/arm/mach-vexpress/v2m.c
+++ b/arch/arm/mach-vexpress/v2m.c
@@ -1,29 +1,21 @@
 /*
- * Versatile Express V2M Motherboard Support
+ * Versatile Express V2M Motherboard static init
  */
 #include <linux/device.h>
 #include <linux/amba/bus.h>
-#include <linux/amba/mmci.h>
-#include <linux/io.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/smsc911x.h>
-#include <linux/spinlock.h>
 #include <linux/sysdev.h>
 #include <linux/usb/isp1760.h>
 
 #include <asm/clkdev.h>
 #include <asm/sizes.h>
 #include <asm/mach/flash.h>
-#include <asm/mach/map.h>
-#include <asm/mach/time.h>
-#include <asm/hardware/arm_timer.h>
 
 #include <mach/clkdev.h>
 #include <mach/motherboard.h>
 
-#include <plat/timer-sp.h>
-
 #include "core.h"
 
 #define V2M_PA_CS0	0x40000000
@@ -32,86 +24,6 @@
 #define V2M_PA_CS3	0x4c000000
 #define V2M_PA_CS7	0x10000000
 
-static struct map_desc v2m_io_desc[] __initdata = {
-	{
-		.virtual	= __MMIO_P2V(V2M_PA_CS7),
-		.pfn		= __phys_to_pfn(V2M_PA_CS7),
-		.length		= SZ_128K,
-		.type		= MT_DEVICE,
-	},
-};
-
-void __init v2m_map_io(struct map_desc *tile, size_t num)
-{
-	iotable_init(v2m_io_desc, ARRAY_SIZE(v2m_io_desc));
-	iotable_init(tile, num);
-}
-
-
-static void v2m_timer_init(void)
-{
-	writel(0, MMIO_P2V(V2M_TIMER0) + TIMER_CTRL);
-	writel(0, MMIO_P2V(V2M_TIMER1) + TIMER_CTRL);
-
-	sp804_clocksource_init(MMIO_P2V(V2M_TIMER1));
-	sp804_clockevents_init(MMIO_P2V(V2M_TIMER0), IRQ_V2M_TIMER0);
-}
-
-struct sys_timer v2m_timer = {
-	.init	= v2m_timer_init,
-};
-
-
-static DEFINE_SPINLOCK(v2m_cfg_lock);
-
-int v2m_cfg_write(u32 devfn, u32 data)
-{
-	/* Configuration interface broken? */
-	u32 val;
-
-	printk("%s: writing %08x to %08x\n", __func__, data, devfn);
-
-	devfn |= SYS_CFG_START | SYS_CFG_WRITE;
-
-	spin_lock(&v2m_cfg_lock);
-	val = readl(MMIO_P2V(V2M_SYS_CFGSTAT));
-	writel(val & ~SYS_CFG_COMPLETE, MMIO_P2V(V2M_SYS_CFGSTAT));
-
-	writel(data, MMIO_P2V(V2M_SYS_CFGDATA));
-	writel(devfn, MMIO_P2V(V2M_SYS_CFGCTRL));
-
-	do {
-		val = readl(MMIO_P2V(V2M_SYS_CFGSTAT));
-	} while (val == 0);
-	spin_unlock(&v2m_cfg_lock);
-
-	return !!(val & SYS_CFG_ERR);
-}
-
-int v2m_cfg_read(u32 devfn, u32 *data)
-{
-	u32 val;
-
-	devfn |= SYS_CFG_START;
-
-	spin_lock(&v2m_cfg_lock);
-	writel(0, MMIO_P2V(V2M_SYS_CFGSTAT));
-	writel(devfn, MMIO_P2V(V2M_SYS_CFGCTRL));
-
-	mb();
-
-	do {
-		cpu_relax();
-		val = readl(MMIO_P2V(V2M_SYS_CFGSTAT));
-	} while (val == 0);
-
-	*data = readl(MMIO_P2V(V2M_SYS_CFGDATA));
-	spin_unlock(&v2m_cfg_lock);
-
-	return !!(val & SYS_CFG_ERR);
-}
-
-
 static struct resource v2m_pcie_i2c_resource = {
 	.start	= V2M_SERIAL_BUS_PCI,
 	.end	= V2M_SERIAL_BUS_PCI + SZ_4K - 1,
@@ -194,29 +106,6 @@ static struct platform_device v2m_usb_device = {
 	.dev.platform_data = &v2m_usb_config,
 };
 
-static int v2m_flash_init(void)
-{
-	writel(0, MMIO_P2V(V2M_SYS_FLASH));
-	return 0;
-}
-
-static void v2m_flash_exit(void)
-{
-	writel(0, MMIO_P2V(V2M_SYS_FLASH));
-}
-
-static void v2m_flash_set_vpp(int on)
-{
-	writel(on != 0, MMIO_P2V(V2M_SYS_FLASH));
-}
-
-static struct flash_platform_data v2m_flash_data = {
-	.map_name	= "cfi_probe",
-	.width		= 4,
-	.init		= v2m_flash_init,
-	.exit		= v2m_flash_exit,
-	.set_vpp	= v2m_flash_set_vpp,
-};
 
 static struct resource v2m_flash_resources[] = {
 	{
@@ -239,15 +128,6 @@ static struct platform_device v2m_flash_device = {
 };
 
 
-static unsigned int v2m_mmci_status(struct device *dev)
-{
-	return !(readl(MMIO_P2V(V2M_SYS_MCI)) & (1 << 0));
-}
-
-static struct mmci_platform_data v2m_mmci_data = {
-	.ocr_mask	= MMC_VDD_32_33|MMC_VDD_33_34,
-	.status		= v2m_mmci_status,
-};
 
 static AMBA_DEVICE(aaci,  "mb:aaci",  V2M_AACI, NULL);
 static AMBA_DEVICE(mmci,  "mb:mmci",  V2M_MMCI, &v2m_mmci_data);
@@ -273,46 +153,6 @@ static struct amba_device *v2m_amba_devs[] __initdata = {
 	&rtc_device,
 };
 
-#define to_clk_v2m(c) (container_of(c, struct clk_v2m, clk))
-
-static long clk_v2m_round_rate(struct clk *clk, unsigned long rate)
-{
-	return rate;
-}
-
-static int clk_v2m_set_rate(struct clk *_clk, unsigned long rate)
-{
-	struct clk_v2m *clk = to_clk_v2m(_clk);
-	int ret;
-
-	ret = v2m_cfg_write(clk->config, rate);
-	if (!ret)
-		clk->rate = rate;
-	return ret;
-}
-
-static void clk_v2m_put(struct clk *_clk)
-{
-}
-
-static int clk_v2m_get(struct clk *_clk)
-{
-	return 1;
-}
-
-static unsigned long clk_v2m_get_rate(struct clk *clk)
-{
-	return to_clk_v2m(clk)->rate;
-}
-
-const struct clk_ops clk_v2m_ops = {
-	.round_rate = clk_v2m_round_rate,
-	.get_rate = clk_v2m_get_rate,
-	.set_rate = clk_v2m_set_rate,
-	.get = clk_v2m_get,
-	.put = clk_v2m_put,
-};
-
 static struct clk_v2m osc1_clk =
 	INIT_CLK_V2M(24000000, SYS_CFG_OSC | SYS_CFG_SITE_MB | 1);
 
@@ -346,24 +186,10 @@ static struct clk_lookup v2m_lookups[] = {
 	},
 };
 
-static void v2m_power_off(void)
-{
-	if (v2m_cfg_write(SYS_CFG_SHUTDOWN | SYS_CFG_SITE_MB, 0))
-		printk(KERN_EMERG "Unable to shutdown\n");
-}
-
-static void v2m_restart(char str, const char *cmd)
-{
-	if (v2m_cfg_write(SYS_CFG_REBOOT | SYS_CFG_SITE_MB, 0))
-		printk(KERN_EMERG "Unable to reboot\n");
-}
-
 static int __init v2m_init(void)
 {
 	int i;
 
-	clkdev_add_table(v2m_lookups, ARRAY_SIZE(v2m_lookups));
-
 	platform_device_register(&v2m_pcie_i2c_device);
 	platform_device_register(&v2m_ddc_i2c_device);
 	platform_device_register(&v2m_flash_device);
@@ -373,6 +199,8 @@ static int __init v2m_init(void)
 	for (i = 0; i < ARRAY_SIZE(v2m_amba_devs); i++)
 		amba_device_register(v2m_amba_devs[i], &iomem_resource);
 
+	clkdev_add_table(v2m_lookups, ARRAY_SIZE(v2m_lookups));
+
 	pm_power_off = v2m_power_off;
 	arm_pm_restart = v2m_restart;
 
-- 
1.6.3.3
