Return-Path: <SRS0=d+eE=TJ=renesas.com=prvs=4032988503=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use of usb_x1
Date: Thu, 9 May 2019 15:11:31 -0500
Message-ID: <20190509201142.10543-5-chris.brandt@renesas.com>
In-Reply-To: <20190509201142.10543-1-chris.brandt@renesas.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris
List-ID: <devicetree@vger.kernel.org>

Document the optional renesas,uses_usb_x1 property.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
 * removed 'use_usb_x1' option
 * document that 'usb_x1' clock node will be detected to determine if
   48MHz clock exists
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index d46188f450bf..79d8360d92e5 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -28,7 +28,9 @@ Required properties:
 	      followed by the generic version.
 
 - reg: offset and length of the partial USB 2.0 Host register block.
-- clocks: clock phandle and specifier pair(s).
+- clocks: clock phandle and specifier pair(s). For SoCs that have a separate
+          dedicated 48MHz USB_X1 input, if a 'usb_x1' clock node exists and is
+          set to non-zero, the PHY will use the 48MHZ input for the PLL.
 - #phy-cells: see phy-bindings.txt in the same directory, must be <1> (and
 	      using <0> is deprecated).
 
-- 
2.16.1
