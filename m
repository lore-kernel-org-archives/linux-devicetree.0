From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 5/8] pinctrl: rockchip: only map bank0-pull-region when pmu regmap missing
Date: Wed, 30 Apr 2014 00:09:37 +0200
Message-ID: <24121820.5TgaR1mPMH@diego>
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

When the pmu registers are supplied through a syscon regmap we do not need
to map the registers ourself.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/pinctrl/pinctrl-rockchip.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 11ad643..d6e2401 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1464,21 +1464,29 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank,
 	 */
 	if (of_device_is_compatible(bank->of_node,
 				    "rockchip,rk3188-gpio-bank0")) {
+		struct device_node *node;
 
 		bank->bank_type = RK3188_BANK0;
 
-		if (of_address_to_resource(bank->of_node, 1, &res)) {
-			dev_err(info->dev, "cannot find IO resource for bank\n");
-			return -ENOENT;
-		}
+		node = of_parse_phandle(bank->of_node->parent,
+					"rockchip,pmu", 0);
+		if (!node) {
+			if (of_address_to_resource(bank->of_node, 1, &res)) {
+				dev_err(info->dev, "cannot find IO resource for bank\n");
+				return -ENOENT;
+			}
 
-		base = devm_ioremap_resource(info->dev, &res);
-		if (IS_ERR(base))
-			return PTR_ERR(base);
-		rockchip_regmap_config.max_register = resource_size(&res) - 4;
-		rockchip_regmap_config.name = "rockchip,rk3188-gpio-bank0-pull";
-		bank->regmap_pull = devm_regmap_init_mmio(info->dev, base,
-						  &rockchip_regmap_config);
+			base = devm_ioremap_resource(info->dev, &res);
+			if (IS_ERR(base))
+				return PTR_ERR(base);
+			rockchip_regmap_config.max_register =
+						    resource_size(&res) - 4;
+			rockchip_regmap_config.name =
+					    "rockchip,rk3188-gpio-bank0-pull";
+			bank->regmap_pull = devm_regmap_init_mmio(info->dev,
+						    base,
+						    &rockchip_regmap_config);
+		}
 
 	} else {
 		bank->bank_type = COMMON_BANK;
-- 
1.9.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
