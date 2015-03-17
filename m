From: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 1/4] ARM: DT: ipq8064: Add ADM device node
Date: Tue, 17 Mar 2015 16:51:08 -0500
Message-ID: <1426629071-3541-2-git-send-email-agross@codeaurora.org>
References: <1426629071-3541-1-git-send-email-agross@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426629071-3541-1-git-send-email-agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for the ADM DMA on the IPQ8064 SOC

Signed-off-by: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts |    4 ++++
 arch/arm/boot/dts/qcom-ipq8064.dtsi      |   23 +++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
index 55b2910..7f9ea50 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
+++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
@@ -62,6 +62,10 @@
 
 				cs-gpios = <&qcom_pinmux 20 0>;
 
+				dmas = <&adm_dma 6>,
+					<&adm_dma 5>;
+				dma-names = "rx", "tx";
+
 				flash: m25p80@0 {
 					compatible = "s25fl256s1";
 					#address-cells = <1>;
diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index cb225da..4108ac4 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -2,7 +2,10 @@
 
 #include "skeleton.dtsi"
 #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
+#include <dt-bindings/reset/qcom,gcc-ipq806x.h>
 #include <dt-bindings/soc/qcom,gsbi.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 
 / {
 	model = "Qualcomm IPQ8064";
@@ -279,5 +282,25 @@
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
+
+		adm_dma: dma@18300000 {
+			compatible = "qcom,adm";
+			reg = <0x18300000 0x100000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_NONE>;
+			#dma-cells = <1>;
+
+			clocks = <&gcc ADM0_CLK>, <&gcc ADM0_PBUS_CLK>;
+			clock-names = "core", "iface";
+
+			resets = <&gcc ADM0_RESET>,
+				 <&gcc ADM0_PBUS_RESET>,
+				 <&gcc ADM0_C0_RESET>,
+				 <&gcc ADM0_C1_RESET>,
+				 <&gcc ADM0_C2_RESET>;
+			reset-names = "clk", "pbus", "c0", "c1", "c2";
+			qcom,ee = <0>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
