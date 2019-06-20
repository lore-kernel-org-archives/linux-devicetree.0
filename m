From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2] dt-bindings: phy-pxa-usb: add bindings
Date: Thu, 20 Jun 2019 13:46:36 +0200
Message-ID: <20190620114636.1387509-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Pavel Machek <pavel@ucw.cz>
List-Id: devicetree@vger.kernel.org

This is the PHY chip for USB OTG on PXA platforms.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Acked-by: Pavel Machek <pavel@ucw.cz>

---
This remained unapplied, despite the driver being in already.

Changes since v1:
- Cosmetic and wording fixes

 .../devicetree/bindings/phy/phy-pxa-usb.txt    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-pxa-usb.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-pxa-usb.txt b/Docu=
mentation/devicetree/bindings/phy/phy-pxa-usb.txt
new file mode 100644
index 000000000000..93fc09c12954
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-pxa-usb.txt
@@ -0,0 +1,18 @@
+Marvell PXA USB PHY
+-------------------
+
+Required properties:
+- compatible: one of: "marvell,mmp2-usb-phy", "marvell,pxa910-usb-phy",
+	"marvell,pxa168-usb-phy",
+- #phy-cells: must be 0
+
+Example:
+	usb-phy: usbphy@d4207000 {
+		compatible =3D "marvell,mmp2-usb-phy";
+		reg =3D <0xd4207000 0x40>;
+		#phy-cells =3D <0>;
+		status =3D "okay";
+	};
+
+This document explains the device tree binding. For general
+information about PHY subsystem refer to Documentation/phy.txt
--=20
2.21.0
