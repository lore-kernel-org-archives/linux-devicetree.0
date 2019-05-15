Return-Path: <SRS0=qLWK=TP=renesas.com=prvs=4038260dfd=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v4 05/13] dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support
Date: Wed, 15 May 2019 10:20:40 -0500
Message-ID: <20190515152048.42363-6-chris.brandt@renesas.com>
In-Reply-To: <20190515152048.42363-1-chris.brandt@renesas.com>
References: <20190515152048.42363-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris
List-ID: <devicetree@vger.kernel.org>

Document RZ/A2 (R7S9210) SoC bindings.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v2:
 * added reviewed-by
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index fa58663b7641..7f7a2ed2c9b1 100644
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
