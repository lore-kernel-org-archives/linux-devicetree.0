From: fenglinw@codeaurora.org
Subject: [PATCH V3 2/2] pinctrl: qcom: spmi-gpio: Add dtest route for digital input
Date: Tue, 15 Aug 2017 08:38:38 +0800
Message-ID: <20170815003918.8332-3-fenglinw@codeaurora.org>
References: <20170815003918.8332-1-fenglinw@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170815003918.8332-1-fenglinw@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: collinsd@codeaurora.org, aghayal@codeaurora.org, wruan@codeaurora.org, kgunda@codeaurora.org, Fenglin Wu <fenglinw@codeaurora.org>
List-Id: devicetree@vger.kernel.org

From: Fenglin Wu <fenglinw@codeaurora.org>

Add property "qcom,dtest-buffer" to specify which dtest rail to feed
when the pin is configured as a digital input.

Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |  7 +++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           | 50 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index d9d2054..f4cf24f 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -198,6 +198,13 @@ to specify in a pin configuration subnode:
 		    in analog-pass-through mode.
 		    Valid values are 1-4 corresponding to ATEST1 to ATEST4.
 
+- qcom,dtest-buffer:
+	Usage: optional
+	Value type: <u32>
+	Definition: Selects DTEST rail to route to GPIO when it's configured
+		    as digital input.
+		    Valid values are 1-4 corresponding to DTEST1 to DTEST4.
+
 Example:
 
 	pm8921_gpio: gpio@150 {
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 6b21832..73ce2b5 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -51,6 +51,7 @@
 #define PMIC_GPIO_REG_DIG_VIN_CTL		0x41
 #define PMIC_GPIO_REG_DIG_PULL_CTL		0x42
 #define PMIC_GPIO_REG_LV_MV_DIG_OUT_SOURCE_CTL	0x44
+#define PMIC_GPIO_REG_DIG_IN_CTL		0x43
 #define PMIC_GPIO_REG_DIG_OUT_CTL		0x45
 #define PMIC_GPIO_REG_EN_CTL			0x46
 #define PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU_SEL	0x4A
@@ -84,6 +85,11 @@
 #define PMIC_GPIO_LV_MV_OUTPUT_INVERT_SHIFT	7
 #define PMIC_GPIO_LV_MV_OUTPUT_SOURCE_SEL_MASK	0xF
 
+/* PMIC_GPIO_REG_DIG_IN_CTL */
+#define PMIC_GPIO_LV_MV_DIG_IN_DTEST_EN		0x80
+#define PMIC_GPIO_LV_MV_DIG_IN_DTEST_SEL_MASK	0x7
+#define PMIC_GPIO_DIG_IN_DTEST_SEL_MASK		0xf
+
 /* PMIC_GPIO_REG_DIG_OUT_CTL */
 #define PMIC_GPIO_REG_OUT_STRENGTH_SHIFT	0
 #define PMIC_GPIO_REG_OUT_STRENGTH_MASK		0x3
@@ -111,6 +117,7 @@
 #define PMIC_GPIO_CONF_STRENGTH			(PIN_CONFIG_END + 2)
 #define PMIC_GPIO_CONF_ATEST			(PIN_CONFIG_END + 3)
 #define PMIC_GPIO_CONF_ANALOG_PASS		(PIN_CONFIG_END + 4)
+#define PMIC_GPIO_CONF_DTEST_BUFFER		(PIN_CONFIG_END + 5)
 
 /* The index of each function in pmic_gpio_functions[] array */
 enum pmic_gpio_func_index {
@@ -145,6 +152,7 @@ enum pmic_gpio_func_index {
  * @strength: No, Low, Medium, High
  * @function: See pmic_gpio_functions[]
  * @atest: the ATEST selection for GPIO analog-pass-through mode
+ * @dtest_buffer: the DTEST buffer selection for digital input mode.
  */
 struct pmic_gpio_pad {
 	u16		base;
@@ -163,6 +171,7 @@ struct pmic_gpio_pad {
 	unsigned int	strength;
 	unsigned int	function;
 	unsigned int	atest;
+	unsigned int	dtest_buffer;
 };
 
 struct pmic_gpio_state {
@@ -177,6 +186,7 @@ struct pmic_gpio_state {
 	{"qcom,drive-strength",		PMIC_GPIO_CONF_STRENGTH,	0},
 	{"qcom,atest",			PMIC_GPIO_CONF_ATEST,		0},
 	{"qcom,analog-pass",		PMIC_GPIO_CONF_ANALOG_PASS,	0},
+	{"qcom,dtest-buffer",           PMIC_GPIO_CONF_DTEST_BUFFER,    0},
 };
 
 #ifdef CONFIG_DEBUG_FS
@@ -185,6 +195,7 @@ struct pmic_gpio_state {
 	PCONFDUMP(PMIC_GPIO_CONF_STRENGTH, "drive-strength", NULL, true),
 	PCONFDUMP(PMIC_GPIO_CONF_ATEST, "atest", NULL, true),
 	PCONFDUMP(PMIC_GPIO_CONF_ANALOG_PASS, "analog-pass", NULL, true),
+	PCONFDUMP(PMIC_GPIO_CONF_DTEST_BUFFER, "dtest-buffer", NULL, true),
 };
 #endif
 
@@ -420,6 +431,9 @@ static int pmic_gpio_config_get(struct pinctrl_dev *pctldev,
 	case PMIC_GPIO_CONF_ANALOG_PASS:
 		arg = pad->analog_pass;
 		break;
+	case PMIC_GPIO_CONF_DTEST_BUFFER:
+		arg = pad->dtest_buffer;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -504,6 +518,11 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				return -EINVAL;
 			pad->analog_pass = true;
 			break;
+		case PMIC_GPIO_CONF_DTEST_BUFFER:
+			if (arg > 4)
+				return -EINVAL;
+			pad->dtest_buffer = arg;
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -528,6 +547,20 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	if (ret < 0)
 		return ret;
 
+	if (pad->dtest_buffer == 0) {
+		val = 0;
+	} else {
+		if (pad->lv_mv_type) {
+			val = pad->dtest_buffer - 1;
+			val |= PMIC_GPIO_LV_MV_DIG_IN_DTEST_EN;
+		} else {
+			val = BIT(pad->dtest_buffer - 1);
+		}
+	}
+	ret = pmic_gpio_write(state, pad, PMIC_GPIO_REG_DIG_IN_CTL, val);
+	if (ret < 0)
+		return ret;
+
 	if (pad->analog_pass)
 		val = PMIC_GPIO_MODE_ANALOG_PASS_THRU;
 	else if (pad->output_enabled && pad->input_enabled)
@@ -627,6 +660,7 @@ static void pmic_gpio_config_dbg_show(struct pinctrl_dev *pctldev,
 		seq_printf(s, " %-4s", pad->out_value ? "high" : "low");
 		seq_printf(s, " %-7s", strengths[pad->strength]);
 		seq_printf(s, " atest-%d", pad->atest);
+		seq_printf(s, " dtest-%d", pad->dtest_buffer);
 	}
 }
 
@@ -845,6 +879,22 @@ static int pmic_gpio_populate(struct pmic_gpio_state *state,
 	pad->pullup = val >> PMIC_GPIO_REG_PULL_SHIFT;
 	pad->pullup &= PMIC_GPIO_REG_PULL_MASK;
 
+	val = pmic_gpio_read(state, pad, PMIC_GPIO_REG_DIG_IN_CTL);
+	if (val < 0)
+		return val;
+
+	if (pad->lv_mv_type && (val & PMIC_GPIO_LV_MV_DIG_IN_DTEST_EN))
+		pad->dtest_buffer =
+			(val & PMIC_GPIO_LV_MV_DIG_IN_DTEST_SEL_MASK) + 1;
+	else if (!pad->lv_mv_type)
+		pad->dtest_buffer = ffs(val);
+	else
+		pad->dtest_buffer = 0;
+
+	val = pmic_gpio_read(state, pad, PMIC_GPIO_REG_DIG_OUT_CTL);
+	if (val < 0)
+		return val;
+
 	pad->strength = val >> PMIC_GPIO_REG_OUT_STRENGTH_SHIFT;
 	pad->strength &= PMIC_GPIO_REG_OUT_STRENGTH_MASK;
 
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
