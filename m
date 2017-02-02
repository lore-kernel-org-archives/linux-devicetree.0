From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH V2] Add devicetree for the Raspberry Pi 3, for arm (32)
Date: Thu, 02 Feb 2017 10:05:53 -0800
Message-ID: <871svgxybi.fsf@eliezer.anholt.net>
References: <20170202090536.16724-1-mzoran@crowfest.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170202090536.16724-1-mzoran-O+n0w2l5AFbk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mzoran-O+n0w2l5AFbk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Michael Zoran <mzoran-O+n0w2l5AFbk1uMJSBkQmQ@public.gmane.org> writes:

> Signed-off-by: Michael Zoran <mzoran-O+n0w2l5AFbk1uMJSBkQmQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile            | 3 ++-
>  arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/bcm2837-rpi-3-b.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 8bd8878efe7b..72ba524df912 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -72,7 +72,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
>  	bcm2835-rpi-b-plus.dtb \
>  	bcm2835-rpi-a-plus.dtb \
>  	bcm2836-rpi-2-b.dtb \
> -	bcm2835-rpi-zero.dtb
> +	bcm2835-rpi-zero.dtb \
> +	bcm2837-rpi-3-b.dtb
>  dtb-$(CONFIG_ARCH_BCM_5301X) += \
>  	bcm4708-asus-rt-ac56u.dtb \
>  	bcm4708-asus-rt-ac68u.dtb \
> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> new file mode 100644
> index 000000000000..48ad20f83255
> --- /dev/null
> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> @@ -0,0 +1,2 @@
> +#include "../../../arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts"
> +

This won't work, for the same reason as v1.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAliTdQEACgkQtdYpNtH8
nuhwkw/+IMqUB1C/TE6NdBUkA3IuZrpijsA42iqqyxeU+suOQeBxG8KXig/HNAyh
I4dtkwJwfTSzi7BGXMMD+J7bhLSChTdbcBGd3bPoTwaXtLWrZapms7EvOJZFzvDM
nbXRnuV5R0HHuD5Uof9/EIAYRyZZwp9l/vi+xDtPowTNHIt6iQW9h/hutCgARcfA
oi+WE3ovxUVE74krgu2ppI9TzuWNAJiKETYS1azguBDjHfvAM5hxp894VRA8tWET
V9NJQqsoPv1GVdVIKYIo6EssH8fCHJWdrNzxwLA28Gc3ldBV5F21kJiL5dBi45Cv
pdhR9q0lfoC+ddL07ucyL9frSJqXTkLbp6Y3eaVXWdHllUG95k4F0YiEIN3odkhD
W7FV+SVhmkNUaqzibr0yT5wQS2ip/kJmvklCGUAYwe19YG5QfUnKWdBL/A9UWDNs
GiMn05dzhkHJZaoCqbEOr/zvrf2gZKWuIze/SXEJ8N1AsfaSR2B2SdjinE51BtyX
ZFcfyZEsqzXGQb3IeC2Ds2hXiH8NbiCrJoksLTWauMAELVIhhYrJBf2V5iYG/Sg6
aFVdQAHkjs7qfM//kONJ4dSaXrIaFM2WkmVxS0C3GJmDhH4I8xg8P5TCLtlwhNof
2aqWROz3N6verdjS0u9hzWjSDd2/+ymor3SYlyPSBH31yJ0FLo4=
=MBdk
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
