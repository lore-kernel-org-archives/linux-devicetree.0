From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCH v2 6/7] pinctrl: mcp23s08: remove hardcoded irq polarity
 in irq_setup
Date: Sun, 8 Oct 2017 23:14:17 +0200
Message-ID: <20171008211416.mknehc4htt3ozffa@earth>
References: <1507266491-73971-1-git-send-email-preid@electromag.com.au>
 <1507266491-73971-7-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ir3zriknfxfih4vr"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1507266491-73971-7-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, poeschel@lemonage.de, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ir3zriknfxfih4vr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 06, 2017 at 01:08:10PM +0800, Phil Reid wrote:
> The irq_active_high flag is for controlling the polarity of the output
> from the mcp23s08 series devices. The polarity of the irq could be altered
> by additional logic (eg inverters) between the device and irq input devic=
e.
> The device-tree already allows for this as the irq can be specified in the
> binding. So hardcoding it in the driver is overly restrictive.
>=20
> There are no inkernel users of the mcp23s08 driver with irq's.
>=20
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

-- Sebastian

> ---
>  drivers/pinctrl/pinctrl-mcp23s08.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl=
-mcp23s08.c
> index 150f216..8dceaa1 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -630,11 +630,6 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
>  	int err;
>  	unsigned long irqflags =3D IRQF_ONESHOT | IRQF_SHARED;
> =20
> -	if (mcp->irq_active_high)
> -		irqflags |=3D IRQF_TRIGGER_HIGH;
> -	else
> -		irqflags |=3D IRQF_TRIGGER_LOW;
> -
>  	err =3D devm_request_threaded_irq(chip->parent, mcp->irq, NULL,
>  					mcp23s08_irq,
>  					irqflags, dev_name(chip->parent), mcp);
> --=20
> 1.8.3.1
>=20

--ir3zriknfxfih4vr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlnalSgACgkQ2O7X88g7
+ppcKBAAh2k0gfKWqQBzrE1Cz/O9OJ9SwkmEjnEiR4PyPcRtanb/f2ndMFwW4SUa
XrtT0zTZq/UUSHg+GaF0snQmqsoAsgpYSbVoT2/Ss5cY33xF+PiIdqXx74S5pI5/
WGYGbUQ9oTuKrqv3/MM12Q+WMZy7xCHv4Zazm9wGJ5DH9RKXeAkKmaNzvJNPw+eg
E0x/Byvly2BOREyO5ntFoH4IxMHIB0j4E+7rQ1pSVAS94YQMQbP8Rn4HlUAKNt9i
Eb7A0xayu6rCAEQr7FJ9qOEw/Mba1/ZLAHzeuLjYVYstnl7B1CUk/JsZI7n4zzDQ
JTPXjmpclUYVn/K7RkO2EcEIa0cneInAqyIHKF9KOXq/KpGjRLy0wH+cSAK4a4cQ
oRwOKDAcKy+w0Um8uX63ir8tC6dDrPVFbArpwc3MXgRo3sv8VFqEZaKvVEuo24qe
3hImaSvYJaizUO2rymGm58B/bHuVd1mU27cK6Weq3nRCCdqapHbaYV0/Vh9cktI8
R3XTnEHUcXoUdUkKph/mJSu9s/4uLxNg0YnSy28oJ+zjoj1y1qbanK/OEzrH+z8/
fRyKBP2L+9T2wULMXmHAR2Js4lTdQucJFDM8i+xb7gkjIQuo4jsedCykiOlIcZM7
hjJ6s1fybH7TmboJS6H1ca2YHgFBCewW+ICbferareGzoHDzAvY=
=SAvg
-----END PGP SIGNATURE-----

--ir3zriknfxfih4vr--
