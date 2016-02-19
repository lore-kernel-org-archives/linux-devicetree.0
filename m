From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] dt-bindings: MediaTek: Add binding document for the AUXADC
Date: Fri, 19 Feb 2016 08:18:46 +0100
Message-ID: <1455866326-15095-1-git-send-email-s.hauer@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---

This is a supplement to the MTK Thermal series which was lacking the
description for the AUXADC.

 .../devicetree/bindings/soc/mediatek/auxadc.txt     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/auxadc.txt

diff --git a/Documentation/devicetree/bindings/soc/mediatek/auxadc.txt b/Documentation/devicetree/bindings/soc/mediatek/auxadc.txt
new file mode 100644
index 0000000..bdb7829
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/auxadc.txt
@@ -0,0 +1,21 @@
+MediaTek AUXADC
+===============
+
+The Auxiliary Analog/Digital Converter (AUXADC) is an ADC found
+in some Mediatek SoCs which among other things measures the temperatures
+in the SoC. It can be used directly with register accesses, but it is also
+used by thermal controller which reads the temperatures from the AUXADC
+directly via its own bus interface. See
+Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
+for the Thermal Controller which holds a phandle to the AUXADC.
+
+Required properties:
+- compatible: Must be "mediatek,mt8173-auxadc"
+- reg: Address range of the AUXADC unit
+
+Example:
+
+auxadc: auxadc@11001000 {
+	compatible = "mediatek,mt8173-auxadc";
+	reg = <0 0x11001000 0 0x1000>;
+};
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
