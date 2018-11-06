From: Florinel Iordache <florinel.iordache@nxp.com>
Subject: [bindings][PATCH] bindings/net: DPAA Backplane Device Bindings
Date: Tue, 6 Nov 2018 11:48:30 +0000
Message-ID: <1541504900-30091-1-git-send-email-florinel.iordache@nxp.com>
Reply-To: Florinel Iordache <florinel.iordache@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "broonie@kernel.org" <broonie@kernel.org>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Florinel Iordache <florinel.iordache@nxp.com>
List-Id: devicetree@vger.kernel.org

Device Tree Bindings for DPAA backplane available on Layerscape
 communications processors.

Signed-off-by: Florinel Iordache <florinel.iordache@nxp.com>
---
 .../devicetree/bindings/net/dpaa-backplane.txt     | 105 +++++++++++++++++=
++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dpaa-backplane.tx=
t

diff --git a/Documentation/devicetree/bindings/net/dpaa-backplane.txt b/Doc=
umentation/devicetree/bindings/net/dpaa-backplane.txt
new file mode 100644
index 0000000..f147c84
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dpaa-backplane.txt
@@ -0,0 +1,105 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+DPAA Backplane Device Bindings
+
+CONTENTS
+  - SerDes Node
+  - PCS Phy Node
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+SerDes Node
+
+DESCRIPTION
+
+SerDes (Serializer/Deserializer) HW peripheral
+
+PROPERTIES
+
+- compatible
+		Usage: required
+		Value type: <stringlist>
+		Definition: Specifies the type of SerDes.
+		Must include the prefix "fsl,serdes"
+		SerDes can be of different types:
+		- 10G SerDes must be specified as: "fsl,serdes-10g"
+		- 28G SerDes must be specified as: "fsl,serdes-28g"
+
+- reg
+		Usage: required
+		Value type: <prop-encoded-array>
+		Definition: Specifies the offset of the SerDes configuration registers
+
+- little-endian
+		Usage: optional
+		Value type: <Boolean>
+		Definition: Specifies endianness access to SerDes registers.
+		If omitted, big-endian will be used
+		See common-properties.txt for complete definition
+
+EXAMPLE
+
+Example of 10G SerDes node:
+
+serdes1: serdes@1ea0000 {
+		compatible =3D "fsl,serdes-10g";
+		reg =3D <0x0 0x1ea0000 0 0x00002000>;
+		little-endian;
+};
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+PCS Phy Node
+
+DESCRIPTION
+
+PCS Phy (Physical Coding Sublayer / Physical layer) node
+
+PROPERTIES
+
+- compatible
+		Usage: required
+		Value type: <stringlist>
+		Definition: A standard property. Specifies the IEEE 802.3 Clause
+		Different IEEE 802.3 Clauses can be specified:
+		- Clause 22 must be specified as: "ethernet-phy-ieee802.3-c22"
+		- Clause 45 must be specified as: "ethernet-phy-ieee802.3-c45"
+		For complete definition see:
+		Documentation/devicetree/bindings/net/phy.txt
+
+- reg
+		Usage: required
+		Value type: <prop-encoded-array>
+		Definition: A standard property.
+		Specifies the offset of the PCS Phy configuration registers
+		For complete definition see:
+		Documentation/devicetree/bindings/net/phy.txt
+
+- backplane-mode
+		Usage: required
+		Value type: <stringlist>
+		Definition: Specifies the speed and type of the protocol used
+		Different speeds and backplane protocol types can be used:
+		- 10GBase-KR must be specified as: "10gbase-kr"
+		- 40GBase-KR must be specified as: "40gbase-kr"
+
+- fsl,lane-handle
+		Usage: required
+		Value type: <phandle>
+		Definition: Specifies the reference to a node representing the SerDes
+		device
+
+- fsl,lane-reg
+		Usage: required
+		Value type: <prop-encoded-array>
+		Definition: Specifies the offsets of the SerDes lanes configuration
+		registers
+
+EXAMPLE
+
+Example of pcs phy node for 10GBase-KR:
+
+pcs_phy1: ethernet-phy@0 {
+	compatible =3D "ethernet-phy-ieee802.3-c45";
+	backplane-mode =3D "10gbase-kr";
+	reg =3D <0x0>;
+	fsl,lane-handle =3D <&serdes1>;
+	fsl,lane-reg =3D <0xE00>; /* lane G */
+};
--=20
1.9.1
