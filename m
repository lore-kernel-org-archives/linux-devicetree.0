From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 4/7] ARM: dts: at91: at91sam9x5: switch to new sckc bindings
Date: Tue, 19 Feb 2019 18:01:57 +0100
Message-ID: <20190219170200.3608-5-alexandre.belloni@bootlin.com>
References: <20190219170200.3608-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219170200.3608-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Remove the child nodes of the sckc as they are not necessary anymore.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 arch/arm/boot/dts/at91sam9x5.dtsi | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/at91sam9x5.dtsi b/arch/arm/boot/dts/at91sam9x5.dtsi
index 07443a387a8f..ff50f49842f4 100644
--- a/arch/arm/boot/dts/at91sam9x5.dtsi
+++ b/arch/arm/boot/dts/at91sam9x5.dtsi
@@ -148,28 +148,11 @@
 				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
 			};
 
-			sckc@fffffe50 {
+			clk32k: sckc@fffffe50 {
 				compatible = "atmel,at91sam9x5-sckc";
 				reg = <0xfffffe50 0x4>;
-
-				slow_osc: slow_osc {
-					compatible = "atmel,at91sam9x5-clk-slow-osc";
-					#clock-cells = <0>;
-					clocks = <&slow_xtal>;
-				};
-
-				slow_rc_osc: slow_rc_osc {
-					compatible = "atmel,at91sam9x5-clk-slow-rc-osc";
-					#clock-cells = <0>;
-					clock-frequency = <32768>;
-					clock-accuracy = <50000000>;
-				};
-
-				clk32k: slck {
-					compatible = "atmel,at91sam9x5-clk-slow";
-					#clock-cells = <0>;
-					clocks = <&slow_rc_osc>, <&slow_osc>;
-				};
+				clocks = <&slow_xtal>;
+				#clock-cells = <0>;
 			};
 
 			tcb0: timer@f8008000 {
-- 
2.20.1
