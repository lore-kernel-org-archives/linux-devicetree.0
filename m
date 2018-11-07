Return-Path: <SRS0=GM37=NS=ti.com=j-keerthy@kernel.org>
From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 6/6] ARM: dts: am437x-gp-evm: Add sleep state for beeper pins
Date: Wed, 7 Nov 2018 10:34:20 +0530
Message-ID: <1541567060-5671-7-git-send-email-j-keerthy@ti.com>
In-Reply-To: <1541567060-5671-1-git-send-email-j-keerthy@ti.com>
References: <1541567060-5671-1-git-send-email-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: tony@atomide.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, d-gerlach@ti.com, t-kristo@ti.com, j-keerthy@ti.com
List-ID: <devicetree@vger.kernel.org>

Add sleep state for beeper pins. Without this there was a power
increase during the suspend and standby states on V3_3D domain.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/am437x-gp-evm.dts | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
index 0127d11..f4a20ca 100644
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -161,7 +161,8 @@
 	beeper: beeper {
 		compatible = "gpio-beeper";
 		pinctrl-names = "default";
-		pinctrl-0 = <&beeper_pins>;
+		pinctrl-0 = <&beeper_pins_default>;
+		pinctrl-1 = <&beeper_pins_sleep>;
 		gpios = <&gpio4 12 GPIO_ACTIVE_HIGH>;
 	};
 };
@@ -523,12 +524,18 @@
 		>;
 	};
 
-	beeper_pins: beeper_pins {
+	beeper_pins_default: beeper_pins_default {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9e0, PIN_OUTPUT_PULLUP | MUX_MODE7)	/* cam1_field.gpio4_12 */
 		>;
 	};
 
+	beeper_pins_sleep: beeper_pins_sleep {
+		pinctrl-single,pins = <
+			AM4372_IOPAD(0x9e0, PIN_INPUT_PULLDOWN | MUX_MODE7)	/* cam1_field.gpio4_12 */
+		>;
+	};
+
 	unused_pins: unused_pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x854, PIN_INPUT_PULLDOWN | MUX_MODE7)
-- 
1.9.1
