From: Sreedhar Sambangi <ssambang@codeaurora.org>
Subject: [PATCH 1/2] qcom: ipq4019: Add regulator support to DK04 device tree
Date: Mon,  4 Apr 2016 14:08:10 -0700
Message-ID: <1459804090-31739-1-git-send-email-ssambang@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: devicetree@vger.kernel.org, andy.gross@linaro.org, linux-arm-msm@vger.kernel.org
Cc: david.brown@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, qca-upstream.external@qca.qualcomm.com
List-Id: devicetree@vger.kernel.org

    This adds the regulator nodes to DK04 device tree to support

Change-Id: I9c1df0e720a330bf6db1889fd2247f6a70ea6faa
Signed-off-by: Sreedhar Sambangi <ssambang@codeaurora.org>
---
 .../bindings/regulator/ipq4019-regulator.txt          | 19 +++++++++++++++++++
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi         | 11 +++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/ipq4019-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/ipq4019-regulator.txt b/Documentation/devicetree/bindings/regulator/ipq4019-regulator.txt
new file mode 100644
index 0000000..9d934a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ipq4019-regulator.txt
@@ -0,0 +1,19 @@
+* Qualcomm Technologies, Inc. IPQ4019 regulators
+
+Required properties:
+- compatible		: Must be "regulator-ipq4019".
+- states		: Selection of available voltages and corresponding values
+- reg			: Register address for controlling LDO
+- mask			: Mask value for switching voltages
+Example:
+
+	vccq_sd0: regulator@0 {
+		compatible = "qcom,regulator-ipq4019";
+		regulator-name = "SD0 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3000000>;
+		states = <3000000 0x3
+			1800000 0x1>;
+		reg = <0x01948000 0x4>;
+		mask = <0x3>;
+	};
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
index 9f3c864..566e239 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
@@ -155,5 +155,16 @@
 		watchdog@b017000 {
 			status = "ok";
 		};
+
+		vccq_sd0: regulator@0 {
+			compatible = "qcom,regulator-ipq4019";
+			regulator-name = "SD0 VccQ";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3000000>;
+			states = <3000000 0x3
+				1800000 0x1>;
+			reg = <0x01948000 0x4>;
+			mask = <0x3>;
+		};
 	};
 };
--
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
