From: Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v7 [RESEND] 2/2] dt-bindings: introduce Command DB for QCOM SoCs
Date: Fri,  6 Apr 2018 09:13:56 -0600
Message-ID: <20180406151356.7818-3-ilina@codeaurora.org>
References: <20180406151356.7818-1-ilina@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180406151356.7818-1-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
Cc: rnayak@codeaurora.org, bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org, sboyd@kernel.org, evgreen@chromium.org, dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>, devicetree@vger.kernel.org, Mahesh Sivasubramanian <msivasub@codeaurora.org>
List-Id: devicetree@vger.kernel.org

From: Mahesh Sivasubramanian <msivasub@codeaurora.org>

Command DB provides information on shared resources like clocks,
regulators etc., probed at boot by the remote subsytem and made
available in shared memory.

Cc: devicetree@vger.kernel.org
Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes in v7:
	- Fix description of 'reg' property

Changes in v6:
	- Move to bindings/reserved-memory
	- Remove indirection address and use only the actual reserved
	  memory

Changes in v4:
	- Fix unwanted capitalization
	- Add reg property
---
 .../bindings/reserved-memory/qcom,cmd-db.txt       | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/qcom,cmd-db.txt

diff --git a/Documentation/devicetree/bindings/reserved-memory/qcom,cmd-db.txt b/Documentation/devicetree/bindings/reserved-memory/qcom,cmd-db.txt
new file mode 100644
index 000000000000..1390cd3a7f0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/qcom,cmd-db.txt
@@ -0,0 +1,36 @@
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
+The bindings for Command DB is specified in the reserved-memory section in
+devicetree. The devicetree representation of the command DB driver should be:
+
+Properties:
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: Should be "qcom,cmd-db"
+
+- reg:
+	Usage: required
+	Value type: <prop encoded array>
+	Definition: The register address that points to the actual location of
+		    the Command DB in memory.
+
+Example:
+
+	reserved-memory {
+		[...]
+		qcom,cmd-db@85fe0000 {
+			reg = <0x0 0x85fe0000 0x0 0x20000>;
+			compatible = "qcom,cmd-db";
+		};
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
