From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 3/8] pinctrl: rockchip: rockchip_pinctrl in rockchip_get_bank_data
Date: Mon, 05 May 2014 13:58:46 +0200
Message-ID: <1862780.XdYo0OxnPz@diego>
References: <11862890.WUjscWaP3U@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <11862890.WUjscWaP3U@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, max.schwarz-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Convert rockchip_get_bank_data to use the struct rockchip_pinctrl because
later on we need to check a value from it when registering the gpio banks.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Tested-by: Max Schwarz <max.schwarz-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org>
---
 drivers/pinctrl/pinctrl-rockchip.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 71d9c99..b67771d 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1440,17 +1440,17 @@ static int rockchip_gpiolib_unregister(struct platform_device *pdev,
 }
 
 static int rockchip_get_bank_data(struct rockchip_pin_bank *bank,
-				  struct device *dev)
+				  struct rockchip_pinctrl *info)
 {
 	struct resource res;
 	void __iomem *base;
 
 	if (of_address_to_resource(bank->of_node, 0, &res)) {
-		dev_err(dev, "cannot find IO resource for bank\n");
+		dev_err(info->dev, "cannot find IO resource for bank\n");
 		return -ENOENT;
 	}
 
-	bank->reg_base = devm_ioremap_resource(dev, &res);
+	bank->reg_base = devm_ioremap_resource(info->dev, &res);
 	if (IS_ERR(bank->reg_base))
 		return PTR_ERR(bank->reg_base);
 
@@ -1464,16 +1464,16 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank,
 		bank->bank_type = RK3188_BANK0;
 
 		if (of_address_to_resource(bank->of_node, 1, &res)) {
-			dev_err(dev, "cannot find IO resource for bank\n");
+			dev_err(info->dev, "cannot find IO resource for bank\n");
 			return -ENOENT;
 		}
 
-		base = devm_ioremap_resource(dev, &res);
+		base = devm_ioremap_resource(info->dev, &res);
 		if (IS_ERR(base))
 			return PTR_ERR(base);
 		rockchip_regmap_config.max_register = resource_size(&res) - 4;
 		rockchip_regmap_config.name = "rockchip,rk3188-gpio-bank0-pull";
-		bank->regmap_pull = devm_regmap_init_mmio(dev, base,
+		bank->regmap_pull = devm_regmap_init_mmio(info->dev, base,
 						  &rockchip_regmap_config);
 
 	} else {
@@ -1515,7 +1515,7 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 			if (!strcmp(bank->name, np->name)) {
 				bank->of_node = np;
 
-				if (!rockchip_get_bank_data(bank, &pdev->dev))
+				if (!rockchip_get_bank_data(bank, d))
 					bank->valid = true;
 
 				break;
@@ -1552,13 +1552,14 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
+	info->dev = dev;
+
 	ctrl = rockchip_pinctrl_get_soc_data(info, pdev);
 	if (!ctrl) {
 		dev_err(dev, "driver data not available\n");
 		return -EINVAL;
 	}
 	info->ctrl = ctrl;
-	info->dev = dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(&pdev->dev, res);
-- 
1.9.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
