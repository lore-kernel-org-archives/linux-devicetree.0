From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 2/3] dt-bindings: add bindings document for zx-irdec
Date: Sun, 30 Jul 2017 21:23:12 +0800
Message-ID: <1501420993-21977-3-git-send-email-shawnguo@kernel.org>
References: <1501420993-21977-1-git-send-email-shawnguo@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501420993-21977-1-git-send-email-shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Young <sean-hENCXIMQXOg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Baoyou Xie <xie.baoyou-i+zz7BTLltu8dxfXipz/DA@public.gmane.org>, Xin Zhou <zhou.xin8-i+zz7BTLltu8dxfXipz/DA@public.gmane.org>, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

It adds the dt-bindings document for ZTE ZX IRDEC remote control
block.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/media/zx-irdec.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/zx-irdec.txt

diff --git a/Documentation/devicetree/bindings/media/zx-irdec.txt b/Documentation/devicetree/bindings/media/zx-irdec.txt
new file mode 100644
index 000000000000..295b9fab593e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/zx-irdec.txt
@@ -0,0 +1,14 @@
+IR Decoder (IRDEC) on ZTE ZX family SoCs
+
+Required properties:
+ - compatible: Should be "zte,zx296718-irdec".
+ - reg: Physical base address and length of IRDEC registers.
+ - interrupts: Interrupt number of IRDEC.
+
+Exmaples:
+
+	irdec: ir-decoder@111000 {
+		compatible = "zte,zx296718-irdec";
+		reg = <0x111000 0x1000>;
+		interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
