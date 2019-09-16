From: Biwen Li <biwen.li@nxp.com>
Subject: [3/3] Documentation: dt: binding: fsl: Add 'fsl,rcpm-scfg' property
Date: Mon, 16 Sep 2019 18:25:56 +0800
Message-ID: <20190916102556.16655-3-biwen.li@nxp.com>
References: <20190916102556.16655-1-biwen.li@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190916102556.16655-1-biwen.li@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: leoyang.li@nxp.com, shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
List-Id: devicetree@vger.kernel.org

The 'fsl,rcpm-scfg' property is used to fix a bug
that FlexTimer cannot wakeup system in deep sleep on LS1021A

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 .../devicetree/bindings/soc/fsl/rcpm.txt          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
index 5a33619d881d..31e22f092b51 100644
--- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
@@ -34,6 +34,12 @@ Chassis Version		Example Chips
 Optional properties:
  - little-endian : RCPM register block is Little Endian. Without it RCPM
    will be Big Endian (default case).
+ - fsl,rcpm-scfg : Must add the property for SoC LS1021A,
+   Must include n + 1 entries (n = #fsl,rcpm-wakeup-cells, such as:
+   #fsl,rcpm-wakeup-cells equal to 2, then must include 2 + 1 entries).
+   The first entry must be a link to the SCFG device node.
+   The non-first entry must be offset of registers of SCFG.
+   (Currently only support SoC LS1021A)
 
 Example:
 The RCPM node for T4240:
@@ -43,6 +49,15 @@ The RCPM node for T4240:
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
+
 * Freescale RCPM Wakeup Source Device Tree Bindings
 -------------------------------------------
 Required fsl,rcpm-wakeup property should be added to a device node if the device
-- 
2.17.1
