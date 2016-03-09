From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 4/5] gpio: of: Add support to have multiple gpios in
 gpio-hog
Date: Wed, 9 Mar 2016 07:28:49 +0100
Message-ID: <20160309062849.GB10454@pengutronix.de>
References: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com>
 <1457438528-29054-5-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457438528-29054-5-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, treding@nvidia.com, swarren@wwwdotorg.org, Benoit Parrot <bparrot@ti.com>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 08, 2016 at 05:32:07PM +0530, Laxman Dewangan wrote:
> The child node for gpio hogs under gpio controller's node
> provide the mechanism to automatic GPIO request and
> configuration as part of the gpio-controller's driver
> probe function.
>=20
> Currently, property "gpio" takes one gpios for such
> configuration. Add support to have multiple GPIOs in
> this property so that multiple GPIOs of gpio-controller
> can be configured by this mechanism with one child node.

So if I read this correctly you want to have multiple GPIOs with the
same line name? Why don't you use multiple child nodes with individual
line names?

Best Regards,

Markus

>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Benoit Parrot <bparrot@ti.com>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpio/gpiolib-of.c | 64 ++++++++++++++++++++++++++++++++++++-----=
------
>  1 file changed, 49 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index d81dbd8..0e4e8fd 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -118,6 +118,21 @@ int of_get_named_gpio_flags(struct device_node *np, =
const char *list_name,
>  }
>  EXPORT_SYMBOL(of_get_named_gpio_flags);
> =20
> +static int of_gpio_get_gpio_cells_size(struct device_node *chip_np)
> +{
> +	u32 ncells;
> +	int ret;
> +
> +	ret =3D of_property_read_u32(chip_np, "#gpio-cells", &ncells);
> +	if (ret)
> +		return ret;
> +
> +	if (ncells > MAX_PHANDLE_ARGS)
> +		return -EINVAL;
> +
> +	return ncells;
> +}
> +
>  /**
>   * of_parse_own_gpio() - Get a GPIO hog descriptor, names and flags for =
GPIO API
>   * @np:		device node to get GPIO from
> @@ -131,6 +146,7 @@ EXPORT_SYMBOL(of_get_named_gpio_flags);
>   */
>  static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
>  					   const char **name,
> +					   int gpio_index,
>  					   enum gpio_lookup_flags *lflags,
>  					   enum gpiod_flags *dflags)
>  {
> @@ -139,8 +155,8 @@ static struct gpio_desc *of_parse_own_gpio(struct dev=
ice_node *np,
>  	struct gg_data gg_data =3D {
>  		.flags =3D &xlate_flags,
>  	};
> -	u32 tmp;
> -	int i, ret;
> +	int ncells;
> +	int i, start_index, ret;
> =20
>  	chip_np =3D np->parent;
>  	if (!chip_np)
> @@ -150,17 +166,16 @@ static struct gpio_desc *of_parse_own_gpio(struct d=
evice_node *np,
>  	*lflags =3D 0;
>  	*dflags =3D 0;
> =20
> -	ret =3D of_property_read_u32(chip_np, "#gpio-cells", &tmp);
> -	if (ret)
> -		return ERR_PTR(ret);
> +	ncells =3D of_gpio_get_gpio_cells_size(chip_np);
> +	if (ncells < 0)
> +		return ERR_PTR(ncells);
> =20
> -	if (tmp > MAX_PHANDLE_ARGS)
> -		return ERR_PTR(-EINVAL);
> +	start_index =3D ncells * gpio_index;
> =20
> -	gg_data.gpiospec.args_count =3D tmp;
> +	gg_data.gpiospec.args_count =3D ncells;
>  	gg_data.gpiospec.np =3D chip_np;
> -	for (i =3D 0; i < tmp; i++) {
> -		ret =3D of_property_read_u32_index(np, "gpios", i,
> +	for (i =3D 0; i < ncells; i++) {
> +		ret =3D of_property_read_u32_index(np, "gpios", start_index + i,
>  					   &gg_data.gpiospec.args[i]);
>  		if (ret)
>  			return ERR_PTR(ret);
> @@ -211,18 +226,37 @@ static int of_gpiochip_scan_gpios(struct gpio_chip =
*chip)
>  	enum gpio_lookup_flags lflags;
>  	enum gpiod_flags dflags;
>  	int ret;
> +	int i, ncells, ngpios;
> +
> +	ncells =3D of_gpio_get_gpio_cells_size(chip->of_node);
> +	if (ncells < 0)
> +		return 0;
> =20
>  	for_each_available_child_of_node(chip->of_node, np) {
>  		if (!of_property_read_bool(np, "gpio-hog"))
>  			continue;
> =20
> -		desc =3D of_parse_own_gpio(np, &name, &lflags, &dflags);
> -		if (IS_ERR(desc))
> +		ngpios =3D of_property_count_u32_elems(np, "gpios");
> +		if (ngpios < 0)
> +			continue;
> +
> +		if (ngpios % ncells) {
> +			dev_warn(chip->parent,
> +				"GPIOs entries are not proper in gpios\n");
>  			continue;
> +		}
> +
> +		ngpios /=3D ncells;
> +		for (i =3D 0; i < ngpios; i++) {
> +			desc =3D of_parse_own_gpio(np, &name, i,
> +						 &lflags, &dflags);
> +			if (IS_ERR(desc))
> +				continue;
> =20
> -		ret =3D gpiod_hog(desc, name, lflags, dflags);
> -		if (ret < 0)
> -			return ret;
> +			ret =3D gpiod_hog(desc, name, lflags, dflags);
> +			if (ret < 0)
> +				return ret;
> +		}
>  	}
> =20
>  	return 0;
> --=20
> 2.1.4
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW38KhAAoJEEpcgKtcEGQQnJYQAJBMbRlCsCk7KaIGFeJWsl/Y
HWAC8O1+5dh+LTZADYplrQPJzUv0v0KMHeQyZLIYpzdr5gBdgtdNgNTKIal9Ohmr
nsAAOQzYhTcGcCaZKmipLr1Ic3wUOJlIEoln602kDOSg2fk/G1fttbli7H+X9Sjj
ko3G2/BnSAdJ0uqp+7ED1FACaFtHeywd/lC+ix2klqrMzxNYjWfwEEvznUU5YWTR
JOV8Wo1GLmUrVQZIh2xl8p7wVSYCoJfoPnnMK0Sa+bOJEEMDDPtKQvs1+aipljM8
9rPd6B83LBimrrEsMHi90btfES5h8fYxPPF//Aq3Thdv2ZD3Rx1OwHwvPABKzh/r
+ZczzVZ6knHUYtz3NymDVH7gqEpu4I3ElG8DEGAF63dCxGL2ctQcj7PmdyVl+S1U
v2bKfDjrbmz0z/hiLRhviSOWL0i4HH3bH+zUAAAoTdrzlyKdmAdTWftZkpHAbR6U
MysmOpAqLHtJyCLbPPNNpjFI6SHPhvuPyglktMh8/jWxPRv3ThNXiO0dJlROE5U/
3VZ+D4tFrDJLBn8HIQAGWOB9SJoB2w9+VaRirj6d2ExdP9SP04CyjOrfsJjxs9RF
HxjaWp6qHp4jhl3bboqkxoXQdNvDkzcEKPh2DaEoV9COBTGYRhUu5CoKG54QfS3F
WeLajGN6KM9I3O3IAtJH
=4Ry+
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
