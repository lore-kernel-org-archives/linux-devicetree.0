From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: dts: sun8i: Extend Orange Pi PC dt to also
 handle the PC Plus
Date: Wed, 13 Jul 2016 10:45:05 +0200
Message-ID: <20160713084505.GE4761@lukather>
References: <1468095718-18515-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OZkY3AIuv2LYvjdk"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1468095718-18515-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--OZkY3AIuv2LYvjdk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 09, 2016 at 10:21:55PM +0200, Hans de Goede wrote:
> There is a new Orange Pi PC Plus available now, rather then adding
> yet another dts file for this variant, extend the existing
> Orange Pi PC to support the sdio wifi and emmc found on this variant.
>=20
> Downside of this approach is the following messages in dmesg when run
> on the non Plus Orange Pi PC:
>=20
> sunxi-mmc 1c10000.mmc: fatal err update clk timeout
> sunxi-mmc 1c11000.mmc: smc 2 err, cmd 8, RTO !!
> sunxi-mmc 1c11000.mmc: smc 2 err, cmd 55, RTO !!
> sunxi-mmc 1c11000.mmc: smc 2 err, cmd 55, RTO !!
> sunxi-mmc 1c11000.mmc: smc 2 err, cmd 55, RTO !!
> sunxi-mmc 1c11000.mmc: smc 2 err, cmd 55, RTO !!
> sunxi-mmc 1c11000.mmc: smc 2 err, cmd 1, RTO !!
>=20
> Note these are completely harmless and there is no adverse effect
> to the functioning of the non Plus Orange Pi PC.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts | 40 ++++++++++++++++++++++++=
+++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/d=
ts/sun8i-h3-orangepi-pc.dts
> index b8340f7..f9bf260 100644
> --- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> @@ -49,11 +49,13 @@
>  #include <dt-bindings/pinctrl/sun4i-a10.h>
> =20
>  / {
> -	model =3D "Xunlong Orange Pi PC";
> +	model =3D "Xunlong Orange Pi PC / PC Plus";
>  	compatible =3D "xunlong,orangepi-pc", "allwinner,sun8i-h3";
> =20
>  	aliases {
>  		serial0 =3D &uart0;
> +		/* ethernet0 is the H3 emac, defined in sun8i-h3.dtsi */
> +		ethernet1 =3D &rtl8189ftv;
>  	};
> =20
>  	chosen {
> @@ -118,6 +120,42 @@
>  	status =3D "okay";
>  };
> =20
> +/* Note only present on orangepi pc *plus* */
> +&mmc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc1_pins_a>;
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	bus-width =3D <4>;
> +	non-removable;
> +	status =3D "okay";
> +
> +	/*
> +	 * Explicitly define the sdio device, so that we can add an ethernet
> +	 * alias for it (which e.g. makes u-boot set a mac-address).
> +	 */
> +	rtl8189ftv: sdio_wifi@1 {
> +		reg =3D <1>;
> +	};
> +};

Nothing prevents you from including the orange pi pc dts, from the
orange pi plus dts.

It prevents the duplication you were trying to avoid, and it doesn't
create all those spurious errors and devices.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--OZkY3AIuv2LYvjdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhf+RAAoJEBx+YmzsjxAgboIP/iGtxbetdX4bMn5fyEFQPUV3
x3dob75lLg1iQcMzEQmFWv+n8HBVMb7wNhy2K2B9HZQ45cfRyQOywXyy1qxYN7Y7
GDZoFc2gbYPei83s07eX70+DfiQtEnirLc4rYeNPWrsF3+LkvPpnJnl8/ZHac3Pz
igYdP/6SbO1uOJppwj/kLRVDWeaQymFMPnfhxQXkh/RqCSeun6fF/fCHe/RQQWX6
MHOQ4f9cLTOH3VG6Ire3nHaGAM4cduwsYscbtGJDic0FjxSterzf/tbl8xj8iljb
pjcyKbpJ4lFBj7Ne3UwAfyU0drr1GdB0YGydYOHSPE5REWuwgq8AfeuhR5ZOqapc
G9hLYJVBokNq01AIMzjQ7AcfpIhkLVAnjk62wAcumxxNouisqLwSJdviBpV6lRqg
E2Pm5uvttYRa3o1kWKwAdkXVxqbDO334VO8PX5gwEA+8PF4XCwZkdB2uT+3swSdP
u21aX++yHqoE7ieQ02Mt8EAOeRlmz0vSCwn+Xh/YD2mK1/dkAa6BWph6qcyGpk/i
+x5vKB7yRzSyXQi8Nu8j54MU3ioV7sLeEUlWHNNFmTbBZktMJZxIiYvSY3i2dzbA
ukPxJ6TJUEtxPxCUAxQdYdTjxbVdejvUhb4JOd2nXTsKnZPfdqH8LOk/V8HQYFqU
vjcn8bH66r1VdIOk+Q4j
=9woe
-----END PGP SIGNATURE-----

--OZkY3AIuv2LYvjdk--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
