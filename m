From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH] ARM: dts: stm32: Add DAC support on stm32h7
Date: Mon, 10 Jul 2017 13:59:06 +0200
Message-ID: <1499687946-29853-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.torgue@st.com, mcoquelin.stm32@gmail.com, linux@armlinux.org.uk, mark.rutland@arm.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, fabrice.gasnier@st.com
List-Id: devicetree@vger.kernel.org

Add support for DAC (Digital to Analog Converter) to STM32H7.
STM32H7 DAC has two output channels.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32h743.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
index 4685629..d0b28c5 100644
--- a/arch/arm/boot/dts/stm32h743.dtsi
+++ b/arch/arm/boot/dts/stm32h743.dtsi
@@ -74,6 +74,30 @@
 			interrupts = <50>;
 			clocks = <&timer_clk>;
 		};
+
+		dac: dac@40007400 {
+			compatible = "st,stm32h7-dac-core";
+			reg = <0x40007400 0x400>;
+			clocks = <&timer_clk>;
+			clock-names = "pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			dac1: dac@1 {
+				compatible = "st,stm32-dac";
+				#io-channels-cells = <1>;
+				reg = <1>;
+				status = "disabled";
+			};
+
+			dac2: dac@2 {
+				compatible = "st,stm32-dac";
+				#io-channels-cells = <1>;
+				reg = <2>;
+				status = "disabled";
+			};
+		};
 	};
 };
 
-- 
1.9.1
