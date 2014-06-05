From: =?UTF-8?q?Antoine=20T=C3=A9nart?=
	<antoine.tenart@free-electrons.com>
Subject: [PATCH 7/9] Documentation: bindings: add doc for the Berlin ChipIdea USB driver
Date: Thu,  5 Jun 2014 17:48:44 +0200
Message-ID: <1401983326-19205-8-git-send-email-antoine.tenart@free-electrons.com>
References: <1401983326-19205-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1401983326-19205-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, Peter.Chen@freescale.com
Cc: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, alexandre.belloni@free-electrons.com, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document the Marvell Berlin USB driver bindings.

Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
---
 .../devicetree/bindings/usb/ci-hdrc-berlin.txt         | 18 ++++++++++=
++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-berli=
n.txt

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-berlin.txt b=
/Documentation/devicetree/bindings/usb/ci-hdrc-berlin.txt
new file mode 100644
index 000000000000..a3fc9054b830
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-berlin.txt
@@ -0,0 +1,18 @@
+* Marvell Berlin usb controllers
+
+Required properties:
+- compatible: should be "marvell,berlin-usb"
+- reg: base address and length of the registers
+- interrupts: interrupt for the USB controller
+- clocks: reference to the USB clock
+- marvell,usbphy: reference to the USB PHY
+
+Example:
+
+	usb@f7ed0000 {
+		compatible =3D "marvell,berlin-usb";
+		reg =3D <0xf7ed0000 0x10000>;
+		interrupts =3D <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+		clocks =3D <&chip CLKID_USB0>;
+		marvell,usbphy =3D <&usb_phy0>;
+	};
--=20
1.9.1
