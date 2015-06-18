From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: [PATCH 6/8] pinctrl: qcom: spmi-mpp: Transpose pinmux function
Date: Wed, 17 Jun 2015 23:47:30 -0700
Message-ID: <1434610052-602-7-git-send-email-bjorn.andersson@sonymobile.com>
References: <1434610052-602-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434610052-602-1-git-send-email-bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The "function" of the MPP driver was inherited from the GPIO driver, but the
differences between the two hardware blocks makes both the driver and the
device tree binding to be awkward.

Instead of overloading the "normal" function with various modes this patch
transposes the pinmux function to represent the three operating modes of the
MPP (digital, analog and current sink). The properties of pin pairing and DTEST
routing is moved to separate properties.

Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.txt  |  29 ++--
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            | 157 ++++++++++++---------
 2 files changed, 99 insertions(+), 87 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
index 0e4d4e62e220..b096d8351b8f 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
@@ -77,12 +77,9 @@ to specify in a pin configuration subnode:
 	Value type: <string>
 	Definition: Specify the alternative function to be configured for the
 		    specified pins.  Valid values are:
-		    "normal",
-		    "paired",
-		    "dtest1",
-		    "dtest2",
-		    "dtest3",
-		    "dtest4"
+		    "digital",
+		    "analog",
+		    "sink"
 
 - bias-disable:
 	Usage: optional
@@ -134,17 +131,11 @@ to specify in a pin configuration subnode:
 		    defined in <dt-binding/pinctrl/qcom,pmic-mpp.h>
 		    PMIC_MPP_AOUT_LVL_*
 
-- qcom,analog-mode:
+- qcom,dtest:
 	Usage: optional
-	Value type: <none>
-	Definition: Selects Analog mode of operation: combined with input-enable
-		    and/or output-high, output-low MPP could operate as
-		    Bidirectional Logic, Analog Input, Analog Output.
-
-- qcom,sink-mode:
-	Usage: optional
-	Value type: <u32> or <none>
-	Definition: Selects sink mode of operation
+	Value type: <u32>
+	Definition: Selects which dtest rail to be routed in the various functions.
+		    Valid values are 1-4
 
 - qcom,amux-route:
 	Usage: optional
@@ -152,6 +143,10 @@ to specify in a pin configuration subnode:
 	Definition: Selects the source for analog input. Valid values are
 		    defined in <dt-bindings/pinctrl/qcom,pmic-mpp.h>
 		    PMIC_MPP_AMUX_ROUTE_CH5, PMIC_MPP_AMUX_ROUTE_CH6...
+- qcom,paired:
+	Usage: optional
+	Value type: <none>
+	Definition: Indicates that the pin should be operating in paired mode.
 
 Example:
 
