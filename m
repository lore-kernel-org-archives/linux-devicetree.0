From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH 4/8] pinctrl: qcom: spmi-mpp: Implement support for sink mode
Date: Wed, 17 Jun 2015 23:47:28 -0700
Message-ID: <1434610052-602-5-git-send-email-bjorn.andersson@sonymobile.com>
References: <1434610052-602-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434610052-602-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The MPP supports three modes; digital, analog and sink mode. This patch
implements support for the latter.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.txt  |   5 +
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            | 115 +++++++++++++--------
 2 files changed, 76 insertions(+), 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
index ed19991aad35..d29fb96a57d3 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
@@ -134,6 +134,11 @@ to specify in a pin configuration subnode:
 		    and/or output-high, output-low MPP could operate as
 		    Bidirectional Logic, Analog Input, Analog Output.
 
+- qcom,sink-mode:
+	Usage: optional
+	Value type: <u32> or <none>
+	Definition: Selects sink mode of operation
+
 - qcom,amux-route:
 	Usage: optional
 	Value type: <u32>
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 745c37dea7d0..9dde023640ba 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -62,6 +62,7 @@
 #define PMIC_MPP_REG_DIG_IN_CTL			0x43
 #define PMIC_MPP_REG_EN_CTL			0x46
 #define PMIC_MPP_REG_AIN_CTL			0x4a
+#define PMIC_MPP_REG_SINK_CTL			0x4c
 
 /* PMIC_MPP_REG_MODE_CTL */
 #define PMIC_MPP_REG_MODE_VALUE_MASK		0x1
@@ -98,6 +99,7 @@
 /* Qualcomm specific pin configurations */
 #define PMIC_MPP_CONF_AMUX_ROUTE		(PIN_CONFIG_END + 1)
 #define PMIC_MPP_CONF_ANALOG_MODE		(PIN_CONFIG_END + 2)
