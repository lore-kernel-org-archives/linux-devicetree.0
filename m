From: Pankaj Bansal <pankaj.bansal@nxp.com>
Subject: [PATCH v3 1/2] dt-bindings: net:  Add bindings for mdio mux consumers
Date: Mon, 25 Feb 2019 06:16:53 +0000
Message-ID: <20190225114121.7878-1-pankaj.bansal@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Leo Li <leoyang.li@nxp.com>, Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Pankaj Bansal <pankaj.bansal@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

When we use the bindings defined in Documentation/devicetree/bindings/mux
to define mdio mux in producer and consumer terms, it results in two
devices. one is mux producer and other is mux consumer.

Add the bindings needed for Mdio mux consumer devices.

Signed-off-by: Pankaj Bansal <pankaj.bansal@nxp.com>
---

Notes:
    V3:
    - No Change
    V2:
    - moved the bindings from mdio-mux.txt to new file mdio-mux-multiplexer=
.txt
    - changed compatible to mdio-mux-multiplexer

 .../bindings/net/mdio-mux-multiplexer.txt    | 83 ++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mdio-mux-multiplexer.txt=
 b/Documentation/devicetree/bindings/net/mdio-mux-multiplexer.txt
new file mode 100644
index 000000000000..9d5384849929
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/mdio-mux-multiplexer.txt
@@ -0,0 +1,83 @@
+Properties for an MDIO bus multiplexer consumer device
+
+This is a special case of MDIO mux  when MDIO mux is defined as a consumer
+of a mux producer device. The mux producer can be of any type like mmio mu=
x
+producer, gpio mux producer or generic register based mux producer.
+
+Required properties in addition to the MDIO Bus multiplexer properties:
+
+- compatible : should be "mmio-mux-multiplexer"
+- mux-controls : mux controller node to use for operating the mux
+- mdio-parent-bus : phandle to the parent MDIO bus.
+
+each child node of mdio bus multiplexer consumer device represent a mdio
+bus.
+
+for more information please refer
+Documentation/devicetree/bindings/mux/mux-controller.txt
+and Documentation/devicetree/bindings/net/mdio-mux.txt
+
+Example:
+In below example the Mux producer and consumer are separate nodes.
+
+&i2c0 {
+	fpga@66 { // fpga connected to i2c
+		compatible =3D "fsl,lx2160aqds-fpga", "fsl,fpga-qixis-i2c",
+			     "simple-mfd";
+		reg =3D <0x66>;
+
+		mux: mux-controller { // Mux Producer
+			compatible =3D "reg-mux";
+			#mux-control-cells =3D <1>;
+			mux-reg-masks =3D <0x54 0xf8>, /* 0: reg 0x54, bits 7:3 */
+					<0x54 0x07>; /* 1: reg 0x54, bits 2:0 */
+		};
+	};
+};
+
+mdio-mux-1 { // Mux consumer
+	compatible =3D "mdio-mux-multiplexer";
+	mux-controls =3D <&mux 0>;
+	mdio-parent-bus =3D <&emdio1>;
+	#address-cells =3D <1>;
+	#size-cells =3D <0>;
+
+	mdio@0 {
+		reg =3D <0x0>;
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+	};
+
+	mdio@8 {
+		reg =3D <0x8>;
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+	};
+
+	..
+	..
+};
+
+mdio-mux-2 { // Mux consumer
+	compatible =3D "mdio-mux-multiplexer";
+	mux-controls =3D <&mux 1>;
+	mdio-parent-bus =3D <&emdio2>;
+	#address-cells =3D <1>;
+	#size-cells =3D <0>;
+
+	mdio@0 {
+		reg =3D <0x0>;
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+	};
+
+	mdio@1 {
+		reg =3D <0x1>;
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+	};
+
+	..
+	..
+};
+
--=20
2.17.1
