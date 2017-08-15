From: fenglinw@codeaurora.org
Subject: [PATCH V3 1/2] pinctrl: qcom: spmi-gpio: Add support for GPIO LV/MV subtype
Date: Tue, 15 Aug 2017 08:38:37 +0800
Message-ID: <20170815003918.8332-2-fenglinw@codeaurora.org>
References: <20170815003918.8332-1-fenglinw@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170815003918.8332-1-fenglinw@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Fenglin Wu <fenglinw@codeaurora.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: collinsd@codeaurora.org, aghayal@codeaurora.org, wruan@codeaurora.org, kgunda@codeaurora.org
List-Id: devicetree@vger.kernel.org

From: Fenglin Wu <fenglinw@codeaurora.org>

GPIO LV (low voltage)/MV (medium voltage) subtypes have different
features and register mappings than 4CH/8CH subtypes. Add support
for LV and MV subtypes.

Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |  17 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           | 281 +++++++++++++++++----
 include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |   2 +
 3 files changed, 250 insertions(+), 50 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 8d893a8..d9d2054 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -98,7 +98,10 @@ to specify in a pin configuration subnode:
 		    "dtest1",
 		    "dtest2",
 		    "dtest3",
-		    "dtest4"
+		    "dtest4",
+		    And following values are supported by LV/MV GPIO subtypes:
+		    "func3",
+		    "func4"
 
 - bias-disable:
 	Usage: optional
@@ -183,6 +186,18 @@ to specify in a pin configuration subnode:
 	Value type: <none>
 	Definition: The specified pins are configured in open-source mode.
 
