Return-Path: <SRS0=7Z3r=NS=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 3/3] dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support
Date: Wed,  7 Nov 2018 12:35:58 -0500
Message-Id: <20181107173558.54481-4-chris.brandt@renesas.com>
In-Reply-To: <20181107173558.54481-1-chris.brandt@renesas.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Document RZ/A2 (R7S9210) SoC bindings.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index de7b5393c163..b545daf8ccb3 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -1,10 +1,12 @@
 * Renesas R-Car generation 3 USB 2.0 PHY
 
 This file provides information on what the device node for the R-Car generation
-3 and RZ/G2 USB 2.0 PHY contain.
+3, RZ/G2 and RZ/A2 USB 2.0 PHY contain.
 
 Required properties:
-- compatible: "renesas,usb2-phy-r8a774a1" if the device is a part of an R8A774A1
+- compatible: "renesas,usb2-phy-r7s9210" if the device is a part of an R7S9210
+	      SoC.
+	      "renesas,usb2-phy-r8a774a1" if the device is a part of an R8A774A1
 	      SoC.
 	      "renesas,usb2-phy-r8a7795" if the device is a part of an R8A7795
 	      SoC.
@@ -16,8 +18,8 @@ Required properties:
 	      R8A77990 SoC.
 	      "renesas,usb2-phy-r8a77995" if the device is a part of an
 	      R8A77995 SoC.
-	      "renesas,rcar-gen3-usb2-phy" for a generic R-Car Gen3 or RZ/G2
-	      compatible device.
+	      "renesas,rcar-gen3-usb2-phy" for a generic R-Car Gen3, RZ/G2 or
+	      RZ/A2 compatible device.
 
 	      When compatible with the generic version, nodes must list the
 	      SoC-specific version corresponding to the platform first
-- 
2.16.1
