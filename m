From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 19/19] ARM: sun4i: dt: Add support for the
 INet-97F_Rev_02 board
Date: Sat,  1 Mar 2014 20:26:38 +0100
Message-ID: <1393701998-3553-20-git-send-email-hdegoede@redhat.com>
References: <1393701998-3553-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBGPJZCMAKGQEXMLPFUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1393701998-3553-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, =?UTF-8?q?David=20Lanzend=C3=B6rfer?= <david.lanzendoerfer-Z7Kmv9EsliU@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: David Lanzend=C3=B6rfer <david.lanzendoerfer-Z7Kmv9EsliU@public.gmane.org>

This patch adds basic support for the INet-97F_Rev_02 board found in variou=
s
low cost consumer tablet devices (http://linux-sunxi.org/INet-97F_Rev_02)

Signed-off-by: David Lanzend=C3=B6rfer <david.lanzendoerfer-Z7Kmv9EsliU@public.gmane.org>
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                |  1 +
 arch/arm/boot/dts/sun4i-a10-inet97fv2.dts | 69 +++++++++++++++++++++++++++=
++++
 2 files changed, 70 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun4i-a10-inet97fv2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 66d6df3..aaa130e 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -284,6 +284,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D \
 	sun4i-a10-cubieboard.dtb \
 	sun4i-a10-mini-xplus.dtb \
 	sun4i-a10-hackberry.dtb \
+	sun4i-a10-inet97fv2.dtb \
 	sun4i-a10-olinuxino-lime.dtb \
 	sun4i-a10-pcduino.dtb \
 	sun5i-a10s-olinuxino-micro.dtb \
diff --git a/arch/arm/boot/dts/sun4i-a10-inet97fv2.dts b/arch/arm/boot/dts/=
sun4i-a10-inet97fv2.dts
new file mode 100644
index 0000000..fe9272e
--- /dev/null
+++ b/arch/arm/boot/dts/sun4i-a10-inet97fv2.dts
@@ -0,0 +1,69 @@
+/*
+ * Copyright 2014 Open Source Support GmbH
+ *
+ * David Lanzend=C3=B6rfer <david.lanzendoerfer-Z7Kmv9EsliU@public.gmane.org>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/dts-v1/;
+/include/ "sun4i-a10.dtsi"
+/include/ "sunxi-common-regulators.dtsi"
+
+/ {
+	model =3D "INet-97F Rev 02";
+	compatible =3D "primux,inet97fv2", "allwinner,sun4i-a10";
+
+	aliases {
+		serial0 =3D &uart0;
+	};
+
+	soc@01c00000 {
+		uart0: serial@01c28000 {
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&uart0_pins_a>;
+			status =3D "okay";
+		};
+
+		i2c0: i2c@01c2ac00 {
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&i2c0_pins_a>;
+			status =3D "okay";
+		};
+
+		usbphy: phy@01c13400 {
+			usb1_vbus-supply =3D <&reg_usb1_vbus>;
+			usb2_vbus-supply =3D <&reg_usb2_vbus>;
+			status =3D "okay";
+		};
+
+		ehci0: usb@01c14000 {
+			status =3D "okay";
+		};
+
+		ohci0: usb@01c14400 {
+			status =3D "okay";
+		};
+
+		ehci1: usb@01c1c000 {
+			status =3D "okay";
+		};
+
+		ohci1: usb@01c1c400 {
+			status =3D "okay";
+		};
+	};
+
+	reg_usb1_vbus: usb1-vbus {
+		status =3D "okay";
+	};
+
+	reg_usb2_vbus: usb2-vbus {
+		status =3D "okay";
+	};
+};
--=20
1.9.0

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/groups/opt_out.