@@ -168,7 +163,7 @@ Example:
 		pm8841_default: default {
 			gpio {
 				pins = "mpp1", "mpp2", "mpp3", "mpp4";
-				function = "normal";
+				function = "digital";
 				input-enable;
 				power-source = <PM8841_MPP_S3>;
 			};
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 24f471eee341..8a280ef6304e 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -95,13 +95,17 @@
 #define PMIC_MPP_MODE_ANALOG_OUTPUT		5
 #define PMIC_MPP_MODE_CURRENT_SINK		6
 
+#define PMIC_MPP_SELECTOR_NORMAL		0
+#define PMIC_MPP_SELECTOR_PAIRED		1
+#define PMIC_MPP_SELECTOR_DTEST_FIRST		4
+
 #define PMIC_MPP_PHYSICAL_OFFSET		1
 
 /* Qualcomm specific pin configurations */
 #define PMIC_MPP_CONF_AMUX_ROUTE		(PIN_CONFIG_END + 1)
-#define PMIC_MPP_CONF_ANALOG_MODE		(PIN_CONFIG_END + 2)
-#define PMIC_MPP_CONF_SINK_MODE			(PIN_CONFIG_END + 3)
-#define PMIC_MPP_CONF_ANALOG_LEVEL		(PIN_CONFIG_END + 4)
+#define PMIC_MPP_CONF_ANALOG_LEVEL		(PIN_CONFIG_END + 2)
+#define PMIC_MPP_CONF_DTEST_SELECTOR		(PIN_CONFIG_END + 3)
+#define PMIC_MPP_CONF_PAIRED			(PIN_CONFIG_END + 4)
 
 /**
  * struct pmic_mpp_pad - keep current MPP settings
@@ -111,9 +115,7 @@
  * @out_value: Cached pin output value.
  * @output_enabled: Set to true if MPP output logic is enabled.
  * @input_enabled: Set to true if MPP input buffer logic is enabled.
- * @analog_mode: Set to true when MPP should operate in Analog Input, Analog
- *	Output or Bidirectional Analog mode.
- * @sink_mode: Boolean indicating if ink mode is slected
+ * @paired: Pin operates in paired mode
  * @num_sources: Number of power-sources supported by this MPP.
  * @power_source: Current power-source used.
  * @amux_input: Set the source for analog input.
@@ -121,6 +123,7 @@
  * @pullup: Pullup resistor value. Valid in Bidirectional mode only.
  * @function: See pmic_mpp_functions[].
  * @drive_strength: Amount of current in sink mode
+ * @dtest: DTEST route selector
  */
 struct pmic_mpp_pad {
 	u16		base;
@@ -129,8 +132,7 @@ struct pmic_mpp_pad {
 	bool		out_value;
 	bool		output_enabled;
 	bool		input_enabled;
-	bool		analog_mode;
-	bool		sink_mode;
+	bool		paired;
 	unsigned int	num_sources;
 	unsigned int	power_source;
 	unsigned int	amux_input;
@@ -138,6 +140,7 @@ struct pmic_mpp_pad {
 	unsigned int	pullup;
 	unsigned int	function;
 	unsigned int	drive_strength;
+	unsigned int	dtest;
 };
 
 struct pmic_mpp_state {
@@ -150,16 +153,16 @@ struct pmic_mpp_state {
 static const struct pinconf_generic_params pmic_mpp_bindings[] = {
 	{"qcom,amux-route",	PMIC_MPP_CONF_AMUX_ROUTE,	0},
 	{"qcom,analog-level",	PMIC_MPP_CONF_ANALOG_LEVEL,	0},
-	{"qcom,analog-mode",	PMIC_MPP_CONF_ANALOG_MODE,	0},
-	{"qcom,sink-mode",	PMIC_MPP_CONF_SINK_MODE,	0},
+	{"qcom,dtest",		PMIC_MPP_CONF_DTEST_SELECTOR,	0},
+	{"qcom,paired",		PMIC_MPP_CONF_PAIRED,		0},
 };
 
 #ifdef CONFIG_DEBUG_FS
 static const struct pin_config_item pmic_conf_items[] = {
 	PCONFDUMP(PMIC_MPP_CONF_AMUX_ROUTE, "analog mux", NULL, true),
 	PCONFDUMP(PMIC_MPP_CONF_ANALOG_LEVEL, "analog level", NULL, true),
-	PCONFDUMP(PMIC_MPP_CONF_ANALOG_MODE, "analog output", NULL, false),
-	PCONFDUMP(PMIC_MPP_CONF_SINK_MODE, "sink mode", NULL, false),
+	PCONFDUMP(PMIC_MPP_CONF_DTEST_SELECTOR, "dtest", NULL, true),
+	PCONFDUMP(PMIC_MPP_CONF_PAIRED, "paired", NULL, false),
 };
 #endif
 
@@ -167,11 +170,12 @@ static const char *const pmic_mpp_groups[] = {
 	"mpp1", "mpp2", "mpp3", "mpp4", "mpp5", "mpp6", "mpp7", "mpp8",
 };
 
+#define PMIC_MPP_DIGITAL	0
+#define PMIC_MPP_ANALOG		1
+#define PMIC_MPP_SINK		2
+
 static const char *const pmic_mpp_functions[] = {
-	PMIC_MPP_FUNC_NORMAL, PMIC_MPP_FUNC_PAIRED,
-	"reserved1", "reserved2",
-	PMIC_MPP_FUNC_DTEST1, PMIC_MPP_FUNC_DTEST2,
-	PMIC_MPP_FUNC_DTEST3, PMIC_MPP_FUNC_DTEST4,
+	"digital", "analog", "sink"
 };
 
 static inline struct pmic_mpp_state *to_mpp_state(struct gpio_chip *chip)
@@ -260,31 +264,46 @@ static int pmic_mpp_get_function_groups(struct pinctrl_dev *pctldev,
 static int pmic_mpp_write_mode_ctl(struct pmic_mpp_state *state,
 				   struct pmic_mpp_pad *pad)
 {
+	unsigned int mode;
+	unsigned int sel;
 	unsigned int val;
-
-	if (pad->analog_mode) {
-		val = PMIC_MPP_MODE_ANALOG_INPUT;
-		if (pad->output_enabled) {
-			if (pad->input_enabled)
-				val = PMIC_MPP_MODE_ANALOG_BIDIR;
-			else
-				val = PMIC_MPP_MODE_ANALOG_OUTPUT;
-		}
-	} else if (pad->sink_mode) {
-		val = PMIC_MPP_MODE_CURRENT_SINK;
-	} else {
-		val = PMIC_MPP_MODE_DIGITAL_INPUT;
-		if (pad->output_enabled) {
-			if (pad->input_enabled)
-				val = PMIC_MPP_MODE_DIGITAL_BIDIR;
-			else
-				val = PMIC_MPP_MODE_DIGITAL_OUTPUT;
-		}
+	unsigned int en;
+
+	switch (pad->function) {
+	case PMIC_MPP_ANALOG:
+		if (pad->input_enabled && pad->output_enabled)
+			mode = PMIC_MPP_MODE_ANALOG_BIDIR;
+		else if (pad->input_enabled)
+			mode = PMIC_MPP_MODE_ANALOG_INPUT;
+		else
+			mode = PMIC_MPP_MODE_ANALOG_OUTPUT;
+		break;
+	case PMIC_MPP_DIGITAL:
+		if (pad->input_enabled && pad->output_enabled)
+			mode = PMIC_MPP_MODE_DIGITAL_BIDIR;
+		else if (pad->input_enabled)
+			mode = PMIC_MPP_MODE_DIGITAL_INPUT;
+		else
+			mode = PMIC_MPP_MODE_DIGITAL_OUTPUT;
+		break;
+	case PMIC_MPP_SINK:
+	default:
+		mode = PMIC_MPP_MODE_CURRENT_SINK;
+		break;
 	}
 
-	val = val << PMIC_MPP_REG_MODE_DIR_SHIFT;
-	val |= pad->function << PMIC_MPP_REG_MODE_FUNCTION_SHIFT;
-	val |= pad->out_value & PMIC_MPP_REG_MODE_VALUE_MASK;
+	if (pad->dtest)
+		sel = PMIC_MPP_SELECTOR_DTEST_FIRST + pad->dtest - 1;
+	else if (pad->paired)
+		sel = PMIC_MPP_SELECTOR_PAIRED;
+	else
+		sel = PMIC_MPP_SELECTOR_NORMAL;
+
+	en = !!pad->out_value;
+
+	val = mode << PMIC_MPP_REG_MODE_DIR_SHIFT |
+	      sel << PMIC_MPP_REG_MODE_FUNCTION_SHIFT |
+	      en;
 
 	return pmic_mpp_write(state, pad, PMIC_MPP_REG_MODE_CTL, val);
 }
@@ -358,21 +377,21 @@ static int pmic_mpp_config_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_OUTPUT:
 		arg = pad->out_value;
 		break;
+	case PMIC_MPP_CONF_DTEST_SELECTOR:
+		arg = pad->dtest;
+		break;
 	case PMIC_MPP_CONF_AMUX_ROUTE:
 		arg = pad->amux_input;
 		break;
+	case PMIC_MPP_CONF_PAIRED:
+		arg = pad->paired;
+		break;
 	case PIN_CONFIG_DRIVE_STRENGTH:
 		arg = pad->drive_strength;
 		break;
 	case PMIC_MPP_CONF_ANALOG_LEVEL:
 		arg = pad->aout_level;
 		break;
-	case PMIC_MPP_CONF_ANALOG_MODE:
-		arg = pad->analog_mode;
-		break;
-	case PMIC_MPP_CONF_SINK_MODE:
-		arg = pad->sink_mode;
-		break;
 	default:
 		return -EINVAL;
 	}
@@ -434,6 +453,9 @@ static int pmic_mpp_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			pad->output_enabled = true;
 			pad->out_value = arg;
 			break;
+		case PMIC_MPP_CONF_DTEST_SELECTOR:
+			pad->dtest = arg;
+			break;
 		case PIN_CONFIG_DRIVE_STRENGTH:
 			arg = pad->drive_strength;
 			break;
@@ -445,11 +467,8 @@ static int pmic_mpp_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		case PMIC_MPP_CONF_ANALOG_LEVEL:
 			pad->aout_level = arg;
 			break;
-		case PMIC_MPP_CONF_ANALOG_MODE:
-			pad->analog_mode = !!arg;
-			break;
-		case PMIC_MPP_CONF_SINK_MODE:
-			pad->sink_mode = !!arg;
+		case PMIC_MPP_CONF_PAIRED:
+			pad->paired = !!arg;
 			break;
 		default:
 			return -EINVAL;
@@ -498,10 +517,6 @@ static void pmic_mpp_config_dbg_show(struct pinctrl_dev *pctldev,
 		"0.6kOhm", "10kOhm", "30kOhm", "Disabled"
 	};
 
-	static const char *const modes[] = {
-		"digital", "analog", "sink"
-	};
-
 	pad = pctldev->desc->pins[pin].drv_data;
 
 	seq_printf(s, " mpp%-2d:", pin + PMIC_MPP_PHYSICAL_OFFSET);
@@ -520,12 +535,15 @@ static void pmic_mpp_config_dbg_show(struct pinctrl_dev *pctldev,
 		}
 
 		seq_printf(s, " %-4s", pad->output_enabled ? "out" : "in");
-		seq_printf(s, " %-7s", modes[pad->analog_mode ? 1 : (pad->sink_mode ? 2 : 0)]);
 		seq_printf(s, " %-7s", pmic_mpp_functions[pad->function]);
 		seq_printf(s, " vin-%d", pad->power_source);
 		seq_printf(s, " %d", pad->aout_level);
 		seq_printf(s, " %-8s", biases[pad->pullup]);
 		seq_printf(s, " %-4s", pad->out_value ? "high" : "low");
+		if (pad->dtest)
+			seq_printf(s, " dtest%d", pad->dtest);
+		if (pad->paired)
+			seq_puts(s, " paired");
 	}
 }
 
@@ -646,6 +664,7 @@ static int pmic_mpp_populate(struct pmic_mpp_state *state,
 			     struct pmic_mpp_pad *pad)
 {
 	int type, subtype, val, dir;
+	unsigned int sel;
 
 	type = pmic_mpp_read(state, pad, PMIC_MPP_REG_TYPE);
 	if (type < 0)
@@ -691,52 +710,50 @@ static int pmic_mpp_populate(struct pmic_mpp_state *state,
 	case PMIC_MPP_MODE_DIGITAL_INPUT:
 		pad->input_enabled = true;
 		pad->output_enabled = false;
-		pad->analog_mode = false;
-		pad->sink_mode = false;
+		pad->function = PMIC_MPP_DIGITAL;
 		break;
 	case PMIC_MPP_MODE_DIGITAL_OUTPUT:
 		pad->input_enabled = false;
 		pad->output_enabled = true;
-		pad->analog_mode = false;
-		pad->sink_mode = false;
+		pad->function = PMIC_MPP_DIGITAL;
 		break;
 	case PMIC_MPP_MODE_DIGITAL_BIDIR:
 		pad->input_enabled = true;
 		pad->output_enabled = true;
-		pad->analog_mode = false;
-		pad->sink_mode = false;
+		pad->function = PMIC_MPP_DIGITAL;
 		break;
 	case PMIC_MPP_MODE_ANALOG_BIDIR:
 		pad->input_enabled = true;
 		pad->output_enabled = true;
-		pad->analog_mode = true;
-		pad->sink_mode = false;
+		pad->function = PMIC_MPP_ANALOG;
 		break;
 	case PMIC_MPP_MODE_ANALOG_INPUT:
 		pad->input_enabled = true;
 		pad->output_enabled = false;
-		pad->analog_mode = true;
-		pad->sink_mode = false;
+		pad->function = PMIC_MPP_ANALOG;
 		break;
 	case PMIC_MPP_MODE_ANALOG_OUTPUT:
 		pad->input_enabled = false;
 		pad->output_enabled = true;
-		pad->analog_mode = true;
-		pad->sink_mode = false;
+		pad->function = PMIC_MPP_ANALOG;
 		break;
 	case PMIC_MPP_MODE_CURRENT_SINK:
 		pad->input_enabled = false;
 		pad->output_enabled = true;
-		pad->analog_mode = false;
-		pad->sink_mode = true;
+		pad->function = PMIC_MPP_SINK;
 		break;
 	default:
 		dev_err(state->dev, "unknown MPP direction\n");
 		return -ENODEV;
 	}
 
-	pad->function = val >> PMIC_MPP_REG_MODE_FUNCTION_SHIFT;
-	pad->function &= PMIC_MPP_REG_MODE_FUNCTION_MASK;
+	sel = val >> PMIC_MPP_REG_MODE_FUNCTION_SHIFT;
+	sel &= PMIC_MPP_REG_MODE_FUNCTION_MASK;
+
+	if (sel >= PMIC_MPP_SELECTOR_DTEST_FIRST)
+		pad->dtest = sel + 1;
+	else if (sel == PMIC_MPP_SELECTOR_PAIRED)
+		pad->paired = true;
 
 	val = pmic_mpp_read(state, pad, PMIC_MPP_REG_DIG_VIN_CTL);
 	if (val < 0)
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
