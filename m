Return-Path: <SRS0=ZPg/=RD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr130071.outbound.protection.outlook.com ([40.107.13.71]:38478
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727960AbfB1OHs (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 28 Feb 2019 09:07:48 -0500
From: Pankaj Bansal <pankaj.bansal@nxp.com>
Subject: [PATCH v6 1/2] dt-bindings: add register based devices' mux
 controller DT bindings
Date: Thu, 28 Feb 2019 14:07:38 +0000
Message-ID: <20190228193206.30594-1-pankaj.bansal@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Leo Li <leoyang.li@nxp.com>, Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Pankaj Bansal <pankaj.bansal@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

This adds device tree binding documentation for generic register based
multiplexer controlled by a bitfields in a parent device's register range.

since MMIO mux is a special case of generic register based mux, the
MMIO mux bindings have been subsumed in these bindings.

Signed-off-by: Pankaj Bansal <pankaj.bansal@nxp.com>
---

Notes:
    V6:
    - As per Peter's comments removed "Mux producer" and "Mux consumer" fro=
m
      example.
    - Replaced Mux producer with Mux controller in all other places.
    - Added address cells/ size cells in video-mux node
    V5:
    - Subsume the mmio-mux.txt bindings in reg-mux.txt
    V4:
    - No change
    V3:
    - Added the patch in series with the driver patch
    - Fixed the node value out of bitfield error
    - removed the "parent register r/w functions" line
    V2:
    - Removed syscon reference from txt file
    - Removed loading zeroes from hex numbers
    - Fixed the depth of dts nodes
    - fixed minor formatting errors

 .../devicetree/bindings/mux/mmio-mux.txt     |  60 --------
 .../devicetree/bindings/mux/reg-mux.txt      | 130 +++++++++++++++++
 2 files changed, 130 insertions(+), 60 deletions(-)

diff --git a/Documentation/devicetree/bindings/mux/mmio-mux.txt b/Documenta=
tion/devicetree/bindings/mux/mmio-mux.txt
deleted file mode 100644
index a9bfb4d8b6ac..000000000000
--- a/Documentation/devicetree/bindings/mux/mmio-mux.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-MMIO register bitfield-based multiplexer controller bindings
-
-Define register bitfields to be used to control multiplexers. The parent
-device tree node must be a syscon node to provide register access.
-
-Required properties:
-- compatible : "mmio-mux"
-- #mux-control-cells : <1>
-- mux-reg-masks : an array of register offset and pre-shifted bitfield mas=
k
-                  pairs, each describing a single mux control.
-* Standard mux-controller bindings as decribed in mux-controller.txt
-
-Optional properties:
-- idle-states : if present, the state the muxes will have when idle. The
-		special state MUX_IDLE_AS_IS is the default.
-
-The multiplexer state of each multiplexer is defined as the value of the
-bitfield described by the corresponding register offset and bitfield mask =
pair
-in the mux-reg-masks array, accessed through the parent syscon.
-
-Example:
-
-	syscon {
-		compatible =3D "syscon";
-
-		mux: mux-controller {
-			compatible =3D "mmio-mux";
-			#mux-control-cells =3D <1>;
-
-			mux-reg-masks =3D <0x3 0x30>, /* 0: reg 0x3, bits 5:4 */
-					<0x3 0x40>, /* 1: reg 0x3, bit 6 */
-			idle-states =3D <MUX_IDLE_AS_IS>, <0>;
-		};
-	};
-
-	video-mux {
-		compatible =3D "video-mux";
-		mux-controls =3D <&mux 0>;
-
-		ports {
-			/* inputs 0..3 */
-			port@0 {
-				reg =3D <0>;
-			};
-			port@1 {
-				reg =3D <1>;
-			};
-			port@2 {
-				reg =3D <2>;
-			};
-			port@3 {
-				reg =3D <3>;
-			};
-
-			/* output */
-			port@4 {
-				reg =3D <4>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mux/reg-mux.txt b/Documentat=
ion/devicetree/bindings/mux/reg-mux.txt
new file mode 100644
index 000000000000..5a118157093e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mux/reg-mux.txt
@@ -0,0 +1,130 @@
+Generic register bitfield-based multiplexer controller bindings
+
+Define register bitfields to be used to control multiplexers. The parent
+device tree node must be a device node to provide register r/w access.
+
+Required properties:
+- compatible : should be one of
+	"reg-mux" : if parent device of mux controller is not syscon device
+	"mmio-mux" : if parent device of mux controller is syscon device
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
+bitfield described by the corresponding register offset and bitfield mask
+pair in the mux-reg-masks array.
+
+Example 1:
+The parent device of mux controller is not a syscon device.
+
+&i2c0 {
+	fpga@66 { // fpga connected to i2c
+		compatible =3D "fsl,lx2160aqds-fpga", "fsl,fpga-qixis-i2c",
+			     "simple-mfd";
+		reg =3D <0x66>;
+
+		mux: mux-controller {
+			compatible =3D "reg-mux";
+			#mux-control-cells =3D <1>;
+			mux-reg-masks =3D <0x54 0xf8>, /* 0: reg 0x54, bits 7:3 */
+					<0x54 0x07>; /* 1: reg 0x54, bits 2:0 */
+		};
+	};
+};
+
+mdio-mux-1 {
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
+mdio-mux-2 {
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
+Example 2:
+The parent device of mux controller is syscon device.
+
+syscon {
+	compatible =3D "syscon";
+
+	mux: mux-controller {
+		compatible =3D "mmio-mux";
+		#mux-control-cells =3D <1>;
+
+		mux-reg-masks =3D <0x3 0x30>, /* 0: reg 0x3, bits 5:4 */
+				<0x3 0x40>, /* 1: reg 0x3, bit 6 */
+		idle-states =3D <MUX_IDLE_AS_IS>, <0>;
+	};
+};
+
+video-mux {
+	compatible =3D "video-mux";
+	mux-controls =3D <&mux 0>;
+	#address-cells =3D <1>;
+	#size-cells =3D <0>;
+
+	ports {
+		/* inputs 0..3 */
+		port@0 {
+			reg =3D <0>;
+		};
+		port@1 {
+			reg =3D <1>;
+		};
+		port@2 {
+			reg =3D <2>;
+		};
+		port@3 {
+			reg =3D <3>;
+		};
+
+		/* output */
+		port@4 {
+			reg =3D <4>;
+		};
+	};
+};
+
--=20
2.17.1
