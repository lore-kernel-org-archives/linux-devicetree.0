From: Biwen Li <biwen.li@nxp.com>
Subject: [PATCH 3/3] arm: dts: ls1021a: add ftm_alarm0 DT node
Date: Tue, 30 Jul 2019 17:06:34 +0800
Message-ID: <20190730090634.25070-3-biwen.li@nxp.com>
References: <20190730090634.25070-1-biwen.li@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730090634.25070-1-biwen.li@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, leoyang.li@nxp.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
List-Id: devicetree@vger.kernel.org

The patch add ftm_alarm0 DT node
	- add rcpm node
	- add ftm_alarm0 node
	- aliases ftm_alarm0 as rtc1

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 arch/arm/boot/dts/ls1021a.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 464df4290ffc..2a14a1fdd2da 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -66,6 +66,7 @@
 		serial4 = &lpuart4;
 		serial5 = &lpuart5;
 		sysclk = &sysclk;
+		rtc1 = &ftm_alarm0;
 	};
 
 	cpus {
@@ -985,5 +986,19 @@
 			big-endian;
 		};
 
+		rcpm: rcpm@1ee2140 {
+			compatible = "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-2.1+";
+			reg = <0x0 0x1ee2140 0x0 0x8>;
+			#fsl,rcpm-wakeup-cells = <2>;
+		};
+
+		ftm_alarm0: timer0@29d0000 {
+			compatible = "fsl,ls1021a-ftm-alarm";
+			reg = <0x0 0x29d0000 0x0 0x10000>;
+			reg-names = "ftm";
+			fsl,rcpm-wakeup = <&rcpm 0x20000 0x0>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			big-endian;
+		};
 	};
 };
-- 
2.17.1
