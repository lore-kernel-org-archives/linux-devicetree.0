From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: rockchip: temporarily remove emmc hs200
 speed from rk3288-veyron-speedy.
Date: Sun, 16 Oct 2016 21:49:43 +0200
Message-ID: <1476647383.3885.3.camel@paulk.fr>
References: <87twd1vzc5.fsf@aikidev.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-QB7cUEG3LZODOFeONbtK"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87twd1vzc5.fsf-LkDtOWtB3X7R7s880joybQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vagrant Cascadian <vagrantc-LkDtOWtB3X7R7s880joybQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-QB7cUEG3LZODOFeONbtK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 27 septembre 2016 =C3=A0 13:53 -0700, Vagrant Cascadian a =C3=A9cr=
it=C2=A0:
> This essentially mimics what was done with rk3288-veyron-minnie in
> commit 984926781122f034d5bc9962815d135b6c4a8e1d.
>=20
> The eMMC of the speedy Chromebook also appears to need the same tuning
> workaround, as it frequently fails to recognize the eMMC without it.

I have a device where (without this patch) eMMC sometimes fails, with:
[=C2=A0=C2=A0=C2=A0=C2=A03.561010] dwmmc_rockchip ff0f0000.dwmmc: Successfu=
lly tuned phase to 175
[=C2=A0=C2=A0=C2=A0=C2=A03.571742] mmc2: new HS200 MMC card at address 0001
[=C2=A0=C2=A0=C2=A0=C2=A03.571943] mmcblk2: mmc2:0001 HAG2e 14.7 GiB=C2=A0
[=C2=A0=C2=A0=C2=A0=C2=A03.572026] mmcblk2boot0: mmc2:0001 HAG2e partition =
1 4.00 MiB
[=C2=A0=C2=A0=C2=A0=C2=A03.572107] mmcblk2boot1: mmc2:0001 HAG2e partition =
2 4.00 MiB
[=C2=A0=C2=A0=C2=A0=C2=A03.572181] mmcblk2rpmb: mmc2:0001 HAG2e partition 3=
 4.00 MiB
[=C2=A0=C2=A0=C2=A0=C2=A03.685647] mmcblk2: error -110 transferring data, s=
ector 0, nr 8, cmd response 0x900, card status 0x0

And sometimes works, with:
[=C2=A0=C2=A0=C2=A0=C2=A03.451058] dwmmc_rockchip ff0f0000.dwmmc: Successfu=
lly tuned phase to 176
[=C2=A0=C2=A0=C2=A0=C2=A03.491093] mmc2: new HS200 MMC card at address 0001
[=C2=A0=C2=A0=C2=A0=C2=A03.491277] mmcblk2: mmc2:0001 HAG2e 14.7 GiB=C2=A0
[=C2=A0=C2=A0=C2=A0=C2=A03.491345] mmcblk2boot0: mmc2:0001 HAG2e partition =
1 4.00 MiB
[=C2=A0=C2=A0=C2=A0=C2=A03.491409] mmcblk2boot1: mmc2:0001 HAG2e partition =
2 4.00 MiB
[=C2=A0=C2=A0=C2=A0=C2=A03.491474] mmcblk2rpmb: mmc2:0001 HAG2e partition 3=
 4.00 MiB
[=C2=A0=C2=A0=C2=A0=C2=A03.493548]=C2=A0=C2=A0mmcblk2: p1 p2

However, with this change, it always fails, with:
[=C2=A0=C2=A0=C2=A0=C2=A03.322129] mmc_host mmc2: Bus speed (slot 0) =3D 50=
000000Hz (slot req 52000000Hz, actual 50000000HZ div =3D 0)
[=C2=A0=C2=A0=C2=A0=C2=A03.333174] mmc2: error -110 whilst initialising MMC=
 card

I don't have so much time to investigate this issue, but it's clear that th=
is
patch doesn't fix the issue (and actually worsens it) for my device.

Cheers!

> Signed-off-by: Vagrant Cascadian <vagrantc-LkDtOWtB3X7R7s880joybQ@public.gmane.org>
> ---
> Changes in v2:
> =C2=A0- Added Signed-off-by.
>=20
> =C2=A0arch/arm/boot/dts/rk3288-veyron-speedy.dts | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/rk3288-veyron-speedy.dts
> b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
> index a0d033f..500fd18 100644
> --- a/arch/arm/boot/dts/rk3288-veyron-speedy.dts
> +++ b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
> @@ -124,6 +124,11 @@
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&=
sdmmc_bus4>;
> =C2=A0};
>=20
> +
> +&emmc {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/delete-property/mmc-hs200-1_8=
v;
> +};
> +
> =C2=A0&vcc_5v {
> =C2=A0=C2=A0=C2=A0=C2=A0enable-active-high;
> =C2=A0=C2=A0=C2=A0=C2=A0gpio =3D <&gpio7 21 GPIO_ACTIVE_HIGH>;
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
--=20
Paul Kocialkowski, developer of free digital technology at the lower levels

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-QB7cUEG3LZODOFeONbtK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYA9nXAAoJEIT9weqP7pUMi+wP/2A6U8MAGYv56nZM0ovFNFy1
Raz9A5JyECiKZzg2mxrSLH/ZiOGElhWtgPDkkfoQLggjkZoEJBypSzG47lP/m5wi
lQ6GsFoGl909G5N5eiULpJkGvPIuG+aOUVZyVQ4dcnqYh08XNYi6zcQ5imgAsPI3
8wY4PgpqsySdZ+kU9EP//wVsclJl8gR3nBGwWQDfV0cL7lV/Ws30rF/rcXn+nHmU
IVh2m10wD1FZh1tJD5wYIc37+sT8tJ861Qk1xTgvz9aBKeNcBSUcDbsBmeWmD9pB
TkNe/ACh1vhvFRElBb7FH8F8S1HIgV2KC77R8tzhRcNi6PU32DsKJQdbtTn/+sJv
DdHnpv4SDI5r0uu7d5tDdwor1BAbEw21+G0rqk/Brp3qWRDr2VkArX4K8m1BazNw
mDsGz63Nc94c7S3hUcz6TD2o41LFcxMcSQBZG9E/YcPJNqNfM+w8fLFHz5CFVNPP
NFCreEPf05DWVV/6TlnZAVgP01RPbJSgLw+o5FA0AGKc8V99iH/DjrQe8YJdFz0l
7Sy0wOpcakE0JyDP1BmQMSQJwMelEoQjBP1OdBeoTQvE635xWm1FOBxG2L9G5ZPj
6wu+d2YbPUqWrAqVHnKU8gn12UGljngOUoVLL3je6MuL+/ZzLbpmjpNBODu3Jxk2
31vuxuCIGLNHih346a5U
=9wXJ
-----END PGP SIGNATURE-----

--=-QB7cUEG3LZODOFeONbtK--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
