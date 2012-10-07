From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/6] ARM: bcm476x: Add sched clock
Date: Sun, 07 Oct 2012 03:53:03 +0200
Message-ID: <20121007015406.809888002@gmail.com>
References: <20121007015300.828366635@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline; filename=arm-bcm476x-add-sched-clock.patch
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>

Sched clock implementation based on the BCM476x's free runner counter.

Signed-off-by: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/timer/brcm,bcm476x-sched-clock.txt |   18 +++
 arch/arm/boot/dts/bcm476x.dtsi                                       |    6 +
 drivers/clocksource/bcm476x_timer.c                                  |   52 ++++++++++
 3 files changed, 76 insertions(+)

Index: b/Documentation/devicetree/bindings/timer/brcm,bcm476x-sched-clock.txt
===================================================================
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/brcm,bcm476x-sched-clock.txt
@@ -0,0 +1,18 @@
+BCM476x Sched clock
+
+The BCM476x provides a 63-bit free running counter driven by a separate
+32KHz clock line.
+
+Required properties:
+
+- compatible : should be "brcm,bcm476x-sched-clock"
+- reg : Specifies base physical address and size of the registers.
+- clock-frequency : The frequency of the clock that drives the counter, in Hz.
+
+Example:
+
+sched-clock {
+	compatible = "brcm,bcm476x-sched-clock";
+	reg = <0xbc000 0x1000>;
+	clock-frequency = <32000>;
+};
Index: b/drivers/clocksource/bcm476x_timer.c
===================================================================
--- a/drivers/clocksource/bcm476x_timer.c
+++ b/drivers/clocksource/bcm476x_timer.c
@@ -54,6 +54,21 @@ struct bcm476x_timer {
 	struct irqaction act;
 };
 
+static void __iomem *system_clock __read_mostly;
+
+static u32 notrace bcm476x_sched_read(void)
+{
+	u32 hi, lo;
+
+	/* access to the counter must happen in the lo-hi order even if
+	 * only the lower 32-bit part is of interest
+	 */
+	lo = readl(system_clock);
+	hi = readl(system_clock + 4);
+
+	return lo;
+}
+
 static inline void __iomem *to_load(struct bcm476x_timer *timer)
 {
 	return timer->base + TIMER_LOAD_OFFSET;
@@ -131,6 +146,42 @@ static irqreturn_t bcm476x_timer_interru
 	return IRQ_HANDLED;
 }
 
+static struct of_device_id bcm476x_sched_clock_match[] __initconst = {
+	{ .compatible = "brcm,bcm476x-sched-clock" },
+	{}
+};
+
+static void __init bcm476x_sched_clock_init(void)
+{
+	struct device_node *node;
+	void __iomem *base;
+	u32 freq;
+
+	node = of_find_matching_node(NULL, bcm476x_sched_clock_match);
+	if (!node) {
+		pr_info("No bcm476x sched clock node");
+		return;
+	}
+
+	base = of_iomap(node, 0);
+	if (!base) {
+		pr_err("Can't remap sched clock registers");
+		return;
+	}
+
+	if (of_property_read_u32(node, "clock-frequency", &freq)) {
+		pr_err("Can't read sched clock frequency");
+		return;
+	}
+	if (freq != 32000) {
+		pr_err("Invalid sched clock frequency");
+		return;
+	}
+
+	system_clock = base;
+	setup_sched_clock(bcm476x_sched_read, 32, freq);
+}
+
 static struct of_device_id bcm476x_timer_match[] __initconst = {
 	{ .compatible = "brcm,bcm476x-system-timer" },
 	{}
@@ -180,6 +231,7 @@ static void __init bcm476x_timer_init(vo
 	if (setup_irq(irq, &timer->act))
 		panic("Can't set up timer IRQ\n");
 
+	bcm476x_sched_clock_init();
 	clockevents_config_and_register(&timer->evt, freq, 0xf, 0xffffffff);
 }
 
Index: b/arch/arm/boot/dts/bcm476x.dtsi
===================================================================
--- a/arch/arm/boot/dts/bcm476x.dtsi
+++ b/arch/arm/boot/dts/bcm476x.dtsi
@@ -22,6 +22,12 @@
 			clock-frequency = <24000000>;
 		};
 
+		sched-clock {
+			compatible = "brcm,bcm476x-sched-clock";
+			reg = <0xbc000 0x1000>;
+			clock-frequency = <32000>;
+		};
+
 		vic0: interrupt-controller@80000 {
 			compatible = "brcm,bcm476x-pl192", "arm,pl192-vic", "arm,primecell";
 			reg = <0x80000 0x1000>;
