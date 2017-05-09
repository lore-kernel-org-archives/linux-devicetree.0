From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3] arm: dts: sun7i-a20-bananapi: name the GPIO lines
Date: Tue, 9 May 2017 22:27:25 +0200
Message-ID: <20170509202725.e2tkry7dmsgx7se5@lukather>
References: <1494048638-24365-1-git-send-email-linux@rempel-privat.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4jb5ptsa4xs45onn"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1494048638-24365-1-git-send-email-linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Cc: ore-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--4jb5ptsa4xs45onn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Oleksij,

It looks much better, thanks!

On Sat, May 06, 2017 at 07:30:38AM +0200, Oleksij Rempel wrote:
> This names the GPIO lines on the Banana Pi board in accordance with
> the A20_Banana_Pi v1.4 Specification.
>=20
> This will make these line names reflect through to user space
> so that they can easily be identified and used with the new
> character device ABI.
>=20
> Signed-off-by: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---

Usually, it's better here if you put a change log with the things that
changed from one version to another.

You probably remember all of the comments that were made on the
previous version of that patch, but I don't ;)

>  arch/arm/boot/dts/sun7i-a20-bananapi.dts | 51 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 51 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/dts=
/sun7i-a20-bananapi.dts
> index 91f2e5f..6b326b3 100644
> --- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> @@ -178,6 +178,57 @@
>  };
> =20
>  &pio {
> +	gpio-line-names =3D
> +		/* PA */
> +		"ERXD3", "ERXD2", "ERXD1", "ERXD0", "ETXD3",
> +			"ETXD2", "ETXD1", "ETXD0",
> +		"ERXCK", "ERXERR", "ERXDV", "EMDC", "EMDIO",
> +			"ETXEN", "ETXCK", "ECRS",
> +		"ECOL", "ETXERR", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* PB */
> +		"PMU-SCK", "PMU-SDA", "", "", "", "", "", "",
> +		"", "USB0-DRV", "", "", "", "", "", "",
> +		"", "", "", "", "SCL", "SDA", "", "",

I'm not sure how it's called in the schematics / documentation, but
having a way to get which bus it's from would be helpful (like you did
for the PMIC I2C bus).

> +		"", "", "", "", "", "", "", "",
> +		/* PC */
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* PD */
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* PE */
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* PF */
> +		"SD0-D1", "SD0-D0", "SD0-CLK", "SD0-CMD", "SD0-D3",
> +			"SD0-D2", "", "",

Why did you change the wrapping and indentation on those two lines?

> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* PG */
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* PH */
> +		"TXD0", "RXD0", "IO-1", "PH3", "USB0-IDDET", "PH5", "", "",

What are PH3 and PH5 used for on the board? Can't we provide a more
explicit name?

Thanks!
Maxime
--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4jb5ptsa4xs45onn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZEiYpAAoJEBx+YmzsjxAgMEwP/iG3QWz3q8iaq80qBff+2NEh
wM6xV/RPXoK9pkRbBuOdoVU8ghLBVoDsFpIakaIK3gwiK3pXiwXHIjBKkoS2CEXt
5qQIPxIDJEb13izNWmanVKfRQAxm6/KKas/Xv8QKnOXpHkO775vVTsdLcFzrUmqz
ltPOpvXv+iGUqi0OOYeHIvSBZ26UkGzcq4jfCiRFSf7OK9IUlZrrwNto1cKiMUrP
XLy2A8ZfRmFhtB/lkpLZqO2BB5FMa1osrWlEH1VCV4LbzVMOLjTJnmS3N28/Cksb
SBelw381M1UFTuDgdgasoft8bj2BI03MSJ8DmHviDpWbHnXqXFql51UIBV2Qr3E9
zl8+mJrkcRdCY/ztLjSAp46bOZWrGR9oUmXESXokuM2l0hS3Tf0v6pWly0joVvgY
OO08OabYG3olgDG+439djaoUcfN0eFYnFbQIOCWDdMJkHOAPBvyTFqJDPZ6R2pUA
7zMxyLim2bbxtrYw0DwBKhrfG4x2YvFg1LGL5ohdF5tH5izZyElBigWKulEvq6tf
ocKVahaj/6fVGreWSt9babFyNbHr8+CvcGftm0tKVl9fu6oUWLixSkVOPTpzCRew
E2nVD2mWhgq5zGvfcdr392pOsvOkQpoAwYh5Zt9fBrddv2mjcjG0GL5xnJHROKSs
nFHvy6Zn34D7Fhkj0x1G
=a/MI
-----END PGP SIGNATURE-----

--4jb5ptsa4xs45onn--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
