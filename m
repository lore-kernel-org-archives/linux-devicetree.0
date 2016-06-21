From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH] ARM: BCM5301X: Set GPIO enabling USB power on Netgear R7000
Date: Tue, 21 Jun 2016 13:42:38 +0200
Message-ID: <1466509358-25498-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@armlinux.org.uk>, "open list:BROADCOM BCM5301X ARM
	ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:BROADCOM BCM5301X ARM
	ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

There is one GPIO controlling power for both USB ports.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
---
 arch/arm/boot/dts/bcm4709-netgear-r7000.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/bcm4709-netgear-r7000.dts b/arch/arm/boo=
t/dts/bcm4709-netgear-r7000.dts
index a22ed14..a76486b 100644
--- a/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
@@ -104,3 +104,11 @@
 &uart0 {
 	status =3D "okay";
 };
+
+&usb2 {
+	vcc-gpio =3D <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+};
+
+&usb3 {
+	vcc-gpio =3D <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+};
--=20
1.8.4.5
