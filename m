From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 3/3] checks: add interrupts property check
Date: Thu, 24 Aug 2017 12:15:53 +1000
Message-ID: <20170824021553.GX5379@umbus.fritz.box>
References: <20170822230208.20987-1-robh@kernel.org>
 <20170822230208.20987-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7fXEoLLey27Fs/d6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170822230208.20987-4-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--7fXEoLLey27Fs/d6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2017 at 06:02:08PM -0500, Rob Herring wrote:
> Add a check for nodes with interrupts property that they have a valid
> parent, the parent has #interrupt-cells property, and the size is a
> valid multiple of #interrupt-cells.
>=20
> This may not handle every possible case and doesn't deal with
> translation thru interrupt-map properties, but should be enough for
> modern dts files.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

> ---
> v2:
> - Add a test
> - Check for interrupt-map when looking for interrupt parent.
> - Check that explicit interrupt-parent node has an interrupt-controller o=
r=20
>   interrupt-map property.
>=20
>  checks.c                      | 76 +++++++++++++++++++++++++++++++++++++=
++++++
>  tests/bad-interrupt-cells.dts | 12 +++++++
>  tests/run_tests.sh            |  1 +
>  3 files changed, 89 insertions(+)
>  create mode 100644 tests/bad-interrupt-cells.dts
>=20
> diff --git a/checks.c b/checks.c
> index 3315a4646497..6b505e9c49d8 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1113,6 +1113,81 @@ static void check_deprecated_gpio_property(struct =
check *c,
>  }
>  CHECK(deprecated_gpio_property, check_deprecated_gpio_property, NULL);
> =20
> +static bool node_is_interrupt_provider(struct node *node)
> +{
> +	struct property *prop;
> +
> +	prop =3D get_property(node, "interrupt-controller");
> +	if (prop)
> +		return true;
> +
> +	prop =3D get_property(node, "interrupt-map");
> +	if (prop)
> +		return true;
> +
> +	return false;
> +}
> +static void check_interrupts_property(struct check *c,
> +				      struct dt_info *dti,
> +				      struct node *node)
> +{
> +	struct node *root =3D dti->dt;
> +	struct node *irq_node =3D NULL, *parent =3D node;
> +	struct property *irq_prop, *prop =3D NULL;
> +	int irq_cells, phandle;
> +
> +	irq_prop =3D get_property(node, "interrupts");
> +	if (!irq_prop)
> +		return;
> +
> +	while (parent && !prop) {
> +		if (parent !=3D node && node_is_interrupt_provider(parent)) {
> +			irq_node =3D parent;
> +			break;
> +		}
> +
> +		prop =3D get_property(parent, "interrupt-parent");
> +		if (prop) {
> +			phandle =3D propval_cell(prop);
> +			irq_node =3D get_node_by_phandle(root, phandle);
> +			if (!irq_node) {
> +				FAIL(c, dti, "Bad interrupt-parent phandle for %s",
> +				     node->fullpath);
> +				return;
> +			}
> +			if (!node_is_interrupt_provider(irq_node))
> +				FAIL(c, dti,
> +				     "Missing interrupt-controller or interrupt-map property in %s",
> +				     irq_node->fullpath);
> +
> +			break;
> +		}
> +
> +		parent =3D parent->parent;
> +	}
> +
> +	if (!irq_node) {
> +		FAIL(c, dti, "Missing interrupt-parent for %s", node->fullpath);
> +		return;
> +	}
> +
> +	prop =3D get_property(irq_node, "#interrupt-cells");
> +	if (!prop) {
> +		FAIL(c, dti, "Missing #interrupt-cells in interrupt-parent %s",
> +		     irq_node->fullpath);
> +		return;
> +	}
> +
> +	irq_cells =3D propval_cell(prop);
> +	if (irq_prop->val.len % (irq_cells * sizeof(cell_t))) {
> +		FAIL(c, dti,
> +		     "interrupts size is (%d), expected multiple of %d in %s",
> +		     irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)),
> +		     node->fullpath);
> +	}
> +}
> +WARNING(interrupts_property, check_interrupts_property, &phandle_referen=
ces);
> +
>  static struct check *check_table[] =3D {
>  	&duplicate_node_names, &duplicate_property_names,
>  	&node_name_chars, &node_name_format, &property_name_chars,
> @@ -1163,6 +1238,7 @@ static struct check *check_table[] =3D {
> =20
>  	&deprecated_gpio_property,
>  	&gpios_property,
> +	&interrupts_property,
> =20
>  	&always_fail,
>  };
> diff --git a/tests/bad-interrupt-cells.dts b/tests/bad-interrupt-cells.dts
> new file mode 100644
> index 000000000000..39fc78fdc11d
> --- /dev/null
> +++ b/tests/bad-interrupt-cells.dts
> @@ -0,0 +1,12 @@
> +/dts-v1/;
> +
> +/ {
> +	interrupt-parent =3D <&intc>;
> +	intc: interrupt-controller {
> +		#interrupt-cells =3D <3>;
> +	};
> +
> +	node {
> +		interrupts =3D <1>;
> +	};
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 2a29fa4ee451..cc35205f5768 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -553,6 +553,7 @@ dtc_tests () {
>      check_tests bad-phandle-cells.dts interrupts_extended_property
>      check_tests bad-gpio.dts gpios_property
>      run_sh_test dtc-checkfails.sh deprecated_gpio_property -- -Wdeprecat=
ed_gpio_property -I dts -O dtb bad-gpio.dts
> +    check_tests bad-interrupt-cells.dts interrupts_property
>      run_sh_test dtc-checkfails.sh node_name_chars -- -I dtb -O dtb bad_n=
ode_char.dtb
>      run_sh_test dtc-checkfails.sh node_name_format -- -I dtb -O dtb bad_=
node_format.dtb
>      run_sh_test dtc-checkfails.sh prop_name_chars -- -I dtb -O dtb bad_p=
rop_char.dtb

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7fXEoLLey27Fs/d6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmeNtkACgkQbDjKyiDZ
s5JfrA/+Ikbf74U+qJ9/nuCnmTdH+layeFlPG7PrEqIdUBMZ0XNVofxYXBscuaNA
mwMX8dF3xZkG5N1d+hb7og6gc+bymhK5Yw77D8N7CkZSGJsMaDxc4yR4vTFxNZJO
/hh0UhayBgq/qJzBHKHtLSU5tWdAExk728346bx1vCW3LeACwYMZIV9HRm8JXg/y
aJK+fkl61Ei2FsLwKD5WOxGSqjw6ZNYCRtdQG8Je3c8L8XndixF4+tfUlXUffLoo
SoiplxjeRxCvVsGA+5GLUNrAA3IANE6jVRM9CO5jm+iESS1SVk3DzgiFOYlOknoE
8UG8MeabQ54bDGRCOmxio1XJ5OicqPlq2YJTTVQQi+e3usXa43c8BnTOyr1h9ROq
FBnjlQnRgFjqHktALmq64xuHG1ozpXzdFTCYFDPRdpw9Dc6JFkXcaEl0HLwCNzEL
NM7CxG95weXb8Tm8L0NZwz4aS6VBpJaaUMFFUWt2slYLlEYQSG+fQT5A+1RRYAfL
515V5h3of8G7nMGg89477fpKymi+zaaqPh3hkU9Fez8/iShMnVszVAAY7VsERGWE
lH4edA9R1BABO1OFFcuNkHLELMR4Q9LzoVleywJusOa5Fh9vjRT1j1Xf4YIS3I4R
It6sUHlJQ/byF5BkAY5EwnfzOqtjhczZZLyhQmS08h3SpuAm15I=
=TgZQ
-----END PGP SIGNATURE-----

--7fXEoLLey27Fs/d6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
