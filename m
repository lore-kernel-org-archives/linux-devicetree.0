From: Pankaj Bansal <pankaj.bansal@nxp.com>
Subject: [PATCH] dt-bindings: Add bindings for mdio mux consumers
Date: Thu, 21 Feb 2019 12:59:19 +0000
Message-ID: <20190221182349.4057-1-pankaj.bansal@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Leo Li <leoyang.li@nxp.com>, Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Pankaj Bansal <pankaj.bansal@nxp.com>
List-Id: devicetree@vger.kernel.org

When we use the bindings defined in Documentation/devicetree/bindings/mux
to define mdio mux in producer and consumer terms, it results in two
devices. one is mux producer and other is mux consumer.

Add the bindings needed for Mdio mux consumer devices.

Signed-off-by: Pankaj Bansal <pankaj.bansal@nxp.com>
---
 .../devicetree/bindings/net/mdio-mux.txt     | 73 ++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mdio-mux.txt b/Documenta=
tion/devicetree/bindings/net/mdio-mux.txt
index f58571f36570..bd198d1c6f10 100644
--- a/Documentation/devicetree/bindings/net/mdio-mux.txt
+++ b/Documentation/devicetree/bindings/net/mdio-mux.txt
@@ -18,8 +18,16 @@ Required properties for child nodes:
 - #size-cells =3D <0>;
 - reg : The sub-bus number.
=20
+Required properties when Mdio mux node is consumer of a separate mux produ=
cer
+node.
+- compatible : should be "mmio-mux"
+- mux-controls : mux controller node to use for operating the mux
+- mdio-parent-bus : phandle to the parent MDIO bus.
+for more information please refer Documentation/devicetree/bindings/mux/
+
=20
 Example :
+The mux Producer and consumer nodes are same.
=20
 	/* The parent MDIO bus. */
 	smi1: mdio@1180000001900 {
@@ -127,3 +135,68 @@ Example :
 			};
 		};
 	};
+
+Example 2:
+In below example the Mux producer and consumer are separate nodes.
+
+&i2c0 {
+        fpga@66 { // fpga connected to i2c
+                compatible =3D "fsl,lx2160aqds-fpga", "fsl,fpga-qixis-i2c"=
,
+                             "simple-mfd";
+                reg =3D <0x66>;
+
+                mux: mux-controller { // Mux Producer
+                        compatible =3D "reg-mux";
+                        #mux-control-cells =3D <1>;
+                        mux-reg-masks =3D <0x54 0xf8>, /* 0: reg 0x54, bit=
s 7:3 */
+                                        <0x54 0x07>; /* 1: reg 0x54, bits =
2:0 */
+                };
+        };
+};
+
+mdio-mux-1 { // Mux consumer
+        compatible =3D "mdio-mux";
+        mux-controls =3D <&mux 0>;
+        mdio-parent-bus =3D <&emdio1>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        mdio@0 {
+                reg =3D <0x0>;
+                #address-cells =3D <1>;
+                #size-cells =3D <0>;
+        };
+
+        mdio@40 {
+                reg =3D <0x40>;
+                #address-cells =3D <1>;
+                #size-cells =3D <0>;
+        };
+
+        ..
+        ..
+};
+
+mdio-mux-2 { // Mux consumer
+        compatible =3D "mdio-mux";
+        mux-controls =3D <&mux 1>;
+        mdio-parent-bus =3D <&emdio2>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        mdio@0 {
+                reg =3D <0x0>;
+                #address-cells =3D <1>;
+                #size-cells =3D <0>;
+        };
+
+        mdio@1 {
+                reg =3D <0x1>;
+                #address-cells =3D <1>;
+                #size-cells =3D <0>;
+        };
+
+        ..
+        ..
+};
+
--=20
2.17.1
