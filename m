From: Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH] iio: adc: Drop if clock from Renesas GyroADC bindings
Date: Thu, 20 Apr 2017 17:42:16 +0200
Message-ID: <20170420154216.32709-1-marek.vasut+renesas@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

The "if" interface clock speed is actually derived from the "fck"
block clock, as in the hardware they are the same clock. Drop the
incorrect second "if" clock and retain only the "fck" clock.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
To: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/iio/adc/renesas,gyroadc.txt | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/renesas,gyroadc.txt b/Documentation/devicetree/bindings/iio/adc/renesas,gyroadc.txt
index f5b0adae6010..2a62908a774a 100644
--- a/Documentation/devicetree/bindings/iio/adc/renesas,gyroadc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/renesas,gyroadc.txt
@@ -16,8 +16,7 @@ Required properties:
 - clocks:	References to all the clocks specified in the clock-names
 		property as specified in
 		Documentation/devicetree/bindings/clock/clock-bindings.txt.
-- clock-names:	Shall contain "fck" and "if". The "fck" is the GyroADC block
-		clock, the "if" is the interface clock.
+- clock-names:	Shall contain "fck". The "fck" is the GyroADC block clock.
 - power-domains: Must contain a reference to the PM domain, if available.
 - #address-cells: Should be <1> (setting for the subnodes) for all ADCs
 		except for "fujitsu,mb88101a". Should be <0> (setting for
@@ -75,8 +74,8 @@ Example:
 	adc@e6e54000 {
 		compatible = "renesas,r8a7791-gyroadc", "renesas,rcar-gyroadc";
 		reg = <0 0xe6e54000 0 64>;
-		clocks = <&mstp9_clks R8A7791_CLK_GYROADC>, <&clk_65m>;
-		clock-names = "fck", "if";
+		clocks = <&mstp9_clks R8A7791_CLK_GYROADC>;
+		clock-names = "fck";
 		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
 
 		pinctrl-0 = <&adc_pins>;
-- 
2.11.0
