From: bjorn@kryo.se
Subject: [PATCH v2 03/11] soc: qcom: Add device tree binding for Shared Memory Device
Date: Fri, 26 Jun 2015 14:50:11 -0700
Message-ID: <1435355419-23602-4-git-send-email-bjorn.andersson@sonymobile.com>
References: <1435355419-23602-1-git-send-email-bjorn.andersson@sonymobile.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1435355419-23602-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Add device tree binding documentation for the Qualcomm Shared Memory
Device, used for communication between the various CPUs in the Qualcomm
SoCs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 .../devicetree/bindings/soc/qcom/qcom,smd.txt      | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt
new file mode 100644
index 0000000..f65c76d
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt
@@ -0,0 +1,79 @@
+Qualcomm Shared Memory Driver (SMD) binding
+
+This binding describes the Qualcomm Shared Memory Driver, a fifo based
+communication channel for sending data between the various subsystems in
+Qualcomm platforms.
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "qcom,smd"
+
+= EDGES
+
+Each subnode of the SMD node represents a remote subsystem or a remote
+processor of some sort - or in SMD language an "edge". The name of the edges
+are not important.
+The edge is described by the following properties:
+
+- interrupts:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: should specify the IRQ used by the remote processor to
+		    signal this processor about communication related updates
+
+- qcom,ipc:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: three entries specifying the outgoing ipc bit used for
+		    signaling the remote processor:
+		    - phandle to a syscon node representing the apcs registers
+		    - u32 representing offset to the register within the syscon
+		    - u32 representing the ipc bit within the register
+
+- qcom,smd-edge:
+	Usage: required
+	Value type: <u32>
+	Definition: the identifier of the remote processor in the smd channel
+		    allocation table
+
+= SMD DEVICES
+
+In turn, subnodes of the "edges" represent devices tied to SMD channels on that
+"edge". The names of the devices are not important. The properties of these
+nodes are defined by the individual bindings for the SMD devices - but must
+contain the following property:
+
+- qcom,smd-channels:
+	Usage: required
+	Value type: <stringlist>
+	Definition: a list of channels tied to this device, used for matching
+		    the device to channels
+
+= EXAMPLE
+
+The following example represents a smd node, with one edge representing the
+"rpm" subsystem. For the "rpm" subsystem we have a device tied to the
+"rpm_request" channel.
+
+	apcs: syscon@f9011000 {
+		compatible = "syscon";
+		reg = <0xf9011000 0x1000>;
+	};
+
+	smd {
+		compatible = "qcom,smd";
+
+		rpm {
+			interrupts = <0 168 1>;
+			qcom,ipc = <&apcs 8 0>;
+			qcom,smd-edge = <15>;
+
+			rpm_requests {
+				compatible = "qcom,rpm-msm8974";
+				qcom,smd-channels = "rpm_requests";
+
+				...
+			};
+		};
+	};
-- 
1.9.3 (Apple Git-50)
