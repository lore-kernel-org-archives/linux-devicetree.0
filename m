From: Baolin Wang <baolin.wang@spreadtrum.com>
Subject: [PATCH v5 1/3] pinctrl: Add sleep related state to indicate sleep related configs
Date: Fri, 14 Jul 2017 16:08:00 +0800
Message-ID: <eb7925c9642efb8a1ee5804a9b06f06d9f082089.1500018536.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, mark.rutland@arm.com, robh+dt@kernel.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org, baolin.wang@spreadtrum.com
List-Id: devicetree@vger.kernel.org

In some scenarios, we should set some pins as input/output/pullup/pulldown
when the specified system goes into deep sleep mode, then when the system
goes into deep sleep mode, these pins will be set automatically by hardware.

That means some pins are not controlled by any specific driver in the OS, but
need to be controlled when entering sleep mode. Thus we introduce one sleep
state config into pinconf-generic for users to configure.

Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
---
Changes since v4:
 - Add sleep-hardware-state config to indicate sleep related configs.
---
 .../bindings/pinctrl/pinctrl-bindings.txt          |    2 ++
 drivers/pinctrl/pinconf-generic.c                  |    2 ++
 include/linux/pinctrl/pinconf-generic.h            |    2 ++
 3 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index bf3f7b0..2365a21 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -236,6 +236,8 @@ low-power-enable	- enable low power mode
 low-power-disable	- disable low power mode
 output-low		- set the pin to output mode with low level
 output-high		- set the pin to output mode with high level
+sleep-hardware-state	- indicate this is sleep related state which will be programmed
+			  into the registers for the sleep state.
 slew-rate		- set the slew rate
 
 For example:
diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index ce3335a..9a7f168 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -46,6 +46,7 @@
 	PCONFDUMP(PIN_CONFIG_LOW_POWER_MODE, "pin low power", "mode", true),
 	PCONFDUMP(PIN_CONFIG_OUTPUT, "pin output", "level", true),
 	PCONFDUMP(PIN_CONFIG_POWER_SOURCE, "pin power source", "selector", true),
+	PCONFDUMP(PIN_CONFIG_SLEEP_HARDWARE_STATE, "sleep hardware state", NULL, false),
 	PCONFDUMP(PIN_CONFIG_SLEW_RATE, "slew rate", NULL, true),
 };
 
@@ -175,6 +176,7 @@ void pinconf_generic_dump_config(struct pinctrl_dev *pctldev,
 	{ "output-high", PIN_CONFIG_OUTPUT, 1, },
 	{ "output-low", PIN_CONFIG_OUTPUT, 0, },
 	{ "power-source", PIN_CONFIG_POWER_SOURCE, 0 },
+	{ "sleep-hardware-state", PIN_CONFIG_SLEEP_HARDWARE_STATE, 0 },
 	{ "slew-rate", PIN_CONFIG_SLEW_RATE, 0 },
 };
 
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 7620eb1..a5d0fb4 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -80,6 +80,7 @@
  * @PIN_CONFIG_POWER_SOURCE: if the pin can select between different power
  *	supplies, the argument to this parameter (on a custom format) tells
  *	the driver which alternative power source to use.
+ * @PIN_CONFIG_SLEEP_HARDWARE_STATE: indicate this is sleep related state.
  * @PIN_CONFIG_SLEW_RATE: if the pin can select slew rate, the argument to
  *	this parameter (on a custom format) tells the driver which alternative
  *	slew rate to use.
@@ -107,6 +108,7 @@ enum pin_config_param {
 	PIN_CONFIG_LOW_POWER_MODE,
 	PIN_CONFIG_OUTPUT,
 	PIN_CONFIG_POWER_SOURCE,
+	PIN_CONFIG_SLEEP_HARDWARE_STATE,
 	PIN_CONFIG_SLEW_RATE,
 	PIN_CONFIG_END = 0x7F,
 	PIN_CONFIG_MAX = 0xFF,
-- 
1.7.9.5

