From: Andy Gross <agross@codeaurora.org>
Subject: [PATCH 3/4] ARM: dts: qcom: Add DWC3 USB support on IPQ8064
Date: Fri, 20 Nov 2015 02:35:08 -0600
Message-ID: <1448008509-8913-4-git-send-email-agross@codeaurora.org>
References: <1448008509-8913-1-git-send-email-agross@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1448008509-8913-1-git-send-email-agross@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org
Cc: Felipe Balbi <balbi@ti.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <agross@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch adds Qualcomm DWC3 USB nodes to device tree to enable support for the
DWC3 controller found on IPQ8064/AP148 platforms.

Signed-off-by: Andy Gross <agross@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts | 24 +++++++++
 arch/arm/boot/dts/qcom-ipq8064.dtsi      | 89 ++++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
index d501382..bf1638c 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
+++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
@@ -97,5 +97,29 @@
 		sata@29000000 {
 			status = "ok";
 		};
+
+		phy@100f8800 {
+			status = "ok";
+		};
+
+		phy@100f8830 {
+			status = "ok";
+		};
+
+		usb30@0 {
+			status = "ok";
+		};
+
+		phy@110f8800 {
+			status = "ok";
+		};
+
+		phy@110f8830 {
+			status = "ok";
+		};
+
+		usb30@1 {
+			status = "ok";
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index fa69863..b2dcd9d 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -329,5 +329,94 @@
 			#reset-cells = <1>;
 		};
 
+		hs_phy_0: phy@100f8800 {
+			compatible = "qcom,dwc3-hs-usb-phy";
+			reg = <0x100f8800 0x30>;
+			clocks = <&gcc USB30_0_UTMI_CLK>;
+			clock-names = "ref";
+
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		ss_phy_0: phy@100f8830 {
+			compatible = "qcom,dwc3-ss-usb-phy";
+			reg = <0x100f8830 0x30>;
+
+			clocks = <&gcc USB30_0_MASTER_CLK>;
+			clock-names = "ref";
+
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usb30@0 {
+			compatible = "qcom,dwc3";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&gcc USB30_0_MASTER_CLK>;
+			clock-names = "core";
+
+			syscon-tcsr = <&tcsr 0xb0 1>;
+
+			ranges;
+
+			status = "disabled";
+
+			dwc3@10000000 {
+				compatible = "snps,dwc3";
+				reg = <0x10000000 0xcd00>;
+				interrupts = <0 205 0x4>;
+				phys = <&hs_phy_0>, <&ss_phy_0>;
+				phy-names = "usb2-phy", "usb3-phy";
+				tx-fifo-resize;
+				dr_mode = "host";
+			};
+		};
+
+		hs_phy_1: phy@110f8800 {
+			compatible = "qcom,dwc3-hs-usb-phy";
+			reg = <0x110f8800 0x30>;
+			clocks = <&gcc USB30_1_UTMI_CLK>;
+			clock-names = "ref";
+
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		ss_phy_1: phy@110f8830 {
+			compatible = "qcom,dwc3-ss-usb-phy";
+			reg = <0x110f8830 0x30>;
+
+			clocks = <&gcc USB30_1_MASTER_CLK>;
+			clock-names = "ref";
+
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usb30@1 {
+			compatible = "qcom,dwc3";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&gcc USB30_1_MASTER_CLK>;
+			clock-names = "core";
+
+			syscon-tcsr = <&tcsr 0xb0 0>;
+
+			ranges;
+
+			status = "disabled";
+
+			dwc3@11000000 {
+				compatible = "snps,dwc3";
+				reg = <0x11000000 0xcd00>;
+				interrupts = <0 110 0x4>;
+				phys = <&hs_phy_1>, <&ss_phy_1>;
+				phy-names = "usb2-phy", "usb3-phy";
+				tx-fifo-resize;
+				dr_mode = "host";
+			};
+		};
 	};
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
