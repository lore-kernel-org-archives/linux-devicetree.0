From: Biwen Li <biwen.li@nxp.com>
Subject: [v2,2/3] arm: dts: ls1021a: fix that FlexTimer cannot wakeup system in deep sleep
Date: Tue, 17 Sep 2019 12:41:18 +0800
Message-ID: <20190917044119.21895-2-biwen.li@nxp.com>
References: <20190917044119.21895-1-biwen.li@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917044119.21895-1-biwen.li@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: leoyang.li@nxp.com, shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
List-Id: devicetree@vger.kernel.org

The patch fix a bug that FlexTimer cannot
wakeup system in deep sleep.

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v2:
	- None

 arch/arm/boot/dts/ls1021a.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index e3973b611c3a..377bb4717584 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -1000,12 +1000,13 @@
 			compatible = "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-2.1+";
 			reg = <0x0 0x1ee2140 0x0 0x8>;
 			#fsl,rcpm-wakeup-cells = <2>;
+			fsl,rcpm-scfg = <&scfg 0x0 0x51c>; /* SCFG_SPARECR8 */
 		};
 
 		ftm_alarm0: timer0@29d0000 {
 			compatible = "fsl,ls1021a-ftm-alarm";
 			reg = <0x0 0x29d0000 0x0 0x10000>;
-			fsl,rcpm-wakeup = <&rcpm 0x0 0x20000000>;
+			fsl,rcpm-wakeup = <&rcpm 0x0 0x30000000>; /* FlexTimer1 and OCRAM1 are not powerdown during LPM20(sleep) */
 			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
 			big-endian;
 		};
-- 
2.17.1
