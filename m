From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 07/17] arm64: dts: qcom: qcs404: Add sdcc1 node
Date: Tue, 30 Oct 2018 15:40:58 +0530
Message-ID: <20181030101108.11041-8-vkoul@kernel.org>
References: <20181030101108.11041-1-vkoul@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181030101108.11041-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Add the sdcc1 node and enable it for the QCS404-EVB.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dts | 64 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi    | 17 +++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dts b/arch/arm64/boot/dts/qcom/qcs404-evb.dts
index 5bae7163a093..b79969153fba 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dts
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dts
@@ -116,3 +116,67 @@
 		};
 	};
 };
+
+&sdcc1 {
+	status = "ok";
+
+	mmc-ddr-1_8v;
+	bus-width = <8>;
+	non-removable;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc1_on>;
+	pinctrl-1 = <&sdc1_off>;
+};
+
+&tlmm {
+	sdc1_on: sdc1-on {
+		clk {
+			pins = "sdc1_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+
+		cmd {
+			pins = "sdc1_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		data {
+			pins = "sdc1_data";
+			bias-pull-up;
+			dreive-strength = <10>;
+		};
+
+		rclk {
+			pins = "sdc1_rclk";
+			bias-pull-down;
+		};
+	};
+
+	sdc1_off: sdc1-off {
+		clk {
+			pins = "sdc1_clk";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		cmd {
+			pins = "sdc1_cmd";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		data {
+			pins = "sdc1_data";
+			bias-pull-up;
+			dreive-strength = <2>;
+		};
+
+		rclk {
+			pins = "sdc1_rclk";
+			bias-pull-down;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 1cfc8857d112..52e525d664bf 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -270,6 +270,23 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		sdcc1: sdcc@7804000 {
+			compatible = "qcom,sdhci-msm-v5";
+			reg = <0x7804000 0x1000>, <0x7805000 0x1000>;
+			reg-names = "hc_mem", "cmdq_mem";
+
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&xo_board>;
+			clock-names = "core", "iface", "xo";
+
+			status = "disabled";
+		};
 	};
 
 	smp2p-adsp {
-- 
2.14.4
