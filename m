From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH 4/5] ARC: AXS103: DTS: Set cpu frequency explicitly via dts
Date: Mon, 14 Aug 2017 19:12:12 +0300
Message-ID: <20170814161213.17522-5-Eugeniy.Paltsev@synopsys.com>
References: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

Set cpu frequency explicitly via "cpu-freq" param in cpu 0 node
in device tree.

We add "cpu-freq" only to cpu 0 as all cpus are clocking from same
clock source (same pll in our case).

We override cpus node in skeleton as we don't need this change for
nsim.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/boot/dts/axc003.dtsi     | 13 +++++++++++++
 arch/arc/boot/dts/axc003_idu.dtsi | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
index dca7e39..7c7411c 100644
--- a/arch/arc/boot/dts/axc003.dtsi
+++ b/arch/arc/boot/dts/axc003.dtsi
@@ -17,6 +17,19 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "snps,archs38";
+			reg = <0>;
+			cpu-freq = <100000000>;
+			clocks = <&core_clk>;
+		};
+	};
+
 	cpu_card {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index 5b56bef..44bc01e 100644
--- a/arch/arc/boot/dts/axc003_idu.dtsi
+++ b/arch/arc/boot/dts/axc003_idu.dtsi
@@ -17,6 +17,41 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/*
+		 * "cpu-freq" was added only to cpu 0 as all cpus are clocking
+		 * from same clock source (same pll (core_clk) in our case).
+		 */
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "snps,archs38";
+			reg = <0>;
+			cpu-freq = <100000000>;
+			clocks = <&core_clk>;
+		};
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "snps,archs38";
+			reg = <1>;
+			clocks = <&core_clk>;
+		};
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "snps,archs38";
+			reg = <2>;
+			clocks = <&core_clk>;
+		};
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "snps,archs38";
+			reg = <3>;
+			clocks = <&core_clk>;
+		};
+	};
+
 	cpu_card {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.9.3
