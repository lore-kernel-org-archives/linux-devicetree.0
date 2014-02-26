From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: at91: sama5d3: get rid of atmel_tsadcc driver
Date: Wed, 26 Feb 2014 18:00:02 +0100
Message-ID: <20140226170002.GA20517@piout.net>
References: <1393432190-8799-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393432190-8799-1-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 26/02/2014 at 17:29:50 +0100, Ludovic Desroches wrote :
> From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>=20
> Touchscreen support for at91_adc has been introduced so we can get rid of
> atmel_tsadcc.
>=20
> Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Acked-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

> ---
>  arch/arm/boot/dts/sama5d3.dtsi    |   14 +-------------
>  arch/arm/boot/dts/sama5d3xdm.dtsi |    7 +++----
>  2 files changed, 4 insertions(+), 17 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.d=
tsi
> index 3d5faf8..26d7ed5 100644
> --- a/arch/arm/boot/dts/sama5d3.dtsi
> +++ b/arch/arm/boot/dts/sama5d3.dtsi
> @@ -239,7 +239,7 @@
>  			};
> =20
>  			adc0: adc@f8018000 {
> -				compatible =3D "atmel,at91sam9260-adc";
> +				compatible =3D "atmel,at91sam9x5-adc";
>  				reg =3D <0xf8018000 0x100>;
>  				interrupts =3D <29 IRQ_TYPE_LEVEL_HIGH 5>;
>  				pinctrl-names =3D "default";
> @@ -295,18 +295,6 @@
>  				};
>  			};
> =20
> -			tsadcc: tsadcc@f8018000 {
> -				compatible =3D "atmel,at91sam9x5-tsadcc";
> -				reg =3D <0xf8018000 0x4000>;
> -				interrupts =3D <29 IRQ_TYPE_LEVEL_HIGH 5>;
> -				atmel,tsadcc_clock =3D <300000>;
> -				atmel,filtering_average =3D <0x03>;
> -				atmel,pendet_debounce =3D <0x08>;
> -				atmel,pendet_sensitivity =3D <0x02>;
> -				atmel,ts_sample_hold_time =3D <0x0a>;
> -				status =3D "disabled";
> -			};
> -
>  			i2c2: i2c@f801c000 {
>  				compatible =3D "atmel,at91sam9x5-i2c";
>  				reg =3D <0xf801c000 0x4000>;
> diff --git a/arch/arm/boot/dts/sama5d3xdm.dtsi b/arch/arm/boot/dts/sama5d=
3xdm.dtsi
> index f9bdde5..0b8f5d1 100644
> --- a/arch/arm/boot/dts/sama5d3xdm.dtsi
> +++ b/arch/arm/boot/dts/sama5d3xdm.dtsi
> @@ -23,10 +23,9 @@
>  			};
> =20
>  			adc0: adc@f8018000 {
> -				status =3D "disabled";
> -			};
> -
> -			tsadcc: tsadcc@f8018000 {
> +				atmel,adc-clock-rate =3D <1000000>;
> +				atmel,adc-ts-wires =3D <4>;
> +				atmel,adc-ts-pressure-threshold =3D <10000>;
>  				status =3D "okay";
>  			};
> =20
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBCAAGBQJTDh2SAAoJEKbNnwlvZCyzu38P/11ak8IbyZegBZBqrl+4cdtQ
Ot6kgm4k23mPIJIyOuWgd6aB8qGSHjl097CHa3UJ6fG0ukmU5ozPImJ0QbESc7Tj
bPCRoZK6IoF3vqSIGrcYWBNbbrlyBORfzI15xCoRoRhn+syEjFBWdOrACGBTwQBi
eeP9SVkqNSEySvuMK7a7zpFJPuqvnmwiNswsA0qaVNdd64DxhltZ13x3sMDv3Ec0
WOXVf7tgb1kgnHei7LFXvfMfyf8sisTuh4Q5DmEhtGMKSs2mxS1d/XFhQ3KeXFap
ZqMa4So+xOfxhVIBBiWY2/7yh27px56RVWrsXv2fhRDaQ4CODQGaScG+6Z4U4iyc
mOdR+mRsuwgLQq9MpevRf45KW/psajJ8N2VseGmoENyzUtdEhfeXf5cgukSCZPoM
d9mEVcdtt7DChdKWPMzm3i5gu8j+zPzT4ME8jDWPq29caDz2CayxiMmyBB0EXAlX
4jPrEAaAvsbBi1UMNuxmEf+LLqGO+SQ1vsQpGigAh+QwOt3WO7aaxqcF1Liob2Kt
eWFqU/p8lwpICk1Cs7mn/e2CrULAUwCzKHVQ6U/ikxPMBtODFbHH8iuorfmMfJsh
0VqIulF2mBwd6rAMSOjEXDhSv6yJFiQZ7Y4n8TFd2z6O3B3AnBNOctnpByZOIqRO
2LNbegW4fGajHex4fKWN
=G4ub
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
