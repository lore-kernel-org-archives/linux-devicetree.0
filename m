From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3 v2] irqchip: gic/realview: support more RealView DCC variants
Date: Mon, 22 Feb 2016 15:01:01 +0100
Message-ID: <1456149661-19118-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In the add-on file for the GIC dealing with the RealView family
we currently only handle the PB11MPCore, let's extend this to
manage the RealView EB ARM11MPCore as well. The Revision B of the
ARM11MPCore core tile is a bit special and needs special handling
as it moves a system control register around at random.

Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
ChangeLog v1->v2:
- Detect syscon register location based on the syscon compatible
  string instead of the GIC compatible string, just define one
  compatible string for the 11mp test chip GIC.
- Consistently return -ENODEV
This can be applied in isolation from the other patches so Marc
one you're happy with it, please take it into the IRQchip tree.
---
 .../bindings/interrupt-controller/arm,gic.txt      |  1 +
 drivers/irqchip/irq-gic-realview.c                 | 44 +++++++++++++++++++---
 2 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
index 5a1cb4bc3dfe..793c20ff8fcc 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
@@ -16,6 +16,7 @@ Main node required properties:
 	"arm,cortex-a15-gic"
 	"arm,cortex-a7-gic"
 	"arm,cortex-a9-gic"
+	"arm,eb11mp-gic"
 	"arm,gic-400"
 	"arm,pl390"
 	"arm,tc11mp-gic"
diff --git a/drivers/irqchip/irq-gic-realview.c b/drivers/irqchip/irq-gic-realview.c
index aa46eb280a7f..54c296401525 100644
--- a/drivers/irqchip/irq-gic-realview.c
+++ b/drivers/irqchip/irq-gic-realview.c
@@ -10,7 +10,8 @@
 #include <linux/irqchip/arm-gic.h>
 
 #define REALVIEW_SYS_LOCK_OFFSET	0x20
-#define REALVIEW_PB11MP_SYS_PLD_CTRL1	0x74
+#define REALVIEW_SYS_PLD_CTRL1		0x74
+#define REALVIEW_EB_REVB_SYS_PLD_CTRL1	0xD8
 #define VERSATILE_LOCK_VAL		0xA05F
 #define PLD_INTMODE_MASK		BIT(22)|BIT(23)|BIT(24)
 #define PLD_INTMODE_LEGACY		0x0
@@ -18,26 +19,57 @@
 #define PLD_INTMODE_NEW_NO_DCC		BIT(23)
 #define PLD_INTMODE_FIQ_ENABLE		BIT(24)
 
+/* For some reason RealView EB Rev B moved this register */
+static const struct of_device_id syscon_pldset_of_match[] = {
+	{
+		.compatible = "arm,realview-eb11mp-revb-syscon",
+		.data = (void *)REALVIEW_EB_REVB_SYS_PLD_CTRL1,
+	},
+	{
+		.compatible = "arm,realview-eb11mp-revc-syscon",
+		.data = (void *)REALVIEW_SYS_PLD_CTRL1,
+	},
+	{
+		.compatible = "arm,realview-eb-syscon",
+		.data = (void *)REALVIEW_SYS_PLD_CTRL1,
+	},
+	{
+		.compatible = "arm,realview-pb11mp-syscon",
+		.data = (void *)REALVIEW_SYS_PLD_CTRL1,
+	},
+	{},
+};
+
 static int __init
 realview_gic_of_init(struct device_node *node, struct device_node *parent)
 {
 	static struct regmap *map;
+	struct device_node *np;
+	const struct of_device_id *gic_id;
+	u32 pld1_ctrl;
+
+	np = of_find_matching_node_and_match(NULL, syscon_pldset_of_match,
+					     &gic_id);
+	if (!np)
+		return -ENODEV;
+	pld1_ctrl = (u32)gic_id->data;
 
 	/* The PB11MPCore GIC needs to be configured in the syscon */
-	map = syscon_regmap_lookup_by_compatible("arm,realview-pb11mp-syscon");
+	map = syscon_node_to_regmap(np);
 	if (!IS_ERR(map)) {
 		/* new irq mode with no DCC */
 		regmap_write(map, REALVIEW_SYS_LOCK_OFFSET,
 			     VERSATILE_LOCK_VAL);
-		regmap_update_bits(map, REALVIEW_PB11MP_SYS_PLD_CTRL1,
+		regmap_update_bits(map, pld1_ctrl,
 				   PLD_INTMODE_NEW_NO_DCC,
 				   PLD_INTMODE_MASK);
 		regmap_write(map, REALVIEW_SYS_LOCK_OFFSET, 0x0000);
-		pr_info("TC11MP GIC: set up interrupt controller to NEW mode, no DCC\n");
+		pr_info("RealView GIC: set up interrupt controller to NEW mode, no DCC\n");
 	} else {
-		pr_err("TC11MP GIC setup: could not find syscon\n");
-		return -ENXIO;
+		pr_err("RealView GIC setup: could not find syscon\n");
+		return -ENODEV;
 	}
 	return gic_of_init(node, parent);
 }
 IRQCHIP_DECLARE(armtc11mp_gic, "arm,tc11mp-gic", realview_gic_of_init);
+IRQCHIP_DECLARE(armeb11mp_gic, "arm,eb11mp-gic", realview_gic_of_init);
-- 
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