+#define PMIC_MPP_CONF_SINK_MODE			(PIN_CONFIG_END + 3)
 
 /**
  * struct pmic_mpp_pad - keep current MPP settings
@@ -109,11 +111,13 @@
  * @input_enabled: Set to true if MPP input buffer logic is enabled.
  * @analog_mode: Set to true when MPP should operate in Analog Input, Analog
  *	Output or Bidirectional Analog mode.
+ * @sink_mode: Boolean indicating if ink mode is slected
  * @num_sources: Number of power-sources supported by this MPP.
  * @power_source: Current power-source used.
  * @amux_input: Set the source for analog input.
  * @pullup: Pullup resistor value. Valid in Bidirectional mode only.
  * @function: See pmic_mpp_functions[].
+ * @drive_strength: Amount of current in sink mode
  */
 struct pmic_mpp_pad {
 	u16		base;
@@ -123,11 +127,13 @@ struct pmic_mpp_pad {
 	bool		output_enabled;
 	bool		input_enabled;
 	bool		analog_mode;
+	bool		sink_mode;
 	unsigned int	num_sources;
 	unsigned int	power_source;
 	unsigned int	amux_input;
 	unsigned int	pullup;
 	unsigned int	function;
+	unsigned int	drive_strength;
 };
 
 struct pmic_mpp_state {
@@ -140,12 +146,14 @@ struct pmic_mpp_state {
 static const struct pinconf_generic_params pmic_mpp_bindings[] = {
 	{"qcom,amux-route",	PMIC_MPP_CONF_AMUX_ROUTE,	0},
 	{"qcom,analog-mode",	PMIC_MPP_CONF_ANALOG_MODE,	0},
+	{"qcom,sink-mode",	PMIC_MPP_CONF_SINK_MODE,	0},
 };
 
 #ifdef CONFIG_DEBUG_FS
 static const struct pin_config_item pmic_conf_items[] = {
 	PCONFDUMP(PMIC_MPP_CONF_AMUX_ROUTE, "analog mux", NULL, true),
 	PCONFDUMP(PMIC_MPP_CONF_ANALOG_MODE, "analog output", NULL, false),
+	PCONFDUMP(PMIC_MPP_CONF_SINK_MODE, "sink mode", NULL, false),
 };
 #endif
 
@@ -243,33 +251,28 @@ static int pmic_mpp_get_function_groups(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static int pmic_mpp_set_mux(struct pinctrl_dev *pctldev, unsigned function,
-				unsigned pin)
+static int pmic_mpp_write_mode_ctl(struct pmic_mpp_state *state,
+				   struct pmic_mpp_pad *pad)
 {
-	struct pmic_mpp_state *state = pinctrl_dev_get_drvdata(pctldev);
-	struct pmic_mpp_pad *pad;
 	unsigned int val;
-	int ret;
-
-	pad = pctldev->desc->pins[pin].drv_data;
-
-	pad->function = function;
 
-	if (!pad->analog_mode) {
-		val = PMIC_MPP_MODE_DIGITAL_INPUT;
+	if (pad->analog_mode) {
+		val = PMIC_MPP_MODE_ANALOG_INPUT;
 		if (pad->output_enabled) {
 			if (pad->input_enabled)
-				val = PMIC_MPP_MODE_DIGITAL_BIDIR;
+				val = PMIC_MPP_MODE_ANALOG_BIDIR;
 			else
-				val = PMIC_MPP_MODE_DIGITAL_OUTPUT;
+				val = PMIC_MPP_MODE_ANALOG_OUTPUT;
 		}
+	} else if (pad->sink_mode) {
+		val = PMIC_MPP_MODE_CURRENT_SINK;
 	} else {
-		val = PMIC_MPP_MODE_ANALOG_INPUT;
+		val = PMIC_MPP_MODE_DIGITAL_INPUT;
 		if (pad->output_enabled) {
 			if (pad->input_enabled)
-				val = PMIC_MPP_MODE_ANALOG_BIDIR;
+				val = PMIC_MPP_MODE_DIGITAL_BIDIR;
 			else
-				val = PMIC_MPP_MODE_ANALOG_OUTPUT;
+				val = PMIC_MPP_MODE_DIGITAL_OUTPUT;
 		}
 	}
 
@@ -277,9 +280,22 @@ static int pmic_mpp_set_mux(struct pinctrl_dev *pctldev, unsigned function,
 	val |= pad->function << PMIC_MPP_REG_MODE_FUNCTION_SHIFT;
 	val |= pad->out_value & PMIC_MPP_REG_MODE_VALUE_MASK;
 
-	ret = pmic_mpp_write(state, pad, PMIC_MPP_REG_MODE_CTL, val);
-	if (ret < 0)
-		return ret;
+	return pmic_mpp_write(state, pad, PMIC_MPP_REG_MODE_CTL, val);
+}
+
+static int pmic_mpp_set_mux(struct pinctrl_dev *pctldev, unsigned function,
+				unsigned pin)
+{
+	struct pmic_mpp_state *state = pinctrl_dev_get_drvdata(pctldev);
+	struct pmic_mpp_pad *pad;
+	unsigned int val;
+	int ret;
+
+	pad = pctldev->desc->pins[pin].drv_data;
+
+	pad->function = function;
+
+	ret = pmic_mpp_write_mode_ctl(state, pad);
 
 	val = pad->is_enabled << PMIC_MPP_REG_MASTER_EN_SHIFT;
 
@@ -339,9 +355,15 @@ static int pmic_mpp_config_get(struct pinctrl_dev *pctldev,
 	case PMIC_MPP_CONF_AMUX_ROUTE:
 		arg = pad->amux_input;
 		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		arg = pad->drive_strength;
+		break;
 	case PMIC_MPP_CONF_ANALOG_MODE:
 		arg = pad->analog_mode;
 		break;
+	case PMIC_MPP_CONF_SINK_MODE:
+		arg = pad->sink_mode;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -403,13 +425,19 @@ static int pmic_mpp_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			pad->output_enabled = true;
 			pad->out_value = arg;
 			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			arg = pad->drive_strength;
+			break;
 		case PMIC_MPP_CONF_AMUX_ROUTE:
 			if (arg >= PMIC_MPP_AMUX_ROUTE_ABUS4)
 				return -EINVAL;
 			pad->amux_input = arg;
 			break;
 		case PMIC_MPP_CONF_ANALOG_MODE:
-			pad->analog_mode = true;
+			pad->analog_mode = !!arg;
+			break;
+		case PMIC_MPP_CONF_SINK_MODE:
+			pad->sink_mode = !!arg;
 			break;
 		default:
 			return -EINVAL;
@@ -434,29 +462,7 @@ static int pmic_mpp_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	if (ret < 0)
 		return ret;
 
-	if (!pad->analog_mode) {
-		val = 0;	/* just digital input */
-		if (pad->output_enabled) {
-			if (pad->input_enabled)
-				val = 2; /* digital input and output */
-			else
-				val = 1; /* just digital output */
-		}
-	} else {
-		val = 4;	/* just analog input */
-		if (pad->output_enabled) {
-			if (pad->input_enabled)
-				val = 3; /* analog input and output */
-			else
-				val = 5; /* just analog output */
-		}
-	}
-
-	val = val << PMIC_MPP_REG_MODE_DIR_SHIFT;
-	val |= pad->function << PMIC_MPP_REG_MODE_FUNCTION_SHIFT;
-	val |= pad->out_value & PMIC_MPP_REG_MODE_VALUE_MASK;
-
-	ret = pmic_mpp_write(state, pad, PMIC_MPP_REG_MODE_CTL, val);
+	ret = pmic_mpp_write_mode_ctl(state, pad);
 	if (ret < 0)
 		return ret;
 
@@ -476,6 +482,9 @@ static void pmic_mpp_config_dbg_show(struct pinctrl_dev *pctldev,
 		"0.6kOhm", "10kOhm", "30kOhm", "Disabled"
 	};
 
+	static const char *const modes[] = {
+		"digital", "analog", "sink"
+	};
 
 	pad = pctldev->desc->pins[pin].drv_data;
 
@@ -495,7 +504,7 @@ static void pmic_mpp_config_dbg_show(struct pinctrl_dev *pctldev,
 		}
 
 		seq_printf(s, " %-4s", pad->output_enabled ? "out" : "in");
-		seq_printf(s, " %-4s", pad->analog_mode ? "ana" : "dig");
+		seq_printf(s, " %-7s", modes[pad->analog_mode ? 1 : (pad->sink_mode ? 2 : 0)]);
 		seq_printf(s, " %-7s", pmic_mpp_functions[pad->function]);
 		seq_printf(s, " vin-%d", pad->power_source);
 		seq_printf(s, " %-8s", biases[pad->pullup]);
@@ -666,31 +675,43 @@ static int pmic_mpp_populate(struct pmic_mpp_state *state,
 		pad->input_enabled = true;
 		pad->output_enabled = false;
 		pad->analog_mode = false;
+		pad->sink_mode = false;
 		break;
 	case PMIC_MPP_MODE_DIGITAL_OUTPUT:
 		pad->input_enabled = false;
 		pad->output_enabled = true;
 		pad->analog_mode = false;
+		pad->sink_mode = false;
 		break;
 	case PMIC_MPP_MODE_DIGITAL_BIDIR:
 		pad->input_enabled = true;
 		pad->output_enabled = true;
 		pad->analog_mode = false;
+		pad->sink_mode = false;
 		break;
 	case PMIC_MPP_MODE_ANALOG_BIDIR:
 		pad->input_enabled = true;
 		pad->output_enabled = true;
 		pad->analog_mode = true;
+		pad->sink_mode = false;
 		break;
 	case PMIC_MPP_MODE_ANALOG_INPUT:
 		pad->input_enabled = true;
 		pad->output_enabled = false;
 		pad->analog_mode = true;
+		pad->sink_mode = false;
 		break;
 	case PMIC_MPP_MODE_ANALOG_OUTPUT:
 		pad->input_enabled = false;
 		pad->output_enabled = true;
 		pad->analog_mode = true;
+		pad->sink_mode = false;
+		break;
+	case PMIC_MPP_MODE_CURRENT_SINK:
+		pad->input_enabled = false;
+		pad->output_enabled = true;
+		pad->analog_mode = false;
+		pad->sink_mode = true;
 		break;
 	default:
 		dev_err(state->dev, "unknown MPP direction\n");
@@ -721,6 +742,12 @@ static int pmic_mpp_populate(struct pmic_mpp_state *state,
 	pad->amux_input = val >> PMIC_MPP_REG_AIN_ROUTE_SHIFT;
 	pad->amux_input &= PMIC_MPP_REG_AIN_ROUTE_MASK;
 
+	val = pmic_mpp_read(state, pad, PMIC_MPP_REG_SINK_CTL);
+	if (val < 0)
+		return val;
+
+	pad->drive_strength = val;
+
 	val = pmic_mpp_read(state, pad, PMIC_MPP_REG_EN_CTL);
 	if (val < 0)
 		return val;
-- 
1.8.2.2
