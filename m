From: =?UTF-8?q?Antoine=20T=C3=A9nart?=
	<antoine.tenart@free-electrons.com>
Subject: [PATCH 9/9] ARM: dts: Berlin: enable USB on the BG2Q DMP
Date: Thu,  5 Jun 2014 17:48:46 +0200
Message-ID: <1401983326-19205-10-git-send-email-antoine.tenart@free-electrons.com>
References: <1401983326-19205-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1401983326-19205-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, Peter.Chen@freescale.com, balbi@ti.com
Cc: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, alexandre.belloni@free-electrons.com, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enable the 2 available USB PHY and USB nodes on the Marvell Berlin BG2Q
DMP.

Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
---
 arch/arm/boot/dts/berlin2q-marvell-dmp.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts b/arch/arm/boot=
/dts/berlin2q-marvell-dmp.dts
index 2da9c41e29d8..4195874b9bed 100644
--- a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
+++ b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
@@ -7,6 +7,8 @@
  */
=20
 /dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
 #include "berlin2q.dtsi"
=20
 / {
@@ -26,3 +28,21 @@
 &uart0 {
 	status =3D "okay";
 };
+
+&usb_phy0 {
+	power-gpio =3D <&portb 8 GPIO_ACTIVE_HIGH>;
+	status =3D "okay";
+};
+
+&usb_phy2 {
+	power-gpio =3D <&portb 12 GPIO_ACTIVE_HIGH>;
+	status =3D "okay";
+};
+
+&usb0 {
+	status =3D "okay";
+};
+
+&usb2 {
+	status =3D "okay";
+};
--=20
1.9.1
