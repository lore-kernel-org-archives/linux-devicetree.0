From: Vagrant Cascadian <vagrantc@aikidev.net>
Subject: [PATCH] ARM: dts: rockchip: temporarily remove emmc hs200 speed from
        rk3288-veyron-speedy.
Date: Mon, 29 Aug 2016 08:18:13 -0700
Message-ID: <87inujbo3u.fsf@aikidev.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This essentially mimics what was done with rk3288-veyron-minnie in
commit 984926781122f034d5bc9962815d135b6c4a8e1d.

The eMMC of the speedy Chromebook also appears to need the same tuning
workaround, as it frequently fails to recognize the eMMC without it.

=2D--
 arch/arm/boot/dts/rk3288-veyron-speedy.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-speedy.dts b/arch/arm/boot/dts=
/rk3288-veyron-speedy.dts
index a0d033f..500fd18 100644
=2D-- a/arch/arm/boot/dts/rk3288-veyron-speedy.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
@@ -124,6 +124,11 @@
 			&sdmmc_bus4>;
 };
=20
+
+&emmc {
+       /delete-property/mmc-hs200-1_8v;
+};
+
 &vcc_5v {
 	enable-active-high;
 	gpio =3D <&gpio7 21 GPIO_ACTIVE_HIGH>;
=2D-=20
2.9.3


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXxFI/AAoJELeLgtSBS5G2YzEP/i11ETInXlVaKFkdBkPRIQZI
VrdjxlJIyv6QB7EYYpsP0euj0bHGEGyW1zKMAT6VhtgJgf9/+lZT+ILIoBcWite/
Z/9mUsngASUnmuEhObfjpSdEZm8N8nyRdTtOeVI9l1wMIG8VvzNWEGdYXqrgUTDH
UNn/GssDe+1PdbB3oUMTWeHUAyw1uXpAZSMWIQDnCUA9LCH7/mh9oSURyRQn7zHc
YsCylmU2FC3uWeSI8R6Gd5tqsm5EGYtHiV9f+9SGH4gQsiRRP/mzthiwtlA+VcSf
3QTGB6KqOC3zmvVk8T5wDgXbzU6cu/xFqPtxgOFV3H3r45gp//LW3ucCo3Kzhdto
6xCUAjp9woe1e9Gf6LcNA4AujrGxLi3Igazk9pDaABWtgPS2CsoDkuQFssq+rNTs
Oki51snxsNuR8Xyg4CpO691YAbcNJfbdbTwwZtMNS5kRmGXsRrM8x435BDF1ZAMP
8UD4StYFFnX48qbrVntxGnow/5l6OXrqo/mhTTgWa9IDURFJg0Mwb8VpKC9xeV2I
MDSgdQH4QD0oY/GUP/wCNgrz9BGg57pq11YEyH9Pv2vNXIs/uTdYL5WFIMTuds5a
noeUE7q73EfvtG5nsoo0idNvThYz6x8ppXfIDRj3UIHLNg84zWEgk1h0agayvGj9
3PoywFFrH0xSdAUWlFpC
=RALr
-----END PGP SIGNATURE-----
--=-=-=--
