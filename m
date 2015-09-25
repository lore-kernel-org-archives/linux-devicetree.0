From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH v2 1/5] dt-binding: soc: qcom: Add Qualcomm SMSM device tree documentation
Date: Thu, 24 Sep 2015 18:24:59 -0700
Message-ID: <1443144303-21020-2-git-send-email-bjorn.andersson@sonymobile.com>
References: <1443144303-21020-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443144303-21020-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This documents a device tree binding for the Qualcomm Shared Memory
State Machine.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---

Changes since v1:
- No longer representing outgoing state as gpio-controller

 .../devicetree/bindings/soc/qcom/qcom,smsm.txt     | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smsm.txt

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smsm.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smsm.txt
new file mode 100644
index 000000000000..a6634c70850d
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smsm.txt
@@ -0,0 +1,104 @@
+Qualcomm Shared Memory State Machine
+
+The Shared Memory State Machine facilitates broadcasting of single bit state
+information between the processors in a Qualcomm SoC. Each processor is
+assigned 32 bits of state that can be modified. A processor can through a
+matrix of bitmaps signal subscription of notifications upon changes to a
+certain bit owned by a certain remote processor.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		    "qcom,smsm"
+
+- qcom,ipc-N:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: three entries specifying the outgoing ipc bit used for
+		    signaling the N:th remote processor
+		    - phandle to a syscon node representing the apcs registers
+		    - u32 representing offset to the register within the syscon
+		    - u32 representing the ipc bit within the register
+
+- qcom,local-host:
+	Usage: optional
+	Value type: <u32>
+	Definition: identifier of the local processor in the list of hosts, or
+		    in other words specifier of the column in the subscription
+		    matrix representing the local processor
+		    defaults to host 0
+
+- #address-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: must be 1
+
+- #size-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: must be 0
+
+= SUBNODES
+Each processor's state bits are described by a subnode of the smsm device node.
+Nodes can either be flagged as an interrupt-controller to denote a remote
+processor's state bits or the local processors bits.  The node names are not
+important.
+
+- reg:
+	Usage: required
+	Value type: <u32>
+	Definition: specifies the offset, in words, of the first bit for this
+		    entry
+
+- #qcom,state-cells:
+	Usage: required for local entry
+	Value type: <u32>
+	Definition: must be 1 - denotes bit number
+
+- interrupt-controller:
+	Usage: required for remote entries
+	Value type: <empty>
+	Definition: marks the entry as a interrupt-controller and the state bits
+		    to belong to a remote processor
+
+- #interrupt-cells:
+	Usage: required for remote entries
+	Value type: <u32>
+	Definition: must be 2 - denotes bit number and IRQ flags
+
+- interrupts:
+	Usage: required for remote entries
+	Value type: <prop-encoded-array>
+	Definition: one entry specifying remote IRQ used by the remote processor
+		    to signal changes of its state bits
+
+
+= EXAMPLE
+The following example shows the SMEM setup for controlling properties of the
+wireless processor, defined from the 8974 apps processor's point-of-view. It
+encompasses one outbound entry and the outgoing interrupt for the wireless
+processor.
+
+smsm {
+	compatible = "qcom,smsm";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	qcom,ipc-3 = <&apcs 8 19>;
+
+	apps_smsm: apps@0 {
+		reg = <0>;
+
+		#qcom,state-cells = <1>;
+	};
+
+	wcnss_smsm: wcnss@7 {
+		reg = <7>;
+		interrupts = <0 144 1>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
-- 
1.8.2.2
