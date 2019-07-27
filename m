From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] ARM: dts: imx: Cleanup style around assignment operator
Date: Sat, 27 Jul 2019 16:26:40 +0200
Message-ID: <20190727142640.23014-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: devicetree@vger.kernel.org

Use a space before and after assignment operator to have consistent
style.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/imx6sll.dtsi              |  4 ++--
 arch/arm/boot/dts/imx6sx.dtsi               |  4 ++--
 arch/arm/boot/dts/imx6ul-phytec-pcl063.dtsi |  2 +-
 arch/arm/boot/dts/imx6ul.dtsi               | 12 ++++++------
 arch/arm/boot/dts/imx7d.dtsi                |  4 ++--
 arch/arm/boot/dts/imx7s.dtsi                |  6 +++---
 arch/arm/boot/dts/imx7ulp.dtsi              |  8 ++++----
 7 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sll.dtsi b/arch/arm/boot/dts/imx6sll.dtsi
index b0a77ff70b67..0a103a19dc0a 100644
--- a/arch/arm/boot/dts/imx6sll.dtsi
+++ b/arch/arm/boot/dts/imx6sll.dtsi
@@ -234,7 +234,7 @@
 					compatible = "fsl,imx6sl-uart", "fsl,imx6q-uart",
 						     "fsl,imx21-uart";
 					reg = <0x02018000 0x4000>;
-					interrupts =<GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+					interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 					dmas = <&sdma 31 4 0>, <&sdma 32 4 0>;
 					dma-names = "rx", "tx";
 					clocks = <&clks IMX6SLL_CLK_UART4_IPG>,
@@ -801,7 +801,7 @@
 				compatible = "fsl,imx6sll-uart", "fsl,imx6q-uart",
 					     "fsl,imx21-uart";
 				reg = <0x021f4000 0x4000>;
-				interrupts =<GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&sdma 33 4 0>, <&sdma 34 4 0>;
 				dma-names = "rx", "tx";
 				clocks = <&clks IMX6SLL_CLK_UART5_IPG>,
diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index bb25add90f19..b36f31b633d3 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -926,8 +926,8 @@
 					 <&clks IMX6SX_CLK_ENET_PTP>;
 				clock-names = "ipg", "ahb", "ptp",
 					      "enet_clk_ref", "enet_out";
-				fsl,num-tx-queues=<3>;
-				fsl,num-rx-queues=<3>;
+				fsl,num-tx-queues = <3>;
+				fsl,num-rx-queues = <3>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/imx6ul-phytec-pcl063.dtsi b/arch/arm/boot/dts/imx6ul-phytec-pcl063.dtsi
index fc2997449b49..a2fec095e2ab 100644
--- a/arch/arm/boot/dts/imx6ul-phytec-pcl063.dtsi
+++ b/arch/arm/boot/dts/imx6ul-phytec-pcl063.dtsi
@@ -70,7 +70,7 @@
 
 &i2c1 {
 	pinctrl-names = "default";
-	pinctrl-0 =<&pinctrl_i2c1>;
+	pinctrl-0 = <&pinctrl_i2c1>;
 	clock-frequency = <100000>;
 	status = "okay";
 
diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 81d4b4925127..ef6437198db1 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -510,8 +510,8 @@
 					 <&clks IMX6UL_CLK_ENET2_REF_125M>;
 				clock-names = "ipg", "ahb", "ptp",
 					      "enet_clk_ref", "enet_out";
-				fsl,num-tx-queues=<1>;
-				fsl,num-rx-queues=<1>;
+				fsl,num-tx-queues = <1>;
+				fsl,num-rx-queues = <1>;
 				status = "disabled";
 			};
 
@@ -845,8 +845,8 @@
 					 <&clks IMX6UL_CLK_ENET_REF>;
 				clock-names = "ipg", "ahb", "ptp",
 					      "enet_clk_ref", "enet_out";
