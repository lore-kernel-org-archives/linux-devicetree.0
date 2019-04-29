Return-Path: <SRS0=r54Y=S7=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH RESEND] dt-bindings: usb: renesas_usbhs: Add support for r8a77470
Date: Mon, 29 Apr 2019 11:22:57 +0100
Message-Id: <1556533377-8116-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document support for RZ/G1C (R8A77470) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch is based on usb-next.

 * Resending the patch to Greg and linux-usb@vger.kernel.org
 (Ref: https://patchwork.kernel.org/patch/10894125/)
---
 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
index d93b6a1..b8acc2a 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -6,6 +6,7 @@ Required properties:
 	- "renesas,usbhs-r8a7743" for r8a7743 (RZ/G1M) compatible device
 	- "renesas,usbhs-r8a7744" for r8a7744 (RZ/G1N) compatible device
 	- "renesas,usbhs-r8a7745" for r8a7745 (RZ/G1E) compatible device
+	- "renesas,usbhs-r8a77470" for r8a77470 (RZ/G1C) compatible device
 	- "renesas,usbhs-r8a774a1" for r8a774a1 (RZ/G2M) compatible device
 	- "renesas,usbhs-r8a774c0" for r8a774c0 (RZ/G2E) compatible device
 	- "renesas,usbhs-r8a7790" for r8a7790 (R-Car H2) compatible device
-- 
2.7.4
