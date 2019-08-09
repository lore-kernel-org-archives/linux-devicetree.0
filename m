From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 04/19] dt-bindings: phy-mmp3-usb: Add bindings
Date: Fri,  9 Aug 2019 11:31:43 +0200
Message-ID: <20190809093158.7969-5-lkundrak@v3.sk>
References: <20190809093158.7969-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809093158.7969-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

This is the PHY chip for USB OTG on MMP3 platform.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../devicetree/bindings/phy/phy-mmp3-usb.txt     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-mmp3-usb.tx=
t

diff --git a/Documentation/devicetree/bindings/phy/phy-mmp3-usb.txt b/Doc=
umentation/devicetree/bindings/phy/phy-mmp3-usb.txt
new file mode 100644
index 0000000000000..b9623b98151bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-mmp3-usb.txt
@@ -0,0 +1,16 @@
+Marvell MMP3 USB PHY
+--------------------
+
+Required properties:
+- compatible: must be "marvell,mmp3-usb-phy"
+- #phy-cells: must be 0
+
+Example:
+	usb-phy: usbphy@d4207000 {
+		compatible =3D "marvell,mmp3-usb-phy";
+		reg =3D <0xd4207000 0x40>;
+		#phy-cells =3D <0>;
+	};
+
+This document explains the device tree binding. For general information
+about PHY subsystem refer to Documentation/phy.txt
--=20
2.21.0
