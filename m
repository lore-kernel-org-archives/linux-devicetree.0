From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v2 04/10] ARM64: dts: rockchip: Add GMAC to GeekBox
Date: Mon,  8 Feb 2016 03:17:33 +0100
Message-ID: <1454897859-7601-5-git-send-email-afaerber@suse.de>
References: <1454897859-7601-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454897859-7601-1-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 v2: New
=20
 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts | 20 +++++++++++++++++=
+++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts b/arch/arm=
64/boot/dts/rockchip/rk3368-geekbox.dts
index bc91d39758ab..a8dcf3c2b0c1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
@@ -56,6 +56,13 @@
 		reg =3D <0x0 0x0 0x0 0x80000000>;
 	};
=20
+	ext_gmac: gmac-clk {
+		compatible =3D "fixed-clock";
+		clock-frequency =3D <125000000>;
+		clock-output-names =3D "ext_gmac";
+		#clock-cells =3D <0>;
+	};
+
 	leds: gpio-leds {
 		compatible =3D "gpio-leds";
=20
@@ -82,6 +89,19 @@
 	};
 };
=20
+&gmac {
+	status =3D "okay";
+	phy-supply =3D <&vcc_lan>;
+	phy-mode =3D "rgmii";
+	clock_in_out =3D "input";
+	assigned-clocks =3D <&cru SCLK_MAC>;
+	assigned-clock-parents =3D <&ext_gmac>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&rgmii_pins>;
+	tx_delay =3D <0x30>;
+	rx_delay =3D <0x10>;
+};
+
 &i2c0 {
 	status =3D "okay";
=20
--=20
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
