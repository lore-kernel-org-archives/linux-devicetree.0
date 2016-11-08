From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/2] ARM: dts: apq8064: add support to pm8821
Date: Tue,  8 Nov 2016 16:29:37 +0000
Message-ID: <1478622577-20699-2-git-send-email-srinivas.kandagatla@linaro.org>
References: <1478622577-20699-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478622577-20699-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bjorn.andersson@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 1dbe697..fde006c 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -627,6 +627,34 @@
 			clock-names = "core";
 		};
 
+		qcom,ssbi@c00000 {
+			compatible = "qcom,ssbi";
+			reg = <0x00c00000 0x1000>;
+			qcom,controller-type = "pmic-arbiter";
+
+			pmicintc2: pmic@1 {
+				compatible = "qcom,pm8821";
+				interrupt-parent = <&tlmm_pinmux>;
+				interrupts = <76 8>;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				pm8821_mpps: mpps@50 {
+
+					compatible = "qcom,pm8821-mpp", "qcom,ssbi-mpp";
+					reg = <0x50>;
+
+					interrupts = <24 1>, <25 1>, <26 1>,
+						     <27 1>;
+
+					gpio-controller;
+					#gpio-cells = <2>;
+		                };
+			};
+		};
+
 		qcom,ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x00500000 0x1000>;
-- 
2.10.1
