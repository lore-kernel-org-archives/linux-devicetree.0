From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [RFCv1 02/11] irqchip: move IRQ driver for Armada 370/XP
Date: Tue, 26 Mar 2013 17:52:17 +0100
Message-ID: <1364316746-8702-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364316746-8702-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1364316746-8702-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When the Marvell Armada 370/XP support was included in the kernel, the
drivers/irqchip/ directory didn't exist and the minimal infrastructure
in it also didn't exist. Now that we have those things in place, we
move the Armada 370/XP IRQ controller driver from
arch/arm/mach-mvebu/irq-armada-370-xp.c to
drivers/irqchip/irq-armada-370-xp.c.

Note in order to reduce code movement and therefore ease the review of
this patch, we intentionally introduce a forward declaration of
armada_370_xp_handle_irq(). It is in fact not needed because this
handler can now simply be implemented before
armada_370_xp_mpic_of_init(). That will be done in the next commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/mach-mvebu/Makefile                       |    2 +-
 arch/arm/mach-mvebu/armada-370-xp.c                |    4 ++--
 drivers/irqchip/Makefile                           |    1 +
 .../irqchip}/irq-armada-370-xp.c                   |   22 ++++++++++----------
 4 files changed, 15 insertions(+), 14 deletions(-)
 rename {arch/arm/mach-mvebu => drivers/irqchip}/irq-armada-370-xp.c (95%)

diff --git a/arch/arm/mach-mvebu/Makefile b/arch/arm/mach-mvebu/Makefile
index ba769e0..2d04f0e 100644
--- a/arch/arm/mach-mvebu/Makefile
+++ b/arch/arm/mach-mvebu/Makefile
@@ -5,6 +5,6 @@ AFLAGS_coherency_ll.o		:= -Wa,-march=armv7-a
 
 obj-y				 += system-controller.o
 obj-$(CONFIG_MACH_ARMADA_370_XP) += armada-370-xp.o
-obj-$(CONFIG_ARCH_MVEBU)	 += coherency.o coherency_ll.o pmsu.o irq-armada-370-xp.o
+obj-$(CONFIG_ARCH_MVEBU)	 += coherency.o coherency_ll.o pmsu.o
 obj-$(CONFIG_SMP)                += platsmp.o headsmp.o
 obj-$(CONFIG_HOTPLUG_CPU)        += hotplug.o
diff --git a/arch/arm/mach-mvebu/armada-370-xp.c b/arch/arm/mach-mvebu/armada-370-xp.c
index d98a0ca..42a4cb3 100644
--- a/arch/arm/mach-mvebu/armada-370-xp.c
+++ b/arch/arm/mach-mvebu/armada-370-xp.c
@@ -20,6 +20,7 @@
 #include <linux/clk/mvebu.h>
 #include <linux/dma-mapping.h>
 #include <linux/mbus.h>
+#include <linux/irqchip.h>
 #include <asm/hardware/cache-l2x0.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -95,8 +96,7 @@ DT_MACHINE_START(ARMADA_XP_DT, "Marvell Armada 370/XP (Device Tree)")
 	.init_machine	= armada_370_xp_dt_init,
 	.map_io		= armada_370_xp_map_io,
 	.init_early	= armada_370_xp_init_early,
-	.init_irq	= armada_370_xp_init_irq,
-	.handle_irq     = armada_370_xp_handle_irq,
+	.init_irq	= irqchip_init,
 	.init_time	= armada_370_xp_timer_and_clk_init,
 	.restart	= mvebu_restart,
 	.dt_compat	= armada_370_xp_dt_compat,
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 98e3b87..dae27a7 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -2,6 +2,7 @@ obj-$(CONFIG_IRQCHIP)			+= irqchip.o
 
 obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2835.o
 obj-$(CONFIG_ARCH_EXYNOS)		+= exynos-combiner.o
+obj-$(CONFIG_ARCH_MVEBU)		+= irq-armada-370-xp.o
 obj-$(CONFIG_METAG)			+= irq-metag-ext.o
 obj-$(CONFIG_METAG_PERFCOUNTER_IRQS)	+= irq-metag.o
 obj-$(CONFIG_ARCH_SUNXI)		+= irq-sunxi.o
diff --git a/arch/arm/mach-mvebu/irq-armada-370-xp.c b/drivers/irqchip/irq-armada-370-xp.c
similarity index 95%
rename from arch/arm/mach-mvebu/irq-armada-370-xp.c
rename to drivers/irqchip/irq-armada-370-xp.c
index f6699f3..d20a832 100644
--- a/arch/arm/mach-mvebu/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -25,6 +25,9 @@
 #include <asm/mach/arch.h>
 #include <asm/exception.h>
 #include <asm/smp_plat.h>
+#include <asm/mach/irq.h>
+
+#include "irqchip.h"
 
 /* Interrupt Controller Registers Map */
 #define ARMADA_370_XP_INT_SET_MASK_OFFS		(0x48)
@@ -202,6 +205,9 @@ static struct irq_domain_ops armada_370_xp_mpic_irq_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
+static asmlinkage void __exception_irq_entry
+armada_370_xp_handle_irq(struct pt_regs *regs);
+
 static int __init armada_370_xp_mpic_of_init(struct device_node *node,
 					     struct device_node *parent)
 {
@@ -237,11 +243,13 @@ static int __init armada_370_xp_mpic_of_init(struct device_node *node,
 
 #endif
 
+	set_handle_irq(armada_370_xp_handle_irq);
+
 	return 0;
 }
 
-asmlinkage void __exception_irq_entry armada_370_xp_handle_irq(struct pt_regs
-							       *regs)
+static asmlinkage void __exception_irq_entry
+armada_370_xp_handle_irq(struct pt_regs *regs)
 {
 	u32 irqstat, irqnr;
 
@@ -283,12 +291,4 @@ asmlinkage void __exception_irq_entry armada_370_xp_handle_irq(struct pt_regs
 	} while (1);
 }
 
-static const struct of_device_id mpic_of_match[] __initconst = {
-	{.compatible = "marvell,mpic", .data = armada_370_xp_mpic_of_init},
-	{},
-};
-
-void __init armada_370_xp_init_irq(void)
-{
-	of_irq_init(mpic_of_match);
-}
+IRQCHIP_DECLARE(armada_370_xp_mpic, "marvell,mpic", armada_370_xp_mpic_of_init);
-- 
1.7.9.5
