From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH 4/7] arm64: dts: qcom: Add msm8916 USB configuration nodes
Date: Thu,  4 Jun 2015 12:19:03 +0300
Message-ID: <1433409546-23995-5-git-send-email-ivan.ivanov@linaro.org>
References: <1433409546-23995-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1433409546-23995-1-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add Host, Device and OTG configuration nodes.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 39 +++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 9ff0eb4..5911de0 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -268,6 +268,45 @@
 			status = "disabled";
 		};

+		usb_dev: usb@78d9000 {
+			compatible = "qcom,ci-hdrc";
+			reg = <0x78d9000 0x400>;
+			dr_mode = "peripheral";
+			interrupts = <GIC_SPI 134 IRQ_TYPE_NONE>;
+			usb-phy = <&usb_otg>;
+			status = "disabled";
+		};
+
+		usb_host: ehci@78d9000 {
+			compatible = "qcom,ehci-host";
+			reg = <0x78d9000 0x400>;
+			interrupts = <GIC_SPI 134 IRQ_TYPE_NONE>;
+			usb-phy = <&usb_otg>;
+			status = "disabled";
+		};
+
+		usb_otg: phy@78d9000 {
+			compatible = "qcom,usb-otg-snps";
+			reg = <0x78d9000 0x400>;
+			interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_BOTH>,
+				     <GIC_SPI 140 IRQ_TYPE_EDGE_RISING>;
+
+			qcom,vdd-levels = <1 5 7>;
+			qcom,phy-init-sequence = <0x44 0x6B 0x24 0x13>;
+			dr_mode = "peripheral";
+			qcom,otg-control = <2>; // PMIC
+
+			clocks = <&gcc GCC_USB_HS_AHB_CLK>,
+				 <&gcc GCC_USB_HS_SYSTEM_CLK>,
+				 <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
+			clock-names = "iface", "core", "sleep";
+
+			resets = <&gcc GCC_USB2A_PHY_BCR>,
+				 <&gcc GCC_USB_HS_BCR>;
+			reset-names = "phy", "link";
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
--
1.9.1
