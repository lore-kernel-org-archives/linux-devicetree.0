Return-Path: <SRS0=hZYI=QZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr30089.outbound.protection.outlook.com ([40.107.3.89]:11296
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726692AbfBRF2L (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 18 Feb 2019 00:28:11 -0500
From: Pankaj Bansal <pankaj.bansal@nxp.com>
Subject: [PATCH] dt-bindings: add register based devices' mux controller DT
 bindings
Date: Mon, 18 Feb 2019 05:28:07 +0000
Message-ID: <20190218105246.23488-1-pankaj.bansal@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Leo Li <leoyang.li@nxp.com>, Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pankaj Bansal <pankaj.bansal@nxp.com>
List-ID: <devicetree@vger.kernel.org>

This adds device tree binding documentation for generic register
based multiplexer controlled by a bitfields in a parent device's
register range.

Signed-off-by: Pankaj Bansal <pankaj.bansal@nxp.com>
---
 .../devicetree/bindings/mux/reg-mux.txt      | 84 ++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/mux/reg-mux.txt b/Documentat=
ion/devicetree/bindings/mux/reg-mux.txt
new file mode 100644
index 000000000000..c5e6faa2a7cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/mux/reg-mux.txt
@@ -0,0 +1,84 @@
+Generic register bitfield-based multiplexer controller bindings
+
+Define register bitfields to be used to control multiplexers. The parent
+device tree node must be a device node to provide register r/w access.
+
+Required properties:
+- compatible : "reg-mux"
+- #mux-control-cells : <1>
+- mux-reg-masks : an array of register offset and pre-shifted bitfield mas=
k
+                  pairs, each describing a single mux control.
+* Standard mux-controller bindings as decribed in mux-controller.txt
+
+Optional properties:
+- idle-states : if present, the state the muxes will have when idle. The
+		special state MUX_IDLE_AS_IS is the default.
+
+The multiplexer state of each multiplexer is defined as the value of the
+bitfield described by the corresponding register offset and bitfield mask =
pair
+in the mux-reg-masks array, accessed through the parent syscon.
+
+Example:
+
+&i2c0 {
+	status =3D "okay";
+
+	fpga@66 { // fpga connected to i2c
+		compatible =3D "fsl,lx2160aqds-fpga", "fsl,fpga-qixis-i2c",
+			     "simple-mfd";
+		reg =3D <0x66>;
+
+		mux: mux-controller { // Mux Producer
+			compatible =3D "reg-mux";
+			#mux-control-cells =3D <1>;
+			mux-reg-masks =3D <0x54 0xf8>, /* 0: reg 0x54, bits 7:3 */
+					<0x54 0x07>; /* 1: reg 0x54, bit 2:0 */
+		};
+	};
+};
+
+	mdio-mux-1 { // Mux consumer
+		compatible =3D "mdio-mux";
+		mux-controls =3D <&mux 0>;
+		mdio-parent-bus =3D <&emdio1>;
+		#address-cells=3D<1>;
+		#size-cells =3D <0>;
+
+		mdio@0 {
+			reg =3D <0x00>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
+
+		mdio@40 {
+			reg =3D <0x40>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
+
+		..
+		..
+	};
+
+	mdio-mux-2 { // Mux consumer
+		compatible =3D "mdio-mux";
+		mux-controls =3D <&mux 1>;
+		mdio-parent-bus =3D <&emdio2>;
+		#address-cells=3D<1>;
+		#size-cells =3D <0>;
+
+		mdio@0 {
+			reg =3D <0x00>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
+
+		mdio@1 {
+			reg =3D <0x01>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
+
+		..
+		..
+	};
--=20
2.17.1
