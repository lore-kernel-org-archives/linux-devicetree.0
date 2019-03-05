From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: qcom: qcs404-evb: Enable uart3 and add Bluetooth
Date: Mon,  4 Mar 2019 23:08:23 -0800
Message-ID: <20190305070823.11845-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enable blsp1_uart3, define its pinconf and add the bluetooth node.

It seems provisioning is lacking a valid BD address, preventing the
interface from initializing, so provide a dummy for now.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 536f735243d2..5c502e6db424 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -7,6 +7,7 @@
 / {
 	aliases {
 		serial0 = &blsp1_uart2;
+		serial1 = &blsp1_uart3;
 	};
 
 	chosen {
@@ -19,6 +20,32 @@
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	vdd_ch0_3p3:
+	vdd_esmps3_3p3: vdd-esmps3-3p3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "eSMPS3_3P3";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+&blsp1_uart3 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3990-bt";
+		vddio-supply = <&vreg_l6_1p8>;
+		vddxo-supply = <&vreg_l5_1p8>;
+		vddrf-supply = <&vreg_l1_1p3>;
+		vddch0-supply = <&vdd_ch0_3p3>;
+
+		local-bd-address = [ 02 00 00 00 5a ad ];
+
+		max-speed = <3200000>;
+	};
 };
 
 &remoteproc_adsp {
@@ -205,3 +232,21 @@
 		bias-disable;
 	};
 };
+
+&blsp1_uart3_default {
+	cts {
+		pins = "gpio84";
+		bias-disable;
+	};
+
+	rts-tx {
+		pins = "gpio85", "gpio82";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rx {
+		pins = "gpio83";
+		bias-pull-up;
+	};
+};
-- 
2.18.0
