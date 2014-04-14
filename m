From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: [RFC PATCH v2 9/9] ARM: DT: qcom: Add Qualcomm crypto driver binding document
Date: Mon, 14 Apr 2014 15:48:45 +0300
Message-ID: <1397479725-20954-10-git-send-email-svarbanov@mm-sol.com>
References: <1397479725-20954-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1397479725-20954-1-git-send-email-svarbanov@mm-sol.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>
Cc: Stanimir Varbanov <svarbanov@mm-sol.com>, linux-arm-msm@vger.kernel.org, Mona Hossain <mhossain@codeaurora.org>, Hariprasad Dhalinarasimha <hnamgund@codeaurora.org>, Zhen Kong <zkong@codeaurora.org>, Niranjana Vishwanathapura <nvishwan@codeaurora.org>, Rohit Vaswani <rvaswani@codeaurora.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Here is Qualcomm crypto driver device tree binding documentation
to be used as a reference example.

Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
---
 .../devicetree/bindings/crypto/qcom-qce.txt        | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.txt

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.txt b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
new file mode 100644
index 000000000000..fdd53b184ba8
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
@@ -0,0 +1,25 @@
+Qualcomm crypto engine driver
+
+Required properties:
+
+- compatible  : should be "qcom,crypto-v5.1"
+- reg         : specifies base physical address and size of the registers map
+- clocks      : phandle to clock-controller plus clock-specifier pair
+- clock-names : "iface" clocks register interface
+                "bus" clocks data transfer interface
+                "core" clocks rest of the crypto block
+- dmas        : DMA specifiers for tx and rx dma channels. For more see
+                Documentation/devicetree/bindings/dma/dma.txt
+- dma-names   : DMA request names should be "rx" and "tx"
+
+Example:
+	crypto@fd45a000 {
+		compatible = "qcom,crypto-v5.1";
+		reg = <0xfd45a000 0x6000>;
+		clocks = <&gcc GCC_CE2_AHB_CLK>,
+			 <&gcc GCC_CE2_AXI_CLK>,
+			 <&gcc GCC_CE2_CLK>;
+		clock-names = "iface", "bus", "core";
+		dmas = <&cryptobam 2>, <&cryptobam 3>;
+		dma-names = "rx", "tx";
+	};
-- 
1.8.4.4

