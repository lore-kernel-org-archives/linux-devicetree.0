From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v7 2/3] dt-bindings: mailbox: Introduce Qualcomm APCS global binding
Date: Sat, 27 May 2017 16:14:03 -0700
Message-ID: <20170527231404.7632-2-bjorn.andersson@linaro.org>
References: <20170527231404.7632-1-bjorn.andersson@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170527231404.7632-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Introduce a binding for the Qualcomm APCS global block, exposing a
mailbox for invoking interrupts on remote processors in the system.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v6:
- None

 .../bindings/mailbox/qcom,apcs-kpss-global.txt     | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
new file mode 100644
index 000000000000..fb961c310f44
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
@@ -0,0 +1,46 @@
+Binding for the Qualcomm APCS global block
+==========================================
+
+This binding describes the APCS "global" block found in various Qualcomm
+platforms.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		    "qcom,msm8916-apcs-kpss-global",
+		    "qcom,msm8996-apcs-hmss-global"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: must specify the base address and size of the global block
+
+- #mbox-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: as described in mailbox.txt, must be 1
+
+
+= EXAMPLE
+The following example describes the APCS HMSS found in MSM8996 and part of the
+GLINK RPM referencing the "rpm_hlos" doorbell therein.
+
+	apcs_glb: mailbox@9820000 {
+		compatible = "qcom,msm8996-apcs-hmss-global";
+		reg = <0x9820000 0x1000>;
+
+		#mbox-cells = <1>;
+	};
+
+	rpm-glink {
+		compatible = "qcom,glink-rpm";
+
+		interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+
+		qcom,rpm-msg-ram = <&rpm_msg_ram>;
+
+		mboxes = <&apcs_glb 0>;
+		mbox-names = "rpm_hlos";
+	};
+
-- 
2.12.0
