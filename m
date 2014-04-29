From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 6/8] pinctrl: rockchip: base regmap supplied by a syscon
Date: Wed, 30 Apr 2014 00:10 +0200
Message-ID: <13326411.cf8qxmfeZW@diego>
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

This allows the basic registers of the general register files to be supplied
by a syscon instead of being mapped locally.

The GRF registers contain a lot more than pinctrl functions like dma, usb-phy
and general soc control and status registers, intermixed with the iomux, pull
and drive-strength registers.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/pinctrl/pinctrl-rockchip.c | 47 +++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index d6e2401..bb805d5 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1574,30 +1574,39 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	}
 	info->ctrl = ctrl;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	rockchip_regmap_config.max_register = resource_size(res) - 4;
-	rockchip_regmap_config.name = "rockchip,pinctrl";
-	info->regmap_base = devm_regmap_init_mmio(&pdev->dev, base,
-						  &rockchip_regmap_config);
-
-	/* to check for the old dt-bindings */
-	info->reg_size = resource_size(res);
-
-	/* Honor the old binding, with pull registers as 2nd resource */
-	if (ctrl->type == RK3188 && info->reg_size < 0x200) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	node = of_parse_phandle(np, "rockchip,grf", 0);
+	if (node) {
+		info->regmap_base = syscon_node_to_regmap(node);
+		if (IS_ERR(info->regmap_base))
+			return PTR_ERR(info->regmap_base);
+	} else {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 		base = devm_ioremap_resource(&pdev->dev, res);
 		if (IS_ERR(base))
 			return PTR_ERR(base);
 
 		rockchip_regmap_config.max_register = resource_size(res) - 4;
-		rockchip_regmap_config.name = "rockchip,pinctrl-pull";
-		info->regmap_pull = devm_regmap_init_mmio(&pdev->dev, base,
-						  &rockchip_regmap_config);
+		rockchip_regmap_config.name = "rockchip,pinctrl";
+		info->regmap_base = devm_regmap_init_mmio(&pdev->dev, base,
+						    &rockchip_regmap_config);
+
+		/* to check for the old dt-bindings */
+		info->reg_size = resource_size(res);
+
+		/* Honor the old binding, with pull registers as 2nd resource */
+		if (ctrl->type == RK3188 && info->reg_size < 0x200) {
+			res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+			base = devm_ioremap_resource(&pdev->dev, res);
+			if (IS_ERR(base))
+				return PTR_ERR(base);
+
+			rockchip_regmap_config.max_register =
+							resource_size(res) - 4;
+			rockchip_regmap_config.name = "rockchip,pinctrl-pull";
+			info->regmap_pull = devm_regmap_init_mmio(&pdev->dev,
+						    base,
+						    &rockchip_regmap_config);
+		}
 	}
 
 	/* try to find the optional reference to the pmu syscon */
-- 
1.9.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
