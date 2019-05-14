From: Guillaume La Roque <glaroque@baylibre.com>
Subject: [PATCH v6 4/6] pinctrl: meson: Rework enable/disable bias part
Date: Tue, 14 May 2019 10:26:50 +0200
Message-ID: <20190514082652.20686-5-glaroque@baylibre.com>
References: <20190514082652.20686-1-glaroque@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514082652.20686-1-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

rework bias enable/disable part to prepare drive-strength integration
no functional changes

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 85 +++++++++++++++------------
 1 file changed, 49 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 96a4a72708e4..8ea5c1527064 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -174,62 +174,75 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
 	return 0;
 }
 
-static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
-			     unsigned long *configs, unsigned num_configs)
+static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
+				      unsigned int pin)
 {
-	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
 	struct meson_bank *bank;
-	enum pin_config_param param;
-	unsigned int reg, bit;
-	int i, ret;
+	unsigned int reg, bit = 0;
+	int ret;
 
 	ret = meson_get_bank(pc, pin, &bank);
 	if (ret)
 		return ret;
 
+	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
+	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit), 0);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
+				     bool pull_up)
+{
+	struct meson_bank *bank;
+	unsigned int reg, bit, val = 0;
+	int ret;
+
+	ret = meson_get_bank(pc, pin, &bank);
+	if (ret)
+		return ret;
+
+	meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
+	if (pull_up)
+		val = BIT(bit);
+
+	ret = regmap_update_bits(pc->reg_pull, reg, BIT(bit), val);
+	if (ret)
+		return ret;
+
+	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
+	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit),	BIT(bit));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
+			     unsigned long *configs, unsigned num_configs)
+{
+	struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
+	enum pin_config_param param;
+	int i, ret;
+
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
 
 		switch (param) {
 		case PIN_CONFIG_BIAS_DISABLE:
-			dev_dbg(pc->dev, "pin %u: disable bias\n", pin);
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg,
-					       &bit);
-			ret = regmap_update_bits(pc->reg_pullen, reg,
-						 BIT(bit), 0);
+			ret = meson_pinconf_disable_bias(pc, pin);
 			if (ret)
 				return ret;
 			break;
 		case PIN_CONFIG_BIAS_PULL_UP:
-			dev_dbg(pc->dev, "pin %u: enable pull-up\n", pin);
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULLEN,
-					       &reg, &bit);
-			ret = regmap_update_bits(pc->reg_pullen, reg,
-						 BIT(bit), BIT(bit));
-			if (ret)
-				return ret;
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
-			ret = regmap_update_bits(pc->reg_pull, reg,
-						 BIT(bit), BIT(bit));
+			ret = meson_pinconf_enable_bias(pc, pin, true);
 			if (ret)
 				return ret;
 			break;
 		case PIN_CONFIG_BIAS_PULL_DOWN:
-			dev_dbg(pc->dev, "pin %u: enable pull-down\n", pin);
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULLEN,
-					       &reg, &bit);
-			ret = regmap_update_bits(pc->reg_pullen, reg,
-						 BIT(bit), BIT(bit));
-			if (ret)
-				return ret;
-
-			meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
-			ret = regmap_update_bits(pc->reg_pull, reg,
-						 BIT(bit), 0);
+			ret = meson_pinconf_enable_bias(pc, pin, false);
 			if (ret)
 				return ret;
 			break;
-- 
2.17.1
