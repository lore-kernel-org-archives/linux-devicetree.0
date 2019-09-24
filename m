From: Biwen Li <biwen.li@nxp.com>
Subject: [v3,3/3] Documentation: dt: binding: fsl: Add 'fsl,ippdexpcr-alt-addr' property
Date: Tue, 24 Sep 2019 10:45:48 +0800
Message-ID: <20190924024548.4356-3-biwen.li@nxp.com>
References: <20190924024548.4356-1-biwen.li@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190924024548.4356-1-biwen.li@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: leoyang.li@nxp.com, shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, ran.wang_1@nxp.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
List-Id: devicetree@vger.kernel.org

The 'fsl,ippdexpcr-alt-addr' property is used to handle an errata A-008646
on LS1021A

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v3:
	- rename property name
	  fsl,rcpm-scfg -> fsl,ippdexpcr-alt-addr

Change in v2:
	- update desc of the property 'fsl,rcpm-scfg'

 Documentation/devicetree/bindings/soc/fsl/rcpm.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
index 5a33619d881d..157dcf6da17c 100644
--- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
@@ -34,6 +34,11 @@ Chassis Version		Example Chips
 Optional properties:
  - little-endian : RCPM register block is Little Endian. Without it RCPM
    will be Big Endian (default case).
+ - fsl,ippdexpcr-alt-addr : Must add the property for SoC LS1021A,
+   Must include n + 1 entries (n = #fsl,rcpm-wakeup-cells, such as:
+   #fsl,rcpm-wakeup-cells equal to 2, then must include 2 + 1 entries).
+   The first entry must be a link to the SCFG device node.
+   The non-first entry must be offset of registers of SCFG.
 
 Example:
 The RCPM node for T4240:
@@ -43,6 +48,15 @@ The RCPM node for T4240:
 		#fsl,rcpm-wakeup-cells = <2>;
 	};
 
+The RCPM node for LS1021A:
+	rcpm: rcpm@1ee2140 {
+		compatible = "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-2.1+";
+		reg = <0x0 0x1ee2140 0x0 0x8>;
+		#fsl,rcpm-wakeup-cells = <2>;
+		fsl,ippdexpcr-alt-addr = <&scfg 0x0 0x51c>; /* SCFG_SPARECR8 */
+	};
+
+
 * Freescale RCPM Wakeup Source Device Tree Bindings
 -------------------------------------------
 Required fsl,rcpm-wakeup property should be added to a device node if the device
-- 
2.17.1
