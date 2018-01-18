From: Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH 2/2] dt-bindings: introduce Command DB for QCOM SoCs
Date: Thu, 18 Jan 2018 15:28:02 -0700
Message-ID: <20180118222802.18161-1-ilina@codeaurora.org>
References: <20180118220833.16616-3-ilina@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20180118220833.16616-3-ilina@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org
Cc: sboyd@codeaurora.org, rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, msivasub@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Mahesh Sivasubramanian <msivasub@codeaurora.org>

Command DB provides information on shared resources like clocks,
regulators etc., probed at boot by the remote subsytem and made
available in shared memory.

Cc: devicetree@vger.kernel.org
Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 .../devicetree/bindings/arm/msm/cmd-db.txt         | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/msm/cmd-db.txt

diff --git a/Documentation/devicetree/bindings/arm/msm/cmd-db.txt b/Documentation/devicetree/bindings/arm/msm/cmd-db.txt
new file mode 100644
index 000000000000..b56e3e3604d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/msm/cmd-db.txt
@@ -0,0 +1,37 @@
+Command DB
+---------
+
+Command DB is a database that provides a mapping between resource key and the
+resource address for a system resource managed by a remote processor. The data
+is stored in a shared memory region and is loaded by the remote processor.
+
+Some of the Qualcomm Technologies Inc SoC's have hardware accelerators for
+controlling shared resources. Depending on the board configuration the shared
+resource properties may change. These properties are dynamically probed by the
+remote processor and made available in the shared memory.
+
+Command DB allows drivers to query resource parameters based on pre-determined
+key strings.
+
+The devicetree representation of the command DB driver should be:
+
+PROPERTIES:
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: Should be "qcom,cmd-db"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: First element is the base address of shared memory
+		Second element is the size of the shared memory region
+		Points to the dictionary address that houses the command DB
+		start address and the size of the command DB region
+
+Example:
+
+	qcom,cmd-db@c3f000c {
+		compatible = "qcom,cmd-db";
+		reg = <0xc3f000c 0x8>;
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
