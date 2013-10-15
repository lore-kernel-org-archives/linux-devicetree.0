From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 2/5] pinctrl: rockchip: add support for multiple bank types
Date: Wed, 16 Oct 2013 01:07:49 +0200
Message-ID: <201310160107.50032.heiko@sntech.de>
References: <201310160106.42329.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201310160106.42329.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are Rockchip SoCs, namely the rk3188, that combine a set of
regular banks with banks that need special handling for some settings.

Therefore add the possibility for the driver to handle more than one
bank type.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/pinctrl/pinctrl-rockchip.c |   17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index df155f9..efca116 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -62,6 +62,10 @@ enum rockchip_pinctrl_type {
 	RK3188,
 };
 
+enum rockchip_pin_bank_type {
+	COMMON_BANK,
+};
+
 /**
  * @reg_base: register base of the gpio bank
  * @clk: clock of the gpio bank
@@ -86,6 +90,7 @@ struct rockchip_pin_bank {
 	u8				nr_pins;
 	char				*name;
 	u8				bank_num;
+	enum rockchip_pin_bank_type	bank_type;
 	bool				valid;
 	struct device_node		*of_node;
 	struct rockchip_pinctrl		*drvdata;
@@ -668,7 +673,10 @@ static const struct pinconf_ops rockchip_pinconf_ops = {
 	.pin_config_set			= rockchip_pinconf_set,
 };
 
-static const char *gpio_compat = "rockchip,gpio-bank";
+static const struct of_device_id rockchip_bank_match[] = {
+	{ .compatible = "rockchip,gpio-bank" },
+	{},
+};
 
 static void rockchip_pinctrl_child_count(struct rockchip_pinctrl *info,
 						struct device_node *np)
@@ -676,7 +684,7 @@ static void rockchip_pinctrl_child_count(struct rockchip_pinctrl *info,
 	struct device_node *child;
 
 	for_each_child_of_node(np, child) {
-		if (of_device_is_compatible(child, gpio_compat))
+		if (of_match_node(rockchip_bank_match, child))
 			continue;
 
 		info->nfunctions++;
@@ -819,8 +827,9 @@ static int rockchip_pinctrl_parse_dt(struct platform_device *pdev,
 	i = 0;
 
 	for_each_child_of_node(np, child) {
-		if (of_device_is_compatible(child, gpio_compat))
+		if (of_match_node(rockchip_bank_match, child))
 			continue;
+
 		ret = rockchip_pinctrl_parse_functions(child, info, i++);
 		if (ret) {
 			dev_err(&pdev->dev, "failed to parse function\n");
@@ -1217,6 +1226,8 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank,
 	if (IS_ERR(bank->reg_base))
 		return PTR_ERR(bank->reg_base);
 
+	bank->bank_type = COMMON_BANK;
+
 	bank->irq = irq_of_parse_and_map(bank->of_node, 0);
 
 	bank->clk = of_clk_get(bank->of_node, 0);
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
