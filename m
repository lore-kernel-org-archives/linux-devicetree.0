From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/2] pinctrl: Add drive strength support for BM1880 SoC
Date: Mon,  3 Jun 2019 13:04:21 +0530
Message-ID: <20190603073421.10314-2-manivannan.sadhasivam@linaro.org>
References: <20190603073421.10314-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603073421.10314-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, linux-gpio@vger.kernel.org, alec.lin@bitmain.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add drive strength support for Bitmain BM1880 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pinctrl/pinctrl-bm1880.c | 290 ++++++++++++++++++++++++++++++-
 1 file changed, 287 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-bm1880.c b/drivers/pinctrl/pinctrl-bm1880.c
index 1aaed46d5c30..63b130cb1ffb 100644
--- a/drivers/pinctrl/pinctrl-bm1880.c
+++ b/drivers/pinctrl/pinctrl-bm1880.c
@@ -4,8 +4,6 @@
  *
  * Copyright (c) 2019 Linaro Ltd.
  * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
- *
- * TODO: Drive strength support
  */
 
 #include <linux/io.h>
@@ -29,6 +27,7 @@
  * @ngroups:	Number of @groups
  * @funcs:	Pinmux functions
  * @nfuncs:	Number of @funcs
+ * @pconf:	Pinconf data
  */
 struct bm1880_pinctrl {
 	void __iomem *base;
@@ -37,6 +36,7 @@ struct bm1880_pinctrl {
 	unsigned int ngroups;
 	const struct bm1880_pinmux_function *funcs;
 	unsigned int nfuncs;
+	const struct bm1880_pinconf_data *pinconf;
 };
 
 /**
@@ -69,6 +69,14 @@ struct bm1880_pinmux_function {
 	u8 mux_shift;
 };
 
+/**
+ * struct bm1880_pinconf_data - pinconf data
+ * @drv_bits:	Drive strength bit width
+ */
+struct bm1880_pinconf_data {
+	u32 drv_bits;
+};
+
 static const struct pinctrl_pin_desc bm1880_pins[] = {
 	PINCTRL_PIN(0,   "MIO0"),
 	PINCTRL_PIN(1,   "MIO1"),
@@ -785,6 +793,126 @@ static const struct bm1880_pinmux_function bm1880_pmux_functions[] = {
 	BM1880_PINMUX_FUNCTION(spi0, 1),
 };
 
+#define BM1880_PINCONF_DAT(_width)		\
+	{					\
+		.drv_bits = _width,		\
+	}
+
+static const struct bm1880_pinconf_data bm1880_pinconf[] = {
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x03),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+	BM1880_PINCONF_DAT(0x02),
+};
+
 static int bm1880_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct bm1880_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
@@ -878,9 +1006,145 @@ static int bm1880_pinmux_set_mux(struct pinctrl_dev *pctldev,
 #define BM1880_PINCONF_PULLCTRL(pin)	BM1880_PINCONF(pin, 0)
 #define BM1880_PINCONF_PULLUP(pin)	BM1880_PINCONF(pin, 1)
 #define BM1880_PINCONF_PULLDOWN(pin)	BM1880_PINCONF(pin, 2)
+#define BM1880_PINCONF_DRV(pin)		BM1880_PINCONF(pin, 6)
 #define BM1880_PINCONF_SCHMITT(pin)	BM1880_PINCONF(pin, 9)
 #define BM1880_PINCONF_SLEW(pin)	BM1880_PINCONF(pin, 10)
 
+static int bm1880_pinconf_drv_set(unsigned int mA, u32 width,
+				  u32 *regval, u32 bit_offset)
+{
+	u32 _regval;
+
+	_regval = *regval;
+
+	/*
+	 * There are two sets of drive strength bit width exposed by the
+	 * SoC at 4mA step, hence we need to handle them separately.
+	 */
+	if (width == 0x03) {
+		switch (mA) {
+		case 4:
+			_regval &= ~(width << bit_offset);
+			_regval |= (0 << bit_offset);
+			break;
+		case 8:
+			_regval &= ~(width << bit_offset);
+			_regval |= (1 << bit_offset);
+			break;
+		case 12:
+			_regval &= ~(width << bit_offset);
+			_regval |= (2 << bit_offset);
+			break;
+		case 16:
+			_regval &= ~(width << bit_offset);
+			_regval |= (3 << bit_offset);
+			break;
+		case 20:
+			_regval &= ~(width << bit_offset);
+			_regval |= (4 << bit_offset);
+			break;
+		case 24:
+			_regval &= ~(width << bit_offset);
+			_regval |= (5 << bit_offset);
+			break;
+		case 28:
+			_regval &= ~(width << bit_offset);
+			_regval |= (6 << bit_offset);
+			break;
+		case 32:
+			_regval &= ~(width << bit_offset);
+			_regval |= (7 << bit_offset);
+			break;
+		default:
+			return -EINVAL;
+		}
+	} else {
+		switch (mA) {
+		case 4:
+			_regval &= ~(width << bit_offset);
+			_regval |= (0 << bit_offset);
+			break;
+		case 8:
+			_regval &= ~(width << bit_offset);
+			_regval |= (1 << bit_offset);
+			break;
+		case 12:
+			_regval &= ~(width << bit_offset);
+			_regval |= (2 << bit_offset);
+			break;
+		case 16:
+			_regval &= ~(width << bit_offset);
+			_regval |= (3 << bit_offset);
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	*regval = _regval;
+
+	return 0;
+}
+
+static int bm1880_pinconf_drv_get(u32 width, u32 drv)
+{
+	int ret = -ENOTSUPP;
+
+	/*
+	 * There are two sets of drive strength bit width exposed by the
+	 * SoC at 4mA step, hence we need to handle them separately.
+	 */
+	if (width == 0x03) {
+		switch (drv) {
+		case 0:
+			ret  = 4;
+			break;
+		case 1:
+			ret  = 8;
+			break;
+		case 2:
+			ret  = 12;
+			break;
+		case 3:
+			ret  = 16;
+			break;
+		case 4:
+			ret  = 20;
+			break;
+		case 5:
+			ret  = 24;
+			break;
+		case 6:
+			ret  = 28;
+			break;
+		case 7:
+			ret  = 32;
+			break;
+		default:
+			break;
+		}
+	} else {
+		switch (drv) {
+		case 0:
+			ret  = 4;
+			break;
+		case 1:
+			ret  = 8;
+			break;
+		case 2:
+			ret  = 12;
+			break;
+		case 3:
+			ret  = 16;
+			break;
+		default:
+			break;
+		}
+	}
+
+	return ret;
+}
+
 static int bm1880_pinconf_cfg_get(struct pinctrl_dev *pctldev,
 				  unsigned int pin,
 				  unsigned long *config)
@@ -889,6 +1153,7 @@ static int bm1880_pinconf_cfg_get(struct pinctrl_dev *pctldev,
 	unsigned int param = pinconf_to_config_param(*config);
 	unsigned int arg = 0;
 	u32 regval, offset, bit_offset;
+	int ret;
 
 	offset = (pin >> 1) << 2;
 	regval = readl_relaxed(pctrl->base + BM1880_REG_MUX + offset);
@@ -914,6 +1179,15 @@ static int bm1880_pinconf_cfg_get(struct pinctrl_dev *pctldev,
 		bit_offset = BM1880_PINCONF_SLEW(pin);
 		arg = !!(regval & BIT(bit_offset));
 		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		bit_offset = BM1880_PINCONF_DRV(pin);
+		ret = bm1880_pinconf_drv_get(pctrl->pinconf[pin].drv_bits,
+					     !!(regval & BIT(bit_offset)));
+		if (ret < 0)
+			return ret;
+
+		arg = ret;
+		break;
 	default:
 		return -ENOTSUPP;
 	}
@@ -930,7 +1204,7 @@ static int bm1880_pinconf_cfg_set(struct pinctrl_dev *pctldev,
 {
 	struct bm1880_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	u32 regval, offset, bit_offset;
-	int i;
+	int i, ret;
 
 	offset = (pin >> 1) << 2;
 	regval = readl_relaxed(pctrl->base + BM1880_REG_MUX + offset);
@@ -966,6 +1240,15 @@ static int bm1880_pinconf_cfg_set(struct pinctrl_dev *pctldev,
 			else
 				regval &= ~BIT(bit_offset);
 			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			bit_offset = BM1880_PINCONF_DRV(pin);
+			ret = bm1880_pinconf_drv_set(arg,
+						pctrl->pinconf[pin].drv_bits,
+						&regval, bit_offset);
+			if (ret < 0)
+				return ret;
+
+			break;
 		default:
 			dev_warn(pctldev->dev,
 				 "unsupported configuration parameter '%u'\n",
@@ -1041,6 +1324,7 @@ static int bm1880_pinctrl_probe(struct platform_device *pdev)
 	pctrl->ngroups = ARRAY_SIZE(bm1880_pctrl_groups);
 	pctrl->funcs = bm1880_pmux_functions;
 	pctrl->nfuncs = ARRAY_SIZE(bm1880_pmux_functions);
+	pctrl->pinconf = bm1880_pinconf;
 
 	pctrl->pctrldev = devm_pinctrl_register(&pdev->dev, &bm1880_desc,
 						pctrl);
-- 
2.17.1
