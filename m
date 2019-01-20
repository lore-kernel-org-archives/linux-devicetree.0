From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2] arm64: dts: qcom: sdm845-mtp: Add WCN3990 BT node
Date: Sat, 19 Jan 2019 22:39:02 -0800
Message-ID: <20190120063902.1714-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The SDM845 MTP has a WCN3990 Bluetooth chip on UART6, enable this.

Pinconf and the associated comments are copied from a patch by
Matthias Kaehlcke <mka@chromium.org>.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Fixed the pinconf

 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 53 +++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index af8c6a2445a2..5aec2c680033 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -17,6 +17,7 @@
 
 	aliases {
 		serial0 = &uart9;
+		hsuart0 = &uart6;
 	};
 
 	chosen {
@@ -357,6 +358,10 @@
 	clock-frequency = <400000>;
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
@@ -373,6 +378,20 @@
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 };
 
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3990-bt";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p3>;
+		max-speed = <3200000>;
+	};
+};
+
 &uart9 {
 	status = "okay";
 };
@@ -470,6 +489,40 @@
 	};
 };
 
+&qup_uart6_default {
+	pinmux {
+		pins = "gpio45", "gpio46", "gpio47", "gpio48";
+		function = "qup6";
+	};
+
+	cts {
+		/*
+		 * Configure a pull-down on 45 (CTS) to match the pull of
+		 * the Bluetooth module.
+		 */
+		pins = "gpio45";
+		bias-pull-down;
+	};
+
+	rts-tx {
+		/* We'll drive 46 (RTS) and 47 (TX), so no pull */
+		pins = "gpio46", "gpio47";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rx {
+		/*
+		 * Configure a pull-up on 48 (RX). This is needed to avoid
+		 * garbage data when the TX pin of the Bluetooth module is
+		 * in tri-state (module powered off or not driving the
+		 * signal yet).
+		 */
+		pins = "gpio48";
+		bias-pull-up;
+	};
+};
+
 &qup_uart9_default {
 	pinconf-tx {
 		pins = "gpio4";
-- 
2.18.0
