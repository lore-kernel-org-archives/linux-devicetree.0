From: <gabriel.fernandez@st.com>
Subject: [PATCH 1/2] ARM: dts: stm32f429: add LSI and LSE clocks
Date: Fri, 4 Nov 2016 09:52:56 +0100
Message-ID: <1478249577-25999-2-git-send-email-gabriel.fernandez@st.com>
References: <1478249577-25999-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478249577-25999-1-git-send-email-gabriel.fernandez@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, gabriel.fernandez@st.com
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
