From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH v2 2/5] dt-binding: soc: qcom: Introduce qcom,smp2p binding documentation
Date: Thu, 24 Sep 2015 18:25:00 -0700
Message-ID: <1443144303-21020-3-git-send-email-bjorn.andersson@sonymobile.com>
References: <1443144303-21020-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443144303-21020-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Introduce binding documentation for the Qualcomm Shared Memory Point 2 Point
protocol.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---

Changes since v1:
- No longer representing outgoing state as gpio-controller

 .../devicetree/bindings/soc/qcom/qcom,smp2p.txt    | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
new file mode 100644
index 000000000000..5cc82b8353d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
@@ -0,0 +1,104 @@
+Qualcomm Shared Memory Point 2 Point binding
+
+The Shared Memory Point to Point (SMP2P) protocol facilitates communication of
+a single 32-bit value between two processors.  Each value has a single writer
+(the local side) and a single reader (the remote side).  Values are uniquely
+identified in the system by the directed edge (local processor ID to remote
+processor ID) and a string identifier.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		    "qcom,smp2p"
+
+- interrupts:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: one entry specifying the smp2p notification interrupt
+
+- qcom,ipc:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: three entries specifying the outgoing ipc bit used for
+		    signaling the remote end of the smp2p edge:
+		    - phandle to a syscon node representing the apcs registers
+		    - u32 representing offset to the register within the syscon
+		    - u32 representing the ipc bit within the register
+
+- qcom,smem:
+	Usage: required
+	Value type: <u32 array>
+	Definition: two identifiers of the inbound and outbound smem items used
+		    for this edge
+
+- qcom,local-pid:
+	Usage: required
+	Value type: <u32>
+	Definition: specifies the identfier of the local endpoint of this edge
+
+- qcom,remote-pid:
+	Usage: required
+	Value type: <u32>
+	Definition: specifies the identfier of the remote endpoint of this edge
+
+= SUBNODES
+Each SMP2P pair contain a set of inbound and outbound entries, these are
+described in subnodes of the smp2p device node. The node names are not
+important.
+
+- qcom,entry-name:
+	Usage: required
+	Value type: <string>
+	Definition: specifies the name of this entry, for inbound entries this
+		    will be used to match against the remotely allocated entry
+		    and for outbound entries this name is used for allocating
+		    entries
+
+- interrupt-controller:
+	Usage: required for incoming entries
+	Value type: <empty>
+	Definition: marks the entry as inbound; the node should be specified
+		    as a two cell interrupt-controller as defined in
+		    "../interrupt-controller/interrupts.txt"
+		    If not specified this node will denote the outgoing entry
+
+- #interrupt-cells:
+	Usage: required for incoming entries
+	Value type: <u32>
+	Definition: must be 2 - denoting the bit in the entry and IRQ flags
+
+- #qcom,state-cells:
+	Usage: required for outgoing entries
+	Value type: <u32>
+	Definition: must be 1 - denoting the bit in the entry
+
+= EXAMPLE
+The following example shows the SMP2P setup with the wireless processor,
+defined from the 8974 apps processor's point-of-view. It encompasses one
+inbound and one outbound entry:
+
+wcnss-smp2p {
+	compatible = "qcom,smp2p";
+	qcom,smem = <431>, <451>;
+
+	interrupts = <0 143 1>;
+
+	qcom,ipc = <&apcs 8 18>;
+
+	qcom,local-pid = <0>;
+	qcom,remote-pid = <4>;
+
+	wcnss_smp2p_out: master-kernel {
+		qcom,entry-name = "master-kernel";
+
+		#qcom,state-cells = <1>;
+	};
+
+	wcnss_smp2p_in: slave-kernel {
+		qcom,entry-name = "slave-kernel";
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
-- 
1.8.2.2
