From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 4/8] pinctrl: rockchip: let pmu registers be supplied by a syscon
Date: Wed, 30 Apr 2014 00:09:11 +0200
Message-ID: <6086196.jPOMaFDOnP@diego>
References: <1414506.B4e2jZujVm@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414506.B4e2jZujVm@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, max.schwarz-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Currently the pmu registers containing pin pull settings on the rk3188 are mapped
locally when bank0 is instantiated. Add an alternative that can resolve the pmu
from a syscon phandle.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/pinctrl/pinctrl-rockchip.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index b67771d..11ad643 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -38,6 +38,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/clk.h>
 #include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 #include "core.h"
@@ -164,6 +165,7 @@ struct rockchip_pinctrl {
 	struct regmap			*regmap_base;
 	int				reg_size;
 	struct regmap			*regmap_pull;
+	struct regmap			*regmap_pmu;
 	struct device			*dev;
 	struct rockchip_pin_ctrl	*ctrl;
 	struct pinctrl_desc		pctl;
@@ -438,6 +440,7 @@ static void rk2928_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 #define RK3188_PULL_BITS_PER_PIN	2
 #define RK3188_PULL_PINS_PER_REG	8
 #define RK3188_PULL_BANK_STRIDE		16
+#define RK3188_PULL_PMU_OFFSET		0x64
 
 static void rk3188_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 				    int pin_num, struct regmap **regmap,
@@ -447,8 +450,9 @@ static void rk3188_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 
 	/* The first 12 pins of the first bank are located elsewhere */
 	if (bank->bank_type == RK3188_BANK0 && pin_num < 12) {
-		*regmap = bank->regmap_pull;
-		*reg = 0;
+		*regmap = info->regmap_pmu ? info->regmap_pmu
+					   : bank->regmap_pull;
+		*reg = info->regmap_pmu ? RK3188_PULL_PMU_OFFSET : 0;
 		*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
 		*bit = pin_num % RK3188_PULL_PINS_PER_REG;
 		*bit *= RK3188_PULL_BITS_PER_PIN;
@@ -1539,6 +1543,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	struct rockchip_pinctrl *info;
 	struct device *dev = &pdev->dev;
 	struct rockchip_pin_ctrl *ctrl;
+	struct device_node *np = pdev->dev.of_node, *node;
 	struct resource *res;
 	void __iomem *base;
 	int ret;
@@ -1587,6 +1592,14 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 						  &rockchip_regmap_config);
 	}
 
+	/* try to find the optional reference to the pmu syscon */
+	node = of_parse_phandle(np, "rockchip,pmu", 0);
+	if (node) {
+		info->regmap_pmu = syscon_node_to_regmap(node);
+		if (IS_ERR(info->regmap_pmu))
+			return PTR_ERR(info->regmap_pmu);
+	}
+
 	ret = rockchip_gpiolib_register(pdev, info);
 	if (ret)
 		return ret;
-- 
1.9.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
