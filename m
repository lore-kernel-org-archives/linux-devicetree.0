From: Domenico Andreoli <cavokz@gmail.com>
Subject: [PATCH 5/6] ARM: bcm476x: Add restart hook
Date: Sun, 07 Oct 2012 03:53:05 +0200
Message-ID: <20121007015407.522256287@gmail.com>
References: <20121007015300.828366635@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline; filename=arm-bcm476x-add-restart-hook.patch
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Domenico Andreoli <domenico.andreoli@linux.com>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Domenico Andreoli <domenico.andreoli@linux.com>

Restart hook implementation for the BCM476x SoC (uses the watchdog).

Signed-off-by: Domenico Andreoli <domenico.andreoli@linux.com>
---
 Documentation/devicetree/bindings/watchdog/brcm,bcm476x-pm-wdt.txt |   13 ++
 arch/arm/boot/dts/bcm476x.dtsi                                     |    5 +
 arch/arm/mach-bcm476x/bcm476x.c                                    |   66 ++++++++++
 3 files changed, 84 insertions(+)

Index: b/Documentation/devicetree/bindings/watchdog/brcm,bcm476x-pm-wdt.txt
===================================================================
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm476x-pm-wdt.txt
@@ -0,0 +1,13 @@
+BCM476x Watchdog timer
+
+Required properties:
+
+- compatible : should be "brcm,bcm476x-pm-wdt"
+- reg : Specifies base physical address and size of the registers.
+
+Example:
+
+watchdog {
+	compatible = "brcm,bcm476x-pm-wdt";
+	reg = <0xbd000 0x1000>;
+};
Index: b/arch/arm/boot/dts/bcm476x.dtsi
===================================================================
--- a/arch/arm/boot/dts/bcm476x.dtsi
+++ b/arch/arm/boot/dts/bcm476x.dtsi
@@ -28,6 +28,11 @@
 			clock-frequency = <32000>;
 		};
 
+		watchdog {
+			compatible = "brcm,bcm476x-pm-wdt";
+			reg = <0xbd000 0x1000>;
+		};
+
 		vic0: interrupt-controller@80000 {
 			compatible = "brcm,bcm476x-pl192", "arm,pl192-vic", "arm,primecell";
 			reg = <0x80000 0x1000>;
Index: b/arch/arm/mach-bcm476x/bcm476x.c
===================================================================
--- a/arch/arm/mach-bcm476x/bcm476x.c
+++ b/arch/arm/mach-bcm476x/bcm476x.c
@@ -15,7 +15,9 @@
  */
 
 #include <linux/init.h>
+#include <linux/delay.h>
 #include <linux/of_irq.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/bcm476x_timer.h>
 #include <linux/clk/bcm476x.h>
@@ -28,6 +30,17 @@
 #define BCM476X_PERIPH_VIRT   0xd0080000
 #define BCM476X_PERIPH_SIZE   SZ_512K
 
+#define BCM476X_WDT_LOAD      0x000
+#define BCM476X_WDT_CTRL      0x008
+#define BCM476X_WDT_INTCLR    0x00c
+#define BCM476X_WDT_LOCK      0xc00
+
+#define BCM476X_WDT_PASSWORD  0x1acce551
+#define BCM476X_WDT_INTEN     BIT(0)
+#define BCM476X_WDT_RESEN     BIT(1)
+
+static void __iomem *wdt_regs;
+
 static struct map_desc io_map __initdata = {
 	.virtual = BCM476X_PERIPH_VIRT,
 	.pfn = __phys_to_pfn(BCM476X_PERIPH_PHYS),
@@ -40,10 +53,62 @@ void __init bcm476x_map_io(void)
 	iotable_init(&io_map, 1);
 }
 
+/*
+ * The machine restart method can be called from an atomic context so we won't
+ * be able to ioremap the regs then.
+ */
+static void bcm476x_setup_restart(void)
+{
+	struct device_node *np;
+
+	np = of_find_compatible_node(NULL, NULL, "brcm,bcm476x-pm-wdt");
+	if (WARN(!np, "unable to setup watchdog restart"))
+		return;
+
+	wdt_regs = of_iomap(np, 0);
+	WARN(!wdt_regs, "Can't remap watchdog registers");
+
+	/* unlock watchdog registers */
+	writel(BCM476X_WDT_PASSWORD, wdt_regs + BCM476X_WDT_LOCK);
+	/* disable watchdog */
+	writel(0, wdt_regs + BCM476X_WDT_CTRL);
+	/* lock watchdog registers */
+	writel(1, wdt_regs + BCM476X_WDT_LOCK);
+}
+
+static void bcm476x_restart(char mode, const char *cmd)
+{
+	if (!wdt_regs)
+		return;
+
+	/* unlock watchdog registers */
+	writel(BCM476X_WDT_PASSWORD, wdt_regs + BCM476X_WDT_LOCK);
+
+	/* disable watchdog */
+	writel(0, wdt_regs + BCM476X_WDT_CTRL);
+	udelay(20);
+
+	/* clear the irq status */
+	writel(1, wdt_regs + BCM476X_WDT_INTCLR);
+	udelay(20);
+
+	/* expire after 5 cycles (~156us) */
+	writel(5, wdt_regs + BCM476X_WDT_LOAD);
+	/* enable watchdog */
+	writel(BCM476X_WDT_INTEN | BCM476X_WDT_RESEN,
+		wdt_regs + BCM476X_WDT_CTRL);
+
+	/* lock watchdog registers */
+	writel(1, wdt_regs + BCM476X_WDT_LOCK);
+	/* wait the bite */
+	udelay(400);
+}
+
 void __init bcm476x_init(void)
 {
 	int ret;
 
+	bcm476x_setup_restart();
 	bcm476x_init_clocks();
 
 	ret = of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
@@ -74,5 +139,6 @@ DT_MACHINE_START(BCM476X, "Broadcom BCM4
 	.handle_irq = vic_handle_irq,
 	.init_machine = bcm476x_init,
 	.timer = &bcm476x_timer,
+	.restart = bcm476x_restart,
 	.dt_compat = bcm476x_compat
 MACHINE_END
