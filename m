Return-Path: <SRS0=Hucj=TO=renesas.com=prvs=40371367b7=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use of usb_x1
Date: Tue, 14 May 2019 09:55:54 -0500
Message-ID: <20190514145605.19112-5-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-1-chris.brandt@renesas.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris
List-ID: <devicetree@vger.kernel.org>

Document the USB_X1 input and add clock-names to identify
functional and USB_X1 clocks.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v3:
 * added clock names
v2:
 * removed 'use_usb_x1' option
 * document that 'usb_x1' clock node will be detected to determine if
   48MHz clock exists
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index d46188f450bf..ca8a831d4273 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -28,7 +28,11 @@ Required properties:
 	      followed by the generic version.
 
 - reg: offset and length of the partial USB 2.0 Host register block.
-- clocks: clock phandle and specifier pair(s).
+- clocks: clock phandle and specifier pair(s). For SoCs that have a separate
+          dedicated USB_X1 input for the PLL, that is also listed.
+- clock-names: Name of the clocks. The functional clock shall be called "fclk"
+	       and USB_X1 shall be called "usb_x1". If only one clock is listed,
+	       this property is not required.
 - #phy-cells: see phy-bindings.txt in the same directory, must be <1> (and
 	      using <0> is deprecated).
 
-- 
2.16.1
