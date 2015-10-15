From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 03/13] irqchips: fix ARM11MPCore GIC bindings
Date: Thu, 15 Oct 2015 15:46:43 +0200
Message-ID: <1444916813-31024-4-git-send-email-linus.walleij@linaro.org>
References: <1444916813-31024-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444916813-31024-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The GIC bindings for the ARM11MPCore need to differentiate between
the GIC on the Test Chip and the one on the evaluation baseboard.
Split the binding in two and define new compatible-strings.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/gic.txt | 3 ++-
 drivers/irqchip/irq-gic.c                     | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/gic.txt b/Documentation/devicetree/bindings/arm/gic.txt
index 2da059a4790c..a5445622c216 100644
--- a/Documentation/devicetree/bindings/arm/gic.txt
+++ b/Documentation/devicetree/bindings/arm/gic.txt
@@ -15,7 +15,8 @@ Main node required properties:
 	"arm,cortex-a15-gic"
 	"arm,cortex-a9-gic"
 	"arm,cortex-a7-gic"
-	"arm,arm11mp-gic"
+	"arm,tc11mp-gic"
+	"arm,pb11mp-gic"
 	"brcm,brahma-b15-gic"
 	"arm,arm1176jzf-devchip-gic"
 	"qcom,msm-8660-qgic"
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 982c09c2d791..5376d1cb0a4f 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -1184,7 +1184,8 @@ gic_of_init(struct device_node *node, struct device_node *parent)
 	return 0;
 }
 IRQCHIP_DECLARE(gic_400, "arm,gic-400", gic_of_init);
-IRQCHIP_DECLARE(arm11mp_gic, "arm,arm11mp-gic", gic_of_init);
+IRQCHIP_DECLARE(armtc11mp_gic, "arm,tc11mp-gic", gic_of_init);
+IRQCHIP_DECLARE(armpb11mp_gic, "arm,pb11mp-gic", gic_of_init);
 IRQCHIP_DECLARE(arm1176jzf_dc_gic, "arm,arm1176jzf-devchip-gic", gic_of_init);
 IRQCHIP_DECLARE(cortex_a15_gic, "arm,cortex-a15-gic", gic_of_init);
 IRQCHIP_DECLARE(cortex_a9_gic, "arm,cortex-a9-gic", gic_of_init);
-- 
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
