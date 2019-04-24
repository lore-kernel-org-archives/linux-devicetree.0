Return-Path: <SRS0=HVR0=S2=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH V5 4/9] dt-bindings: usb: renesas_usb3: Add renesas,usb-role-switch property
Date: Wed, 24 Apr 2019 10:22:18 +0100
Message-Id: <1556097743-12717-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1556097743-12717-1-git-send-email-biju.das@bp.renesas.com>
References: <1556097743-12717-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add an optional property renesas,usb-role-switch to support
dual role switch for USB Type-C DRP port controller devices
using USB role switch class framework.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 V4-->V5
  * No Change
 V3-->V4
  * No Change
 V2-->V3
  * Added optional renesas,usb-role-switch property.
 V1-->V2
  * Added usb-role-switch-property
  * Updated the example with usb-role-switch property.
---
 .../devicetree/bindings/usb/renesas_usb3.txt       | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
index 35039e7..f1cb06a 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
@@ -22,6 +22,7 @@ Required properties:
 Optional properties:
   - phys: phandle + phy specifier pair
   - phy-names: must be "usb"
+  - renesas,usb-role-switch: use USB role switch to handle role switch events
 
 Example of R-Car H3 ES1.x:
 	usb3_peri0: usb@ee020000 {
@@ -39,3 +40,24 @@ Example of R-Car H3 ES1.x:
 		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cpg CPG_MOD 327>;
 	};
+
+Example of RZ/G2E:
+	usb3_peri0: usb@ee020000 {
+		compatible = "renesas,r8a774c0-usb3-peri",
+			     "renesas,rcar-gen3-usb3-peri";
+		reg = <0 0xee020000 0 0x400>;
+		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD 328>;
+		companion = <&xhci0>;
+		renesas,usb-role-switch;
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb3peri_role_switch: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&hd3ss3220_ep>;
+			};
+		};
+	};
-- 
2.7.4
