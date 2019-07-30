From: Biwen Li <biwen.li@nxp.com>
Subject: [PATCH 2/3] arm64: dts: ls1012a/ls1043a/ls1046a/ls1088a/ls208xa: add ftm_alarm0 node
Date: Tue, 30 Jul 2019 17:06:33 +0800
Message-ID: <20190730090634.25070-2-biwen.li@nxp.com>
References: <20190730090634.25070-1-biwen.li@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730090634.25070-1-biwen.li@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, leoyang.li@nxp.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
List-Id: devicetree@vger.kernel.org

The patch adds ftm_alarm0 DT node
	- add new rcpm node
	- add ftm_alarm0 node
	- aliases ftm_alarm0 as rtc1

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 15 +++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 15 +++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 14 ++++++++++++++
 5 files changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
index ec6257a5b251..401210e3afd2 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -22,6 +22,7 @@
 		rtic-c = &rtic_c;
 		rtic-d = &rtic_d;
 		sec-mon = &sec_mon;
+		rtc1 = &ftm_alarm0;
 	};
 
 	cpus {
@@ -500,6 +501,20 @@
 					<0000 0 0 4 &gic 0 113 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
+
+		rcpm: rcpm@1ee2140 {
+			compatible = "fsl,ls1012a-rcpm", "fsl,qoriq-rcpm-2.1+";
+			reg = <0x0 0x1ee2140 0x0 0x4>;
+			#fsl,rcpm-wakeup-cells = <1>;
+		};
+
+		ftm_alarm0: timer@29d0000 {
+			compatible = "fsl,ls1012a-ftm-alarm";
+			reg = <0x0 0x29d0000 0x0 0x10000>;
+			fsl,rcpm-wakeup = <&rcpm 0x20000>;
+			interrupts = <0 86 0x4>;
+			big-endian;
+		};
 	};
 
 	firmware {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 71d9ed9ff985..9ff5dd32e87d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -27,6 +27,7 @@
 		ethernet4 = &enet4;
 		ethernet5 = &enet5;
 		ethernet6 = &enet6;
+		rtc1 = &ftm_alarm0;
 	};
 
 	cpus {
@@ -767,6 +768,19 @@
 			big-endian;
 		};
 
+		rcpm: rcpm@1ee2140 {
+			compatible = "fsl,ls1043a-rcpm", "fsl,qoriq-rcpm-2.1+";
+			reg = <0x0 0x1ee2140 0x0 0x4>;
+			#fsl,rcpm-wakeup-cells = <1>;
+		};
+
+		ftm_alarm0: timer@29d0000 {
+			compatible = "fsl,ls1043a-ftm-alarm";
+			reg = <0x0 0x29d0000 0x0 0x10000>;
+			fsl,rcpm-wakeup = <&rcpm 0x20000>;
+			interrupts = <0 86 0x4>;
+			big-endian;
+		};
 	};
 
 	firmware {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index b0ef08b090dd..d216375b174f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -28,6 +28,7 @@
 		ethernet5 = &enet5;
 		ethernet6 = &enet6;
 		ethernet7 = &enet7;
+		rtc1 = &ftm_alarm0;
 	};
 
 	cpus {
@@ -771,6 +772,20 @@
 			queue-sizes = <64 64>;
 			big-endian;
 		};
+
+		rcpm: rcpm@1ee208c {
+			compatible = "fsl,ls1046a-rcpm", "fsl,qoriq-rcpm-2.1+";
+			reg = <0x0 0x1ee208c 0x0 0x4>;
+			#fsl,rcpm-wakeup-cells = <1>;
+		};
+
+		ftm_alarm0: timer@29d0000 {
+			compatible = "fsl,ls1046a-ftm-alarm";
+			reg = <0x0 0x29d0000 0x0 0x10000>;
+			fsl,rcpm-wakeup = <&rcpm 0x20000>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			big-endian;
+		};
 	};
 
 	reserved-memory {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index dacd8cf03a7f..61cb897b940a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -18,6 +18,7 @@
 
 	aliases {
 		crypto = &crypto;
+		rtc1 = &ftm_alarm0;
 	};
 
 	cpus {
@@ -745,6 +746,19 @@
 				};
 			};
 		};
+
+		rcpm: rcpm@1e34040 {
+			compatible = "fsl,ls1088a-rcpm", "fsl,qoriq-rcpm-2.1+";
+			reg = <0x0 0x1e34040 0x0 0x18>;
+			#fsl,rcpm-wakeup-cells = <6>;
+		};
+
+		ftm_alarm0: timer@2800000 {
+			compatible = "fsl,ls1088a-ftm-alarm";
+			reg = <0x0 0x2800000 0x0 0x10000>;
+			fsl,rcpm-wakeup = <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
+			interrupts = <0 44 4>;
+		};
 	};
 
 	firmware {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index 3ace91945b72..908386042c5b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -24,6 +24,7 @@
 		serial1 = &serial1;
 		serial2 = &serial2;
 		serial3 = &serial3;
+		rtc1 = &ftm_alarm0;
 	};
 
 	cpu: cpus {
@@ -758,6 +759,19 @@
 			reg = <0x0 0x04000000 0x0 0x01000000>;
 			interrupts = <0 12 4>;
 		};
+
+		rcpm: rcpm@1e34040 {
+			compatible = "fsl,ls208xa-rcpm", "fsl,qoriq-rcpm-2.1+";
+			reg = <0x0 0x1e34040 0x0 0x18>;
+			#fsl,rcpm-wakeup-cells = <6>;
+		};
+
+		ftm_alarm0: timer@2800000 {
+			compatible = "fsl,ls208xa-ftm-alarm";
+			reg = <0x0 0x2800000 0x0 0x10000>;
+			fsl,rcpm-wakeup = <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
+			interrupts = <0 44 4>;
+		};
 	};
 
 	ddr1: memory-controller@1080000 {
-- 
2.17.1
