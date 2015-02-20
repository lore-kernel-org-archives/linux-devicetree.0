From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4 0/3] add support for Firefly-RK3288 and Rayeager PX2 boards
Date: Fri, 20 Feb 2015 01:44:35 +0100
Message-ID: <142441781.gJtRx3FmLT@diego>
References: <1422189576-19478-1-git-send-email-naobsd@gmail.com> <2137926.nqOiED5bzz@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2137926.nqOiED5bzz@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: FUKAUMI Naoki <naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, 26. Januar 2015, 02:22:55 schrieb Heiko St=FCbner:
> Am Sonntag, 25. Januar 2015, 21:39:33 schrieb FUKAUMI Naoki:
> > This series adds support for following Rockchip SoC based boards.
> >=20
> >  - Firefly, Firefly-RK3288 (both beta and mass production version)
> >  - ChipSPARK, Rayeager PX2
>=20
> I've applied this series with Andy's Tested-by for the Rayeager board=
 and my
> Tested-by for the Firefly.
>=20
> One caveat, I had to remove the gmac node from the firefly dtsi, as t=
he
> whole gmac series goes through the network tree, so the dtb won't com=
pile
> either in my tree or arm-soc due to the missing core node.
>=20
> I'll try to see if I can get the separate gmac node in when everythin=
g is
> combined in 3.20-rc1.

I've added the missing gmac config now to my dts-branch for 3.21 (or
whatever it might get called), with the following patch:

----------- 8< ------------
=46rom: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Date: Fri, 20 Feb 2015 01:31:57 +0100
Subject: [PATCH] ARM: dts: rockchip: enable gmac on rk3288-firefly

This was left out of the original firefly board definition due to the
ethernet support going completely through the network tree, making the
underlying nodes unavailable.

Now that everything is present enable the gmac on the firefly.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/rk3288-firefly.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-firefly.dtsi b/arch/arm/boot/dts/=
rk3288-firefly.dtsi
index b9dda41..b54dd78 100644
--- a/arch/arm/boot/dts/rk3288-firefly.dtsi
+++ b/arch/arm/boot/dts/rk3288-firefly.dtsi
@@ -179,6 +179,22 @@
 	status =3D "okay";
 };
=20
+&gmac {
+	assigned-clocks =3D <&cru SCLK_MAC>;
+	assigned-clock-parents =3D <&ext_gmac>;
+	clock_in_out =3D "input";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&rgmii_pins>, <&phy_rst>, <&phy_pmeb>, <&phy_int>;
+	phy-supply =3D <&vcc_lan>;
+	phy-mode =3D "rgmii";
+	snps,reset-active-low;
+	snps,reset-delays-us =3D <0 10000 1000000>;
+	snps,reset-gpio =3D <&gpio4 8 GPIO_ACTIVE_LOW>;
+	tx_delay =3D <0x30>;
+	rx_delay =3D <0x10>;
+	status =3D "ok";
+};
+
 &hdmi {
 	ddc-i2c-bus =3D <&i2c5>;
 	status =3D "okay";
--=20
2.1.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
