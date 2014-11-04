From: <shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] DT: add MDIO node for FMan node
Date: Tue, 4 Nov 2014 19:56:36 +0800
Message-ID: <1415102196-9238-1-git-send-email-shh.xie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: Emilian.Medve-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

This binding is for FMan MDIO, it covers FMan v2 & FMan v3.

Signed-off-by: Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
based on http://patchwork.ozlabs.org/patch/390351/
for 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/scottwood/linux.git

 .../devicetree/bindings/powerpc/fsl/fman.txt       | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
index da8e5f2..83c2f14 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
+++ b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
@@ -7,6 +7,7 @@ CONTENTS
   - FMan MURAM Node
   - FMan dTSEC/XGEC/mEMAC Node
   - FMan IEEE 1588 Node
+  - FMan MDIO Node
   - Example
 
 =============================================================================
@@ -352,6 +353,67 @@ ptp-timer@fe000 {
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
+		Definition: Default MDIO bus clock speed.
+
+- interrupts
+		Usage: optional
+		Value type: <prop-encoded-array>
+		Definition: MDIO controller event interrupts.
+
+- type
+		Usage: required for FMan v3
+		Value type: <stringlist>
+		Definition: A standard property.
+		FMan v3 has internal MDIO for internal PCS(Physical Coding
+		Sublayer) PHYs and external MDIO for external PHYs.
+		The settings and programming routines for internal/external
+		MDIO are different. Must include "internal" for internal MDIO,
+		must include "external" for external MDIO.
+
+EXAMPLE
+
+Example for FMan v2:
+
+mdio@f1000 {
+	compatible = "fsl,fman-xmdio";
+	reg = <0xf1000 0x1000>;
+};
+
+Example for FMan v3:
+
+mdio@fd000 {
+	compatible = "fsl,fman-memac-mdio";
+	reg = <0xfd000 0x1000>;
+	bus-frequency = <2500000>;
+	type = "external";
+};
+
+=============================================================================
 Example
 
 fman@400000 {
@@ -526,4 +588,11 @@ fman@400000 {
 		compatible = "fsl,fman-ptp-timer";
 		reg = <0xfe000 0x1000>;
 	};
+
+	mdio@fd000 {
+		compatible = "fsl,fman-memac-mdio";
+		reg = <0xfd000 0x1000>;
+		bus-frequency = <2500000>;
+		type = "external";
+	};
 };
-- 
1.8.4.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
