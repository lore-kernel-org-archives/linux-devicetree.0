From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v3 1/5] pinctrl: mcp23s08: remove hard coded irq polarity
 in irq_setup
Date: Tue, 21 Nov 2017 14:17:00 +0100
Message-ID: <20171121131700.facbc4plejmkqavl@earth>
References: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
 <1511252491-79952-2-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="v4wnffqhblcehtay"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1511252491-79952-2-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--v4wnffqhblcehtay
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 21, 2017 at 04:21:27PM +0800, Phil Reid wrote:
> The polarity of the irq should be defined in the configuration
> for the irq. eg The device tree bind already allows for either
> active high / low interrupt configuration.
>=20
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---

I think the patch is right, but the long patch description is not.
I would expect something like this:

This changes the driver, so that the "microchip,irq-active-high"
property only configures the mcp23017 interrupt output, but not
the host interrupt input. The host interrupt should be configured
using the standard interrupt flags.

-- Sebastian

>  drivers/pinctrl/pinctrl-mcp23s08.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl=
-mcp23s08.c
> index 0aef30e..cc1f9f6 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -56,7 +56,6 @@
> =20
>  struct mcp23s08 {
>  	u8			addr;
> -	bool			irq_active_high;
>  	bool			reg_shift;
> =20
>  	u16			irq_rise;
> @@ -627,11 +626,6 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
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
> @@ -777,12 +771,12 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp,=
 struct device *dev,
>  {
>  	int status, ret;
>  	bool mirror =3D false;
> +	bool irq_active_high =3D false;
> =20
>  	mutex_init(&mcp->lock);
> =20
>  	mcp->dev =3D dev;
>  	mcp->addr =3D addr;
> -	mcp->irq_active_high =3D false;
> =20
>  	mcp->chip.direction_input =3D mcp23s08_direction_input;
>  	mcp->chip.get =3D mcp23s08_get;
> @@ -868,7 +862,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, s=
truct device *dev,
>  	mcp->irq_controller =3D
>  		device_property_read_bool(dev, "interrupt-controller");
>  	if (mcp->irq && mcp->irq_controller) {
> -		mcp->irq_active_high =3D
> +		irq_active_high =3D
>  			device_property_read_bool(dev,
>  					      "microchip,irq-active-high");
> =20
> @@ -876,11 +870,11 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp,=
 struct device *dev,
>  	}
> =20
>  	if ((status & IOCON_SEQOP) || !(status & IOCON_HAEN) || mirror ||
> -	     mcp->irq_active_high) {
> +	     irq_active_high) {
>  		/* mcp23s17 has IOCON twice, make sure they are in sync */
>  		status &=3D ~(IOCON_SEQOP | (IOCON_SEQOP << 8));
>  		status |=3D IOCON_HAEN | (IOCON_HAEN << 8);
> -		if (mcp->irq_active_high)
> +		if (irq_active_high)
>  			status |=3D IOCON_INTPOL | (IOCON_INTPOL << 8);
>  		else
>  			status &=3D ~(IOCON_INTPOL | (IOCON_INTPOL << 8));
> --=20
> 1.8.3.1
>=20

--v4wnffqhblcehtay
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAloUJ0gACgkQ2O7X88g7
+pp/og/9EOhwEuG89FsLjgQ78R342i8URkjuEHbHq03Np3k3dg7xMhiwB3pPjrVf
RnWu62uNvK+OThFJpC41zQ+BvRYYwXbypQ4oa98OryCWEq8rWAeLNsWdYBGjS3QX
oGG5puBfxvF5B01euJoGiUsmgW7YTZIJ1UJglHWPRWTHesxguwyokvxThZe57MAv
3lQuDGT5ilB7MHMTNADOXxiFbeQ1WKLUrB9XwX1H036GJchkwjGEU+sPJ0+fyXyZ
sFv38UdAcfvtccpsnAHVfBJIl+XKOYXPm5GVjyxCKV3co67D2qaeOqF9BTeasqXN
itK/bpr3VIfB6r/HdSaAmb4MpVK0HB5zzsbaPlsQkW7SnSIdjXJf78gP1zcIgC/Y
HHZIekyJVVK97n8lxMzug2MPdCwGFWBSZnbpvZ/WQMnNKYCZayvGSh4/bMhom5nc
vobiEnzLd4JVC2tFxhzAdF2uoKHezvP6dZW85DbGjiZ5g7gT82ZHWBFlf3G+5ijl
ACKHEHcgnYqbYRuif95VkBEmu0cj9b8tbWmPaAp5MEvNYQqFG/uEaBY88GJAPMA5
HI7R1zJGA1B/MGY6NibHURfKHFiL80h8fRtWmH0Krc0oLEj2wkkYQuKKS5DH/l8x
U28kfL8JFjhVJm9c8TzdE4PgaodvLx761HxxYXW3R8UoSjJEuis=
=ACx7
-----END PGP SIGNATURE-----

--v4wnffqhblcehtay--
