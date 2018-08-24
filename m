From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 2/6] dt-bindings: rcar-gen3-phy-usb3: Add r8a774a1 support
Date: Fri, 24 Aug 2018 08:56:11 +0100
Message-ID: <1535097375-5561-3-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1535097375-5561-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535097375-5561-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I <kishon@ti.com>, Biju Das <biju.das@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document RZ/G2M (R8A774A1) SoC bindings.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
index 47dd296..9d98266 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
@@ -1,20 +1,22 @@
 * Renesas R-Car generation 3 USB 3.0 PHY
 
 This file provides information on what the device node for the R-Car generation
-3 USB 3.0 PHY contains.
+3 and RZ/G2 USB 3.0 PHY contain.
 If you want to enable spread spectrum clock (ssc), you should use USB_EXTAL
 instead of USB3_CLK. However, if you don't want to these features, you don't
 need this driver.
 
 Required properties:
-- compatible: "renesas,r8a7795-usb3-phy" if the device is a part of an R8A7795
+- compatible: "renesas,r8a774a1-usb3-phy" if the device is a part of an R8A774A1
+	      SoC.
+	      "renesas,r8a7795-usb3-phy" if the device is a part of an R8A7795
 	      SoC.
 	      "renesas,r8a7796-usb3-phy" if the device is a part of an R8A7796
 	      SoC.
 	      "renesas,r8a77965-usb3-phy" if the device is a part of an
 	      R8A77965 SoC.
-	      "renesas,rcar-gen3-usb3-phy" for a generic R-Car Gen3 compatible
-	      device.
+	      "renesas,rcar-gen3-usb3-phy" for a generic R-Car Gen3 or RZ/G2
+	      compatible device.
 
 	      When compatible with the generic version, nodes must list the
 	      SoC-specific version corresponding to the platform first
-- 
2.7.4
