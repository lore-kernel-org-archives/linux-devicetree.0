From: Biwen Li <biwen.li@nxp.com>
Subject: [v4,2/3] arm: dts: ls1021a: fix that FlexTimer cannot wakeup system in deep sleep
Date: Thu, 26 Sep 2019 10:41:17 +0800
Message-ID: <20190926024118.15931-2-biwen.li@nxp.com>
References: <20190926024118.15931-1-biwen.li@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926024118.15931-1-biwen.li@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: leoyang.li@nxp.com, shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, ran.wang_1@nxp.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
List-Id: devicetree@vger.kernel.org

The patch fixes a bug that FlexTimer cannot
wakeup system in deep sleep.

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v4:
	- update property name
	  fsl,ippdexpcr-alt-addr -> fsl,ippdexpcr1-alt-addr

Change in v3:
	- update property name
	  fsl,rcpm-scfg -> fsl,ippdexpcr-alt-addr
	  
Change in v2:
	- None

 arch/arm/boot/dts/ls1021a.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index e3973b611c3a..ae427f039e8b 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -1000,6 +1000,12 @@
 			compatible = "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-2.1+";
 			reg = <0x0 0x1ee2140 0x0 0x8>;
 			#fsl,rcpm-wakeup-cells = <2>;
+
+			/*
+			 * The second and third entry compose an alt offset
+			 * address for IPPDEXPCR1(SCFG_SPARECR8)
+			 */
+			fsl,ippdexpcr1-alt-addr = <&scfg 0x0 0x51c>;
 		};
 
 		ftm_alarm0: timer0@29d0000 {
-- 
2.17.1
