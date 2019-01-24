From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 1/5] misc: dt-bindings: Add Qualcomm Fastrpc bindings
Date: Thu, 24 Jan 2019 15:24:08 +0000
Message-ID: <20190124152412.10503-2-srinivas.kandagatla@linaro.org>
References: <20190124152412.10503-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124152412.10503-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, bkumar@qti.qualcomm.com, linux-arm-msm@vger.kernel.org, thierry.escande@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

The FastRPC driver implements an IPC (Inter-Processor Communication)
mechanism that allows for clients to transparently make remote method
invocations across DSP and APPS boundaries. This enables developers
to offload tasks to the DSP and free up the application processor for
other tasks.

Co-developed-by: Thierry Escande <thierry.escande@linaro.org>
Signed-off-by: Thierry Escande <thierry.escande@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/misc/qcom,fastrpc.txt | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/qcom,fastrpc.txt

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
new file mode 100644
index 000000000000..2a1827ab50d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
@@ -0,0 +1,78 @@
+Qualcomm Technologies, Inc. FastRPC Driver
+
+The FastRPC implements an IPC (Inter-Processor Communication)
+mechanism that allows for clients to transparently make remote method
+invocations across DSP and APPS boundaries. This enables developers
+to offload tasks to the DSP and free up the application processor for
+other tasks.
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "qcom,fastrpc"
+
+- label
+	Usage: required
+	Value type: <string>
+	Definition: should specify the dsp domain name this fastrpc
+	corresponds to. must be one of this: "adsp", "mdsp", "sdsp", "cdsp"
+
+- #address-cells
+	Usage: required
+	Value type: <u32>
+	Definition: Must be 1
+
+- #size-cells
+	Usage: required
+	Value type: <u32>
+	Definition: Must be 0
+
+= COMPUTE BANKS
+Each subnode of the Fastrpc represents compute context banks available
+on the dsp.
+- All Compute context banks MUST contain the following properties:
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "qcom,fastrpc-compute-cb"
+
+- reg
+	Usage: required
+	Value type: <u32>
+	Definition: Context Bank ID.
+
+- qcom,nsessions:
+	Usage: Optional
+	Value type: <u32>
+	Defination: A value indicating how many sessions can share this
+		    context bank. Defaults to 1 when this property
+		    is not specified.
+
+Example:
+
+adsp-pil {
+	compatible = "qcom,msm8996-adsp-pil";
+	...
+	smd-edge {
+		label = "lpass";
+		fastrpc {
+			compatible = "qcom,fastrpc";
+			qcom,smd-channels = "fastrpcsmd-apps-dsp";
+			label = "adsp";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cb@1 {
+				compatible = "qcom,fastrpc-compute-cb";
+				reg = <1>;
+			};
+
+			cb@2 {
+				compatible = "qcom,fastrpc-compute-cb";
+				reg = <2>;
+			};
+			...
+		};
+	};
+};
-- 
2.20.1
