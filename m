From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 1/2] dt: binding: Add Qualcomm WCNSS control binding
Date: Mon,  6 Jun 2016 16:46:43 -0700
Message-ID: <1465256804-27281-1-git-send-email-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This binding describes the control interface for the Qualcomm WCNSS.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Fixup some misstakes in the document pointed out by Rob

Changes since v1:
- Introduce reference to wcnss block node for register block definition
- Use wcnss block node compatible for hw version detection (riva vs pronto)
- Clean up compatible name for bt node

 .../devicetree/bindings/soc/qcom/qcom,wcnss.txt    | 116 +++++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
new file mode 100644
index 000000000000..c2a45043b971
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
@@ -0,0 +1,116 @@
+Qualcomm WCNSS Binding
+
+This binding describes the Qualcomm WCNSS hardware. It consists of control
+block and a BT, WiFi and FM radio block, all using SMD as command channels.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be: "qcom,wcnss",
+
+- qcom,smd-channel:
+	Usage: required
+	Value type: <string>
+	Definition: standard SMD property specifying the SMD channel used for
+		    communication with the WiFi firmware.
+		    Should be "WCNSS_CTRL".
+
+- qcom,mmio:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: reference to a node specifying the wcnss "ccu" and "dxe"
+		    register blocks. The node must be compatible with one of
+		    the following:
+		    "qcom,riva",
+		    "qcom,pronto"
+
+= SUBNODES
+The subnodes of the wcnss node are optional and describe the individual blocks in
+the WCNSS.
+
+== Bluetooth
+The following properties are defined to the bluetooth node:
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be:
+		    "qcom,wcnss-bt"
+
+== WiFi
+The following properties are defined to the WiFi node:
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		    "qcom,wcnss-wlan",
+
+- interrupts:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: should specify the "rx" and "tx" interrupts
+
+- interrupt-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must contain "rx" and "tx"
+
+- qcom,smem-state:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: should reference the tx-enable and tx-rings-empty SMEM states
+
+- qcom,state-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must contain "tx-enable" and "tx-rings-empty"
+
+= EXAMPLE
+The following example represents a SMD node, with one edge representing the
+"pronto" subsystem, with the wcnss device and its wcn3680 BT and WiFi blocks
+described; as found on the 8974 platform.
+
+smd {
+	compatible = "qcom,smd";
+
+	pronto-edge {
+		interrupts = <0 142 1>;
+
+		qcom,ipc = <&apcs 8 17>;
+		qcom,smd-edge = <6>;
+
+		wcnss {
+			compatible = "qcom,wcnss";
+			qcom,smd-channels = "WCNSS_CTRL";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			qcom,mmio = <&pronto>;
+
+			bt {
+				compatible = "qcom,wcnss-bt";
+			};
+
+			wlan {
+				compatible = "qcom,wcnss-wlan";
+
+				interrupts = <0 145 0>, <0 146 0>;
+				interrupt-names = "tx", "rx";
+
+				qcom,state = <&apps_smsm 10>, <&apps_smsm 9>;
+				qcom,state-names = "tx-enable", "tx-rings-empty";
+			};
+		};
+	};
+};
+
+soc {
+	pronto: pronto {
+		compatible = "qcom,pronto";
+
+		reg = <0xfb204000 0x2000>, <0xfb202000 0x1000>, <0xfb21b000 0x3000>;
+		reg-names = "ccu", "dxe", "pmu";
+	};
+};
-- 
2.5.0
