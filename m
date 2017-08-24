From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/3] checks: add phandle with arg property checks
Date: Thu, 24 Aug 2017 12:03:38 +1000
Message-ID: <20170824020338.GV5379@umbus.fritz.box>
References: <20170822230208.20987-1-robh@kernel.org>
 <20170822230208.20987-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="worL9B4ITIAQZ1FS"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170822230208.20987-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--worL9B4ITIAQZ1FS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2017 at 06:02:06PM -0500, Rob Herring wrote:
> Many common bindings follow the same pattern of client properties
> containing a phandle and N arg cells where N is defined in the provider
> with a '#<specifier>-cells' property such as:
>=20
> 	intc0: interrupt-controller@0 {
> 		#interrupt-cells =3D <3>;
> 	};
> 	intc1: interrupt-controller@1 {
> 		#interrupt-cells =3D <2>;
> 	};
>=20
> 	node {
> 		interrupts-extended =3D <&intc0 1 2 3>, <&intc1 4 5>;
> 	};
>=20
> Add checks for properties following this pattern.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> v2:
> - Make each property a separate check
> - Iterate over raw cells rather than markers
> - Fix property length check for 2nd to Nth items
> - Improve error messages. If cell sizes are wrong, the next iteration can
>   get a bad (but valid) phandle.
> - Add a test
>=20
>  checks.c                    | 104 ++++++++++++++++++++++++++++++++++++++=
++++++
>  dtc.h                       |   1 +
>  livetree.c                  |   6 +++
>  tests/bad-phandle-cells.dts |  11 +++++
>  tests/run_tests.sh          |   1 +
>  5 files changed, 123 insertions(+)
>  create mode 100644 tests/bad-phandle-cells.dts
>=20
> diff --git a/checks.c b/checks.c
> index afabf64337d5..548d7e118c42 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -956,6 +956,93 @@ static void check_obsolete_chosen_interrupt_controll=
er(struct check *c,
>  WARNING(obsolete_chosen_interrupt_controller,
>  	check_obsolete_chosen_interrupt_controller, NULL);
> =20
> +struct provider {
> +	const char *prop_name;
> +	const char *cell_name;
> +	bool optional;

AFAICT you don't actually use this optional flag, even in the followup
patches; it's always false.

> +};
> +
> +static void check_property_phandle_args(struct check *c,
> +					  struct dt_info *dti,
> +				          struct node *node,
> +				          struct property *prop,
> +				          const struct provider *provider)
> +{
> +	struct node *root =3D dti->dt;
> +	int cell, cellsize =3D 0;
> +
> +	for (cell =3D 0; cell < prop->val.len / sizeof(cell_t); cell +=3D cells=
ize + 1) {
> +		struct node *provider_node;
> +		struct property *cellprop;
> +		int phandle;
> +
> +		phandle =3D propval_cell_n(prop, cell);
> +		if (phandle =3D=3D 0 || phandle =3D=3D -1) {
> +			cellsize =3D 0;
> +			continue;

I'm not clear what case this is handling.  If the property has an
invalid (or unresolved) phandle value, shouldn't that be a FAIL?  As
it is we interpret the next cell as a phandle, and since we couldn't
resolve the first phandle, we can't be at all sure that it really is a
phandle.

> +		}
> +
> +		provider_node =3D get_node_by_phandle(root, phandle);
> +		if (!provider_node) {
> +			FAIL(c, dti, "Could not get phandle node for %s:%s(cell %d)",
> +			     node->fullpath, prop->name, cell);
> +			break;
> +		}
> +
> +		cellprop =3D get_property(provider_node, provider->cell_name);
> +		if (cellprop) {
> +			cellsize =3D propval_cell(cellprop);
> +		} else if (provider->optional) {
> +			cellsize =3D 0;
> +		} else {
> +			FAIL(c, dti, "Missing property '%s' in node %s or bad phandle (referr=
ed from %s:%s[%d])",
> +			     provider->cell_name,
> +			     provider_node->fullpath,
> +			     node->fullpath, prop->name, cell);
> +			break;
> +		}
> +
> +		if (prop->val.len < ((cell + cellsize + 1) * sizeof(cell_t))) {
> +			FAIL(c, dti, "%s property size (%d) too small for cell size %d in %s",
> +			     prop->name, prop->val.len, cellsize, node->fullpath);
> +		}

How will this cope if the property is really badly formed - e.g. a 3
byte property, so you can't even grab a whole first phandle?  I think
it will trip the assert() in propval_cell_n() which isn't great.

> +	}
> +}
> +
> +static void check_provider_cells_property(struct check *c,
> +					  struct dt_info *dti,
> +				          struct node *node)
> +{
> +	struct provider *provider =3D c->data;
> +	struct property *prop;
> +
> +	prop =3D get_property(node, provider->prop_name);
> +	if (!prop)
> +		return;
> +
> +	check_property_phandle_args(c, dti, node, prop, provider);
> +}
> +#define WARNING_PROPERTY_PHANDLE_CELLS(nm, propname, cells_name, ...) \
> +	static struct provider nm##_provider =3D { (propname), (cells_name), __=
VA_ARGS__ }; \
> +	WARNING(nm##_property, check_provider_cells_property, &nm##_provider, &=
phandle_references);
> +
> +WARNING_PROPERTY_PHANDLE_CELLS(clocks, "clocks", "#clock-cells");
> +WARNING_PROPERTY_PHANDLE_CELLS(cooling_device, "cooling-device", "#cooli=
ng-cells");
> +WARNING_PROPERTY_PHANDLE_CELLS(dmas, "dmas", "#dma-cells");
> +WARNING_PROPERTY_PHANDLE_CELLS(hwlocks, "hwlocks", "#hwlock-cells");
> +WARNING_PROPERTY_PHANDLE_CELLS(interrupts_extended, "interrupts-extended=
", "#interrupt-cells");
> +WARNING_PROPERTY_PHANDLE_CELLS(io_channels, "io-channels", "#io-channel-=
cells");
> +WARNING_PROPERTY_PHANDLE_CELLS(iommus, "iommus", "#iommu-cells");
> +WARNING_PROPERTY_PHANDLE_CELLS(mboxes, "mboxes", "#mbox-cells");
> +WARNING_PROPERTY_PHANDLE_CELLS(msi_parent, "msi-parent", "#msi-cells", t=
rue);
> +WARNING_PROPERTY_PHANDLE_CELLS(mux_controls, "mux-controls", "#mux-contr=
ol-cells");
> +WARNING_PROPERTY_PHANDLE_CELLS(phys, "phys", "#phy-cells");
> +WARNING_PROPERTY_PHANDLE_CELLS(power_domains, "power-domains", "#power-d=
omain-cells");
> +WARNING_PROPERTY_PHANDLE_CELLS(pwms, "pwms", "#pwm-cells");
> +WARNING_PROPERTY_PHANDLE_CELLS(resets, "resets", "#reset-cells");
> +WARNING_PROPERTY_PHANDLE_CELLS(sound_dais, "sound-dais", "#sound-dai-cel=
ls");
> +WARNING_PROPERTY_PHANDLE_CELLS(thermal_sensors, "thermal-sensors", "#the=
rmal-sensor-cells");
> +
>  static struct check *check_table[] =3D {
>  	&duplicate_node_names, &duplicate_property_names,
>  	&node_name_chars, &node_name_format, &property_name_chars,
> @@ -987,6 +1074,23 @@ static struct check *check_table[] =3D {
>  	&avoid_default_addr_size,
>  	&obsolete_chosen_interrupt_controller,
> =20
> +	&clocks_property,
> +	&cooling_device_property,
> +	&dmas_property,
> +	&hwlocks_property,
> +	&interrupts_extended_property,
> +	&io_channels_property,
> +	&iommus_property,
> +	&mboxes_property,
> +	&msi_parent_property,
> +	&mux_controls_property,
> +	&phys_property,
> +	&power_domains_property,
> +	&pwms_property,
> +	&resets_property,
> +	&sound_dais_property,
> +	&thermal_sensors_property,
> +
>  	&always_fail,
>  };
> =20
> diff --git a/dtc.h b/dtc.h
> index 409db76c94b7..3c0532a7c3ab 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -216,6 +216,7 @@ void append_to_property(struct node *node,
>  const char *get_unitname(struct node *node);
>  struct property *get_property(struct node *node, const char *propname);
>  cell_t propval_cell(struct property *prop);
> +cell_t propval_cell_n(struct property *prop, int n);
>  struct property *get_property_by_label(struct node *tree, const char *la=
bel,
>  				       struct node **node);
>  struct marker *get_marker_label(struct node *tree, const char *label,
> diff --git a/livetree.c b/livetree.c
> index aecd27875fdd..c815176ec241 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -396,6 +396,12 @@ cell_t propval_cell(struct property *prop)
>  	return fdt32_to_cpu(*((fdt32_t *)prop->val.val));
>  }
> =20
> +cell_t propval_cell_n(struct property *prop, int n)
> +{
> +	assert(prop->val.len / sizeof(cell_t) >=3D n);
> +	return fdt32_to_cpu(*((fdt32_t *)prop->val.val + n));
> +}
> +
>  struct property *get_property_by_label(struct node *tree, const char *la=
bel,
>  				       struct node **node)
>  {
> diff --git a/tests/bad-phandle-cells.dts b/tests/bad-phandle-cells.dts
> new file mode 100644
> index 000000000000..7f7c6a25fd25
> --- /dev/null
> +++ b/tests/bad-phandle-cells.dts
> @@ -0,0 +1,11 @@
> +/dts-v1/;
> +
> +/ {
> +	intc: interrupt-controller {
> +		#interrupt-cells =3D <3>;
> +	};
> +
> +	node {
> +		interrupts-extended =3D <&intc>;
> +	};
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 3bc5b41ce76d..7cbc6971130a 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -550,6 +550,7 @@ dtc_tests () {
>      check_tests unit-addr-without-reg.dts unit_address_vs_reg
>      check_tests unit-addr-leading-0x.dts unit_address_format
>      check_tests unit-addr-leading-0s.dts unit_address_format
> +    check_tests bad-phandle-cells.dts interrupts_extended_property
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

--worL9B4ITIAQZ1FS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmeM/cACgkQbDjKyiDZ
s5L6XhAAn+a6IzXi9TjLdGtJZ5NZmAeI1Gdj1Afdk/+KDVXNxJewjIqf37U5YVvl
vcQERk1X5mSwbPbIJJEkB4UJ47qIHuejf71gb+y3S7CfEbtcVGaw7Kekz1q1pTS7
GibLX8v/SL1RnhbB9QhjemztiBeNRUzcSlEg2BpSLWtJAvgytdgt0hytHeEqr8RK
GoBkhh5hVoL5+lMZ7hxnlKKBdSWM+6zJuoUhpqH9CNhvV8YDkxGT5s1Ju8gNJqis
3L6Jm5e9XW7tGYNxq8ucfHQBdP1f7bMjQdnq0Y9pY4uXlMDEP+8pMnIC44VeNi91
d1hLOmhS++jIwJLqYYd66bCeCoWoWSk8ppkHRwZc4LeVm33Vu9F5JmP5HHXypQ3n
cajjPpZHJySnL1xI2ZwuFI8XuEaRijDJK6OYw//NKbrTLERC3clsE/MaEAzjoXs2
AEH+D3q5sykW+WUOAE70Yo5dbCdRsF0nULd6Je0QBTiUsUXFZlPXFhgFpYSs/QYp
8Sgfe8GQtvOvD1Sw3s5Q09yubo3lGEm3K/d+Q7YTOENwJXZxLEyys+HRBIT9aMfW
rrlR6hAIInZJd64itZeTaOxCopwj77bwZhjbqKzVeOlsCx/JppjkEoesfcJxrypL
UvYiK0V6h6L0GluD2MCAsp/sIf385UWaeaGL+8bII60onMDvq/U=
=qAl+
-----END PGP SIGNATURE-----

--worL9B4ITIAQZ1FS--