-				fsl,num-tx-queues=<1>;
-				fsl,num-rx-queues=<1>;
+				fsl,num-tx-queues = <1>;
+				fsl,num-rx-queues = <1>;
 				status = "disabled";
 			};
 
@@ -858,7 +858,7 @@
 					 <&clks IMX6UL_CLK_USDHC1>,
 					 <&clks IMX6UL_CLK_USDHC1>;
 				clock-names = "ipg", "ahb", "per";
-				fsl,tuning-step= <2>;
+				fsl,tuning-step = <2>;
 				fsl,tuning-start-tap = <20>;
 				bus-width = <4>;
 				status = "disabled";
@@ -873,7 +873,7 @@
 					 <&clks IMX6UL_CLK_USDHC2>;
 				clock-names = "ipg", "ahb", "per";
 				bus-width = <4>;
-				fsl,tuning-step= <2>;
+				fsl,tuning-step = <2>;
 				fsl,tuning-start-tap = <20>;
 				status = "disabled";
 			};
diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index 42528d2812a2..9c8dd32cc035 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -147,8 +147,8 @@
 			<&clks IMX7D_ENET_PHY_REF_ROOT_CLK>;
 		clock-names = "ipg", "ahb", "ptp",
 			"enet_clk_ref", "enet_out";
-		fsl,num-tx-queues=<3>;
-		fsl,num-rx-queues=<3>;
+		fsl,num-tx-queues = <3>;
+		fsl,num-rx-queues = <3>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index c1a4fff5ceda..710f850e785c 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -151,7 +151,7 @@
 		compatible = "fsl,imx7d-tempmon";
 		interrupt-parent = <&gpc>;
 		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
-		fsl,tempmon =<&anatop>;
+		fsl,tempmon = <&anatop>;
 		nvmem-cells = <&tempmon_calib>,
 			<&tempmon_temp_grade>;
 		nvmem-cell-names = "calib", "temp_grade";
@@ -1184,8 +1184,8 @@
 					<&clks IMX7D_ENET_PHY_REF_ROOT_CLK>;
 				clock-names = "ipg", "ahb", "ptp",
 					"enet_clk_ref", "enet_out";
-				fsl,num-tx-queues=<3>;
-				fsl,num-rx-queues=<3>;
+				fsl,num-tx-queues = <3>;
+				fsl,num-rx-queues = <3>;
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
index 992747a57442..ddab7c42b955 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -201,12 +201,12 @@
 			clocks = <&scg1 IMX7ULP_CLK_NIC1_BUS_DIV>,
 				 <&scg1 IMX7ULP_CLK_NIC1_DIV>,
 				 <&pcc2 IMX7ULP_CLK_USDHC0>;
-			clock-names ="ipg", "ahb", "per";
+			clock-names = "ipg", "ahb", "per";
 			assigned-clocks = <&pcc2 IMX7ULP_CLK_USDHC0>;
 			assigned-clock-parents = <&scg1 IMX7ULP_CLK_NIC1_DIV>;
 			bus-width = <4>;
 			fsl,tuning-start-tap = <20>;
-			fsl,tuning-step= <2>;
+			fsl,tuning-step = <2>;
 			status = "disabled";
 		};
 
@@ -217,12 +217,12 @@
 			clocks = <&scg1 IMX7ULP_CLK_NIC1_BUS_DIV>,
 				 <&scg1 IMX7ULP_CLK_NIC1_DIV>,
 				 <&pcc2 IMX7ULP_CLK_USDHC1>;
-			clock-names ="ipg", "ahb", "per";
+			clock-names = "ipg", "ahb", "per";
 			assigned-clocks = <&pcc2 IMX7ULP_CLK_USDHC1>;
 			assigned-clock-parents = <&scg1 IMX7ULP_CLK_NIC1_DIV>;
 			bus-width = <4>;
 			fsl,tuning-start-tap = <20>;
-			fsl,tuning-step= <2>;
+			fsl,tuning-step = <2>;
 			status = "disabled";
 		};
 
-- 
2.17.1
