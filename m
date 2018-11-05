From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 03/17] arm64: dts: qcom: qcs404: Add RPM GLINK related nodes
Date: Mon,  5 Nov 2018 21:15:15 +0530
Message-ID: <20181105154529.7614-4-vkoul@kernel.org>
References: <20181105154529.7614-1-vkoul@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181105154529.7614-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Add RPM GLINK node and the RPM message ram, hwspinlock, APCS apps global
and smem nodes it depends on.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 44 ++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index ba7cd707299c..c749c61225b4 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -106,6 +106,34 @@
 		method = "smc";
 	};
 
+	rpm-glink {
+		compatible = "qcom,glink-rpm";
+
+		interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+		qcom,rpm-msg-ram = <&rpm_msg_ram>;
+		mboxes = <&apcs_glb 0>;
+
+		rpm_requests: glink-channel {
+			compatible = "qcom,rpm-qcs404";
+			qcom,glink-channels = "rpm_requests";
+		};
+	};
+
+	smem {
+		compatible = "qcom,smem";
+
+		memory-region = <&smem_region>;
+		qcom,rpm-msg-ram = <&rpm_msg_ram>;
+
+		hwlocks = <&tcsr_mutex 3>;
+	};
+
+	tcsr_mutex: hwlock {
+		compatible = "qcom,tcsr-mutex";
+		syscon = <&tcsr_mutex_regs 0 0x1000>;
+		#hwlock-cells = <1>;
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 2 0xff08>,
@@ -128,6 +156,11 @@
 		ranges = <0 0 0 0xffffffff>;
 		compatible = "simple-bus";
 
+		rpm_msg_ram: memory@60000 {
+			compatible = "qcom,rpm-msg-ram";
+			reg = <0x60000 0x6000>;
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
@@ -145,6 +178,11 @@
 			assigned-clock-rates = <19200000>;
 		};
 
+		tcsr_mutex_regs: syscon@1905000 {
+			compatible = "syscon";
+			reg = <0x1905000 0x20000>;
+		};
+
 		timer@b120000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -212,5 +250,11 @@
 			clock-names = "core", "iface";
 			status = "okay";
 		};
+
+		apcs_glb: mailbox@b011000 {
+			compatible = "qcom,qcs404-apcs-apps-global", "syscon";
+			reg = <0xb011000 0x1000>;
+			#mbox-cells = <1>;
+		};
 	};
 };
-- 
2.14.4
