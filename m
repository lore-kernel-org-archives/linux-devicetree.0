Return-Path: <SRS0=YKRD=MJ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] dt-bindings: phy: rcar-gen2: Add r8a7744 support
Date: Thu, 27 Sep 2018 13:23:34 +0100
Message-Id: <1538051014-5853-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Kishon Vijay Abraham I <kishon@ti.com>, Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add USB PHY support for r8a7744 SoC. Renesas RZ/G1N (R8A7744)
USB PHY is identical to the R-Car Gen2 family.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
This patch is tested against linux-next next-20180927
---
 Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
index eeb9e18..4f0879a 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
@@ -5,6 +5,7 @@ This file provides information on what the device node for the R-Car generation
 
 Required properties:
 - compatible: "renesas,usb-phy-r8a7743" if the device is a part of R8A7743 SoC.
+	      "renesas,usb-phy-r8a7744" if the device is a part of R8A7744 SoC.
 	      "renesas,usb-phy-r8a7745" if the device is a part of R8A7745 SoC.
 	      "renesas,usb-phy-r8a7790" if the device is a part of R8A7790 SoC.
 	      "renesas,usb-phy-r8a7791" if the device is a part of R8A7791 SoC.
-- 
2.7.4
