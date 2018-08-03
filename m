From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH 2/5] arm: dts: qcom: Add sdcc nodes for ipq8064
Date: Fri,  3 Aug 2018 19:40:16 +0530
Message-ID: <1533305419-29152-3-git-send-email-sricharan@codeaurora.org>
References: <1533305419-29152-1-git-send-email-sricharan@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533305419-29152-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

The relevant data for sdcc.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 76 +++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index e02d588..e78618e 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -555,5 +555,81 @@
 			status = "disabled";
 			perst-gpio = <&qcom_pinmux 63 GPIO_ACTIVE_LOW>;
 		};
+
+		vsdcc_fixed: vsdcc-regulator {
+			compatible = "regulator-fixed";
+			regulator-name = "SDCC Power";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+		};
+
+		sdcc1bam:dma@12402000 {
+			compatible = "qcom,bam-v1.3.0";
+			reg = <0x12402000 0x8000>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc SDC1_H_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+		};
+
+		sdcc3bam:dma@12182000 {
+			compatible = "qcom,bam-v1.3.0";
+			reg = <0x12182000 0x8000>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc SDC3_H_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+		};
+
+		amba {
+			compatible = "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			sdcc@12400000 {
+				status          = "disabled";
+				compatible      = "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00051180>;
+				reg             = <0x12400000 0x2000>;
+				interrupts      = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "cmd_irq";
+				clocks          = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
+				clock-names     = "mclk", "apb_pclk";
+				bus-width       = <8>;
+				max-frequency   = <96000000>;
+				non-removable;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				mmc-ddr-1_8v;
+				vmmc-supply = <&vsdcc_fixed>;
+				dmas = <&sdcc1bam 2>, <&sdcc1bam 1>;
+				dma-names = "tx", "rx";
+			};
+
+			sdcc@12180000 {
+				compatible      = "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00051180>;
+				status          = "disabled";
+				reg             = <0x12180000 0x2000>;
+				interrupts      = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "cmd_irq";
+				clocks          = <&gcc SDC3_CLK>, <&gcc SDC3_H_CLK>;
+				clock-names     = "mclk", "apb_pclk";
+				bus-width       = <8>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency   = <192000000>;
+				#mmc-ddr-1_8v;
+				sd-uhs-sdr104;
+				sd-uhs-ddr50;
+				vqmmc-supply = <&vsdcc_fixed>;
+				dmas = <&sdcc3bam 2>, <&sdcc3bam 1>;
+				dma-names = "tx", "rx";
+			};
+		};
 	};
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
