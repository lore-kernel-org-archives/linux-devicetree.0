From: fenglinw@codeaurora.org
Subject: [PATCH V1 1/3] pinctrl: qcom: spmi-gpio: Add support for GPIO LV/MV subtype
Date: Tue, 13 Jun 2017 14:16:03 +0800
Message-ID: <20170613061707.13892-2-fenglinw@codeaurora.org>
References: <20170613061707.13892-1-fenglinw@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170613061707.13892-1-fenglinw@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Fenglin Wu <fenglinw@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org
Cc: collinsd@quicinc.com, aghayal@qti.qualcomm.com, wruan@quicinc.com, kgunda@qti.qualcomm.com
List-Id: devicetree@vger.kernel.org

From: Fenglin Wu <fenglinw@codeaurora.org>

GPIO LV (low voltage)/MV (medium voltage) subtypes have different
features and register mappings than 4CH/8CH subtypes. Add support
for LV and MV subtypes.

Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
---
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |  28 ++-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           | 269 ++++++++++++++++++---
 include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |   9 +
 3 files changed, 264 insertions(+), 42 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 8d893a8..1493c0a 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -91,14 +91,18 @@ to specify in a pin configuration subnode:
 	Value type: <string>
 	Definition: Specify the alternative function to be configured for the
 		    specified pins.  Valid values are:
-		    "normal",
-		    "paired",
-		    "func1",
-		    "func2",
-		    "dtest1",
-		    "dtest2",
-		    "dtest3",
-		    "dtest4"
+			"normal",
+			"paired",
+			"func1",
+			"func2",
+			"dtest1",
+			"dtest2",
+			"dtest3",
+			"dtest4",
+		    And following values are supported by LV/MV GPIO subtypes:
+			"func3",
+			"func4",
+			"analog"
 
 - bias-disable:
 	Usage: optional
@@ -183,6 +187,14 @@ to specify in a pin configuration subnode:
 	Value type: <none>
 	Definition: The specified pins are configured in open-source mode.
 
