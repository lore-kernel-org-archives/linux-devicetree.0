Return-Path: <SRS0=GM37=NS=ti.com=j-keerthy@kernel.org>
From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 2/6] ARM: dts: am437x-gp-evm: Add pinctrl for unused_pins
Date: Wed, 7 Nov 2018 10:34:16 +0530
Message-ID: <1541567060-5671-3-git-send-email-j-keerthy@ti.com>
In-Reply-To: <1541567060-5671-1-git-send-email-j-keerthy@ti.com>
References: <1541567060-5671-1-git-send-email-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: tony@atomide.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, d-gerlach@ti.com, t-kristo@ti.com, j-keerthy@ti.com
List-ID: <devicetree@vger.kernel.org>

From: Dave Gerlach <d-gerlach@ti.com>

There are several pins on this EVM that are not in use but they can
still draw power if misconfigured. Create a pinctrl entry for these pins
and configure each one for optimal power savings.

Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
[t-kristo@ti.com: converted to use AM4372_IOPAD macro]
Signed-off-by: Tero Kristo <t-kristo@ti.com>

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/am437x-gp-evm.dts | 50 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
index d119f2a..ae6b24e 100644
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -162,7 +162,7 @@
 
 &am43xx_pinmux {
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&wlan_pins_default &ddr3_vtt_toggle_default>;
+	pinctrl-0 = <&wlan_pins_default &ddr3_vtt_toggle_default &unused_pins>;
 	pinctrl-1 = <&wlan_pins_sleep>;
 
 	ddr3_vtt_toggle_default: ddr_vtt_toggle_default {
@@ -532,6 +532,54 @@
 		>;
 	};
 
+	unused_pins: unused_pins {
+		pinctrl-single,pins = <
+			AM4372_IOPAD(0x854, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0x858, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0x860, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0x864, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0x868, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0x86c, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0x950, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0x990, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0x994, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0x998, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0x99c, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0x9a0, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xa3c, PIN_INPUT | PULL_DISABLE | MUX_MODE7)
+			AM4372_IOPAD(0xa40, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xa44, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xa48, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xa4c, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xa50, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xa54, PIN_INPUT | PULL_DISABLE | MUX_MODE7)
+			AM4372_IOPAD(0xa58, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xa60, PIN_INPUT | PULL_DISABLE | MUX_MODE7)
+			AM4372_IOPAD(0xa68, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xa70, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xa78, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xa7c, PIN_INPUT | PULL_DISABLE)
+			AM4372_IOPAD(0xac8, PIN_INPUT_PULLDOWN)
+			AM4372_IOPAD(0xad4, PIN_INPUT_PULLDOWN)
+			AM4372_IOPAD(0xad8, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xadc, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xae0, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xae4, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xae8, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xaec, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xaf0, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xaf4, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xaf8, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xafc, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xb00, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xb04, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xb08, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xb0c, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xb10, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xb14, PIN_INPUT_PULLDOWN | MUX_MODE7)
+			AM4372_IOPAD(0xb18, PIN_INPUT_PULLDOWN | MUX_MODE7)
+		>;
+	};
 };
 
 &uart0 {
-- 
1.9.1
