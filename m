From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 7/7] ARM: dts: at91: sama5d3: switch to new sckc bindings
Date: Tue, 19 Feb 2019 18:02:00 +0100
Message-ID: <20190219170200.3608-8-alexandre.belloni@bootlin.com>
References: <20190219170200.3608-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219170200.3608-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Remove the child nodes of the sckc as they are not necessary anymore.

Also, switch to the new atmel,sama5d3-sckc compatible string to use the
proper startup time for the RC oscillator (500 µs instead of 75).

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 arch/arm/boot/dts/at91-wb50n.dtsi |  2 +-
 arch/arm/boot/dts/sama5d3.dtsi    | 27 ++++-----------------------
 2 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/at91-wb50n.dtsi b/arch/arm/boot/dts/at91-wb50n.dtsi
index 85692c8ef2b1..4ed8500a5cb8 100644
--- a/arch/arm/boot/dts/at91-wb50n.dtsi
+++ b/arch/arm/boot/dts/at91-wb50n.dtsi
@@ -42,7 +42,7 @@
 	clock-frequency = <12000000>;
 };
 
-&slow_osc {
+&clk32k {
 	atmel,osc-bypass;
 };
 
diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
index 1408fa4a62e4..05f6554d4177 100644
--- a/arch/arm/boot/dts/sama5d3.dtsi
+++ b/arch/arm/boot/dts/sama5d3.dtsi
@@ -1370,30 +1370,11 @@
 				status = "disabled";
 			};
 
-			sckc@fffffe50 {
-				compatible = "atmel,at91sam9x5-sckc";
+			clk32k: sckc@fffffe50 {
+				compatible = "atmel,sama5d3-sckc";
 				reg = <0xfffffe50 0x4>;
-
-				slow_rc_osc: slow_rc_osc {
-					compatible = "atmel,at91sam9x5-clk-slow-rc-osc";
-					#clock-cells = <0>;
-					clock-frequency = <32768>;
-					clock-accuracy = <50000000>;
-					atmel,startup-time-usec = <75>;
-				};
-
-				slow_osc: slow_osc {
-					compatible = "atmel,at91sam9x5-clk-slow-osc";
-					#clock-cells = <0>;
-					clocks = <&slow_xtal>;
-					atmel,startup-time-usec = <1200000>;
-				};
-
-				clk32k: slowck {
-					compatible = "atmel,at91sam9x5-clk-slow";
-					#clock-cells = <0>;
-					clocks = <&slow_rc_osc &slow_osc>;
-				};
+				clocks = <&slow_xtal>;
+				#clock-cells = <0>;
 			};
 
 			rtc@fffffeb0 {
-- 
2.20.1
