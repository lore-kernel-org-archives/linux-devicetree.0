From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: BCM5301X: Specify PHY of USB 2.0 in DT
Date: Wed,  1 Jun 2016 21:16:25 +0200
Message-ID: <1464808585-14996-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:BROADCOM BCM5301X ARM
	ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Driver for Northstar USB 2.0 PHY was added in 4.7-rc1 by:
commit d3feb4067335 ("phy: bcm-ns-usb2: new driver for USB 2.0 PHY on
Northstar").
It should be used to let EHCI platform driver init PHY.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/bcm5301x.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm530=
1x.dtsi
index 7d4d29b..9300e19 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -140,6 +140,22 @@
 		};
 	};
=20
+	phys {
+		compatible =3D "simple-bus";
+		ranges =3D <0x00000000 0x18000000 0x00100000>;
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+
+		usb2_phy2: usb2-phy {
+			compatible =3D "brcm,ns-usb2-phy";
+			reg =3D <0x0000c000 0x1000>;
+			reg-names =3D "dmu";
+			#phy-cells =3D <0>;
+			clocks =3D <&genpll BCM_NSP_GENPLL_USB_PHY_REF_CLK>;
+			clock-names =3D "phy-ref-clk";
+		};
+	};
+
 	axi@18000000 {
 		compatible =3D "brcm,bus-axi";
 		reg =3D <0x18000000 0x1000>;
@@ -217,6 +233,8 @@
=20
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
+
+			phys =3D <&usb2_phy2>;
 		};
=20
 		usb3: usb3@23000 {
--=20
1.8.4.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
