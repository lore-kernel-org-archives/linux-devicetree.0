From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2] pinctrl: generic: Add output-enable property
Date: Thu, 22 Jun 2017 12:00:58 +0200
Message-ID: <1498125658-14554-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, andy.shevchenko@gmail.com, dongas86@gmail.com, geert+renesas@glider.be, Chris.Brandt@renesas.com, laurent.pinchart@ideasonboard.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add output-enable generic pin configuration property.
This properties allows enabling/disabling pin's output capabilities
without actually driving any value on the line.

---
v1->v2:
 - Expand the property description as suggested by Laurent. I ended up
   mentioning the in-famous output buffer :)

One (more) question to GPIO people on:
+	PCONFDUMP(PIN_CONFIG_OUTPUT_ENABLE, "output enabled", NULL, false),

I copied this from INPUT_ENABLE where arguments 2 and 3 passed to PCONFDUMP are
NULL and false even if the property has an argument, used to enable/disable
the input mode. Is this intended? Should that be turned instead to
-	PCONFDUMP(PIN_CONFIG_INPUT_ENABLE, "input enabled", NULL, false),
+	PCONFDUMP(PIN_CONFIG_INPUT_ENABLE, "input enabled", "enabled", true),

Note that the same applies to most of the properties that have an
"enable"/"disable" argument. Just to make sure this is done on purpose.

Thanks
   j
 .../devicetree/bindings/pinctrl/pinctrl-bindings.txt      |  2 ++
 drivers/pinctrl/pinconf-generic.c                         |  3 +++
 include/linux/pinctrl/pinconf-generic.h                   | 15 +++++++++++----
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index f01d154..f8af190 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -259,6 +259,8 @@ input-debounce		- debounce mode with debound time X
 power-source		- select between different power supplies
 low-power-enable	- enable low power mode
 low-power-disable	- disable low power mode
+output-disable		- disable output on a pin
+output-enable		- enable output on a pin
 output-low		- set the pin to output mode with low level
 output-high		- set the pin to output mode with high level
 slew-rate		- set the slew rate
diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 720a19f..fc0c230 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -44,6 +44,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT, "input schmitt trigger", NULL, false),
 	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT_ENABLE, "input schmitt enabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_LOW_POWER_MODE, "pin low power", "mode", true),
+	PCONFDUMP(PIN_CONFIG_OUTPUT_ENABLE, "output enabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_OUTPUT, "pin output", "level", true),
 	PCONFDUMP(PIN_CONFIG_POWER_SOURCE, "pin power source", "selector", true),
 	PCONFDUMP(PIN_CONFIG_SLEW_RATE, "slew rate", NULL, true),
@@ -172,6 +173,8 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "input-schmitt-enable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 1 },
 	{ "low-power-disable", PIN_CONFIG_LOW_POWER_MODE, 0 },
 	{ "low-power-enable", PIN_CONFIG_LOW_POWER_MODE, 1 },
+	{ "output-disable", PIN_CONFIG_OUTPUT_ENABLE, 0 },
+	{ "output-enable", PIN_CONFIG_OUTPUT_ENABLE, 1 },
 	{ "output-high", PIN_CONFIG_OUTPUT, 1, },
 	{ "output-low", PIN_CONFIG_OUTPUT, 0, },
 	{ "power-source", PIN_CONFIG_POWER_SOURCE, 0 },
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 7620eb1..231d307 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -73,10 +73,16 @@
  *	operation, if several modes of operation are supported these can be
  *	passed in the argument on a custom form, else just use argument 1
  *	to indicate low power mode, argument 0 turns low power mode off.
- * @PIN_CONFIG_OUTPUT: this will configure the pin as an output. Use argument
- *	1 to indicate high level, argument 0 to indicate low level. (Please
- *	see Documentation/pinctrl.txt, section "GPIO mode pitfalls" for a
- *	discussion around this parameter.)
+ * @PIN_CONFIG_OUTPUT_ENABLE: this will enable the pin's output mode
+ * 	without driving a value there. For most platforms this reduces to
+ * 	enable the output buffers and then let the pin controller current
+ * 	configuration (eg. the currently selected mux function) drive values on
+ * 	the line. Use argument 1 to enable output mode, argument 0 to disable
+ * 	it.
+ * @PIN_CONFIG_OUTPUT: this will configure the pin as an output and drive a
+ * 	value on the line. Use argument 1 to indicate high level, argument 0 to
+ * 	indicate low level. (Please see Documentation/pinctrl.txt, section
+ * 	"GPIO mode pitfalls" for a discussion around this parameter.)
  * @PIN_CONFIG_POWER_SOURCE: if the pin can select between different power
  *	supplies, the argument to this parameter (on a custom format) tells
  *	the driver which alternative power source to use.
@@ -105,6 +111,7 @@ enum pin_config_param {
 	PIN_CONFIG_INPUT_SCHMITT,
 	PIN_CONFIG_INPUT_SCHMITT_ENABLE,
 	PIN_CONFIG_LOW_POWER_MODE,
+	PIN_CONFIG_OUTPUT_ENABLE,
 	PIN_CONFIG_OUTPUT,
 	PIN_CONFIG_POWER_SOURCE,
 	PIN_CONFIG_SLEW_RATE,
--
2.7.4
