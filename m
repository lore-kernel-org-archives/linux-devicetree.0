Return-Path: <SRS0=qLWK=TP=renesas.com=prvs=4038260dfd=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v4 02/13] dt-bindings: rcar-gen3-phy-usb2: Document use of usb_x1
Date: Wed, 15 May 2019 10:20:37 -0500
Message-ID: <20190515152048.42363-3-chris.brandt@renesas.com>
In-Reply-To: <20190515152048.42363-1-chris.brandt@renesas.com>
References: <20190515152048.42363-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris
List-ID: <devicetree@vger.kernel.org>

Document the USB_X1 input and add clock-names to identify
functional and USB_X1 clocks.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v4:
 * 'Name' to 'Names'
 * "fclk" to "fck"
 * added reviewed-by
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
index d46188f450bf..f05d2c39a556 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -28,7 +28,11 @@ Required properties:
 	      followed by the generic version.
 
 - reg: offset and length of the partial USB 2.0 Host register block.
-- clocks: clock phandle and specifier pair(s).
+- clocks: clock phandle and specifier pair(s). For SoCs that have a separate
+          dedicated USB_X1 input for the PLL, that is also listed.
+- clock-names: Names of the clocks. The functional clock shall be called "fck"
+	       and USB_X1 shall be called "usb_x1". If only one clock is listed,
+	       this property is not required.
 - #phy-cells: see phy-bindings.txt in the same directory, must be <1> (and
 	      using <0> is deprecated).
 
-- 
2.16.1
