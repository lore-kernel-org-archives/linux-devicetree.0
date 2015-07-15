From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH v2 5/8] pinctrl: qcom: spmi-mpp: Add support for setting analog output level
Date: Tue, 14 Jul 2015 23:40:33 -0700
Message-ID: <1436942435-25611-1-git-send-email-bjorn.andersson@sonymobile.com>
References: <1434610052-602-6-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434610052-602-6-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When the MPP is configured for analog output the output level is selected by
the AOUT_CTL register, this patch makes it possible to control this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---

Changes since v1:
- Assign aout_level in pmic_mpp_populate()

 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.txt  |  7 +++++++
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            | 23 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
index d29fb96a57d3..0e4d4e62e220 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
@@ -127,6 +127,13 @@ to specify in a pin configuration subnode:
 	Definition: Selects the power source for the specified pins. Valid power
 		    sources are defined in <dt-bindings/pinctrl/qcom,pmic-mpp.h>
 
+- qcom,analog-level:
+	Usage: optional
+	Value type: <u32>
+	Definition: Selects the source for analog output. Valued values are
+		    defined in <dt-binding/pinctrl/qcom,pmic-mpp.h>
+		    PMIC_MPP_AOUT_LVL_*
+
 - qcom,analog-mode:
 	Usage: optional
 	Value type: <none>
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 9dde023640ba..e52a72348a67 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -61,6 +61,7 @@
 #define PMIC_MPP_REG_DIG_PULL_CTL		0x42
 #define PMIC_MPP_REG_DIG_IN_CTL			0x43
 #define PMIC_MPP_REG_EN_CTL			0x46
+#define PMIC_MPP_REG_AOUT_CTL			0x48
 #define PMIC_MPP_REG_AIN_CTL			0x4a
 #define PMIC_MPP_REG_SINK_CTL			0x4c
 
@@ -100,6 +101,7 @@
 #define PMIC_MPP_CONF_AMUX_ROUTE		(PIN_CONFIG_END + 1)
 #define PMIC_MPP_CONF_ANALOG_MODE		(PIN_CONFIG_END + 2)
 #define PMIC_MPP_CONF_SINK_MODE			(PIN_CONFIG_END + 3)
+#define PMIC_MPP_CONF_ANALOG_LEVEL		(PIN_CONFIG_END + 4)
 
 /**
  * struct pmic_mpp_pad - keep current MPP settings
@@ -115,6 +117,7 @@
  * @num_sources: Number of power-sources supported by this MPP.
  * @power_source: Current power-source used.
  * @amux_input: Set the source for analog input.
+ * @aout_level: Analog output level
  * @pullup: Pullup resistor value. Valid in Bidirectional mode only.
  * @function: See pmic_mpp_functions[].
  * @drive_strength: Amount of current in sink mode
@@ -131,6 +134,7 @@ struct pmic_mpp_pad {
 	unsigned int	num_sources;
 	unsigned int	power_source;
 	unsigned int	amux_input;
+	unsigned int	aout_level;
 	unsigned int	pullup;
 	unsigned int	function;
 	unsigned int	drive_strength;
@@ -145,6 +149,7 @@ struct pmic_mpp_state {
 
 static const struct pinconf_generic_params pmic_mpp_bindings[] = {
 	{"qcom,amux-route",	PMIC_MPP_CONF_AMUX_ROUTE,	0},
+	{"qcom,analog-level",	PMIC_MPP_CONF_ANALOG_LEVEL,	0},
 	{"qcom,analog-mode",	PMIC_MPP_CONF_ANALOG_MODE,	0},
 	{"qcom,sink-mode",	PMIC_MPP_CONF_SINK_MODE,	0},
 };
@@ -152,6 +157,7 @@ static const struct pinconf_generic_params pmic_mpp_bindings[] = {
 #ifdef CONFIG_DEBUG_FS
 static const struct pin_config_item pmic_conf_items[] = {
 	PCONFDUMP(PMIC_MPP_CONF_AMUX_ROUTE, "analog mux", NULL, true),
+	PCONFDUMP(PMIC_MPP_CONF_ANALOG_LEVEL, "analog level", NULL, true),
 	PCONFDUMP(PMIC_MPP_CONF_ANALOG_MODE, "analog output", NULL, false),
 	PCONFDUMP(PMIC_MPP_CONF_SINK_MODE, "sink mode", NULL, false),
 };
@@ -358,6 +364,9 @@ static int pmic_mpp_config_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_DRIVE_STRENGTH:
 		arg = pad->drive_strength;
 		break;
+	case PMIC_MPP_CONF_ANALOG_LEVEL:
+		arg = pad->aout_level;
+		break;
 	case PMIC_MPP_CONF_ANALOG_MODE:
 		arg = pad->analog_mode;
 		break;
@@ -433,6 +442,9 @@ static int pmic_mpp_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				return -EINVAL;
 			pad->amux_input = arg;
 			break;
+		case PMIC_MPP_CONF_ANALOG_LEVEL:
+			pad->aout_level = arg;
+			break;
 		case PMIC_MPP_CONF_ANALOG_MODE:
 			pad->analog_mode = !!arg;
 			break;
@@ -462,6 +474,10 @@ static int pmic_mpp_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	if (ret < 0)
 		return ret;
 
+	ret = pmic_mpp_write(state, pad, PMIC_MPP_REG_AOUT_CTL, pad->aout_level);
+	if (ret < 0)
+		return ret;
+
 	ret = pmic_mpp_write_mode_ctl(state, pad);
 	if (ret < 0)
 		return ret;
@@ -507,6 +523,7 @@ static void pmic_mpp_config_dbg_show(struct pinctrl_dev *pctldev,
 		seq_printf(s, " %-7s", modes[pad->analog_mode ? 1 : (pad->sink_mode ? 2 : 0)]);
 		seq_printf(s, " %-7s", pmic_mpp_functions[pad->function]);
 		seq_printf(s, " vin-%d", pad->power_source);
+		seq_printf(s, " %d", pad->aout_level);
 		seq_printf(s, " %-8s", biases[pad->pullup]);
 		seq_printf(s, " %-4s", pad->out_value ? "high" : "low");
 	}
@@ -748,6 +765,12 @@ static int pmic_mpp_populate(struct pmic_mpp_state *state,
 
 	pad->drive_strength = val;
 
+	val = pmic_mpp_read(state, pad, PMIC_MPP_REG_AOUT_CTL);
+	if (val < 0)
+		return val;
+
+	pad->aout_level = val;
+
 	val = pmic_mpp_read(state, pad, PMIC_MPP_REG_EN_CTL);
 	if (val < 0)
 		return val;
-- 
1.8.2.2
