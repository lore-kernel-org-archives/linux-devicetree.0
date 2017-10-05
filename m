From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] usb: renesas_usbhs: Add compatible string for r8a7743/5
Date: Thu,  5 Oct 2017 16:12:38 +0100
Message-ID: <1507216358-917-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

This patch adds support for r8a7743/5 SoC.  The Renesas RZ/G1[ME]
(R8A7743/5) usbhs is identical to the R-Car Gen2 family.

This doesn't change the driver, so it does nothing by itself.  But it does
mean that checkpatch won't complain about a future patch that adds
"renesas,usbhs-r8a7743" or "renesas,usbhs-r8a7745" to a DT, which helps
ensure that shipped DTs use documented compatibility strings.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
This patch is tested against Linux next tag next-20170929

 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
index 9e18e00..479215b 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -3,6 +3,8 @@ Renesas Electronics USBHS driver
 Required properties:
   - compatible: Must contain one or more of the following:
 
+	- "renesas,usbhs-r8a7743" for r8a7743 (RZ/G1M) compatible device
+	- "renesas,usbhs-r8a7745" for r8a7745 (RZ/G1E) compatible device
 	- "renesas,usbhs-r8a7790" for r8a7790 (R-Car H2) compatible device
 	- "renesas,usbhs-r8a7791" for r8a7791 (R-Car M2-W) compatible device
 	- "renesas,usbhs-r8a7792" for r8a7792 (R-Car V2H) compatible device
@@ -10,7 +12,7 @@ Required properties:
 	- "renesas,usbhs-r8a7794" for r8a7794 (R-Car E2) compatible device
 	- "renesas,usbhs-r8a7795" for r8a7795 (R-Car H3) compatible device
 	- "renesas,usbhs-r8a7796" for r8a7796 (R-Car M3-W) compatible device
-	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 compatible device
+	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 or RZ/G1 compatible device
 	- "renesas,rcar-gen3-usbhs" for R-Car Gen3 compatible device
 
 	When compatible with the generic version, nodes must list the
-- 
1.9.1
