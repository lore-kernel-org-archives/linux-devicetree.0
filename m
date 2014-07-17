From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: [PATCH v2 3/4] ARM: DT: qcom: add pm8941 and pm8841 device nodes
Date: Thu, 17 Jul 2014 19:17:34 +0300
Message-ID: <1405613855-27572-4-git-send-email-svarbanov@mm-sol.com>
References: <1405613855-27572-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1405613855-27572-1-git-send-email-svarbanov@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@linaro.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Josh Cartwright <joshc@codeaurora.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
List-Id: devicetree@vger.kernel.org

The pm8941 and pm8841 spmi devicetree nodes are childrens of
spmi pmic arbiter. The msm8974 SoC uses two PMIC chips
pm8941 and pm8841. Every PMIC chip has two spmi bus slave id's.

Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi |   37 +++++++++++++++++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 69dca2a..cb05603 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -3,6 +3,7 @@
 #include "skeleton.dtsi"
 
 #include <dt-bindings/clock/qcom,gcc-msm8974.h>
+#include <dt-bindings/spmi/spmi.h>
 
 / {
 	model = "Qualcomm MSM8974";
@@ -236,5 +237,41 @@
 			#interrupt-cells = <2>;
 			interrupts = <0 208 0>;
 		};
+
+		spmi@fc4cf000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg-names = "core", "intr", "cnfg";
+			reg = <0xfc4cf000 0x1000>,
+			      <0xfc4cb000 0x1000>,
+			      <0xfc4ca000 0x1000>;
+			interrupt-names = "periph_irq";
+			interrupts = <0 190 0>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+
+			usid0: pm8941@0 {
+				compatible = "qcom,pm8941";
+				reg = <0x0 SPMI_USID>;
+			};
+
+			usid1: pm8941@1 {
+				compatible = "qcom,pm8941";
+				reg = <0x1 SPMI_USID>;
+			};
+
+			usid4: pm8841@4 {
+				compatible = "qcom,pm8841";
+				reg = <0x4 SPMI_USID>;
+			};
+
+			usid5: pm8841@5 {
+				compatible = "qcom,pm8841";
+				reg = <0x5 SPMI_USID>;
+			};
+		};
 	};
 };
-- 
1.7.0.4
