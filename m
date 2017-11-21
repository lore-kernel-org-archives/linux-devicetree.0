From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v3 4/5] pinctrl: mcp23s08: configure irq polarity using
 irq data
Date: Tue, 21 Nov 2017 14:34:34 +0100
Message-ID: <20171121133434.tuvxtrrbabjk4zeg@earth>
References: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
 <1511252491-79952-5-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="llqy5ouemfbgccz3"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1511252491-79952-5-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--llqy5ouemfbgccz3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 21, 2017 at 04:21:30PM +0800, Phil Reid wrote:
> The irq polarity is already encoded in the irq config. Use that to
> determine the polarity for the mcp32s08 irq output instead of the
> custom microchip,irq-active-high property.
>=20
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---

I don't like, that we use the flags for configuring the host
interrupt input and the mcp23xxx interrupt output. Usually
when the interrupt line has an inverter on it, board DTS files
just toggle the interrupts polarity. This will not work with
this patch applied. We would need to explicitly add an inverter
in the interrupt line, which is completely different to how its
implemented everywhere else (I know at least some Tegra devices
have implicit inverters on interrupt lines).

In case this is really wanted, this patch and the first patch
should be merged to avoid temporarily exposing the splitted
logic.

-- Sebastian

>  drivers/pinctrl/pinctrl-mcp23s08.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl=
-mcp23s08.c
> index 8ff9b77..6b3f810 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -773,6 +773,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, s=
truct device *dev,
>  	bool mirror =3D false;
>  	bool irq_active_high =3D false;
>  	bool open_drain =3D false;
> +	u32 irq_trig;
> =20
>  	mutex_init(&mcp->lock);
> =20
> @@ -863,9 +864,13 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, =
struct device *dev,
>  	mcp->irq_controller =3D
>  		device_property_read_bool(dev, "interrupt-controller");
>  	if (mcp->irq && mcp->irq_controller) {
> -		irq_active_high =3D
> -			device_property_read_bool(dev,
> -					      "microchip,irq-active-high");
> +		if (device_property_present(dev, "microchip,irq-active-high"))
> +			dev_warn(dev,
> +				 "microchip,irq-active-high is deprecated\n");
> +
> +		irq_trig =3D irqd_get_trigger_type(irq_get_irq_data(mcp->irq));
> +		if (irq_trig =3D=3D IRQF_TRIGGER_HIGH)
> +			irq_active_high =3D true;
> =20
>  		mirror =3D device_property_read_bool(dev, "microchip,irq-mirror");
>  		open_drain =3D device_property_read_bool(dev, "drive-open-drain");
> --=20
> 1.8.3.1
>=20

--llqy5ouemfbgccz3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAloUK18ACgkQ2O7X88g7
+pphEQ/9HJ30zkX/9YtQ84+YqkQZ6ICtG5wUVJn8LY4mLEjZmCeHTxq/dQurX/UB
zOY8Zydn/JWjDH7RnmHoRdWAeYl3TXtWnIawOFRCOUT34stglx9KkLghPVTyA/G7
17pa/XL3TZHr+VZg1zT3TbMKCMN2J5G9xO+MD7wOTLQrLzWuGbzLK+/Xa1419tIJ
N2hDOVsFGaVkUHGbBt5H6Ee43zwCF2/lGAJO9Fv8yfCrUkb5p8tmCo9FoiZRYjvU
tr1ZL+b1OpsabOXq1baS8RJkRKXH7BqRpO69Z1dBFEG6cgtkd3MOC4uXqy7apknC
ZwjteNGgPIT9JyYsmgY+BJk5JQwINOp9iP2orWfwsGQ44nxSPI6YHng6Pd2X1t/j
ttFNn2n1mFVvoo5mtot39TziB8t8xA6lbhesVlD39nEIWYbGPFgAO0TcriyZTWXP
MhG2QwCqN9IH0QAa4vZlAhHPqmP+MWbpa+IQjKfPcguOfhdi2ThjgsvmDX/FZtFG
t6hDuKElRaLgL8Z9EC9K/2PTfCOX5V+5chRu9oGYGwNubZ0Ma/wQgc6CXQ0aNFyS
I5GQZf75YjKW3wBnTK8JGgplvdlab7GUz8PLMKv9lR/TNh+v77AA5D5eBgYJa8Ba
MHq6rdFY41RnVy42qrda/6z4c0nQtqBOeuRF50/opki1i66/emk=
=5uJG
-----END PGP SIGNATURE-----

--llqy5ouemfbgccz3--
