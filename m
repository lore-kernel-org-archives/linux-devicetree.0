From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/7] dt-bindings: clock: at91: new sckc bindings
Date: Tue, 19 Feb 2019 18:01:54 +0100
Message-ID: <20190219170200.3608-2-alexandre.belloni@bootlin.com>
References: <20190219170200.3608-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219170200.3608-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Remove the need for child nodes in the sckc binding to be able to remove
dtc warnings and have a more modern binding.

Also document optional properties.

Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../devicetree/bindings/clock/at91-clock.txt  | 30 ++++++++-----------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/at91-clock.txt b/Documentation/devicetree/bindings/clock/at91-clock.txt
index e9f70fcdfe80..cb838c1c4bdd 100644
--- a/Documentation/devicetree/bindings/clock/at91-clock.txt
+++ b/Documentation/devicetree/bindings/clock/at91-clock.txt
@@ -8,29 +8,23 @@ Slow Clock controller:
 
 Required properties:
 - compatible : shall be one of the following:
-	"atmel,at91sam9x5-sckc" or
+	"atmel,at91sam9x5-sckc",
+	"atmel,sama5d3-sckc" or
 	"atmel,sama5d4-sckc":
 		at91 SCKC (Slow Clock Controller)
-		This node contains the slow clock definitions.
-
-	"atmel,at91sam9x5-clk-slow-osc":
-		at91 slow oscillator
-
-	"atmel,at91sam9x5-clk-slow-rc-osc":
-		at91 internal slow RC oscillator
-- reg : defines the IO memory reserved for the SCKC.
-- #size-cells : shall be 0 (reg is used to encode clk id).
-- #address-cells : shall be 1 (reg is used to encode clk id).
+- #clock-cells : shall be 0.
+- clocks : shall be the input parent clock phandle for the clock.
 
+Optional properties:
+- atmel,osc-bypass : boolean property. Set this when a clock signal is directly
+  provided on XIN.
 
 For example:
-	sckc: sckc@fffffe50 {
-		compatible = "atmel,sama5d3-pmc";
-		reg = <0xfffffe50 0x4>
-		#size-cells = <0>;
-		#address-cells = <1>;
-
-		/* put at91 slow clocks here */
+	sckc@fffffe50 {
+		compatible = "atmel,at91sam9x5-sckc";
+		reg = <0xfffffe50 0x4>;
+		clocks = <&slow_xtal>;
+		#clock-cells = <0>;
 	};
 
 Power Management Controller (PMC):
-- 
2.20.1
