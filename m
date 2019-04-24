From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/5] arm64: dts: bitmain: Add UART pinctrl support for Sophon Edge
Date: Wed, 24 Apr 2019 17:32:22 +0530
Message-ID: <20190424120224.22660-4-manivannan.sadhasivam@linaro.org>
References: <20190424120224.22660-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424120224.22660-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, linux-gpio@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add pinctrl support for UARTs exposed on the Sophon Edge board.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../boot/dts/bitmain/bm1880-sophon-edge.dts   | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts b/arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts
index 6a3255597138..41da899963b2 100644
--- a/arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts
+++ b/arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts
@@ -34,17 +34,46 @@
 	};
 };
 
+&pinctrl {
+	pinctrl_uart0_default: pinctrl-uart0-default {
+		pinmux {
+			groups = "uart0_grp";
+			function = "uart0";
+		};
+	};
+
+	pinctrl_uart1_default: pinctrl-uart1-default {
+		pinmux {
+			groups = "uart1_grp";
+			function = "uart1";
+		};
+	};
+
+	pinctrl_uart2_default: pinctrl-uart2-default {
+		pinmux {
+			groups = "uart2_grp";
+			function = "uart2";
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 	clocks = <&uart_clk>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart0_default>;
 };
 
 &uart1 {
 	status = "okay";
 	clocks = <&uart_clk>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1_default>;
 };
 
 &uart2 {
 	status = "okay";
 	clocks = <&uart_clk>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2_default>;
 };
-- 
2.17.1
