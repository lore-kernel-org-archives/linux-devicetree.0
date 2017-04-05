From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v4 1/9] pinctrl: generic: Add bi-directional and output-enable
Date: Wed,  5 Apr 2017 16:07:19 +0200
Message-ID: <1491401247-7030-2-git-send-email-jacopo+renesas@jmondi.org>
References: <1491401247-7030-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1491401247-7030-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linus.walleij@linaro.org, geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add bi-directional and output-enable pin configuration properties.

bi-directional allows to specify when a pin shall operate in input and
output mode at the same time. This is particularly useful in platforms
where input and output buffers have to be manually enabled.

output-enable is just syntactic sugar to specify that a pin shall
operate in output mode, ignoring the provided argument.
This pairs with input-enable pin configuration option.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 2 ++
 drivers/pinctrl/pinconf-generic.c                              | 3 +++
 include/linux/pinctrl/pinconf-generic.h                        | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index bf3f7b0..f2ed458 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -222,6 +222,7 @@ bias-bus-hold		- latch weakly
 bias-pull-up		- pull up the pin
 bias-pull-down		- pull down the pin
 bias-pull-pin-default	- use pin-default pull state
+bi-directional		- pin supports simultaneous input/output operations
 drive-push-pull		- drive actively high and low
 drive-open-drain	- drive with open drain
 drive-open-source	- drive with open source
@@ -234,6 +235,7 @@ input-debounce		- debounce mode with debound time X
 power-source		- select between different power supplies
 low-power-enable	- enable low power mode
 low-power-disable	- disable low power mode
+output-enable		- enable output on pin regardless of output value
 output-low		- set the pin to output mode with low level
 output-high		- set the pin to output mode with high level
 slew-rate		- set the slew rate
diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index ce3335a..03e6808 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -35,6 +35,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_BIAS_PULL_PIN_DEFAULT,
 				"input bias pull to pin specific state", NULL, false),
 	PCONFDUMP(PIN_CONFIG_BIAS_PULL_UP, "input bias pull up", NULL, false),
+	PCONFDUMP(PIN_CONFIG_BIDIRECTIONAL, "bi-directional pin operations", NULL, false),
 	PCONFDUMP(PIN_CONFIG_DRIVE_OPEN_DRAIN, "output drive open drain", NULL, false),
 	PCONFDUMP(PIN_CONFIG_DRIVE_OPEN_SOURCE, "output drive open source", NULL, false),
 	PCONFDUMP(PIN_CONFIG_DRIVE_PUSH_PULL, "output drive push pull", NULL, false),
@@ -160,6 +161,7 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "bias-pull-up", PIN_CONFIG_BIAS_PULL_UP, 1 },
 	{ "bias-pull-pin-default", PIN_CONFIG_BIAS_PULL_PIN_DEFAULT, 1 },
 	{ "bias-pull-down", PIN_CONFIG_BIAS_PULL_DOWN, 1 },
+	{ "bi-directional", PIN_CONFIG_BIDIRECTIONAL, 1 },
 	{ "drive-open-drain", PIN_CONFIG_DRIVE_OPEN_DRAIN, 0 },
 	{ "drive-open-source", PIN_CONFIG_DRIVE_OPEN_SOURCE, 0 },
 	{ "drive-push-pull", PIN_CONFIG_DRIVE_PUSH_PULL, 0 },
@@ -172,6 +174,7 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "input-schmitt-enable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 1 },
 	{ "low-power-disable", PIN_CONFIG_LOW_POWER_MODE, 0 },
 	{ "low-power-enable", PIN_CONFIG_LOW_POWER_MODE, 1 },
+	{ "output-enable", PIN_CONFIG_OUTPUT, 1, },
 	{ "output-high", PIN_CONFIG_OUTPUT, 1, },
 	{ "output-low", PIN_CONFIG_OUTPUT, 0, },
 	{ "power-source", PIN_CONFIG_POWER_SOURCE, 0 },
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 7620eb1..279e3c5 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -42,6 +42,8 @@
  * @PIN_CONFIG_BIAS_PULL_UP: the pin will be pulled up (usually with high
  *	impedance to VDD). If the argument is != 0 pull-up is enabled,
  *	if it is 0, pull-up is total, i.e. the pin is connected to VDD.
+ * @PIN_CONFIG_BIDIRECTIONAL: the pin will be configured to allow simultaneous
+ *	input and output operations.
  * @PIN_CONFIG_DRIVE_OPEN_DRAIN: the pin will be driven with open drain (open
  *	collector) which means it is usually wired with other output ports
  *	which are then pulled up with an external resistor. Setting this
@@ -96,6 +98,7 @@ enum pin_config_param {
 	PIN_CONFIG_BIAS_PULL_DOWN,
 	PIN_CONFIG_BIAS_PULL_PIN_DEFAULT,
 	PIN_CONFIG_BIAS_PULL_UP,
+	PIN_CONFIG_BIDIRECTIONAL,
 	PIN_CONFIG_DRIVE_OPEN_DRAIN,
 	PIN_CONFIG_DRIVE_OPEN_SOURCE,
 	PIN_CONFIG_DRIVE_PUSH_PULL,
-- 
2.7.4
