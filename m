From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niso@kth.se>
Subject: [PATCH 4/4] ARM: shmobile: emev2-kzm9d: Add PFC information for uart1
Date: Fri, 12 Dec 2014 21:01:37 +0100
Message-ID: <1418414497-23741-5-git-send-email-niso@kth.se>
References: <1418414497-23741-1-git-send-email-niso@kth.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1418414497-23741-1-git-send-email-niso@kth.se>
Sender: linux-sh-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com, linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, linux-sh@vger.kernel.org, magnus.damm@gmail.com, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niso@kth.se>
List-Id: devicetree@vger.kernel.org

Configure the pinmux on kzm9d to use the serial connector for uart1.

Signed-off-by: Niklas S=C3=B6derlund <niso@kth.se>
---
 arch/arm/boot/dts/emev2-kzm9d.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/emev2-kzm9d.dts b/arch/arm/boot/dts/emev=
2-kzm9d.dts
index 667d323..daf19bf 100644
--- a/arch/arm/boot/dts/emev2-kzm9d.dts
+++ b/arch/arm/boot/dts/emev2-kzm9d.dts
@@ -94,3 +94,16 @@
 		vdd33a-supply =3D <&reg_3p3v>;
 	};
 };
+
+&pfc {
+	uart1_pins: uart@e1030000 {
+		renesas,groups =3D "uart1_rx", "uart1_tx", "uart1_ctsb", "uart1_rtsb=
";
+		renesas,function =3D "uart1";
+	};
+};
+
+&uart1 {
+	pinctrl-0 =3D <&uart1_pins>;
+	pinctrl-names =3D "default";
+	status =3D "okay";
+};
--=20
2.1.3

