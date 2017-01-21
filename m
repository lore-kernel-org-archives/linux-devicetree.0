From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [RESENT PATCH] ARM: bcm2835: Add devicetree for the Raspberry Pi 3, for arm (32)
Date: Sat, 21 Jan 2017 10:42:06 -0800
Message-ID: <87fukcgsqp.fsf@eliezer.anholt.net>
References: <1484845444-4617-1-git-send-email-kraxel@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484845444-4617-1-git-send-email-kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:

> Signed-off-by: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7327250..82a760d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -70,7 +70,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
>  	bcm2835-rpi-b-plus.dtb \
>  	bcm2835-rpi-a-plus.dtb \
>  	bcm2836-rpi-2-b.dtb \
> -	bcm2835-rpi-zero.dtb
> +	bcm2835-rpi-zero.dtb \
> +	../../../arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dtb
>  dtb-$(CONFIG_ARCH_BCM_5301X) += \
>  	bcm4708-asus-rt-ac56u.dtb \
>  	bcm4708-asus-rt-ac68u.dtb \

This would be really nice to have.

Acked-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>

ARM upstream folks, do you have any issues with this?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAliDq34ACgkQtdYpNtH8
nujOJRAAjDwxEhnQFyJWCSi6HWwdZs61gaJmRbBXVe/2cEORd1+/4HGkPomt8lnK
cpFyNQ87/Lg3I454AmXxwZ3cR1rvtvxjwWtxjEKWO0LqmdYb8KJYasBykdWQtHbh
/9wKDttES05M2yYPSpFn+GUdkHNMZA/eV6BBo2G6VPejtnbS/0ZMP2Iuh4iSvqQ/
EyMXOQ5JeIHmkbBhBNgcIpHvVjO1YsPnwOUOxfSvC9JjSlNY/qy39RkwYO9zSHsO
Q8p8aL28jsb7/98yXe2Tm48vCI7S1U6FU08nm8HIIfQtVZy+/AKkDemar12yqP/I
yRpG6QJHcxUBzbWddOt8UwNDZOh3Q724rjIiOQwbwkj+s42thhygHb+zQMuqpNNU
Qx+e+Io+/SaoZknVzA91HlqqQNu0qXVGcPfvtX2ChPnHMwXWNJcZt0IhBxxPIluA
iduMWAXR5vp3x3bA1wej37ZO5bJsZ27bFWt1Ym5zybwYx0YjSNEuWSzJ/kf3fVP5
644dkkuy6Dcm2G3NYUoYXtD1NOX5tyhvutDJooaa/ArvRTa6Evj6wSbhDwBo4HG+
pz5oJHRDWaWq07ahHUXsocUQCMPyOy0l++FmTOv80gGJ/vWpUPncXOyF6SM02Cgx
clarNzcDFRgBxAQD8uqbE9SunyJV4ViSPb0O4mQD7oeV+r2OopQ=
=FIde
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
