From: <gabriel.fernandez@st.com>
Subject: [PATCH v2 2/6] ARM: dts: stm32f429: add LSI and LSE clocks
Date: Fri, 14 Oct 2016 11:18:15 +0200
Message-ID: <1476436699-21879-3-git-send-email-gabriel.fernandez@st.com>
References: <1476436699-21879-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1476436699-21879-1-git-send-email-gabriel.fernandez@st.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, gabriel.fernandez@st.com, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@st.com>

This patch adds lsi / lse oscillators. These clocks can be use by
RTC clocks.
The clock drivers needs to disable the power domain write protection using
syscon / regmap to enable these clocks.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 336ee4f..2700449 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -56,6 +56,18 @@
 			compatible = "fixed-clock";
 			clock-frequency = <0>;
 		};
+
+		clk-lse {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <32768>;
+		};
+
+		clk-lsi {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+		};
 	};
 
 	soc {
@@ -185,6 +197,11 @@
 			interrupts = <1>, <2>, <3>, <6>, <7>, <8>, <9>, <10>, <23>, <40>, <41>, <42>, <62>, <76>;
 		};
 
+		pwrcfg: power-config@40007000 {
+			compatible = "syscon";
+			reg = <0x40007000 0x400>;
+		};
+
 		pin-controller {
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -340,6 +357,7 @@
 			compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
 			reg = <0x40023800 0x400>;
 			clocks = <&clk_hse>;
+			st,syscfg = <&pwrcfg>;
 		};
 
 		dma1: dma-controller@40026000 {
-- 
1.9.1

