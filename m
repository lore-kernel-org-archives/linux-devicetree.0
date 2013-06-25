From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH 4/4] pinctrl: remove bindings for pinconf options needing more thought
Date: Tue, 25 Jun 2013 14:57:10 +0200
Message-ID: <201306251457.10980.heiko@sntech.de>
References: <201306251455.01540.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306251455.01540.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, James Hogan <james.hogan@imgtec.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

Some options currently take arguments in unspecified driver-specific units.
As pointed out by Stephen Warren, driver specific values should not be part
of generic devicetree bindings describing the hardware.

Therefore remove the critical bindings again, before they become part of
an official release.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../devicetree/bindings/pinctrl/pinctrl-bindings.txt         |   10 ----------
 drivers/pinctrl/pinconf-generic.c                            |    3 ---
 2 files changed, 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index 788ab09..aeb3c99 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -154,10 +154,7 @@ drive-open-source	- drive with open source
 drive-strength		- sink or source at most X mA
 input-schmitt-enable	- enable schmitt-trigger mode
 input-schmitt-disable	- disable schmitt-trigger mode
-input-schmitt		- run in schmitt-trigger mode with hysteresis X
 input-debounce		- debounce mode with debound time X
-power-source		- select power source X
-slew-rate		- use slew-rate X
 low-power-enable	- enable low power mode
 low-power-disable	- disable low power mode
 output-low		- set the pin to output mode with low level
@@ -170,16 +167,9 @@ Arguments for parameters:
 
 - drive-strength takes as argument the target strength in mA.
 
-- input-schmitt takes as argument the adjustable hysteresis in a
-  driver-specific format
-
 - input-debounce takes the debounce time in usec as argument
   or 0 to disable debouncing
 
-- power-source argument is the custom value describing the source to select
-
-- slew-rate takes as argument the target rate in a driver-specific format
-
 All parameters not listed here, do not take an argument.
 
 More in-depth documentation on these parameters can be found in
diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 2b271d5..8594f03 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -161,10 +161,7 @@ static struct pinconf_generic_dt_params dt_params[] = {
 	{ "drive-strength", PIN_CONFIG_DRIVE_STRENGTH, 0 },
 	{ "input-schmitt-enable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 1 },
 	{ "input-schmitt-disable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 0 },
-	{ "input-schmitt", PIN_CONFIG_INPUT_SCHMITT, 0 },
 	{ "input-debounce", PIN_CONFIG_INPUT_DEBOUNCE, 0 },
-	{ "power-source", PIN_CONFIG_POWER_SOURCE, 0 },
-	{ "slew-rate", PIN_CONFIG_SLEW_RATE, 0 },
 	{ "low-power-enable", PIN_CONFIG_LOW_POWER_MODE, 1 },
 	{ "low-power-disable", PIN_CONFIG_LOW_POWER_MODE, 0 },
 	{ "output-low", PIN_CONFIG_OUTPUT, 0, },
-- 
1.7.10.4
