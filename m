From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 5/5] pinctrl: Add pinconf support for BM1880 SoC
Date: Mon, 20 May 2019 14:01:01 +0530
Message-ID: <20190520083101.10229-6-manivannan.sadhasivam@linaro.org>
References: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, linux-gpio@vger.kernel.org, alec.lin@bitmain.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add pinconf support for Bitmain BM1880 SoC. Pinconf support includes
pin bias, slew rate and schmitt trigger. Drive strength support will
be added later.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pinctrl/pinctrl-bm1880.c | 134 +++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-bm1880.c b/drivers/pinctrl/pinctrl-bm1880.c
index bddb705ea142..1aaed46d5c30 100644
--- a/drivers/pinctrl/pinctrl-bm1880.c
+++ b/drivers/pinctrl/pinctrl-bm1880.c
@@ -4,6 +4,8 @@
  *
  * Copyright (c) 2019 Linaro Ltd.
  * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ *
+ * TODO: Drive strength support
  */
 
 #include <linux/io.h>
@@ -872,6 +874,137 @@ static int bm1880_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+#define BM1880_PINCONF(pin, idx) ((!((pin + 1) & 1) << 4) + idx)
+#define BM1880_PINCONF_PULLCTRL(pin)	BM1880_PINCONF(pin, 0)
+#define BM1880_PINCONF_PULLUP(pin)	BM1880_PINCONF(pin, 1)
+#define BM1880_PINCONF_PULLDOWN(pin)	BM1880_PINCONF(pin, 2)
+#define BM1880_PINCONF_SCHMITT(pin)	BM1880_PINCONF(pin, 9)
+#define BM1880_PINCONF_SLEW(pin)	BM1880_PINCONF(pin, 10)
+
+static int bm1880_pinconf_cfg_get(struct pinctrl_dev *pctldev,
+				  unsigned int pin,
+				  unsigned long *config)
+{
+	struct bm1880_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int param = pinconf_to_config_param(*config);
+	unsigned int arg = 0;
+	u32 regval, offset, bit_offset;
+
+	offset = (pin >> 1) << 2;
+	regval = readl_relaxed(pctrl->base + BM1880_REG_MUX + offset);
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_PULL_UP:
+		bit_offset = BM1880_PINCONF_PULLUP(pin);
+		arg = !!(regval & BIT(bit_offset));
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		bit_offset = BM1880_PINCONF_PULLDOWN(pin);
+		arg = !!(regval & BIT(bit_offset));
+		break;
+	case PIN_CONFIG_BIAS_DISABLE:
+		bit_offset = BM1880_PINCONF_PULLCTRL(pin);
+		arg = !!(regval & BIT(bit_offset));
+		break;
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		bit_offset = BM1880_PINCONF_SCHMITT(pin);
+		arg = !!(regval & BIT(bit_offset));
+		break;
+	case PIN_CONFIG_SLEW_RATE:
+		bit_offset = BM1880_PINCONF_SLEW(pin);
+		arg = !!(regval & BIT(bit_offset));
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return 0;
+}
+
+static int bm1880_pinconf_cfg_set(struct pinctrl_dev *pctldev,
+				  unsigned int pin,
+				  unsigned long *configs,
+				  unsigned int num_configs)
+{
+	struct bm1880_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	u32 regval, offset, bit_offset;
+	int i;
+
+	offset = (pin >> 1) << 2;
+	regval = readl_relaxed(pctrl->base + BM1880_REG_MUX + offset);
+
+	for (i = 0; i < num_configs; i++) {
+		unsigned int param = pinconf_to_config_param(configs[i]);
+		unsigned int arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_PULL_UP:
+			bit_offset = BM1880_PINCONF_PULLUP(pin);
+			regval |= BIT(bit_offset);
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			bit_offset = BM1880_PINCONF_PULLDOWN(pin);
+			regval |= BIT(bit_offset);
+			break;
+		case PIN_CONFIG_BIAS_DISABLE:
+			bit_offset = BM1880_PINCONF_PULLCTRL(pin);
+			regval |= BIT(bit_offset);
+			break;
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			bit_offset = BM1880_PINCONF_SCHMITT(pin);
+			if (arg)
+				regval |= BIT(bit_offset);
+			else
+				regval &= ~BIT(bit_offset);
+			break;
+		case PIN_CONFIG_SLEW_RATE:
+			bit_offset = BM1880_PINCONF_SLEW(pin);
+			if (arg)
+				regval |= BIT(bit_offset);
+			else
+				regval &= ~BIT(bit_offset);
+			break;
+		default:
+			dev_warn(pctldev->dev,
+				 "unsupported configuration parameter '%u'\n",
+				 param);
+			continue;
+		}
+
+		writel_relaxed(regval, pctrl->base + BM1880_REG_MUX + offset);
+	}
+
+	return 0;
+}
+
+static int bm1880_pinconf_group_set(struct pinctrl_dev *pctldev,
+				    unsigned int selector,
+				    unsigned long *configs,
+				    unsigned int  num_configs)
+{
+	int i, ret;
+	struct bm1880_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct bm1880_pctrl_group *pgrp = &pctrl->groups[selector];
+
+	for (i = 0; i < pgrp->npins; i++) {
+		ret = bm1880_pinconf_cfg_set(pctldev, pgrp->pins[i], configs,
+					     num_configs);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct pinconf_ops bm1880_pinconf_ops = {
+	.is_generic = true,
+	.pin_config_get = bm1880_pinconf_cfg_get,
+	.pin_config_set = bm1880_pinconf_cfg_set,
+	.pin_config_group_set = bm1880_pinconf_group_set,
+};
+
 static const struct pinmux_ops bm1880_pinmux_ops = {
 	.get_functions_count = bm1880_pmux_get_functions_count,
 	.get_function_name = bm1880_pmux_get_function_name,
@@ -885,6 +1018,7 @@ static struct pinctrl_desc bm1880_desc = {
 	.npins = ARRAY_SIZE(bm1880_pins),
 	.pctlops = &bm1880_pctrl_ops,
 	.pmxops = &bm1880_pinmux_ops,
+	.confops = &bm1880_pinconf_ops,
 	.owner = THIS_MODULE,
 };
 
-- 
2.17.1
