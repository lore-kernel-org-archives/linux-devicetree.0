From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH 1/4] arm64: dts: msm8996: Add device node for qcom qusb2 phy
Date: Mon, 31 Jul 2017 12:14:41 +0530
Message-ID: <1501483484-2207-2-git-send-email-vivek.gautam@codeaurora.org>
References: <1501483484-2207-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501483484-2207-1-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Adding device node for QUSB2 phy and the required infrastructure
to enable support for the same. This phy is used by dwc3 controller
present on msm8996.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi |  8 +++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi        | 51 ++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 5366708ee78f..4476e9238150 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -88,6 +88,14 @@
 			cd-gpios = <&msmgpio 38 0x1>;
 			status = "okay";
 		};
+
+		phy@7411000 {
+			status = "okay";
+		};
+
+		phy@7412000 {
+			status = "okay";
+		};
 	};
 
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index d6a30fe81b77..019ec9345dbc 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -621,6 +621,57 @@
 					       <960000000>,
 					       <825000000>;
 		};
+
+		qfprom@74000 {
+			compatible = "qcom,qfprom";
+			reg = <0x74000 0x8ff>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			qusb2p_hstx_trim: hstx_trim@24e {
+				reg = <0x24e 0x2>;
+				bits = <5 4>;
+			};
+
+			qusb2s_hstx_trim: hstx_trim@24f {
+				reg = <0x24f 0x1>;
+				bits = <1 4>;
+			};
+		};
+
+		hsusb_phy1: phy@7411000 {
+			compatible = "qcom,msm8996-qusb2-phy";
+			reg = <0x7411000 0x180>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+				<&gcc GCC_RX1_USB2_CLKREF_CLK>;
+			clock-names = "cfg_ahb", "ref";
+
+			vdda-pll-supply = <&pm8994_l12>;
+			vdda-phy-dpdm-supply = <&pm8994_l24>;
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+			nvmem-cells = <&qusb2p_hstx_trim>;
+			status = "disabled";
+		};
+
+		hsusb_phy2: phy@7412000 {
+			compatible = "qcom,msm8996-qusb2-phy";
+			reg = <0x7412000 0x180>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+				<&gcc GCC_RX2_USB2_CLKREF_CLK>;
+			clock-names = "cfg_ahb", "ref";
+
+			vdda-pll-supply = <&pm8994_l12>;
+			vdda-phy-dpdm-supply = <&pm8994_l24>;
+
+			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
+			nvmem-cells = <&qusb2s_hstx_trim>;
+			status = "disabled";
+		};
 	};
 
 	adsp-pil {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
