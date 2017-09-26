From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH v3 06/14] ARM: dts: sun8i: orangepi-lite: Fix node with unit name and no reg property
Date: Tue, 26 Sep 2017 09:22:26 +0200
Message-ID: <20170926072234.27481-7-clabbe.montjoie@gmail.com>
References: <20170926072234.27481-1-clabbe.montjoie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170926072234.27481-1-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, maxime.ripard@free-electrons.com, wens@csie.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch fix the warning "xxx has a unit name, but no reg property" by
removing "@0" from such node.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts
index 9b47a0def740..a70a1daf4e2c 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts
@@ -141,19 +141,19 @@
 };
 
 &pio {
-	leds_opc: led_pins@0 {
+	leds_opc: led_pins {
 		pins = "PA15";
 		function = "gpio_out";
 	};
 };
 
 &r_pio {
-	leds_r_opc: led_pins@0 {
+	leds_r_opc: led_pins {
 		pins = "PL10";
 		function = "gpio_out";
 	};
 
-	sw_r_opc: key_pins@0 {
+	sw_r_opc: key_pins {
 		pins = "PL3";
 		function = "gpio_in";
 	};
-- 
2.13.5
