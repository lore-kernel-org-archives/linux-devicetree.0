From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH v10 5/6] dt-bindings: mailbox: qcom: Document the APCS clock binding
Date: Fri,  1 Dec 2017 19:02:23 +0200
Message-ID: <20171201170224.25053-6-georgi.djakov@linaro.org>
References: <20171201170224.25053-1-georgi.djakov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171201170224.25053-1-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@codeaurora.org, jassisinghbrar@gmail.com, bjorn.andersson@linaro.org, robh@kernel.org
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, georgi.djakov@linaro.org
List-Id: devicetree@vger.kernel.org

Update the binding documentation for APCS to mention that the APCS
hardware block also expose a clock controller functionality.

The APCS clock controller is a mux and half-integer divider. It has the
main CPU PLL as an input and provides the clock for the application CPU.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 .../bindings/mailbox/qcom,apcs-kpss-global.txt         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
index fb961c310f44..16964f0c1773 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
@@ -15,12 +15,21 @@ platforms.
 	Usage: required
 	Value type: <prop-encoded-array>
 	Definition: must specify the base address and size of the global block
+- clocks:
+	Usage: required if #clocks-cells property is present
+	Value type: <phandle>
+	Definition: phandle to the input PLL, which feeds the APCS mux/divider
 
 - #mbox-cells:
 	Usage: required
 	Value type: <u32>
 	Definition: as described in mailbox.txt, must be 1
 
+- #clock-cells:
+	Usage: optional
+	Value type: <u32>
+	Definition: as described in clock.txt, must be 0
+
 
 = EXAMPLE
 The following example describes the APCS HMSS found in MSM8996 and part of the
@@ -44,3 +53,12 @@ GLINK RPM referencing the "rpm_hlos" doorbell therein.
 		mbox-names = "rpm_hlos";
 	};
 
+Below is another example of the APCS binding on MSM8916 platforms:
+
+	apcs: mailbox@b011000 {
+		compatible = "qcom,msm8916-apcs-kpss-global";
+		reg = <0xb011000 0x1000>;
+		#mbox-cells = <1>;
+		clocks = <&a53pll>;
+		#clock-cells = <0>;
+	};
