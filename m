From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 3/5] dt-binding: soc: qcom: Add binding for RFSA
Date: Wed,  2 Aug 2017 19:57:52 -0700
Message-ID: <20170803025754.19101-4-bjorn.andersson@linaro.org>
References: <20170803025754.19101-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170803025754.19101-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds the binding for describing shared memory used to exchange file
system blocks between the RMTFS client and service.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changed since v1:
- Memory described in a single reserved-memory node, rather than by reference
  from a "dummy" node
- qcom,vmdid added

 .../bindings/reserved-memory/qcom,rfsa.txt         | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/qcom,rfsa.txt

diff --git a/Documentation/devicetree/bindings/reserved-memory/qcom,rfsa.txt b/Documentation/devicetree/bindings/reserved-memory/qcom,rfsa.txt
new file mode 100644
index 000000000000..d9bec8eec696
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/qcom,rfsa.txt
@@ -0,0 +1,51 @@
+Qualcomm Remote File System Access binding
+
+This binding describes the Qualcomm RFSA, which serves the purpose of
+describing the shared memory region used for remote processors to access block
+device data using the Remote Filesystem protocol.
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be:
+		    "qcom,rfsa"
+
+- reg:
+	Usage: required for static allocation
+	Value type: <prop-encoded-array>
+	Definition: must specify base address and size of the memory region,
+		    as described in reserved-memory.txt
+
+- size:
+	Usage: required for dynamic allocation
+	Value type: <prop-encoded-array>
+	Definition: must specify a size of the memory region, as described in
+		    reserved-memory.txt
+
+- qcom,client-id:
+	Usage: required
+	Value type: <u32>
+	Definition: identifier of the client to use this region for buffers.
+
+- qcom,vmid:
+	Usage: optional
+	Value type: <u32>
+	Definition: vmid of the remote processor, to set up memory protection.
+
+= EXAMPLE
+The following example shows the RFSA setup for APQ8016, with the RFSA region
+for the Hexagon DSP (id #1) located at 0x86700000.
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		rmtfs@86700000 {
+			compatible = "qcom,rfsa";
+			reg = <0x0 0x86700000 0x0 0xe0000>;
+			no-map;
+
+			qcom,client-id = <1>;
+		};
+	};
-- 
2.12.0
