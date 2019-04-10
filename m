From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH] arm64: dts: sprd: Add clock properties for serial devices
Date: Wed, 10 Apr 2019 15:22:50 +0800
Message-ID: <1246f7a9ce912458ea3b889b0c0e392897a664c8.1554879978.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: olof@lixom.net, arm@kernel.org, linux-arm-kernel@lists.infradead.org, orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We've introduced power management logics for the Spreadtrum serial
controller by commit 062ec2774c8a ("serial: sprd: Add power management
for the Spreadtrum serial controller"), thus add related clock properties
to support this feature.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 arch/arm64/boot/dts/sprd/whale2.dtsi |   16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/sprd/whale2.dtsi b/arch/arm64/boot/dts/sprd/whale2.dtsi
index 34b6ca0..b5c5dce 100644
--- a/arch/arm64/boot/dts/sprd/whale2.dtsi
+++ b/arch/arm64/boot/dts/sprd/whale2.dtsi
@@ -75,7 +75,9 @@
 					     "sprd,sc9836-uart";
 				reg = <0x0 0x100>;
 				interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&ext_26m>;
+				clock-names = "enable", "uart", "source";
+				clocks = <&apapb_gate CLK_UART0_EB>,
+				       <&ap_clk CLK_UART0>, <&ext_26m>;
 				status = "disabled";
 			};
 
@@ -84,7 +86,9 @@
 					     "sprd,sc9836-uart";
 				reg = <0x100000 0x100>;
 				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&ext_26m>;
+				clock-names = "enable", "uart", "source";
+				clocks = <&apapb_gate CLK_UART1_EB>,
+				       <&ap_clk CLK_UART1>, <&ext_26m>;
 				status = "disabled";
 			};
 
@@ -93,7 +97,9 @@
 					     "sprd,sc9836-uart";
 				reg = <0x200000 0x100>;
 				interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&ext_26m>;
+				clock-names = "enable", "uart", "source";
+				clocks = <&apapb_gate CLK_UART2_EB>,
+				       <&ap_clk CLK_UART2>, <&ext_26m>;
 				status = "disabled";
 			};
 
@@ -102,7 +108,9 @@
 					     "sprd,sc9836-uart";
 				reg = <0x300000 0x100>;
 				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&ext_26m>;
+				clock-names = "enable", "uart", "source";
+				clocks = <&apapb_gate CLK_UART3_EB>,
+				       <&ap_clk CLK_UART3>, <&ext_26m>;
 				status = "disabled";
 			};
 		};
-- 
1.7.9.5
