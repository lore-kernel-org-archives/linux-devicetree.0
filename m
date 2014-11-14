From: <shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] [v2] power/fsl: add MDIO dt binding for FMan
Date: Fri, 14 Nov 2014 17:53:20 +0800
Message-ID: <1415958800-9867-1-git-send-email-shh.xie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: Emilian.Medve-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

This binding is for FMan MDIO, it covers FMan v2 & FMan v3.

Signed-off-by: Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
changes in V2:
addressed comments from Scott in V1.

 .../devicetree/bindings/powerpc/fsl/fman.txt       | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
index edeea16..1523a87 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
+++ b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
@@ -7,6 +7,7 @@ CONTENTS
   - FMan MURAM Node
   - FMan dTSEC/XGEC/mEMAC Node
   - FMan IEEE 1588 Node
+  - FMan MDIO Node
   - Example
 
 =============================================================================
@@ -357,6 +358,68 @@ ptp-timer@fe000 {
 };
 
 =============================================================================
+FMan MDIO Node
+
+DESCRIPTION
+
+The MDIO is a bus to which the PHY devices are connected.
+
+PROPERTIES
+
+- compatible
+		Usage: required
+		Value type: <stringlist>
+		Definition: A standard property.
+		Must include "fsl,fman-mdio" for 1 Gb/s MDIO from FMan v2.
+		Must include "fsl,fman-xmdio" for 10 Gb/s MDIO from FMan v2.
+		Must include "fsl,fman-memac-mdio" for 1/10 Gb/s MDIO from
+		FMan v3.
+
+- reg
+		Usage: required
+		Value type: <prop-encoded-array>
+		Definition: A standard property.
+
+- bus-frequency
+		Usage: optional
+		Value type: <u32>
+		Definition: Specifies external MDIO bus clock speed which is
+		different from MDIO standard 2.5MHz. Should be defined for SoCs
+		on which the standard one cannot work.
+
+- interrupts
+		Usage: optional
+		Value type: <prop-encoded-array>
+		Definition: Event interrupt of external MDIO controller.
+		1 Gb/s MDIO and 10 Gb/s MDIO has one interrupt respectively.
+
+- fsl,fman-internal-mdio
+		Usage: required for internal MDIO
+		Value type: boolean
+		Definition: Fman has internal MDIO for internal PCS(Physical
+		Coding Sublayer) PHYs and external MDIO for external PHYs.
+		The settings and programming routines for internal/external
+		MDIO are different. Must be included for internal MDIO.
+
+EXAMPLE
+
+Example for FMan v2 external MDIO:
+
+mdio@f1000 {
+	compatible = "fsl,fman-xmdio";
+	reg = <0xf1000 0x1000>;
+	bus-frequency = <20000>;
+};
+
+Example for FMan v3 internal MDIO:
+
+mdio@f1000 {
+	compatible = "fsl,fman-memac-mdio";
+	reg = <0xf1000 0x1000>;
+	fsl,fman-internal-mdio;
+};
+
+=============================================================================
 Example
 
 fman@400000 {
@@ -531,4 +594,10 @@ fman@400000 {
 		compatible = "fsl,fman-ptp-timer";
 		reg = <0xfe000 0x1000>;
 	};
+
+	mdio@f1000 {
+		compatible = "fsl,fman-xmdio";
+		reg = <0xf1000 0x1000>;
+		bus-frequency = <20000>;
+	};
 };
-- 
1.8.4.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
