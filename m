From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 02/10] ARM: dts: apq8064: Add usb host support.
Date: Thu,  9 Apr 2015 09:22:53 +0100
Message-ID: <1428567773-10809-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1428567674-10672-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1428567674-10672-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: galak@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: bjorn.andersson@sonymobile.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, inux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds device tree nodes to support two usb hosts on APQ8064
SOC.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 23 +++++++++++++++
 arch/arm/boot/dts/qcom-apq8064.dtsi        | 47 ++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index e641001..0b562f0 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -49,6 +49,29 @@
 			};
 		};
 
+
+		usb3_phy: phy@12520000 {
+			status		= "okay";
+			vddcx-supply	= <&pm8921_s3>;
+			v3p3-supply	= <&pm8921_l3>;
+			v1p8-supply	= <&pm8921_l23>;
+		};
+
+		usb4_phy: phy@12530000 {
+			status		= "okay";
+			vddcx-supply	= <&pm8921_s3>;
+			v3p3-supply	= <&pm8921_l3>;
+			v1p8-supply	= <&pm8921_l23>;
+		};
+
+		usb3: usb@12520000 {
+			status = "okay";
+		};
+
+		usb4: usb@12530000 {
+			status = "okay";
+		};
+
 		amba {
 			/* eMMC */
 			sdcc1: sdcc@12400000 {
diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index d9166eb..2d7703d 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -2,6 +2,7 @@
 
 #include "skeleton.dtsi"
 #include <dt-bindings/clock/qcom,gcc-msm8960.h>
+#include <dt-bindings/reset/qcom,gcc-msm8960.h>
 #include <dt-bindings/clock/qcom,mmcc-msm8960.h>
 #include <dt-bindings/mfd/qcom-rpm.h>
 #include <dt-bindings/soc/qcom,gsbi.h>
@@ -548,6 +549,52 @@
 			};
 		};
 
+		usb3_phy: phy@12520000 {
+			compatible	= "qcom,usb-otg-ci";
+			reg		= <0x12520000 0x400>;
+			interrupts	= <GIC_SPI 188 IRQ_TYPE_NONE>;
+			status		= "disabled";
+			dr_mode		= "host";
+
+			clocks		= <&gcc USB_HS3_XCVR_CLK>,
+					  <&gcc USB_HS3_H_CLK>;
+			clock-names	= "core", "iface";
+
+			resets		= <&gcc USB_HS3_RESET>;
+			reset-names	= "link";
+		};
+
+		usb4_phy: phy@12530000 {
+			compatible	= "qcom,usb-otg-ci";
+			reg		= <0x12530000 0x400>;
+			interrupts	= <GIC_SPI 215 IRQ_TYPE_NONE>;
+			status		= "disabled";
+			dr_mode		= "host";
+
+			clocks		= <&gcc USB_HS4_XCVR_CLK>,
+					  <&gcc USB_HS4_H_CLK>;
+			clock-names	= "core", "iface";
+
+			resets		= <&gcc USB_HS4_RESET>;
+			reset-names	= "link";
+		};
+
+		usb3: usb@12520000 {
+			compatible	= "qcom,ehci-host";
+			reg		= <0x12520000 0x400>;
+			interrupts	= <GIC_SPI 188 IRQ_TYPE_NONE>;
+			status		= "disabled";
+			usb-phy		= <&usb3_phy>;
+		};
+
+		usb4: usb@12530000 {
+			compatible	= "qcom,ehci-host";
+			reg		= <0x12530000 0x400>;
+			interrupts	= <GIC_SPI 215 IRQ_TYPE_NONE>;
+			status		= "disabled";
+			usb-phy		= <&usb4_phy>;
+		};
+
 		/* Temporary fixed regulator */
 		vsdcc_fixed: vsdcc-regulator {
 			compatible = "regulator-fixed";
-- 
1.9.1
