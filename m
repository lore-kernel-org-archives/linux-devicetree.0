From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 6/7] ARM: dts: at91: at91sam9rl: switch to new sckc bindings
Date: Tue, 19 Feb 2019 18:01:59 +0100
Message-ID: <20190219170200.3608-7-alexandre.belloni@bootlin.com>
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
 arch/arm/boot/dts/at91sam9rl.dtsi | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/at91sam9rl.dtsi b/arch/arm/boot/dts/at91sam9rl.dtsi
index 3862ff2f26e0..f5f09a30dd3f 100644
--- a/arch/arm/boot/dts/at91sam9rl.dtsi
+++ b/arch/arm/boot/dts/at91sam9rl.dtsi
@@ -867,30 +867,11 @@
 				status = "disabled";
 			};
 
-			sckc@fffffd50 {
+			clk32k: sckc@fffffd50 {
 				compatible = "atmel,at91sam9x5-sckc";
 				reg = <0xfffffd50 0x4>;
-
-				slow_osc: slow_osc {
-					compatible = "atmel,at91sam9x5-clk-slow-osc";
-					#clock-cells = <0>;
-					atmel,startup-time-usec = <1200000>;
-					clocks = <&slow_xtal>;
-				};
-
-				slow_rc_osc: slow_rc_osc {
-					compatible = "atmel,at91sam9x5-clk-slow-rc-osc";
-					#clock-cells = <0>;
-					atmel,startup-time-usec = <75>;
-					clock-frequency = <32768>;
-					clock-accuracy = <50000000>;
-				};
-
-				clk32k: slck {
-					compatible = "atmel,at91sam9x5-clk-slow";
-					#clock-cells = <0>;
-					clocks = <&slow_rc_osc &slow_osc>;
-				};
+				clocks = <&slow_xtal>;
+				#clock-cells = <0>;
 			};
 
 			rtc@fffffd20 {
-- 
2.20.1
