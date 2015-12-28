From: Bjorn Andersson <bjorn@kryo.se>
Subject: [PATCH v2 3/4] dt-binding: remoteproc: Introduce Qualcomm WCNSS loader binding
Date: Sun, 27 Dec 2015 17:15:45 -0800
Message-ID: <1451265346-14969-4-git-send-email-bjorn.andersson@sonymobile.com>
References: <1451265346-14969-1-git-send-email-bjorn.andersson@sonymobile.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1451265346-14969-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, fengwei.yin@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org
List-Id: devicetree@vger.kernel.org

The document defines the binding for a component that loads firmware for
and boots the Qualcomm WCNSS core.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---

Changes since v1:
- Dropped custom properties for firmware-name and crash-reason

 .../bindings/remoteproc/qcom,wcnss-pil.txt         | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
new file mode 100644
index 000000000000..e69bd415106b
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
@@ -0,0 +1,92 @@
+Qualcomm WCNSS Peripheral Image Loader
+
+This document defines the binding for a component that loads and boots firmware
+on the Qualcomm WCNSS core.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		    "qcom,riva-pil",
+		    "qcom,pronto-v1-pil",
+		    "qcom,pronto-v2-pil"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: base address and size of riva/pronto PMU registers
+
+- interrupts-extended:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: should specify the watchdog, fatal, ready, handover and
+		    stop-ack IRQs, in order.
+
+- interrupt-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: should be "wdog", "fatal", "ready", "handover", "stop-ack"
+
+- clocks:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: should specify the xo clock and optionally the rf_clk
+
+- clock-names:
+	Usage: requireduired
+	Value type: <stringlist>
+	Definition: should be "xo", optionally followed by "rf"
+
+- qcom,iris-vddxo-supply:
+- qcom,iris-vddrfa-supply:
+- qcom,iris-vddpa-supply:
+- qcom,iris-vdddig-supply:
+- qcom,pronto-vddmx-supply:
+- qcom,pronto-vddcx-supply:
+- qcom,pronto-vddpx-supply:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to the regulators to be held on behalf of the
+		    booting of the WCNSS core
+
+- qcom,state:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: reference to the SMEM state used to indicate to WCNSS that
+		    it should shut down
+
+- qcom,state-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: should be "stop"
+
+= EXAMPLE
+
+pronto_rproc@fb21b000 {
+	compatible = "qcom,pronto-v2-pil";
+	reg = <0xfb21b000 0x3000>;
+
+	interrupts-extended = <&intc 0 149 1>,
+			      <&wcnss_smp2p_slave 0 0>,
+			      <&wcnss_smp2p_slave 1 0>,
+			      <&wcnss_smp2p_slave 2 0>,
+			      <&wcnss_smp2p_slave 3 0>;
+	interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
+
+	clocks = <&rpmcc RPM_CXO_CLK_SRC>, <&rpmcc RPM_CXO_A2>;
+	clock-names = "xo", "rf";
+
+	qcom,iris-vddxo-supply = <&pm8941_l6>;
+	qcom,iris-vddrfa-supply = <&pm8941_l11>;
+	qcom,iris-vddpa-supply = <&pm8941_l19>;
+	qcom,iris-vdddig-supply = <&pm8941_s3>;
+	qcom,pronto-vddmx-supply = <&pm8841_s1>;
+	qcom,pronto-vddcx-supply = <&pm8841_s2>;
+	qcom,pronto-vddpx-supply = <&pm8941_s3>;
+
+	qcom,state = <&wcnss_smp2p_out 0>;
+	qcom,state-names = "stop";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&wcnss_pin_a>;
+};
-- 
2.5.0
