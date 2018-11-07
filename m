Return-Path: <SRS0=GM37=NS=ti.com=j-keerthy@kernel.org>
From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 1/6] ARM: dts: am437x-gp-evm: Add state for ddr3 vtt toggle pin
Date: Wed, 7 Nov 2018 10:34:15 +0530
Message-ID: <1541567060-5671-2-git-send-email-j-keerthy@ti.com>
In-Reply-To: <1541567060-5671-1-git-send-email-j-keerthy@ti.com>
References: <1541567060-5671-1-git-send-email-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: tony@atomide.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, d-gerlach@ti.com, t-kristo@ti.com, j-keerthy@ti.com
List-ID: <devicetree@vger.kernel.org>

From: Dave Gerlach <d-gerlach@ti.com>

Add pinctrl data for ddr_vtt_toggle pin so that it is configured
for proper state during DeepSleep0. The pin should enter DS0 off mode
and hold the line low so VTT regulator is kept off while suspended.
It is also important for the PULLUP to be set on this pin so that
on removal of isolation, the VTT line is pulled high as a requirement
for bringing the DDR3 out of self-refresh.

This toggling is dependent on the IO isolation controlled by the
wkup_m3. Without placing the IOs into isolation the DS0 states set for
the pin will not be latched into effect during suspend.

Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/am437x-gp-evm.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
index 601bf4d..d119f2a 100644
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -162,9 +162,15 @@
 
 &am43xx_pinmux {
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&wlan_pins_default>;
+	pinctrl-0 = <&wlan_pins_default &ddr3_vtt_toggle_default>;
 	pinctrl-1 = <&wlan_pins_sleep>;
 
+	ddr3_vtt_toggle_default: ddr_vtt_toggle_default {
+		pinctrl-single,pins = <
+			0x25C (DS0_PULL_UP_DOWN_EN | PIN_OUTPUT_PULLUP | DS0_FORCE_OFF_MODE | MUX_MODE7) /* spi0_cs0.gpio5_7 */
+		>;
+	};
+
 	i2c0_pins: i2c0_pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x988, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE0)  /* i2c0_sda.i2c0_sda */
-- 
1.9.1
