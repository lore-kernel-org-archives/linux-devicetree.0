From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: bcm2835: Add Raspberry Pi Zero W
Date: Wed, 26 Jul 2017 13:09:06 -0700
Message-ID: <87vamfx8nx.fsf@eliezer.anholt.net>
References: <1500579429-9101-1-git-send-email-stefan.wahren@i2se.com> <1500579429-9101-4-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500579429-9101-4-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> The Raspberry Pi Zero W has the same components like the Zero plus
> a Cypress CYW43438 wireless chip (wifi + bl).

I sent out v2 of the arm64 patch so that hopefully we can get started
merging this.  Couple of comments on a re-read.

> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> Reviewed-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile               |  3 +-
>  arch/arm/boot/dts/bcm2835-rpi-zero-w.dts | 73 ++++++++++++++++++++++++++=
++++++
>  2 files changed, 75 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index ec60f4f..f3bf9397 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -74,7 +74,8 @@ dtb-$(CONFIG_ARCH_BCM2835) +=3D \
>  	bcm2835-rpi-a-plus.dtb \
>  	bcm2836-rpi-2-b.dtb \
>  	bcm2837-rpi-3-b.dtb \
> -	bcm2835-rpi-zero.dtb
> +	bcm2835-rpi-zero.dtb \
> +	bcm2835-rpi-zero-w.dtb
>  dtb-$(CONFIG_ARCH_BCM_5301X) +=3D \
>  	bcm4708-asus-rt-ac56u.dtb \
>  	bcm4708-asus-rt-ac68u.dtb \
> diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts b/arch/arm/boot/dts=
/bcm2835-rpi-zero-w.dts
> new file mode 100644
> index 0000000..9c6d714
> --- /dev/null
> +++ b/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
> @@ -0,0 +1,73 @@
> +/*
> + * Copyright (C) 2017 Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +/dts-v1/;
> +#include "bcm2835.dtsi"
> +#include "bcm2835-rpi.dtsi"
> +#include "bcm283x-rpi-usb-host.dtsi"
> +
> +/ {
> +	compatible =3D "raspberrypi,model-zero-w", "brcm,bcm2835";
> +	model =3D "Raspberry Pi Zero W";
> +
> +	aliases {
> +		uart0 =3D "/soc/serial@7e201000";
> +		uart1 =3D "/soc/serial@7e215040";
> +		serial0 =3D "/soc/serial@7e201000";
> +		serial1 =3D "/soc/serial@7e215040";
> +	};

Should we have this in the other board DTs?  What does it do?

> +
> +	leds {
> +		act {
> +			gpios =3D <&gpio 47 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	wifi_pwrseq: wifi-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&wl_on>;
> +		reset-gpios =3D <&gpio 41 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&gpio {
> +	pinctrl-0 =3D <&gpioout &alt0>;
> +
> +	wl_on: wl-on {
> +		brcm,pins =3D <41>;
> +		brcm,function =3D <BCM2835_FSEL_GPIO_OUT>;
> +	};
> +};

Would you be up for adding gpio-line-names based on the dt-blob.dts?

> +
> +&hdmi {
> +	hpd-gpios =3D <&gpio 46 GPIO_ACTIVE_LOW>;
> +};
> +
> +&sdhci {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	pinctrl-0 =3D <&emmc_gpio34 &gpclk2_gpio43>;
> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> +	non-removable;
> +	status =3D "okay";
> +
> +	brcmf: wifi@1 {
> +		reg =3D <1>;
> +		compatible =3D "brcm,bcm4329-fmac";
> +	};
> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_gpio14>;
> +	status =3D "okay";
> +};
> --=20
> 2.7.4

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAll49uIACgkQtdYpNtH8
nujTmA/+Kz62nXuM7rUNsm7YBDbOUnBNVQdD6Dq3Ao7qTeANI6YKl86jXfF3wtnz
tgjQWcNeuZ/a+logGEklWLsIbZh5xjvNQM4/fwnJNRyiRLZ29M4/RdeR0c3h69bn
snz8GTVYLQRmaZRuXjt3vAeGyXR1mxNHzGezAw/e8HVNvEX0UfJhd0ZW7zBzMxiw
oemjCnJ+be1BShh7Q0f2IaUOnYUAz/OplK7nTbAG98jqgmq9pQjha25vl2BJ7uCW
rME9F3X1cZ8OsKsEaDC/V4ozyzMF5XvVOf7OPf3Y6KWvRore+untDdGDdNgOpjg4
96RbCaX9NRCeLUG+OtCqkDmMUF2TulbYyyTIOOaqvywgS/dThdNVEpii/mhgff7N
rjLDKhqvISnoX+9+AUbHGq8v5cf0Vss/Wfc945w3xCCjIGspAbZ02ITWF4R5MVcL
MlvzY4qhfX5c+vtA5CmXZVAJo1TvQZe36N4Rh4VKDsp39GU3GF4Hsbue69CX2aO2
ISsr6bEdRHMmnOzz7Xf1fzLlawQgDNfkEqds6VIXOkkLoGQ+V0S/1lJT9BVcwIHp
b015S8P6CUDXpaKFt00LcX+accBh0iphsXGs9Sm2eLnKjHXdjIesLiq7J5XLmBlQ
3kOACGNvGGBh0npgPrKz99uaCO1e2i9gemZlsS+59RjVTWUyF7k=
=xEoW
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
