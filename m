From: Wanglai Shi <shiwanglai@hisilicon.com>
Subject: [PATCH] dts: arm64: add CoreSight trace support for hi3660
Date: Tue, 11 Dec 2018 18:05:49 +0800
Message-ID: <1544522749-54071-1-git-send-email-shiwanglai@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: xuwei5@hisilicon.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leo.yan@linaro.org, shiwanglai@hisilicon.com
List-Id: devicetree@vger.kernel.org

This patch adds devicetree entries for the CoreSight trace
 components on hi3660.

Signed-off-by: Wanglai Shi <shiwanglai@hisilicon.com>
---
 .../arm64/boot/dts/hisilicon/hi3660-coresight.dtsi | 428 +++++++++++++++++++++
 1 file changed, 428 insertions(+)
 create mode 100644 arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
new file mode 100644
index 0000000..95c79e4
--- /dev/null
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
@@ -0,0 +1,428 @@
+/*
+ * dtsi for Hisilicon Hi3660 Coresight
+ *
+ * Copyright (C) 2016-2017 Hisilicon Ltd.
+ *
+ * Author: Wanglai Shi <shiwanglai@hisilicon.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * publishhed by the Free Software Foundation.
+ */
+/ {
+	amba {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "arm,amba-bus";
+		ranges;
+
+		/* A53 cluster internal coresight */
+		etm@0,ecc40000 {
+			compatible = "arm,coresight-etm4x","arm,primecell";
+			reg = <0 0xecc40000 0 0x1000>;
+			clocks = <&pclk>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu0>;
+			port {
+				etm0_out_port: endpoint {
+					remote-endpoint = <&funnel0_in_port0>;
+				};
+			};
+		};
+
+		etm@1,ecd40000 {
+			compatible = "arm,coresight-etm4x","arm,primecell";
+			reg = <0 0xecd40000 0 0x1000>;
+			clocks = <&pclk>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu1>;
+			port {
+				etm1_out_port: endpoint {
+					remote-endpoint = <&funnel0_in_port1>;
+				};
+			};
+		};
+
+		etm@2,ece40000 {
+			compatible = "arm,coresight-etm4x","arm,primecell";
+			reg = <0 0xece40000 0 0x1000>;
+			clocks = <&pclk>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu2>;
+			port {
+				etm2_out_port: endpoint {
+					remote-endpoint = <&funnel0_in_port2>;
+				};
+			};
+		};
+
+		etm@3,ecf40000 {
+			compatible = "arm,coresight-etm4x","arm,primecell";
+			reg = <0 0xecf40000 0 0x1000>;
+			clocks = <&pclk>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu3>;
+			port {
+				etm3_out_port: endpoint {
+					remote-endpoint = <&funnel0_in_port3>;
+				};
+			};
+		};
+
+		funnel0:funnel@0,ec801000 {
+			compatible = "arm,coresight-funnel","arm,primecell";
+			reg = <0 0xec801000 0 0x1000>;
+			clocks = <&pclk>;
+			clock-names = "apb_pclk";
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* funnel output port */
+				port@0 {
+					reg = <0>;
+					funnel0_out_port: endpoint {
+						remote-endpoint =
+							<&etf0_in_port>;
+					};
+				};
+
+				/* funnel input ports */
+				port@1 {
+					reg = <0>;
+					funnel0_in_port0: endpoint {
+						slave-mode;
+						remote-endpoint =
+							<&etm0_out_port>;
+					};
+				};
+
+				port@2 {
+					reg = <1>;
+					funnel0_in_port1: endpoint {
+						slave-mode;
+						remote-endpoint =
+							<&etm1_out_port>;
+					};
+				};
+
+				port@3 {
+					reg = <2>;
+					funnel0_in_port2: endpoint {
+						slave-mode;
+						remote-endpoint =
+							<&etm2_out_port>;
+					};
+				};
+
+				port@4 {
+					reg = <3>;
+					funnel0_in_port3: endpoint {
+						slave-mode;
+						remote-endpoint =
+							<&etm3_out_port>;
+					};
+				};
+			};
+		};
+
+		etf0:etf@0,ec802000 {
+			compatible = "arm,coresight-tmc","arm,primecell";
+			reg = <0 0xec802000 0 0x1000>;
+			clocks = <&pclk>;
+			clock-names = "apb_pclk";
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				/* input port */
+				port@0 {
+					reg = <0>;
+					etf0_in_port: endpoint {
+						slave-mode;
+						remote-endpoint =
+							<&funnel0_out_port>;
+					};
+				};
+
+				/* output port */
+				port@1 {
+					reg = <0>;
+					etf0_out_port: endpoint {
+						remote-endpoint =
+							<&funnel2_in_port0>;
+					};
+				};
+			};
+		};
+
+		/* A73 cluster internal coresight */
+		etm@4,ed440000 {
+			compatible = "arm,coresight-etm4x","arm,primecell";
+			reg = <0 0xed440000 0 0x1000>;
+			clocks = <&pclk>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu4>;
+			port {
+				etm4_out_port: endpoint {
+				remote-endpoint = <&funnel1_in_port0>;
+				};
+			};
+		};
+
+		etm@5,ed540000 {
+			compatible = "arm,coresight-etm4x","arm,primecell";
+			reg = <0 0xed540000 0 0x1000>;
+			clocks = <&pclk>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu5>;
+			port {
+				etm5_out_port: endpoint {
+				remote-endpoint = <&funnel1_in_port1>;
+				};
+			};
+		};
+
+		etm@6,ed640000 {
+			compatible = "arm,coresight-etm4x","arm,primecell";
+			reg = <0 0xed640000 0 0x1000>;
+			clocks = <&pclk>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu6>;
+			port {
+				etm6_out_port: endpoint {
+					remote-endpoint = <&funnel1_in_port2>;
+				};
+			};
+		};
+
+		etm@7,ed740000 {
+			compatible = "arm,coresight-etm4x","arm,primecell";
+			reg = <0 0xed740000 0 0x1000>;
+			clocks = <&pclk>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu7>;
+			port {
+				etm7_out_port: endpoint {
+					remote-endpoint = <&funnel1_in_port3>;
+				};
+			};
+		};
+
+		funnel1:funnel@1,ed001000 {
+			compatible = "arm,coresight-funnel","arm,primecell";
+			reg = <0 0xed001000 0 0x1000>;
+			clocks = <&pclk>;
+			clock-names = "apb_pclk";
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* funnel output port */
+				port@0 {
+					reg = <0>;
+					funnel1_out_port: endpoint {
+						remote-endpoint =
+							<&etf1_in_port>;
+					};
+				};
+
+				/* funnel input ports */
+				port@1 {
+					reg = <0>;
+					funnel1_in_port0: endpoint {
+						slave-mode;
+						remote-endpoint =
+							<&etm4_out_port>;
+					};
+				};
+
+				port@2 {
+					reg = <1>;
+					funnel1_in_port1: endpoint {
+						slave-mode;
+						remote-endpoint =
+							<&etm5_out_port>;
+					};
+				};
+
+				port@3 {
+					reg = <2>;
+					funnel1_in_port2: endpoint {
+						slave-mode;
+						remote-endpoint =
+							<&etm6_out_port>;
+					};
+				};
+
+				port@4 {
+					reg = <3>;
+					funnel1_in_port3: endpoint {
+						slave-mode;
+						remote-endpoint =
+							<&etm7_out_port>;
+					};
+				};
+			};
+		};
+
+		etf1:etf@1,ed002000 {
+			compatible = "arm,coresight-tmc","arm,primecell";
+			reg = <0 0xed002000 0 0x1000>;
+			clocks = <&pclk>;
+			clock-names = "apb_pclk";
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				/* input port */
+				port@0 {
+					reg = <0>;
+					etf1_in_port: endpoint {
+						slave-mode;
+						remote-endpoint =
+							<&funnel1_out_port>;
+					};
+				};
+
+				/* output port */
+				port@1 {
+					reg = <0>;
+					etf1_out_port: endpoint {
+						remote-endpoint =
+							<&funnel2_in_port0>;
+					};
+				};
+			};
+		};
+
+		/* Top coresight config */
+		funnel@2,ec031000 {
+			compatible = "arm,coresight-funnel","arm,primecell";
+			reg = <0 0xec031000 0 0x1000>;
+			clocks = <&pclk>;
+			clock-names = "apb_pclk";
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* funnel output port */
+				port@0 {
+					reg = <0>;
+					funnel2_out_port: endpoint {
+						remote-endpoint =
+							<&etf2_in_port>;
+					};
+				};
+
+				/* funnel input ports */
+				port@1 {
+					reg = <0>;
+					funnel2_in_port0: endpoint {
+						slave-mode;
+						remote-endpoint =
+							<&etf0_out_port>;
+					};
+				};
+			};
+		};
+
+		etf@2,ec036000 {
+			compatible = "arm,coresight-tmc","arm,primecell";
+			reg = <0 0xec036000 0 0x1000>;
+			clocks = <&pclk>;
+			clock-names = "apb_pclk";
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				/* input port */
+				port@0 {
+					reg = <0>;
+					etf2_in_port: endpoint {
+						slave-mode;
+						remote-endpoint =
+							<&funnel2_out_port>;
+					};
+				};
+
+				/* output port */
+				port@1 {
+					reg = <0>;
+					etf2_out_port: endpoint {
+						remote-endpoint =
+							<&replicator0_in_port>;
+					};
+				};
+			};
+		};
+
+		replicator {
+			compatible = "arm,coresight-replicator";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* etr out port  */
+				port@0 {
+					reg = <0>;
+					replicator0_out_port0: endpoint {
+						remote-endpoint =
+							<&etr_in_port>;
+					};
+				};
+				/* TPIU out port  */
+				port@1 {
+					reg = <1>;
+					replicator0_out_port1: endpoint {
+						remote-endpoint =
+							<&tpiu_in_port>;
+					};
+				};
+				/* input port  */
+				port@2 {
+					reg = <0>;
+					replicator0_in_port: endpoint {
+						slave-mode;
+						remote-endpoint =
+							<&etf2_out_port>;
+					};
+				};
+			};
+		};
+
+		etr@0,ec033000 {
+			compatible = "arm,coresight-tmc","arm,primecell";
+			reg = <0 0xec033000 0 0x1000>;
+			clocks = <&pclk>;
+			clock-names = "apb_pclk";
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* etr input port  */
+				port@0 {
+					reg = <0>;
+					etr_in_port: endpoint {
+						slave-mode;
+						remote-endpoint =
+						<&replicator0_out_port0>;
+					};
+				};
+			};
+		};
+
+		tpiu@ec032000 {
+			compatible = "arm,coresight-tpiu", "arm,primecell";
+			reg = <0 0xec032000 0 0x1000>;
+
+			clocks = <&pclk>;
+			clock-names = "apb_pclk";
+			port {
+				tpiu_in_port: endpoint {
+					slave-mode;
+					remote-endpoint =
+						<&replicator0_out_port1>;
+				};
+			};
+		};
+	};
+};
-- 
2.7.4
