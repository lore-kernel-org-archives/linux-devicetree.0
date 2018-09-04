From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 5/8] arm64: dts: qcom: msm8998: Add smem related nodes
Date: Mon,  3 Sep 2018 22:01:20 -0700
Message-ID: <20180904050123.26601-6-bjorn.andersson@linaro.org>
References: <20180904050123.26601-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180904050123.26601-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add reserve-memory nodes, tcsr-mutex nodes and the smem node.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- New patch

 arch/arm64/boot/dts/qcom/msm8998.dtsi | 49 +++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index f92f04f9ed6d..335bbc339932 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -20,6 +20,38 @@
 		reg = <0 0 0 0>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		memory@85800000 {
+			reg = <0x0 0x85800000 0x0 0x800000>;
+			no-map;
+		};
+
+		smem_mem: smem-mem@86000000 {
+			reg = <0x0 0x86000000 0x0 0x200000>;
+			no-map;
+		};
+
+		memory@86200000 {
+			reg = <0x0 0x86200000 0x0 0x2600000>;
+			no-map;
+		};
+
+		rmtfs {
+			compatible = "qcom,rmtfs-mem";
+
+			size = <0x0 0x200000>;
+			alloc-ranges = <0x0 0xa0000000 0x0 0x2000000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
+		};
+	};
+
 	clocks {
 		xo_board {
 			compatible = "fixed-clock";
@@ -205,6 +237,12 @@
 		};
 	};
 
+	tcsr_mutex: hwlock {
+		compatible = "qcom,tcsr-mutex";
+		syscon = <&tcsr_mutex_regs 0 0x1000>;
+		#hwlock-cells = <1>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -225,6 +263,12 @@
 		};
 	};
 
+	smem {
+		compatible = "qcom,smem";
+		memory-region = <&smem_mem>;
+		hwlocks = <&tcsr_mutex 3>;
+	};
+
 	thermal-zones {
 		cpu-thermal0 {
 			polling-delay-passive = <250>;
@@ -474,6 +518,11 @@
 			#thermal-sensor-cells = <1>;
 		};
 
+		tcsr_mutex_regs: syscon@1f40000 {
+			compatible = "syscon";
+			reg = <0x1f40000 0x20000>;
+		};
+
 		apcs_glb: mailbox@9820000 {
 			compatible = "qcom,msm8998-apcs-hmss-global";
 			reg = <0x17911000 0x1000>;
-- 
2.18.0
