From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 3/3] checks: Warn on node name unit-addresses with
 '0x' or leading 0s
Date: Fri, 3 Mar 2017 13:12:58 +1100
Message-ID: <20170303021258.GE4067@umbus.fritz.box>
References: <20170228224310.14162-1-robh@kernel.org>
 <20170228224310.14162-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5xSkJheCpeK0RUEJ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170228224310.14162-4-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--5xSkJheCpeK0RUEJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2017 at 04:43:10PM -0600, Rob Herring wrote:
> Node name unit-addresses should generally never begin with 0x or leading
> 0s. Add warnings to check for these cases, but only for nodes without a
> known bus type as there should be better bus specific checks of the
> unit address in those cases. Any unit addresses that don't follow the
> general rule will need to add a new bus type. There aren't any known
> ones ATM.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

In the context of the other two patches,

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

> ---
> v3:
> - Only run check if bus type is not set (moving to the end of the series
>   as a result). The bus bridge checks also must be a dependency.
>=20
> v2:
> - Split into separate check from unit_address_vs_reg
>=20
>  checks.c                       | 25 +++++++++++++++++++++++++
>  tests/run_tests.sh             |  2 ++
>  tests/unit-addr-leading-0s.dts | 12 ++++++++++++
>  tests/unit-addr-leading-0x.dts | 12 ++++++++++++
>  4 files changed, 51 insertions(+)
>  create mode 100644 tests/unit-addr-leading-0s.dts
>  create mode 100644 tests/unit-addr-leading-0x.dts
>=20
> diff --git a/checks.c b/checks.c
> index c4865b4c8da0..537c27dc4082 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -883,6 +883,30 @@ static void check_simple_bus_reg(struct check *c, st=
ruct dt_info *dti, struct no
>  }
>  WARNING(simple_bus_reg, check_simple_bus_reg, NULL, &reg_format, &simple=
_bus_bridge);
> =20
> +static void check_unit_address_format(struct check *c, struct dt_info *d=
ti,
> +				      struct node *node)
> +{
> +	const char *unitname =3D get_unitname(node);
> +
> +	if (node->parent && node->parent->bus)
> +		return;
> +
> +	if (!unitname[0])
> +		return;
> +
> +	if (!strncmp(unitname, "0x", 2)) {
> +		FAIL(c, dti, "Node %s unit name should not have leading \"0x\"",
> +		    node->fullpath);
> +		/* skip over 0x for next test */
> +		unitname +=3D 2;
> +	}
> +	if (unitname[0] =3D=3D '0' && isxdigit(unitname[1]))
> +		FAIL(c, dti, "Node %s unit name should not have leading 0s",
> +		    node->fullpath);
> +}
> +WARNING(unit_address_format, check_unit_address_format, NULL,
> +	&node_name_format, &pci_bridge, &simple_bus_bridge);
> +
>  /*
>   * Style checks
>   */
> @@ -954,6 +978,7 @@ static struct check *check_table[] =3D {
>  	&addr_size_cells, &reg_format, &ranges_format,
> =20
>  	&unit_address_vs_reg,
> +	&unit_address_format,
> =20
>  	&pci_bridge,
>  	&pci_device_reg,
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index ed489dbdd269..0f5c3db79b80 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -540,6 +540,8 @@ dtc_tests () {
>      check_tests obsolete-chosen-interrupt-controller.dts obsolete_chosen=
_interrupt_controller
>      check_tests reg-without-unit-addr.dts unit_address_vs_reg
>      check_tests unit-addr-without-reg.dts unit_address_vs_reg
> +    check_tests unit-addr-leading-0x.dts unit_address_format
> +    check_tests unit-addr-leading-0s.dts unit_address_format
>      run_sh_test dtc-checkfails.sh node_name_chars -- -I dtb -O dtb bad_n=
ode_char.dtb
>      run_sh_test dtc-checkfails.sh node_name_format -- -I dtb -O dtb bad_=
node_format.dtb
>      run_sh_test dtc-checkfails.sh prop_name_chars -- -I dtb -O dtb bad_p=
rop_char.dtb
> diff --git a/tests/unit-addr-leading-0s.dts b/tests/unit-addr-leading-0s.=
dts
> new file mode 100644
> index 000000000000..cc017e9431a2
> --- /dev/null
> +++ b/tests/unit-addr-leading-0s.dts
> @@ -0,0 +1,12 @@
> +/dts-v1/;
> +
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	bus {
> +		node@001 {
> +			reg =3D <1 0>;
> +		};
> +	};
> +};
> diff --git a/tests/unit-addr-leading-0x.dts b/tests/unit-addr-leading-0x.=
dts
> new file mode 100644
> index 000000000000..74f19678c98c
> --- /dev/null
> +++ b/tests/unit-addr-leading-0x.dts
> @@ -0,0 +1,12 @@
> +/dts-v1/;
> +
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	bus {
> +		node@0x1 {
> +			reg =3D <1 0>;
> +		};
> +	};
> +};

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5xSkJheCpeK0RUEJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYuNEpAAoJEGw4ysog2bOStdcQAJzyje5rHVX8Eakz71LGKe3x
hAKiqkRSnziSLODPpC5twjcMDnLbvhiXhDPZQSubaPNb0pZwh9RG+1/xKcCIxRkP
kaeMGmKhkM7Ut1q2JlolfU/Io9oDH5yJqcCXJNRmbjBGXSMYlDzNgsIivBOI9dI3
uB39c8WeRypvtEuaLXKGNXCKshCU+u9P0K8l6aYlG11Zi1GnMt8b4DgaGUatIniz
S4G+V25FhkYrQLFvXAVXfWYNBbiewTK//lUGa8bcMs9Caa3KqpYrfbarGzMsHmxl
OydQWJvyHjqDJOQ9p/tB9hLhalTFXDADl5G5RBXZT5kRbobIUIYA6A/qyUz0qEwi
MKgWl+ETUxMVo2kk2kdcNdu2LSHVIzwmRNhLGq8HVSn5YQWBXD271QgFLeDTezIF
SBaD8gG3B9a3eCnXQx43IzjgZ3G0Xmm6ht4gJLz0IYVhHix8nVdxB3/WUFtyBq0X
a1hy+3S9yQ/belcrdYidOpX6uW2CIwsoC7rja9iJQuUph+U95A7mKq4MXObkBWuw
rQULmWj7R2+HfdvSvGDEFOzJiqWHtFt/zE01lAr7jeCDdqzTKpQqdwrGD6Pg/5Ts
BMr+sEzHlQUNIuSiiAXS7fvJfRzppS6Xnm6yAIO6EOmzLXAEPfpi2ytutVYm2zde
MO8nkrAo2377DlWH562L
=iZz6
-----END PGP SIGNATURE-----

--5xSkJheCpeK0RUEJ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
