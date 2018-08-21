From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 5/8] pinctrl: ingenic: Implement .get_direction for GPIO chips
Date: Tue, 21 Aug 2018 18:42:33 +0200
Message-ID: <20180821164236.21101-6-paul@crapouillou.net>
References: <20180821164236.21101-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180821164236.21101-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: od@zcrc.me, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

This allows to read from debugfs whether the GPIOs requested are set as
input or output.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: No change

 drivers/pinctrl/pinctrl-ingenic.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 75115733144e..f4aa7d4529e8 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -699,6 +699,21 @@ static inline bool ingenic_get_pin_config(struct ingenic_pinctrl *jzpc,
 	return val & BIT(idx);
 }
 
+static int ingenic_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct ingenic_gpio_chip *jzgc = gpiochip_get_data(gc);
+	struct ingenic_pinctrl *jzpc = jzgc->jzpc;
+	unsigned int pin = gc->base + offset;
+
+	if (jzpc->version >= ID_JZ4770)
+		return ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PAT1);
+
+	if (ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_SELECT))
+		return true;
+
+	return !ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_DIR);
+}
+
 static const struct pinctrl_ops ingenic_pctlops = {
 	.get_groups_count = pinctrl_generic_get_group_count,
 	.get_group_name = pinctrl_generic_get_group_name,
@@ -1003,6 +1018,7 @@ static int __init ingenic_gpio_probe(struct ingenic_pinctrl *jzpc,
 	jzgc->gc.get = ingenic_gpio_get;
 	jzgc->gc.direction_input = ingenic_gpio_direction_input;
 	jzgc->gc.direction_output = ingenic_gpio_direction_output;
+	jzgc->gc.get_direction = ingenic_gpio_get_direction;
 
 	if (of_property_read_bool(node, "gpio-ranges")) {
 		jzgc->gc.request = gpiochip_generic_request;
-- 
2.11.0
