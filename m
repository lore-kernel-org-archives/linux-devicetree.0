Return-Path: <SRS0=d+eE=TJ=renesas.com=prvs=4032988503=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 07/15] dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support
Date: Thu, 9 May 2019 15:11:34 -0500
Message-ID: <20190509201142.10543-8-chris.brandt@renesas.com>
In-Reply-To: <20190509201142.10543-1-chris.brandt@renesas.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris
List-ID: <devicetree@vger.kernel.org>

Document RZ/A2 (R7S9210) SoC bindings.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index d2bbfe577345..d6b48704e3f2 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -1,10 +1,12 @@
 * Renesas R-Car generation 3 USB 2.0 PHY
 
 This file provides information on what the device node for the R-Car generation
-3, RZ/G1C and RZ/G2 USB 2.0 PHY contain.
+3, RZ/G1C, RZ/G2 and RZ/A2 USB 2.0 PHY contain.
 
 Required properties:
-- compatible: "renesas,usb2-phy-r8a77470" if the device is a part of an R8A77470
+- compatible: "renesas,usb2-phy-r7s9210" if the device is a part of an R7S9210
+	      SoC.
+	      "renesas,usb2-phy-r8a77470" if the device is a part of an R8A77470
 	      SoC.
 	      "renesas,usb2-phy-r8a774a1" if the device is a part of an R8A774A1
 	      SoC.
@@ -20,8 +22,8 @@ Required properties:
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
