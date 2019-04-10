Return-Path: <SRS0=uE6T=SM=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH V4 03/13] dt-bindings: rcar-gen3-phy-usb2: Add r8a77470 support
Date: Wed, 10 Apr 2019 09:08:25 +0100
Message-Id: <1554883715-41725-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554883715-41725-1-git-send-email-biju.das@bp.renesas.com>
References: <1554883715-41725-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document RZ/G1C (R8A77470) SoC bindings.

For RZ/G1C, this driver is used to enable interrupt generation and
initializing timing registers which is part of phy_init code.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
V3-->V4
  * No Change
V2-->V3
  * New patch
    https://patchwork.kernel.org/patch/10879899/
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index ad9c290..23894db 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -1,10 +1,12 @@
 * Renesas R-Car generation 3 USB 2.0 PHY
 
 This file provides information on what the device node for the R-Car generation
-3 and RZ/G2 USB 2.0 PHY contain.
+3, RZ/G1C and RZ/G2 USB 2.0 PHY contain.
 
 Required properties:
-- compatible: "renesas,usb2-phy-r8a774a1" if the device is a part of an R8A774A1
+- compatible: "renesas,usb2-phy-r8a77470" if the device is a part of an R8A77470
+	      SoC.
+	      "renesas,usb2-phy-r8a774a1" if the device is a part of an R8A774A1
 	      SoC.
 	      "renesas,usb2-phy-r8a774c0" if the device is a part of an R8A774C0
 	      SoC.
-- 
2.7.4
