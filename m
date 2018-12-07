From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 1/6] misc: dt-bindings: Add Qualcomm Fastrpc bindings
Date: Fri,  7 Dec 2018 16:35:08 +0000
Message-ID: <20181207163513.16412-2-srinivas.kandagatla@linaro.org>
References: <20181207163513.16412-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207163513.16412-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, arnd@arndb.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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
 .../devicetree/bindings/misc/qcom,fastrpc.txt | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/qcom,fastrpc.txt

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
new file mode 100644
index 000000000000..06e8c25839d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
@@ -0,0 +1,73 @@
+Qualcomm Technologies, Inc. FastRPC Driver
+
+The FastRPC driver implements an IPC (Inter-Processor Communication)
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
+- reg
+	Usage: required
+	Value type: <u32>
+	Definition: DSP Processor ID.
+	Possible values are :
+			0 - ADSP
+			1 - MDSP
+			2 - SDSP
+			3 - CDSP
+
+= COMPUTE BANKS
+Each subnode of the Fastrpc node represents compute context banks available
+on the dsp. The name of the nodes are not important. The properties of these
+nodes are defined by the individual bindings for the specific service
+- All Compute context banks MUST contain the following property:
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
+- secured:
+	Usage: Optional
+	Value type: <boolean>
+	Defination: Indicating context bank is secured
+
+- nsessions:
+	Usage: Optional
+	Value type: <u32>
+	Defination: A value indicating how many sessions can share this
+		    context bank. Defaults to 'One' when this property
+		    is not specified.
+
+Example:
+
+fastrpc {
+	compatible = "qcom,fastrpc";
+	qcom,smd-channels = "fastrpcsmd-apps-dsp";
+	reg = <0>; /* DOMAIN_ADSP */
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	cb@1 {
+		compatible = "qcom,fastrpc-compute-cb";
+		reg = <1>;
+		iommus = <&lpass_q6_smmu 1>;
+	};
+
+	cb@2 {
+		compatible = "qcom,fastrpc-compute-cb";
+		reg = <2>;
+		iommus = <&lpass_q6_smmu 2>;
+	};
+	...
+};
-- 
2.19.2
