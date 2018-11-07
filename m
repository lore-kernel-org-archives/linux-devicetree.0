Return-Path: <SRS0=GM37=NS=ti.com=j-keerthy@kernel.org>
From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 3/6] ARM: dts: am437x-gp-evm: Add pinctrl for debugss pins
Date: Wed, 7 Nov 2018 10:34:17 +0530
Message-ID: <1541567060-5671-4-git-send-email-j-keerthy@ti.com>
In-Reply-To: <1541567060-5671-1-git-send-email-j-keerthy@ti.com>
References: <1541567060-5671-1-git-send-email-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: tony@atomide.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, d-gerlach@ti.com, t-kristo@ti.com, j-keerthy@ti.com
List-ID: <devicetree@vger.kernel.org>

From: Dave Gerlach <d-gerlach@ti.com>

The pins used by debugss are not configued by default, place pulldowns
on the pins for maximum power savings during sleep.

Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
[t-kristo@ti.com: converted to use AM4372_IOPAD macro]
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/am437x-gp-evm.dts | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
index ae6b24e..9c5e969 100644
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -162,7 +162,7 @@
 
 &am43xx_pinmux {
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&wlan_pins_default &ddr3_vtt_toggle_default &unused_pins>;
+	pinctrl-0 = <&wlan_pins_default &ddr3_vtt_toggle_default &unused_pins &debugss_pins>;
 	pinctrl-1 = <&wlan_pins_sleep>;
 
 	ddr3_vtt_toggle_default: ddr_vtt_toggle_default {
@@ -580,6 +580,18 @@
 			AM4372_IOPAD(0xb18, PIN_INPUT_PULLDOWN | MUX_MODE7)
 		>;
 	};
+
+	debugss_pins: pinmux_debugss_pins {
+		pinctrl-single,pins = <
+			AM4372_IOPAD(0xa90, PIN_INPUT_PULLDOWN)
+			AM4372_IOPAD(0xa94, PIN_INPUT_PULLDOWN)
+			AM4372_IOPAD(0xa98, PIN_INPUT_PULLDOWN)
+			AM4372_IOPAD(0xa9c, PIN_INPUT_PULLDOWN)
+			AM4372_IOPAD(0xaa0, PIN_INPUT_PULLDOWN)
+			AM4372_IOPAD(0xaa4, PIN_INPUT_PULLDOWN)
+			AM4372_IOPAD(0xaa8, PIN_INPUT_PULLDOWN)
+		>;
+	};
 };
 
 &uart0 {
-- 
1.9.1
