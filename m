From: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
Subject: [PATCH v3 1/2] dt-bindings: Documentation for qcom,eud
Date: Thu, 15 Nov 2018 11:32:53 -0800
Message-ID: <1542310374-18474-2-git-send-email-pheragu@codeaurora.org>
References: <1542310374-18474-1-git-send-email-pheragu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542310374-18474-1-git-send-email-pheragu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, ckadabi@codeaurora.org, tsoni@codeaurora.org, bryanh@codeaurora.org, psodagud@codeaurora.org, rnayak@codeaurora.org, Prakruthi Deepak Heragu <pheragu@codeaurora.org>, Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Documentation for Embedded USB Debugger (EUD) device tree bindings.

Signed-off-by: Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
Signed-off-by: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
---
 .../devicetree/bindings/soc/qcom/qcom,msm-eud.txt  | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
new file mode 100644
index 0000000..6d339e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,msm-eud.txt
@@ -0,0 +1,43 @@
+* Qualcomm Technologies Inc Embedded USB Debugger (EUD)
+
+The EUD (Embedded USB Debugger) is a mini-USB hub implemented
+on chip to support the USB-based debug and trace capabilities.
+
+Required properties:
+
+ - compatible:  Should be "qcom,msm-eud"
+ - interrupts:  Interrupt number
+ - reg: Should be address and size of EUD register space
+
+EUD notifies clients for VBUS attach/detach and charger enable/disable
+events. The link between client and EUD is established via a directed
+graph. EUD has one endpoint of the graph link mentioning EUD as an
+output link and clients of EUD should have the other endpoint of the
+graph link as an input link.
+
+An example for EUD device node:
+
+	eud: qcom,msm-eud@88e0000 {
+		compatible = "qcom,msm-eud";
+		interrupts = <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH>;
+		reg = <0x88e0000 0x4000>;
+		usb_con: connector {
+                compatible = "usb-c-connector";
+                label = "USB-C";
+                port {
+                	    eud_usb_output: endpoint {
+                        	    remote-endpoint = <&eud_usb3_input>;
+                        };
+        	    };
+        };
+	};
+
+An example for EUD client:
+
+	usb3 {
+		port {
+                eud_usb3_input: endpoint {
+                        remote-endpoint = <&eud_usb_output>;
+                };
+        };
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
