From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 8/8] arm64: dts: qcom: sm8150: Add apps shared nodes
Date: Tue, 20 Aug 2019 22:53:51 +0530
Message-ID: <20190820172351.24145-10-vkoul@kernel.org>
References: <20190820172351.24145-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820172351.24145-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add hwlock, pmu, smem, tcsr_mutex_regs, apss_shared mailbox, apps_rsc
including the rpmhcc child nodes to the SM8150 DTSI

Co-developed-by: Sibi Sankar <sibis@codeaurora.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 63 ++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 3bed04d60dea..781905e9977a 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -144,12 +144,23 @@
 		};
 	};
 
+	tcsr_mutex: hwlock {
+		compatible = "qcom,tcsr-mutex";
+		syscon = <&tcsr_mutex_regs 0 0x1000>;
+		#hwlock-cells = <1>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the size */
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -266,6 +277,12 @@
 		};
 	};
 
+	smem {
+		compatible = "qcom,smem";
+		memory-region = <&smem_mem>;
+		hwlocks = <&tcsr_mutex 3>;
+	};
+
 	soc: soc@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -305,6 +322,11 @@
 			};
 		};
 
+		tcsr_mutex_regs: syscon@1f40000 {
+			compatible = "syscon";
+			reg = <0x01f40000 0x40000>;
+		};
+
 		tlmm: pinctrl@3100000 {
 			compatible = "qcom,sm8150-pinctrl";
 			reg = <0x03100000 0x300000>,
@@ -320,6 +342,16 @@
 			#interrupt-cells = <2>;
 		};
 
+		aoss_qmp: power-controller@c300000 {
+			compatible = "qcom,sm8150-aoss-qmp";
+			reg = <0x0c300000 0x100000>;
+			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&apss_shared 0>;
+
+			#clock-cells = <0>;
+			#power-domain-cells = <1>;
+		};
+
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
 			interrupt-controller;
@@ -329,6 +361,12 @@
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		apss_shared: mailbox@17c00000 {
+			compatible = "qcom,sm8150-apss-shared";
+			reg = <0x17c00000 0x1000>;
+			#mbox-cells = <1>;
+		};
+
 		timer@17c20000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -388,6 +426,31 @@
 			};
 		};
 
+		apps_rsc: rsc@18200000 {
+			label = "apps_rsc";
+			compatible = "qcom,rpmh-rsc";
+			reg = <0x18200000 0x10000>,
+			      <0x18210000 0x10000>,
+			      <0x18220000 0x10000>;
+			reg-names = "drv-0", "drv-1", "drv-2";
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,tcs-offset = <0xd00>;
+			qcom,drv-id = <2>;
+			qcom,tcs-config = <ACTIVE_TCS  2>,
+					  <SLEEP_TCS   1>,
+					  <WAKE_TCS    1>,
+					  <CONTROL_TCS 0>;
+
+			rpmhcc: clock-controller {
+				compatible = "qcom,sm8150-rpmh-clk";
+				#clock-cells = <1>;
+				clock-names = "xo";
+				clocks = <&xo_board>;
+			};
+		};
+
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0c440000 0x0001100>,
-- 
2.20.1