+- qcom,analog-pass:
+	Usage: optional
+	Value type: <none>
+	Definition: The specified pins are configured in analog-pass-through mode.
+
+- qcom,atest:
+	Usage: optional
+	Value type: <u32>
+	Definition: Selects ATEST rail to route to GPIO when it's configured
+		    in analog-pass-through mode.
+		    Valid values are 1-4 corresponding to ATEST1 to ATEST4.
+
 Example:
 
 	pm8921_gpio: gpio@150 {
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 664b641..6b21832 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -40,6 +40,8 @@
 #define PMIC_GPIO_SUBTYPE_GPIOC_4CH		0x5
 #define PMIC_GPIO_SUBTYPE_GPIO_8CH		0x9
 #define PMIC_GPIO_SUBTYPE_GPIOC_8CH		0xd
+#define PMIC_GPIO_SUBTYPE_GPIO_LV		0x10
+#define PMIC_GPIO_SUBTYPE_GPIO_MV		0x11
 
 #define PMIC_MPP_REG_RT_STS			0x10
 #define PMIC_MPP_REG_RT_STS_VAL_MASK		0x1
@@ -48,8 +50,10 @@
 #define PMIC_GPIO_REG_MODE_CTL			0x40
 #define PMIC_GPIO_REG_DIG_VIN_CTL		0x41
 #define PMIC_GPIO_REG_DIG_PULL_CTL		0x42
+#define PMIC_GPIO_REG_LV_MV_DIG_OUT_SOURCE_CTL	0x44
 #define PMIC_GPIO_REG_DIG_OUT_CTL		0x45
 #define PMIC_GPIO_REG_EN_CTL			0x46
+#define PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU_SEL	0x4A
 
 /* PMIC_GPIO_REG_MODE_CTL */
 #define PMIC_GPIO_REG_MODE_VALUE_SHIFT		0x1
@@ -58,6 +62,12 @@
 #define PMIC_GPIO_REG_MODE_DIR_SHIFT		4
 #define PMIC_GPIO_REG_MODE_DIR_MASK		0x7
 
+#define PMIC_GPIO_MODE_DIGITAL_INPUT		0
+#define PMIC_GPIO_MODE_DIGITAL_OUTPUT		1
+#define PMIC_GPIO_MODE_DIGITAL_INPUT_OUTPUT	2
+#define PMIC_GPIO_MODE_ANALOG_PASS_THRU		3
+#define PMIC_GPIO_REG_LV_MV_MODE_DIR_MASK	0x3
+
 /* PMIC_GPIO_REG_DIG_VIN_CTL */
 #define PMIC_GPIO_REG_VIN_SHIFT			0
 #define PMIC_GPIO_REG_VIN_MASK			0x7
@@ -69,6 +79,11 @@
 #define PMIC_GPIO_PULL_DOWN			4
 #define PMIC_GPIO_PULL_DISABLE			5
 
+/* PMIC_GPIO_REG_LV_MV_DIG_OUT_SOURCE_CTL for LV/MV */
+#define PMIC_GPIO_LV_MV_OUTPUT_INVERT		0x80
+#define PMIC_GPIO_LV_MV_OUTPUT_INVERT_SHIFT	7
+#define PMIC_GPIO_LV_MV_OUTPUT_SOURCE_SEL_MASK	0xF
+
 /* PMIC_GPIO_REG_DIG_OUT_CTL */
 #define PMIC_GPIO_REG_OUT_STRENGTH_SHIFT	0
 #define PMIC_GPIO_REG_OUT_STRENGTH_MASK		0x3
@@ -88,9 +103,28 @@
 
 #define PMIC_GPIO_PHYSICAL_OFFSET		1
 
+/* PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU_SEL */
+#define PMIC_GPIO_LV_MV_ANA_MUX_SEL_MASK		0x3
+
 /* Qualcomm specific pin configurations */
 #define PMIC_GPIO_CONF_PULL_UP			(PIN_CONFIG_END + 1)
 #define PMIC_GPIO_CONF_STRENGTH			(PIN_CONFIG_END + 2)
+#define PMIC_GPIO_CONF_ATEST			(PIN_CONFIG_END + 3)
+#define PMIC_GPIO_CONF_ANALOG_PASS		(PIN_CONFIG_END + 4)
+
+/* The index of each function in pmic_gpio_functions[] array */
+enum pmic_gpio_func_index {
+	PMIC_GPIO_FUNC_INDEX_NORMAL,
+	PMIC_GPIO_FUNC_INDEX_PAIRED,
+	PMIC_GPIO_FUNC_INDEX_FUNC1,
+	PMIC_GPIO_FUNC_INDEX_FUNC2,
+	PMIC_GPIO_FUNC_INDEX_FUNC3,
+	PMIC_GPIO_FUNC_INDEX_FUNC4,
+	PMIC_GPIO_FUNC_INDEX_DTEST1,
+	PMIC_GPIO_FUNC_INDEX_DTEST2,
+	PMIC_GPIO_FUNC_INDEX_DTEST3,
+	PMIC_GPIO_FUNC_INDEX_DTEST4,
+};
 
 /**
  * struct pmic_gpio_pad - keep current GPIO settings
@@ -102,12 +136,15 @@
  *	open-drain or open-source mode.
  * @output_enabled: Set to true if GPIO output logic is enabled.
  * @input_enabled: Set to true if GPIO input buffer logic is enabled.
+ * @analog_pass: Set to true if GPIO is in analog-pass-through mode.
+ * @lv_mv_type: Set to true if GPIO subtype is GPIO_LV(0x10) or GPIO_MV(0x11).
  * @num_sources: Number of power-sources supported by this GPIO.
  * @power_source: Current power-source used.
  * @buffer_type: Push-pull, open-drain or open-source.
  * @pullup: Constant current which flow trough GPIO output buffer.
  * @strength: No, Low, Medium, High
  * @function: See pmic_gpio_functions[]
+ * @atest: the ATEST selection for GPIO analog-pass-through mode
  */
 struct pmic_gpio_pad {
 	u16		base;
@@ -117,12 +154,15 @@ struct pmic_gpio_pad {
 	bool		have_buffer;
 	bool		output_enabled;
 	bool		input_enabled;
+	bool		analog_pass;
+	bool		lv_mv_type;
 	unsigned int	num_sources;
 	unsigned int	power_source;
 	unsigned int	buffer_type;
 	unsigned int	pullup;
 	unsigned int	strength;
 	unsigned int	function;
+	unsigned int	atest;
 };
 
 struct pmic_gpio_state {
@@ -135,12 +175,16 @@ struct pmic_gpio_state {
 static const struct pinconf_generic_params pmic_gpio_bindings[] = {
 	{"qcom,pull-up-strength",	PMIC_GPIO_CONF_PULL_UP,		0},
 	{"qcom,drive-strength",		PMIC_GPIO_CONF_STRENGTH,	0},
+	{"qcom,atest",			PMIC_GPIO_CONF_ATEST,		0},
+	{"qcom,analog-pass",		PMIC_GPIO_CONF_ANALOG_PASS,	0},
 };
 
 #ifdef CONFIG_DEBUG_FS
 static const struct pin_config_item pmic_conf_items[ARRAY_SIZE(pmic_gpio_bindings)] = {
 	PCONFDUMP(PMIC_GPIO_CONF_PULL_UP,  "pull up strength", NULL, true),
 	PCONFDUMP(PMIC_GPIO_CONF_STRENGTH, "drive-strength", NULL, true),
+	PCONFDUMP(PMIC_GPIO_CONF_ATEST, "atest", NULL, true),
+	PCONFDUMP(PMIC_GPIO_CONF_ANALOG_PASS, "analog-pass", NULL, true),
 };
 #endif
 
@@ -153,10 +197,16 @@ struct pmic_gpio_state {
 };
 
 static const char *const pmic_gpio_functions[] = {
-	PMIC_GPIO_FUNC_NORMAL, PMIC_GPIO_FUNC_PAIRED,
-	PMIC_GPIO_FUNC_FUNC1, PMIC_GPIO_FUNC_FUNC2,
-	PMIC_GPIO_FUNC_DTEST1, PMIC_GPIO_FUNC_DTEST2,
-	PMIC_GPIO_FUNC_DTEST3, PMIC_GPIO_FUNC_DTEST4,
+	[PMIC_GPIO_FUNC_INDEX_NORMAL]	= PMIC_GPIO_FUNC_NORMAL,
+	[PMIC_GPIO_FUNC_INDEX_PAIRED]	= PMIC_GPIO_FUNC_PAIRED,
+	[PMIC_GPIO_FUNC_INDEX_FUNC1]	= PMIC_GPIO_FUNC_FUNC1,
+	[PMIC_GPIO_FUNC_INDEX_FUNC2]	= PMIC_GPIO_FUNC_FUNC2,
+	[PMIC_GPIO_FUNC_INDEX_FUNC3]	= PMIC_GPIO_FUNC_FUNC3,
+	[PMIC_GPIO_FUNC_INDEX_FUNC4]	= PMIC_GPIO_FUNC_FUNC4,
+	[PMIC_GPIO_FUNC_INDEX_DTEST1]	= PMIC_GPIO_FUNC_DTEST1,
+	[PMIC_GPIO_FUNC_INDEX_DTEST2]	= PMIC_GPIO_FUNC_DTEST2,
+	[PMIC_GPIO_FUNC_INDEX_DTEST3]	= PMIC_GPIO_FUNC_DTEST3,
+	[PMIC_GPIO_FUNC_INDEX_DTEST4]	= PMIC_GPIO_FUNC_DTEST4,
 };
 
 static int pmic_gpio_read(struct pmic_gpio_state *state,
@@ -244,25 +294,67 @@ static int pmic_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned function,
 	unsigned int val;
 	int ret;
 
+	if (function > PMIC_GPIO_FUNC_INDEX_DTEST4) {
+		pr_err("function: %d is not defined\n", function);
+		return -EINVAL;
+	}
+
 	pad = pctldev->desc->pins[pin].drv_data;
+	/*
+	 * Non-LV/MV subtypes only support 2 special functions,
+	 * offsetting the dtestx function values by 2
+	 */
+	if (!pad->lv_mv_type) {
+		if (function == PMIC_GPIO_FUNC_INDEX_FUNC3 ||
+				function == PMIC_GPIO_FUNC_INDEX_FUNC4) {
+			pr_err("LV/MV subtype doesn't have func3/func4\n");
+			return -EINVAL;
+		}
+		if (function >= PMIC_GPIO_FUNC_INDEX_DTEST1)
+			function -= (PMIC_GPIO_FUNC_INDEX_DTEST1 -
+					PMIC_GPIO_FUNC_INDEX_FUNC3);
+	}
 
 	pad->function = function;
 
-	val = 0;
-	if (pad->output_enabled) {
-		if (pad->input_enabled)
-			val = 2;
-		else
-			val = 1;
-	}
+	if (pad->analog_pass)
+		val = PMIC_GPIO_MODE_ANALOG_PASS_THRU;
+	else if (pad->output_enabled && pad->input_enabled)
+		val = PMIC_GPIO_MODE_DIGITAL_INPUT_OUTPUT;
+	else if (pad->output_enabled)
+		val = PMIC_GPIO_MODE_DIGITAL_OUTPUT;
+	else
+		val = PMIC_GPIO_MODE_DIGITAL_INPUT;
 
-	val = val << PMIC_GPIO_REG_MODE_DIR_SHIFT;
-	val |= pad->function << PMIC_GPIO_REG_MODE_FUNCTION_SHIFT;
-	val |= pad->out_value & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
+	if (pad->lv_mv_type) {
+		ret = pmic_gpio_write(state, pad,
+				PMIC_GPIO_REG_MODE_CTL, val);
+		if (ret < 0)
+			return ret;
 
-	ret = pmic_gpio_write(state, pad, PMIC_GPIO_REG_MODE_CTL, val);
-	if (ret < 0)
-		return ret;
+		val = pad->atest - 1;
+		ret = pmic_gpio_write(state, pad,
+				PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU_SEL, val);
+		if (ret < 0)
+			return ret;
+
+		val = pad->out_value
+			<< PMIC_GPIO_LV_MV_OUTPUT_INVERT_SHIFT;
+		val |= pad->function
+			& PMIC_GPIO_LV_MV_OUTPUT_SOURCE_SEL_MASK;
+		ret = pmic_gpio_write(state, pad,
+			PMIC_GPIO_REG_LV_MV_DIG_OUT_SOURCE_CTL, val);
+		if (ret < 0)
+			return ret;
+	} else {
+		val = val << PMIC_GPIO_REG_MODE_DIR_SHIFT;
+		val |= pad->function << PMIC_GPIO_REG_MODE_FUNCTION_SHIFT;
+		val |= pad->out_value & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
+
+		ret = pmic_gpio_write(state, pad, PMIC_GPIO_REG_MODE_CTL, val);
+		if (ret < 0)
+			return ret;
+	}
 
 	val = pad->is_enabled << PMIC_GPIO_REG_MASTER_EN_SHIFT;
 
@@ -322,6 +414,12 @@ static int pmic_gpio_config_get(struct pinctrl_dev *pctldev,
 	case PMIC_GPIO_CONF_STRENGTH:
 		arg = pad->strength;
 		break;
+	case PMIC_GPIO_CONF_ATEST:
+		arg = pad->atest;
+		break;
+	case PMIC_GPIO_CONF_ANALOG_PASS:
+		arg = pad->analog_pass;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -396,6 +494,16 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				return -EINVAL;
 			pad->strength = arg;
 			break;
+		case PMIC_GPIO_CONF_ATEST:
+			if (!pad->lv_mv_type || arg > 4)
+				return -EINVAL;
+			pad->atest = arg;
+			break;
+		case PMIC_GPIO_CONF_ANALOG_PASS:
+			if (!pad->lv_mv_type)
+				return -EINVAL;
+			pad->analog_pass = true;
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -420,19 +528,46 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	if (ret < 0)
 		return ret;
 
-	val = 0;
-	if (pad->output_enabled) {
-		if (pad->input_enabled)
-			val = 2;
-		else
-			val = 1;
-	}
+	if (pad->analog_pass)
+		val = PMIC_GPIO_MODE_ANALOG_PASS_THRU;
+	else if (pad->output_enabled && pad->input_enabled)
+		val = PMIC_GPIO_MODE_DIGITAL_INPUT_OUTPUT;
+	else if (pad->output_enabled)
+		val = PMIC_GPIO_MODE_DIGITAL_OUTPUT;
+	else
+		val = PMIC_GPIO_MODE_DIGITAL_INPUT;
 
-	val = val << PMIC_GPIO_REG_MODE_DIR_SHIFT;
-	val |= pad->function << PMIC_GPIO_REG_MODE_FUNCTION_SHIFT;
-	val |= pad->out_value & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
+	if (pad->lv_mv_type) {
+		ret = pmic_gpio_write(state, pad,
+				PMIC_GPIO_REG_MODE_CTL, val);
+		if (ret < 0)
+			return ret;
+
+		val = pad->atest - 1;
+		ret = pmic_gpio_write(state, pad,
+				PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU_SEL, val);
+		if (ret < 0)
+			return ret;
+
+		val = pad->out_value
+			<< PMIC_GPIO_LV_MV_OUTPUT_INVERT_SHIFT;
+		val |= pad->function
+			& PMIC_GPIO_LV_MV_OUTPUT_SOURCE_SEL_MASK;
+		ret = pmic_gpio_write(state, pad,
+			PMIC_GPIO_REG_LV_MV_DIG_OUT_SOURCE_CTL, val);
+		if (ret < 0)
+			return ret;
+	} else {
+		val = val << PMIC_GPIO_REG_MODE_DIR_SHIFT;
+		val |= pad->function << PMIC_GPIO_REG_MODE_FUNCTION_SHIFT;
+		val |= pad->out_value & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
 
-	return pmic_gpio_write(state, pad, PMIC_GPIO_REG_MODE_CTL, val);
+		ret = pmic_gpio_write(state, pad, PMIC_GPIO_REG_MODE_CTL, val);
+		if (ret < 0)
+			return ret;
+	}
+
+	return ret;
 }
 
 static void pmic_gpio_config_dbg_show(struct pinctrl_dev *pctldev,
@@ -440,7 +575,7 @@ static void pmic_gpio_config_dbg_show(struct pinctrl_dev *pctldev,
 {
 	struct pmic_gpio_state *state = pinctrl_dev_get_drvdata(pctldev);
 	struct pmic_gpio_pad *pad;
-	int ret, val;
+	int ret, val, function;
 
 	static const char *const biases[] = {
 		"pull-up 30uA", "pull-up 1.5uA", "pull-up 31.5uA",
@@ -462,7 +597,6 @@ static void pmic_gpio_config_dbg_show(struct pinctrl_dev *pctldev,
 	if (val < 0 || !(val >> PMIC_GPIO_REG_MASTER_EN_SHIFT)) {
 		seq_puts(s, " ---");
 	} else {
-
 		if (pad->input_enabled) {
 			ret = pmic_gpio_read(state, pad, PMIC_MPP_REG_RT_STS);
 			if (ret < 0)
@@ -471,14 +605,28 @@ static void pmic_gpio_config_dbg_show(struct pinctrl_dev *pctldev,
 			ret &= PMIC_MPP_REG_RT_STS_VAL_MASK;
 			pad->out_value = ret;
 		}
-
-		seq_printf(s, " %-4s", pad->output_enabled ? "out" : "in");
-		seq_printf(s, " %-7s", pmic_gpio_functions[pad->function]);
+		/*
+		 * For the non-LV/MV subtypes only 2 special functions are
+		 * available, offsetting the dtest function values by 2.
+		 */
+		function = pad->function;
+		if (!pad->lv_mv_type &&
+				pad->function >= PMIC_GPIO_FUNC_INDEX_FUNC3)
+			function += PMIC_GPIO_FUNC_INDEX_DTEST1 -
+				PMIC_GPIO_FUNC_INDEX_FUNC3;
+
+		if (pad->analog_pass)
+			seq_puts(s, " analog-pass");
+		else
+			seq_printf(s, " %-4s",
+					pad->output_enabled ? "out" : "in");
+		seq_printf(s, " %-7s", pmic_gpio_functions[function]);
 		seq_printf(s, " vin-%d", pad->power_source);
 		seq_printf(s, " %-27s", biases[pad->pullup]);
 		seq_printf(s, " %-10s", buffer_types[pad->buffer_type]);
 		seq_printf(s, " %-4s", pad->out_value ? "high" : "low");
 		seq_printf(s, " %-7s", strengths[pad->strength]);
+		seq_printf(s, " atest-%d", pad->atest);
 	}
 }
 
@@ -618,40 +766,71 @@ static int pmic_gpio_populate(struct pmic_gpio_state *state,
 	case PMIC_GPIO_SUBTYPE_GPIOC_8CH:
 		pad->num_sources = 8;
 		break;
+	case PMIC_GPIO_SUBTYPE_GPIO_LV:
+		pad->num_sources = 1;
+		pad->have_buffer = true;
+		pad->lv_mv_type = true;
+		break;
+	case PMIC_GPIO_SUBTYPE_GPIO_MV:
+		pad->num_sources = 2;
+		pad->have_buffer = true;
+		pad->lv_mv_type = true;
+		break;
 	default:
 		dev_err(state->dev, "unknown GPIO type 0x%x\n", subtype);
 		return -ENODEV;
 	}
 
-	val = pmic_gpio_read(state, pad, PMIC_GPIO_REG_MODE_CTL);
-	if (val < 0)
-		return val;
+	if (pad->lv_mv_type) {
+		val = pmic_gpio_read(state, pad,
+				PMIC_GPIO_REG_LV_MV_DIG_OUT_SOURCE_CTL);
+		if (val < 0)
+			return val;
+
+		pad->out_value = !!(val & PMIC_GPIO_LV_MV_OUTPUT_INVERT);
+		pad->function = val & PMIC_GPIO_LV_MV_OUTPUT_SOURCE_SEL_MASK;
+
+		val = pmic_gpio_read(state, pad, PMIC_GPIO_REG_MODE_CTL);
+		if (val < 0)
+			return val;
+
+		dir = val & PMIC_GPIO_REG_LV_MV_MODE_DIR_MASK;
+	} else {
+		val = pmic_gpio_read(state, pad, PMIC_GPIO_REG_MODE_CTL);
+		if (val < 0)
+			return val;
 
-	pad->out_value = val & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
+		pad->out_value = val & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
+
+		dir = val >> PMIC_GPIO_REG_MODE_DIR_SHIFT;
+		dir &= PMIC_GPIO_REG_MODE_DIR_MASK;
+		pad->function = val >> PMIC_GPIO_REG_MODE_FUNCTION_SHIFT;
+		pad->function &= PMIC_GPIO_REG_MODE_FUNCTION_MASK;
+	}
 
-	dir = val >> PMIC_GPIO_REG_MODE_DIR_SHIFT;
-	dir &= PMIC_GPIO_REG_MODE_DIR_MASK;
 	switch (dir) {
-	case 0:
+	case PMIC_GPIO_MODE_DIGITAL_INPUT:
 		pad->input_enabled = true;
 		pad->output_enabled = false;
 		break;
-	case 1:
+	case PMIC_GPIO_MODE_DIGITAL_OUTPUT:
 		pad->input_enabled = false;
 		pad->output_enabled = true;
 		break;
-	case 2:
+	case PMIC_GPIO_MODE_DIGITAL_INPUT_OUTPUT:
 		pad->input_enabled = true;
 		pad->output_enabled = true;
 		break;
+	case PMIC_GPIO_MODE_ANALOG_PASS_THRU:
+		if (!pad->lv_mv_type)
+			return -ENODEV;
+		pad->analog_pass = true;
+		break;
 	default:
 		dev_err(state->dev, "unknown GPIO direction\n");
 		return -ENODEV;
 	}
 
-	pad->function = val >> PMIC_GPIO_REG_MODE_FUNCTION_SHIFT;
-	pad->function &= PMIC_GPIO_REG_MODE_FUNCTION_MASK;
-
 	val = pmic_gpio_read(state, pad, PMIC_GPIO_REG_DIG_VIN_CTL);
 	if (val < 0)
 		return val;
@@ -666,16 +845,20 @@ static int pmic_gpio_populate(struct pmic_gpio_state *state,
 	pad->pullup = val >> PMIC_GPIO_REG_PULL_SHIFT;
 	pad->pullup &= PMIC_GPIO_REG_PULL_MASK;
 
-	val = pmic_gpio_read(state, pad, PMIC_GPIO_REG_DIG_OUT_CTL);
-	if (val < 0)
-		return val;
-
 	pad->strength = val >> PMIC_GPIO_REG_OUT_STRENGTH_SHIFT;
 	pad->strength &= PMIC_GPIO_REG_OUT_STRENGTH_MASK;
 
 	pad->buffer_type = val >> PMIC_GPIO_REG_OUT_TYPE_SHIFT;
 	pad->buffer_type &= PMIC_GPIO_REG_OUT_TYPE_MASK;
 
+	if (pad->lv_mv_type) {
+		val = pmic_gpio_read(state, pad,
+				PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU_SEL);
+		if (val < 0)
+			return val;
+		pad->atest = (val & PMIC_GPIO_LV_MV_ANA_MUX_SEL_MASK) + 1;
+	}
+
 	/* Pin could be disabled with PIN_CONFIG_BIAS_HIGH_IMPEDANCE */
 	pad->is_enabled = true;
 	return 0;
diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
index d33f17c..b8ff882 100644
--- a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
+++ b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
@@ -98,6 +98,8 @@
 #define PMIC_GPIO_FUNC_PAIRED		"paired"
 #define PMIC_GPIO_FUNC_FUNC1		"func1"
 #define PMIC_GPIO_FUNC_FUNC2		"func2"
+#define PMIC_GPIO_FUNC_FUNC3		"func3"
+#define PMIC_GPIO_FUNC_FUNC4		"func4"
 #define PMIC_GPIO_FUNC_DTEST1		"dtest1"
 #define PMIC_GPIO_FUNC_DTEST2		"dtest2"
 #define PMIC_GPIO_FUNC_DTEST3		"dtest3"
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
