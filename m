From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH] ARM: dts: sun6i: Add clock-output-names to osc24M clock
Date: Tue,  8 Jan 2019 15:25:26 +0800
Message-ID: <20190108072526.2621-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The osc24M clock does not have a "clock-output-names" property, which
means that the clock name is derived from the node name in Linux. The
node name was changed in commit acfd5bbe2641 ("ARM: dts: sun6i: Change
clock node names to avoid warnings"). This breaks Linux as the sunxi-ng
clock driver implicitly depends on the external clock being named
"osc24M".

Add a "clock-output-names" property to restore the previous behavior.

Fixes: acfd5bbe2641 ("ARM: dts: sun6i: Change clock node names to avoid
		      warnings")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
This is a critical fix for v5.0-rc. Without it the A31 boots up to the
UART failing to get its clock rate, and thus failing to setup a console.

Also the timer-sun5i init code hits a divide by zero exception. I'll
send a separate patch to make this one fail gracefully.
---
 arch/arm/boot/dts/sun6i-a31.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index 353d90f99b40..13304b8c5139 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -216,6 +216,7 @@
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <24000000>;
+			clock-output-names = "osc24M";
 		};
 
 		osc32k: clk-32k {
-- 
2.20.1
