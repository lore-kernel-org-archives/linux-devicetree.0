From: Tirupathi Reddy <tirupath@codeaurora.org>
Subject: [PATCH V7 2/2] dt-bindings: Add qcom spmi_pmic clock divider bindings
Date: Tue, 21 Nov 2017 14:41:05 +0530
Message-ID: <1511255465-3984-3-git-send-email-tirupath@codeaurora.org>
References: <1511255465-3984-1-git-send-email-tirupath@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1511255465-3984-1-git-send-email-tirupath@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@codeaurora.org, robh+dt@kernel.org
Cc: mturquette@baylibre.com, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Tirupathi Reddy <tirupath@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch adds device tree bindings for Qualcomm SPMI PMIC
clock divider module.

Signed-off-by: Tirupathi Reddy <tirupath@codeaurora.org>
---
 .../bindings/clock/qcom,spmi-pmic-div.txt          | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,spmi-pmic-div.txt

diff --git a/Documentation/devicetree/bindings/clock/qcom,spmi-pmic-div.txt b/Documentation/devicetree/bindings/clock/qcom,spmi-pmic-div.txt
new file mode 100644
index 0000000..2cf2aba
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,spmi-pmic-div.txt
@@ -0,0 +1,59 @@
+Qualcomm Technologies, Inc. SPMI PMIC clock divider (clkdiv)
+
+clkdiv configures the clock frequency of a set of outputs on the PMIC.
+These clocks are typically wired through alternate functions on
+gpio pins.
+
+=======================
+Properties
+=======================
+
+- compatible
+	Usage:      required
+	Value type: <string>
+	Definition: must be "qcom,spmi-clkdiv".
+
+- reg
+	Usage:      required
+	Value type: <prop-encoded-array>
+	Definition: base address of CLKDIV peripherals.
+
+- qcom,num-clkdivs
+	Usage:      required
+	Value type: <u32>
+	Definition: number of CLKDIV peripherals.
+
+- clocks:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: reference to the xo clock.
+
+- clock-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "xo".
+
+- clock-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: shall contain 1.
+
+=======
+Example
+=======
+
+pm8998_clk_divs: clock-controller@5b00 {
+	compatible = "qcom,spmi-clkdiv";
+	reg = <0x5b00>;
+	#clock-cells = <1>;
+	qcom,num-clkdivs = <3>;
+	clocks = <&xo_board>;
+	clock-names = "xo";
+
+	assigned-clocks = <&pm8998_clk_divs 1>,
+			  <&pm8998_clk_divs 2>,
+			  <&pm8998_clk_divs 3>;
+	assigned-clock-rates = <9600000>,
+			       <9600000>,
+			       <9600000>;
+};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
