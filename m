From: Baolin Wang <baolin.wang@spreadtrum.com>
Subject: [PATCH v4 1/3] pinctrl: Add sleep related configuration
Date: Wed, 21 Jun 2017 19:55:37 +0800
Message-ID: <62a67526907157d41235403bd05af309fd4db16b.1498045588.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, mark.rutland@arm.com, robh+dt@kernel.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org, baolin.wang@spreadtrum.com
List-Id: devicetree@vger.kernel.org

In some scenarios, we should set some pins as input/output/pullup/pulldown
when the specified system goes into deep sleep mode, then when the system
goes into deep sleep mode, these pins will be set automatically by hardware.

Usually we can set the "sleep" state to set sleep related config, but one SoC
usually has not only one system (especially for mobile SoC), some systems on
the SoC which did not run linux kernel, they can not select the "sleep" state
when they go into deep sleep mode.

Thus we introduce some sleep related config into pinconf-generic for users to
configure.

Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
---
 - Add this patch since v4.
---
 .../bindings/pinctrl/pinctrl-bindings.txt          |   12 ++++++++++++
 drivers/pinctrl/pinconf-generic.c                  |   10 ++++++++++
 include/linux/pinctrl/pinconf-generic.h            |   14 ++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index bf3f7b0..e098059 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -236,6 +236,18 @@ low-power-enable	- enable low power mode
 low-power-disable	- disable low power mode
 output-low		- set the pin to output mode with low level
 output-high		- set the pin to output mode with high level
+sleep-bias-pull-up	- pull up the pin when the specified system goes into
+			  deep sleep mode
+sleep-bias-pull-down	- pull down the pin when the specified system goes into
+			  deep sleep mode
+sleep-input-enable	- enable input on pin when the specified system goes
+			  into deep sleep mode (no effect on output)
+sleep-intput-disable	- disable input on pin when the specified system goes
+			  into deep sleep mode (no effect on output)
+sleep-output-low	- set the pin to output mode with low level when the
+			  specified system goes into deep sleep mode
+sleep-output-high	- set the pin to output mode with high level when the
+			  specified system goes into deep sleep mode
 slew-rate		- set the slew rate
 
 For example:
diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index ce3335a..2847026 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -46,6 +46,10 @@
 	PCONFDUMP(PIN_CONFIG_LOW_POWER_MODE, "pin low power", "mode", true),
 	PCONFDUMP(PIN_CONFIG_OUTPUT, "pin output", "level", true),
 	PCONFDUMP(PIN_CONFIG_POWER_SOURCE, "pin power source", "selector", true),
+	PCONFDUMP(PIN_CONFIG_SLEEP_BIAS_PULL_DOWN, "sleep input bias pull down", NULL, false),
+	PCONFDUMP(PIN_CONFIG_SLEEP_BIAS_PULL_UP, "sleep input bias pull up", NULL, false),
+	PCONFDUMP(PIN_CONFIG_SLEEP_INPUT_ENABLE, "sleep input enabled", NULL, false),
+	PCONFDUMP(PIN_CONFIG_SLEEP_OUTPUT, "sleep pin output", NULL, true),
 	PCONFDUMP(PIN_CONFIG_SLEW_RATE, "slew rate", NULL, true),
 };
 
@@ -175,6 +179,12 @@ void pinconf_generic_dump_config(struct pinctrl_dev *pctldev,
 	{ "output-high", PIN_CONFIG_OUTPUT, 1, },
 	{ "output-low", PIN_CONFIG_OUTPUT, 0, },
 	{ "power-source", PIN_CONFIG_POWER_SOURCE, 0 },
+	{ "sleep-bias-pull-down", PIN_CONFIG_SLEEP_BIAS_PULL_DOWN, 1 },
+	{ "sleep-bias-pull-up", PIN_CONFIG_SLEEP_BIAS_PULL_UP, 1 },
+	{ "sleep-input-disable", PIN_CONFIG_SLEEP_INPUT_ENABLE, 0 },
+	{ "sleep-input-enable", PIN_CONFIG_SLEEP_INPUT_ENABLE, 1 },
+	{ "sleep-output-high", PIN_CONFIG_SLEEP_OUTPUT, 1 },
+	{ "sleep-output-low", PIN_CONFIG_SLEEP_OUTPUT, 0 },
 	{ "slew-rate", PIN_CONFIG_SLEW_RATE, 0 },
 };
 
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 7620eb1..3deb6bc 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -80,6 +80,16 @@
  * @PIN_CONFIG_POWER_SOURCE: if the pin can select between different power
  *	supplies, the argument to this parameter (on a custom format) tells
  *	the driver which alternative power source to use.
+ * @PIN_CONFIG_SLEEP_BIAS_PULL_DOWN: the pin will be pulled down when the
+ *	specified system goes into deep sleep mode.
+ * @PIN_CONFIG_SLEEP_BIAS_PULL_UP: the pin will be pulled up when the specified
+ *	system goes into deep sleep mode.
+ * @PIN_CONFIG_SLEEP_INPUT_ENABLE: enable the pin's input when the specified
+ *	system goes into deep sleep mode.  Note that this does not affect the
+ *	pin's ability to drive output.  1 enables input, 0 disables input.
+ * @PIN_CONFIG_SLEEP_OUTPUT: this will configure the pin as an output when the
+ *	specified system goes into deep sleep mode. Use argument 1 to indicate
+ *	high level, argument 0 to indicate low level.
  * @PIN_CONFIG_SLEW_RATE: if the pin can select slew rate, the argument to
  *	this parameter (on a custom format) tells the driver which alternative
  *	slew rate to use.
@@ -107,6 +117,10 @@ enum pin_config_param {
 	PIN_CONFIG_LOW_POWER_MODE,
 	PIN_CONFIG_OUTPUT,
 	PIN_CONFIG_POWER_SOURCE,
+	PIN_CONFIG_SLEEP_BIAS_PULL_DOWN,
+	PIN_CONFIG_SLEEP_BIAS_PULL_UP,
+	PIN_CONFIG_SLEEP_INPUT_ENABLE,
+	PIN_CONFIG_SLEEP_OUTPUT,
 	PIN_CONFIG_SLEW_RATE,
 	PIN_CONFIG_END = 0x7F,
 	PIN_CONFIG_MAX = 0xFF,
-- 
1.7.9.5
