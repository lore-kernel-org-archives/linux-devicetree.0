From: Biwen Li <biwen.li@nxp.com>
Subject: [v2,3/3] Documentation: dt: binding: fsl: Add 'fsl,rcpm-scfg' property
Date: Tue, 17 Sep 2019 12:41:19 +0800
Message-ID: <20190917044119.21895-3-biwen.li@nxp.com>
References: <20190917044119.21895-1-biwen.li@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917044119.21895-1-biwen.li@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: leoyang.li@nxp.com, shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
List-Id: devicetree@vger.kernel.org

The 'fsl,rcpm-scfg' property is used to fix a bug
that FlexTimer cannot wakeup system in deep sleep on LS1021A

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v2:
	- update desc of the property 'fsl,rcpm-scfg'

 Documentation/devicetree/bindings/soc/fsl/rcpm.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
index 5a33619d881d..f8dce247357a 100644
--- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
@@ -34,6 +34,11 @@ Chassis Version		Example Chips
 Optional properties:
  - little-endian : RCPM register block is Little Endian. Without it RCPM
    will be Big Endian (default case).
+ - fsl,rcpm-scfg : LS1021A has defect of failing to get data when
+   reading ippdexpcr. So add this property to help store one
+   copy to specified scfg_scrachpad_addr register for others
+   (such as U-Boot) reference. The first entry must be a link to the
+   SCFG device node, then followed by the offset of registers of SCFG.
 
 Example:
 The RCPM node for T4240:
@@ -43,6 +48,14 @@ The RCPM node for T4240:
 		#fsl,rcpm-wakeup-cells = <2>;
 	};
 
+The RCPM node for LS1021A:
+	rcpm: rcpm@1ee2140 {
+		compatible = "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-2.1+";
+		reg = <0x0 0x1ee2140 0x0 0x8>;
+		#fsl,rcpm-wakeup-cells = <2>;
+		fsl,rcpm-scfg = <&scfg 0x0 0x51c>; /* SCFG_SPARECR8 */
+	};
+
 * Freescale RCPM Wakeup Source Device Tree Bindings
 -------------------------------------------
 Required fsl,rcpm-wakeup property should be added to a device node if the device
-- 
2.17.1
