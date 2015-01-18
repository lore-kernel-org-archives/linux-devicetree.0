From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niso-UNjuZkX4dYU@public.gmane.org>
Subject: [PATCH v2 4/4] ARM: shmobile: emev2-kzm9d: Add PFC information for uart1
Date: Sun, 18 Jan 2015 13:20:04 +0100
Message-ID: <1421583604-27256-5-git-send-email-niso@kth.se>
References: <1421583604-27256-1-git-send-email-niso@kth.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421583604-27256-1-git-send-email-niso-UNjuZkX4dYU@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niso-UNjuZkX4dYU@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Configure the pinmux on kzm9d to use the serial connector for uart1.

Signed-off-by: Niklas S=C3=B6derlund <niso-UNjuZkX4dYU@public.gmane.org>
---
 arch/arm/boot/dts/emev2-kzm9d.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/emev2-kzm9d.dts b/arch/arm/boot/dts/emev=
2-kzm9d.dts
index 667d323..1944627 100644
--- a/arch/arm/boot/dts/emev2-kzm9d.dts
+++ b/arch/arm/boot/dts/emev2-kzm9d.dts
@@ -94,3 +94,16 @@
 		vdd33a-supply =3D <&reg_3p3v>;
 	};
 };
+
+&pfc {
+	uart1_pins: uart@e1030000 {
+		renesas,groups =3D "uart1_ctrl", "uart1_data";
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
2.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