+- qcom,atest:
+	Usage: optional
+	Value type: <u32>
+	Definition: Selects ATEST rail to route to GPIO when it's configured
+		    in analog-pass-through mode by specifying "analog" function.
+		    Valid values are 0-3 corresponding to PMIC_GPIO_AOUT_ATESTx
+		    defined in <dt-bindings/pinctrl/qcom,pmic-gpio.h>.
+
 Example:
 
 	pm8921_gpio: gpio@150 {
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 664b641..caa07e9 100644
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
@@ -58,6 +62,13 @@
 #define PMIC_GPIO_REG_MODE_DIR_SHIFT		4
 #define PMIC_GPIO_REG_MODE_DIR_MASK		0x7
 
+#define PMIC_GPIO_MODE_DIGITAL_INPUT		0
+#define PMIC_GPIO_MODE_DIGITAL_OUTPUT		1
+#define PMIC_GPIO_MODE_DIGITAL_INPUT_OUTPUT	2
+#define PMIC_GPIO_MODE_ANALOG_PASS_THRU		3
+
+#define PMIC_GPIO_REG_LV_MV_MODE_DIR_MASK	0x3
+
 /* PMIC_GPIO_REG_DIG_VIN_CTL */
 #define PMIC_GPIO_REG_VIN_SHIFT			0
 #define PMIC_GPIO_REG_VIN_MASK			0x7
@@ -69,6 +80,11 @@
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
@@ -88,9 +104,28 @@
 
 #define PMIC_GPIO_PHYSICAL_OFFSET		1
 
+/* PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU_SEL */
+#define PMIC_GPIO_LV_MV_ANA_MUX_SEL_MASK		0x3
+
 /* Qualcomm specific pin configurations */
 #define PMIC_GPIO_CONF_PULL_UP			(PIN_CONFIG_END + 1)
 #define PMIC_GPIO_CONF_STRENGTH			(PIN_CONFIG_END + 2)
+#define PMIC_GPIO_CONF_ATEST			(PIN_CONFIG_END + 3)
+
+/* The index of each function in pmic_gpio_functions[] array */
+enum pmic_gpio_func_index {
+	PMIC_GPIO_FUNC_INDEX_NORMAL	= 0x00,
+	PMIC_GPIO_FUNC_INDEX_PAIRED	= 0x01,
+	PMIC_GPIO_FUNC_INDEX_FUNC1	= 0x02,
+	PMIC_GPIO_FUNC_INDEX_FUNC2	= 0x03,
+	PMIC_GPIO_FUNC_INDEX_FUNC3	= 0x04,
+	PMIC_GPIO_FUNC_INDEX_FUNC4	= 0x05,
+	PMIC_GPIO_FUNC_INDEX_DTEST1	= 0x06,
+	PMIC_GPIO_FUNC_INDEX_DTEST2	= 0x07,
+	PMIC_GPIO_FUNC_INDEX_DTEST3	= 0x08,
+	PMIC_GPIO_FUNC_INDEX_DTEST4	= 0x09,
+	PMIC_GPIO_FUNC_INDEX_ANALOG	= 0x10,
+};
 
 /**
  * struct pmic_gpio_pad - keep current GPIO settings
@@ -102,12 +137,14 @@
  *	open-drain or open-source mode.
  * @output_enabled: Set to true if GPIO output logic is enabled.
  * @input_enabled: Set to true if GPIO input buffer logic is enabled.
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
@@ -117,12 +154,14 @@ struct pmic_gpio_pad {
 	bool		have_buffer;
 	bool		output_enabled;
 	bool		input_enabled;
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
@@ -135,12 +174,14 @@ struct pmic_gpio_state {
 static const struct pinconf_generic_params pmic_gpio_bindings[] = {
 	{"qcom,pull-up-strength",	PMIC_GPIO_CONF_PULL_UP,		0},
 	{"qcom,drive-strength",		PMIC_GPIO_CONF_STRENGTH,	0},
+	{"qcom,atest",			PMIC_GPIO_CONF_ATEST,	0},
 };
 
 #ifdef CONFIG_DEBUG_FS
 static const struct pin_config_item pmic_conf_items[ARRAY_SIZE(pmic_gpio_bindings)] = {
 	PCONFDUMP(PMIC_GPIO_CONF_PULL_UP,  "pull up strength", NULL, true),
 	PCONFDUMP(PMIC_GPIO_CONF_STRENGTH, "drive-strength", NULL, true),
+	PCONFDUMP(PMIC_GPIO_CONF_ATEST, "atest", NULL, true),
 };
 #endif
 
@@ -152,11 +193,25 @@ struct pmic_gpio_state {
 	"gpio30", "gpio31", "gpio32", "gpio33", "gpio34", "gpio35", "gpio36",
 };
 
+/*
+ * Treat LV/MV GPIO analog-pass-through mode as a function, add it
+ * to the end of the function list. Add placeholder for the reserved
+ * functions defined in LV/MV OUTPUT_SOURCE_SEL register.
+ */
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
+	"reserved-a", "reserved-b", "reserved-c",
+	"reserved-d", "reserved-e", "reserved-f",
+	[PMIC_GPIO_FUNC_INDEX_ANALOG]	= PMIC_GPIO_FUNC_ANALOG,
 };
 
 static int pmic_gpio_read(struct pmic_gpio_state *state,
@@ -248,21 +303,74 @@ static int pmic_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned function,
 
 	pad->function = function;
 
-	val = 0;
+	val = PMIC_GPIO_MODE_DIGITAL_INPUT;
 	if (pad->output_enabled) {
 		if (pad->input_enabled)
-			val = 2;
+			val = PMIC_GPIO_MODE_DIGITAL_INPUT_OUTPUT;
 		else
-			val = 1;
+			val = PMIC_GPIO_MODE_DIGITAL_OUTPUT;
 	}
 
-	val = val << PMIC_GPIO_REG_MODE_DIR_SHIFT;
-	val |= pad->function << PMIC_GPIO_REG_MODE_FUNCTION_SHIFT;
-	val |= pad->out_value & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
+	if (function > PMIC_GPIO_FUNC_INDEX_DTEST4 &&
+			function < PMIC_GPIO_FUNC_INDEX_ANALOG) {
+		pr_err("reserved function: %s hasn't been enabled\n",
+				pmic_gpio_functions[function]);
+		return -EINVAL;
+	}
 
-	ret = pmic_gpio_write(state, pad, PMIC_GPIO_REG_MODE_CTL, val);
-	if (ret < 0)
-		return ret;
+	if (pad->lv_mv_type) {
+		if (pad->function == PMIC_GPIO_FUNC_INDEX_ANALOG) {
+			val = PMIC_GPIO_MODE_ANALOG_PASS_THRU;
+			ret = pmic_gpio_write(state, pad,
+					PMIC_GPIO_REG_MODE_CTL, val);
+			if (ret < 0)
+				return ret;
+
+			ret = pmic_gpio_write(state, pad,
+					PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU_SEL,
+					pad->atest);
+			if (ret < 0)
+				return ret;
+		} else {
+			ret = pmic_gpio_write(state, pad,
+					PMIC_GPIO_REG_MODE_CTL, val);
+			if (ret < 0)
+				return ret;
+
+			val = pad->out_value
+				<< PMIC_GPIO_LV_MV_OUTPUT_INVERT_SHIFT;
+			val |= pad->function
+				& PMIC_GPIO_LV_MV_OUTPUT_SOURCE_SEL_MASK;
+			ret = pmic_gpio_write(state, pad,
+				PMIC_GPIO_REG_LV_MV_DIG_OUT_SOURCE_CTL, val);
+			if (ret < 0)
+				return ret;
+		}
+	} else {
+		/*
+		 * GPIO not of LV/MV subtype doesn't have "func3", "func4"
+		 * "analog" functions, and "dtest1" to "dtest4" functions
+		 * have register value 2 bits lower than the function index
+		 * in pmic_gpio_functions[].
+		 */
+		if (function == PMIC_GPIO_FUNC_INDEX_FUNC3
+				|| function == PMIC_GPIO_FUNC_INDEX_FUNC4
+				|| function == PMIC_GPIO_FUNC_INDEX_ANALOG) {
+			return -EINVAL;
+		} else if (function >= PMIC_GPIO_FUNC_INDEX_DTEST1 &&
+				function <= PMIC_GPIO_FUNC_INDEX_DTEST4) {
+			pad->function -= (PMIC_GPIO_FUNC_INDEX_DTEST1 -
+					PMIC_GPIO_FUNC_INDEX_FUNC3);
+		}
+
+		val = val << PMIC_GPIO_REG_MODE_DIR_SHIFT;
+		val |= pad->function << PMIC_GPIO_REG_MODE_FUNCTION_SHIFT;
+		val |= pad->out_value & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
+
+		ret = pmic_gpio_write(state, pad, PMIC_GPIO_REG_MODE_CTL, val);
+		if (ret < 0)
+			return ret;
+	}
 
 	val = pad->is_enabled << PMIC_GPIO_REG_MASTER_EN_SHIFT;
 
@@ -322,6 +430,9 @@ static int pmic_gpio_config_get(struct pinctrl_dev *pctldev,
 	case PMIC_GPIO_CONF_STRENGTH:
 		arg = pad->strength;
 		break;
+	case PMIC_GPIO_CONF_ATEST:
+		arg = pad->atest;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -396,6 +507,11 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				return -EINVAL;
 			pad->strength = arg;
 			break;
+		case PMIC_GPIO_CONF_ATEST:
+			if (arg > PMIC_GPIO_AOUT_ATEST4)
+				return -EINVAL;
+			pad->atest = arg;
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -420,19 +536,53 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	if (ret < 0)
 		return ret;
 
-	val = 0;
+	val = PMIC_GPIO_MODE_DIGITAL_INPUT;
 	if (pad->output_enabled) {
 		if (pad->input_enabled)
-			val = 2;
+			val = PMIC_GPIO_MODE_DIGITAL_INPUT_OUTPUT;
 		else
-			val = 1;
+			val = PMIC_GPIO_MODE_DIGITAL_OUTPUT;
 	}
 
-	val = val << PMIC_GPIO_REG_MODE_DIR_SHIFT;
-	val |= pad->function << PMIC_GPIO_REG_MODE_FUNCTION_SHIFT;
-	val |= pad->out_value & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
+	if (pad->lv_mv_type) {
+		if (pad->function == PMIC_GPIO_FUNC_INDEX_ANALOG) {
+			val = PMIC_GPIO_MODE_ANALOG_PASS_THRU;
+			ret = pmic_gpio_write(state, pad,
+					PMIC_GPIO_REG_MODE_CTL, val);
+			if (ret < 0)
+				return ret;
 
-	return pmic_gpio_write(state, pad, PMIC_GPIO_REG_MODE_CTL, val);
+			ret = pmic_gpio_write(state, pad,
+					PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU_SEL,
+					pad->atest);
+			if (ret < 0)
+				return ret;
+		} else {
+			ret = pmic_gpio_write(state, pad,
+					PMIC_GPIO_REG_MODE_CTL, val);
+			if (ret < 0)
+				return ret;
+
+			val = pad->out_value
+				<< PMIC_GPIO_LV_MV_OUTPUT_INVERT_SHIFT;
+			val |= pad->function
+				& PMIC_GPIO_LV_MV_OUTPUT_SOURCE_SEL_MASK;
+			ret = pmic_gpio_write(state, pad,
+				PMIC_GPIO_REG_LV_MV_DIG_OUT_SOURCE_CTL, val);
+			if (ret < 0)
+				return ret;
+		}
+	} else {
+		val = val << PMIC_GPIO_REG_MODE_DIR_SHIFT;
+		val |= pad->function << PMIC_GPIO_REG_MODE_FUNCTION_SHIFT;
+		val |= pad->out_value & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
+
+		ret = pmic_gpio_write(state, pad, PMIC_GPIO_REG_MODE_CTL, val);
+		if (ret < 0)
+			return ret;
+	}
+
+	return ret;
 }
 
 static void pmic_gpio_config_dbg_show(struct pinctrl_dev *pctldev,
@@ -440,7 +590,7 @@ static void pmic_gpio_config_dbg_show(struct pinctrl_dev *pctldev,
 {
 	struct pmic_gpio_state *state = pinctrl_dev_get_drvdata(pctldev);
 	struct pmic_gpio_pad *pad;
-	int ret, val;
+	int ret, val, function;
 
 	static const char *const biases[] = {
 		"pull-up 30uA", "pull-up 1.5uA", "pull-up 31.5uA",
@@ -471,9 +621,21 @@ static void pmic_gpio_config_dbg_show(struct pinctrl_dev *pctldev,
 			ret &= PMIC_MPP_REG_RT_STS_VAL_MASK;
 			pad->out_value = ret;
 		}
+		/*
+		 * For GPIO not of LV/MV subtypes, the register value of
+		 * the function mapping from "dtest1" to "dtest4" is 2 bits
+		 * lower than the function index in pmic_gpio_functions[].
+		 */
+		if (!pad->lv_mv_type &&
+				pad->function >= PMIC_GPIO_FUNC_INDEX_FUNC3) {
+			function = pad->function + (PMIC_GPIO_FUNC_INDEX_DTEST1
+					- PMIC_GPIO_FUNC_INDEX_FUNC3);
+		} else {
+			function = pad->function;
+		}
 
 		seq_printf(s, " %-4s", pad->output_enabled ? "out" : "in");
-		seq_printf(s, " %-7s", pmic_gpio_functions[pad->function]);
+		seq_printf(s, " %-7s", pmic_gpio_functions[function]);
 		seq_printf(s, " vin-%d", pad->power_source);
 		seq_printf(s, " %-27s", biases[pad->pullup]);
 		seq_printf(s, " %-10s", buffer_types[pad->buffer_type]);
@@ -618,40 +780,72 @@ static int pmic_gpio_populate(struct pmic_gpio_state *state,
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
+
+		pad->out_value = val & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
 
-	pad->out_value = val & PMIC_GPIO_REG_MODE_VALUE_SHIFT;
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
+		if (pad->lv_mv_type)
+			pad->function = PMIC_GPIO_FUNC_INDEX_ANALOG;
+		else
+			return -ENODEV;
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
@@ -676,6 +870,13 @@ static int pmic_gpio_populate(struct pmic_gpio_state *state,
 	pad->buffer_type = val >> PMIC_GPIO_REG_OUT_TYPE_SHIFT;
 	pad->buffer_type &= PMIC_GPIO_REG_OUT_TYPE_MASK;
 
+	if (pad->function == PMIC_GPIO_FUNC_INDEX_ANALOG) {
+		val = pmic_gpio_read(state, pad,
+				PMIC_GPIO_REG_LV_MV_ANA_PASS_THRU_SEL);
+		if (val < 0)
+			return val;
+		pad->atest = val & PMIC_GPIO_LV_MV_ANA_MUX_SEL_MASK;
+	}
 	/* Pin could be disabled with PIN_CONFIG_BIAS_HIGH_IMPEDANCE */
 	pad->is_enabled = true;
 	return 0;
diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
index d33f17c..85d8809 100644
--- a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
+++ b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
@@ -93,15 +93,24 @@
 #define PM8994_GPIO_S4			2
 #define PM8994_GPIO_L12			3
 
+/* ATEST MUX selection for analog-pass-through mode */
+#define PMIC_GPIO_AOUT_ATEST1		0
+#define PMIC_GPIO_AOUT_ATEST2		1
+#define PMIC_GPIO_AOUT_ATEST3		2
+#define PMIC_GPIO_AOUT_ATEST4		3
+
 /* To be used with "function" */
 #define PMIC_GPIO_FUNC_NORMAL		"normal"
 #define PMIC_GPIO_FUNC_PAIRED		"paired"
 #define PMIC_GPIO_FUNC_FUNC1		"func1"
 #define PMIC_GPIO_FUNC_FUNC2		"func2"
+#define PMIC_GPIO_FUNC_FUNC3		"func3"
+#define PMIC_GPIO_FUNC_FUNC4		"func4"
 #define PMIC_GPIO_FUNC_DTEST1		"dtest1"
 #define PMIC_GPIO_FUNC_DTEST2		"dtest2"
 #define PMIC_GPIO_FUNC_DTEST3		"dtest3"
 #define PMIC_GPIO_FUNC_DTEST4		"dtest4"
+#define PMIC_GPIO_FUNC_ANALOG		"analog"
 
 #define PM8038_GPIO1_2_LPG_DRV		PMIC_GPIO_FUNC_FUNC1
 #define PM8038_GPIO3_5V_BOOST_EN	PMIC_GPIO_FUNC_FUNC1
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
