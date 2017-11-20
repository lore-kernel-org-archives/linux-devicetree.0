From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/5] checks: add string list check
Date: Mon, 20 Nov 2017 11:10:34 +1100
Message-ID: <20171120001034.GG19214@umbus.fritz.box>
References: <20171117144515.10870-1-robh@kernel.org>
 <20171117144515.10870-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gKijDXBCEH69PxaN"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171117144515.10870-3-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--gKijDXBCEH69PxaN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2017 at 08:45:12AM -0600, Rob Herring wrote:
> Add a check for string list properties with compatible being the first
> check.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Not applying right now, while resolving queries on 1/5.

> ---
>  checks.c                   | 34 ++++++++++++++++++++++++++++++++++
>  tests/bad-string-props.dts |  8 ++++++++
>  tests/run_tests.sh         |  2 +-
>  3 files changed, 43 insertions(+), 1 deletion(-)
>=20
> diff --git a/checks.c b/checks.c
> index a4a9d37ca19b..4e23f29486bb 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -179,6 +179,36 @@ static void check_is_string(struct check *c, struct =
dt_info *dti,
>  #define ERROR_IF_NOT_STRING(nm, propname) \
>  	ERROR(nm, check_is_string, (propname))
> =20
> +static void check_is_string_list(struct check *c, struct dt_info *dti,
> +				 struct node *node)
> +{
> +	int rem, l;
> +	struct property *prop;
> +	char *propname =3D c->data;
> +	char *str;
> +
> +	prop =3D get_property(node, propname);
> +	if (!prop)
> +		return; /* Not present, assumed ok */
> +
> +	str =3D prop->val.val;
> +	rem =3D prop->val.len;
> +	while (rem > 0) {
> +		l =3D strnlen(str, rem);
> +		if (l =3D=3D rem) {
> +			FAIL(c, dti, "\"%s\" property in %s is not a string list",
> +			     propname, node->fullpath);
> +			break;
> +		}
> +		rem -=3D l + 1;
> +		str +=3D l + 1;
> +	}
> +}
> +#define WARNING_IF_NOT_STRING_LIST(nm, propname) \
> +	WARNING(nm, check_is_string_list, (propname))
> +#define ERROR_IF_NOT_STRING_LIST(nm, propname) \
> +	ERROR(nm, check_is_string_list, (propname))
> +
>  static void check_is_cell(struct check *c, struct dt_info *dti,
>  			  struct node *node)
>  {
> @@ -590,6 +620,8 @@ WARNING_IF_NOT_STRING(label_is_string, "label");
>  WARNING_IF_NOT_STRING(bootargs_is_string, "bootargs");
>  WARNING_IF_NOT_STRING(stdout_path_is_string, "stdout-path");
> =20
> +WARNING_IF_NOT_STRING_LIST(compatible_is_string_list, "compatible");
> +
>  static void fixup_addr_size_cells(struct check *c, struct dt_info *dti,
>  				  struct node *node)
>  {
> @@ -1241,6 +1273,8 @@ static struct check *check_table[] =3D {
>  	&device_type_is_string, &model_is_string, &status_is_string,
>  	&label_is_string, &bootargs_is_string, &stdout_path_is_string,
> =20
> +	&compatible_is_string_list,
> +
>  	&property_name_chars_strict,
>  	&node_name_chars_strict,
> =20
> diff --git a/tests/bad-string-props.dts b/tests/bad-string-props.dts
> index 9b5a7a1736ee..5e226ce0c736 100644
> --- a/tests/bad-string-props.dts
> +++ b/tests/bad-string-props.dts
> @@ -7,4 +7,12 @@
>  	bootargs =3D <0xdeadbeef>;
>  	stdout-path =3D <0xdeadbeef>;
>  	label =3D <0xdeadbeef>;
> +
> +	node1 {
> +		compatible =3D <0xdeadbeef>;
> +	};
> +
> +	node2 {
> +		compatible =3D "good", <0xdeadbeef>;
> +	};
>  };
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index c610aaeb053e..f492cf78ae84 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -546,7 +546,7 @@ dtc_tests () {
>      check_tests bad-name-property.dts name_properties
> =20
>      check_tests bad-ncells.dts address_cells_is_cell size_cells_is_cell =
interrupt_cells_is_cell
> -    check_tests bad-string-props.dts device_type_is_string model_is_stri=
ng status_is_string bootargs_is_string stdout_path_is_string label_is_string
> +    check_tests bad-string-props.dts device_type_is_string model_is_stri=
ng status_is_string bootargs_is_string stdout_path_is_string label_is_strin=
g compatible_is_string_list
>      check_tests bad-reg-ranges.dts reg_format ranges_format
>      check_tests bad-empty-ranges.dts ranges_format
>      check_tests reg-ranges-root.dts reg_format ranges_format

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gKijDXBCEH69PxaN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAloSHXoACgkQbDjKyiDZ
s5LvcxAAlYpOR+reEYWq8qNpF+RwMKQWfO/kFlwnKVuv0sYOXqTJ53cTSIGC5ynt
/WdSi0+ZKjmv4JgBHSYft6vGs4A1E0nDbm7hSl8aXp13/EfHxP3uRoLQ6FWPtjl1
7w8fjGJ2mz4qel/N1YXBh8fVRBbdMtmr33gbAis1M0ZdHrmLW0eDsDdOCiqGoWnR
LYvM/v2oRSjf0WdE0WSGSkC0piFxEO3yJJRpuOfnZr45KiNpvHSkIWIkMfNcfPaa
jK/k/1fS5is3zxgpGvWlQ6jJshgV6G8j+F3F6Q4wFFy+irEz8Dv87tShR8pgPTxo
ZqJLOqdHHyfQrewojJkm2/1019XjGSEcDCcwib0s/rP6wG77cLqRzOJ5SULJLWBL
2bJRjz3IwLSMci2VGzV4bd66E5sB3xT9SjoqRSxLXqZZKcgAlX3UFFwTZD6CniDT
/ZWeUtr+nY3uzsk3Z4slEn+/Agq1l7JDxtQ/SsIwffo5A28y9tvhBYEDd4DxGtla
ZlcUm4tobyZNHfJekxoRP82WudWfyOI+sciS4ypWHxbl+hj4w7RT6rp2nZdUXn1l
3UP7LbQmhQAL5jM4Gtb5feKTtqs++yoLRMPdj2Mcrg6TtAKtugJBRCASS/xl1SMt
PvXbqQJFUqWTAFG6/6jvP1Dudo86VRyp7qbqAZj8acKVvR18rYA=
=vEUp
-----END PGP SIGNATURE-----

--gKijDXBCEH69PxaN--
