Return-Path: <SRS0=WgTi=TG=renesas.com=prvs=40290ccc1f=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 04/10] dt-bindings: rcar-gen3-phy-usb2: Document dr_mode
Date: Mon, 6 May 2019 18:46:25 -0500
Message-ID: <20190506234631.113226-5-chris.brandt@renesas.com>
In-Reply-To: <20190506234631.113226-1-chris.brandt@renesas.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Document the optional dr_mode property

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index 26bf377102d3..646a1748d3c4 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -48,6 +48,9 @@ channel as USB OTG:
 		       otg pins.
 - renesas,use_usb_x1: boolean, the dedicated 48MHz crystal inputs USB_X1 are
                       used for the PLL source
+- dr_mode: string, indicates the working mode for the PHY. Can be "host",
+           "peripheral", or "otg". Defaults to "host" if not defined.
+
 
 Example (R-Car H3):
 
-- 
2.16.1
