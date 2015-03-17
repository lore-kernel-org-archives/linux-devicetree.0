From: Andy Gross <agross@codeaurora.org>
Subject: [PATCH 4/4] ARM: DT: msm8960: Add ADM device node
Date: Tue, 17 Mar 2015 16:51:11 -0500
Message-ID: <1426629071-3541-5-git-send-email-agross@codeaurora.org>
References: <1426629071-3541-1-git-send-email-agross@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1426629071-3541-1-git-send-email-agross@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andy Gross <agross@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for the ADM DMA on the MSM8960 SOC

Signed-off-by: Andy Gross <agross@codeaurora.org>
---
 arch/arm/boot/dts/qcom-msm8960.dtsi |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
index e1b0d5c..1b7c4c4 100644
--- a/arch/arm/boot/dts/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8960.h>
+#include <dt-bindings/reset/qcom,gcc-msm8960.h>
 #include <dt-bindings/soc/qcom,gsbi.h>
 
 / {
@@ -238,5 +239,25 @@
 				vmmc-supply = <&vsdcc_fixed>;
 			};
 		};
+
+		adm_dma: dma@18320000 {
+			compatible = "qcom,adm";
+			reg = <0x18320000 0xE0000>;
+			interrupts = <GIC_SPI 171 IRQ_TYPE_NONE>;
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
+			qcom,ee = <1>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
