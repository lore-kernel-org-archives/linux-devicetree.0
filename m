From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 1/3] dt-bindings: usb: Add usb-phy property to the jz4740-musb node
Date: Thu,  4 Apr 2019 11:47:37 +0200
Message-ID: <20190404094739.23503-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bin Liu <b-liu@ti.com>
Cc: od@zcrc.me, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Add a required 'usb-phy' property, to obtain a phandle to the USB PHY
from devicetree.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: Change "usb-phy" DT property to "phys"

 Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt b/Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt
index 620355cee63f..16808721f3ff 100644
--- a/Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt
+++ b/Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt
@@ -8,9 +8,15 @@ Required properties:
 - interrupt-names: must be "mc"
 - clocks: phandle to the "udc" clock
 - clock-names: must be "udc"
+- phys: phandle to the USB PHY
 
 Example:
 
+usb_phy: usb-phy@0 {
+	compatible = "usb-nop-xceiv";
+	#phy-cells = <0>;
+};
+
 udc: usb@13040000 {
 	compatible = "ingenic,jz4740-musb";
 	reg = <0x13040000 0x10000>;
@@ -21,4 +27,6 @@ udc: usb@13040000 {
 
 	clocks = <&cgu JZ4740_CLK_UDC>;
 	clock-names = "udc";
+
+	phys = <&usb_phy>;
 };
-- 
2.11.0
