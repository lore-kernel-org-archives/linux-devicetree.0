From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH v8 1/2] DT: hwspinlock: Add binding documentation for Qualcomm hwmutex
Date: Tue, 24 Mar 2015 10:11:04 -0700
Message-ID: <1427217065-17186-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ohad Ben-Cohen <ohad@wizery.com>, Kumar Gala <galak@codeaurora.org>
Cc: Suman Anna <s-anna@ti.com>, linux-arm-msm@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>, Andy Gross <agross@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add binding documentation for the Qualcomm Hardware Mutex.

Reviewed-by: Andy Gross <agross@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---

Changes since v7:
- Corrected address, compatible and naming of the tcsr block

Changes since v6:
- Corrected indentation error in example

Changes since v5:
- Extracted the dt binding documentation into a separate patch
- Moved the driver to consume a syscon
- Dropped previously suggested generic hwlock dt bindings

 .../devicetree/bindings/hwlock/qcom-hwspinlock.txt | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt

diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
new file mode 100644
index 0000000..4563f52
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
@@ -0,0 +1,39 @@
+Qualcomm Hardware Mutex Block:
+
+The hardware block provides mutexes utilized between different processors on
+the SoC as part of the communication protocol used by these processors.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		    "qcom,sfpb-mutex",
+		    "qcom,tcsr-mutex"
+
+- syscon:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: one cell containing:
+		    syscon phandle
+		    offset of the hwmutex block within the syscon
+		    stride of the hwmutex registers
+
+- #hwlock-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: must be 1, the specified cell represent the lock id
+		    (hwlock standard property, see hwlock.txt)
+
+Example:
+
+	tcsr_mutex_block: syscon@fd484000 {
+		compatible = "syscon";
+		reg = <0xfd484000 0x2000>;
+	};
+
+	hwlock@fd484000 {
+		compatible = "qcom,tcsr-mutex";
+		syscon = <&tcsr_mutex_block 0 0x80>;
+
+		#hwlock-cells = <1>;
+	};
-- 
1.8.2.2
