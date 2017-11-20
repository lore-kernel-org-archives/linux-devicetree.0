From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/5] checks: add a string checks for label, bootargs and
 stdout-path
Date: Mon, 20 Nov 2017 11:09:54 +1100
Message-ID: <20171120000954.GF19214@umbus.fritz.box>
References: <20171117144515.10870-1-robh@kernel.org>
 <20171117144515.10870-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eMnpOGXCMazMAbfp"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171117144515.10870-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--eMnpOGXCMazMAbfp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2017 at 08:45:11AM -0600, Rob Herring wrote:
> Add more string property checks for label, bootargs, and stdout-path.

Where does 'label' appear?  I'm not immediately recalling it as a
property with global meaning.

bootargs and stdout-path are from /chosen of course.  I have some
mixed feelings about whether it's reasonable to check it's a string
everywhere, rather than specifically just in /chosen.

> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  checks.c                   | 4 ++++
>  tests/bad-string-props.dts | 3 +++
>  tests/run_tests.sh         | 2 +-
>  3 files changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/checks.c b/checks.c
> index f5bf5f97a3ad..a4a9d37ca19b 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -586,6 +586,9 @@ WARNING_IF_NOT_CELL(interrupt_cells_is_cell, "#interr=
upt-cells");
>  WARNING_IF_NOT_STRING(device_type_is_string, "device_type");
>  WARNING_IF_NOT_STRING(model_is_string, "model");
>  WARNING_IF_NOT_STRING(status_is_string, "status");
> +WARNING_IF_NOT_STRING(label_is_string, "label");
> +WARNING_IF_NOT_STRING(bootargs_is_string, "bootargs");
> +WARNING_IF_NOT_STRING(stdout_path_is_string, "stdout-path");
> =20
>  static void fixup_addr_size_cells(struct check *c, struct dt_info *dti,
>  				  struct node *node)
> @@ -1236,6 +1239,7 @@ static struct check *check_table[] =3D {
> =20
>  	&address_cells_is_cell, &size_cells_is_cell, &interrupt_cells_is_cell,
>  	&device_type_is_string, &model_is_string, &status_is_string,
> +	&label_is_string, &bootargs_is_string, &stdout_path_is_string,
> =20
>  	&property_name_chars_strict,
>  	&node_name_chars_strict,
> diff --git a/tests/bad-string-props.dts b/tests/bad-string-props.dts
> index 396f82069cf7..9b5a7a1736ee 100644
> --- a/tests/bad-string-props.dts
> +++ b/tests/bad-string-props.dts
> @@ -4,4 +4,7 @@
>  	device_type =3D <0xdeadbeef>;
>  	model =3D <0xdeadbeef>;
>  	status =3D <0xdeadbeef>;
> +	bootargs =3D <0xdeadbeef>;
> +	stdout-path =3D <0xdeadbeef>;
> +	label =3D <0xdeadbeef>;
>  };
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 850bc165e757..c610aaeb053e 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -546,7 +546,7 @@ dtc_tests () {
>      check_tests bad-name-property.dts name_properties
> =20
>      check_tests bad-ncells.dts address_cells_is_cell size_cells_is_cell =
interrupt_cells_is_cell
> -    check_tests bad-string-props.dts device_type_is_string model_is_stri=
ng status_is_string
> +    check_tests bad-string-props.dts device_type_is_string model_is_stri=
ng status_is_string bootargs_is_string stdout_path_is_string label_is_string
>      check_tests bad-reg-ranges.dts reg_format ranges_format
>      check_tests bad-empty-ranges.dts ranges_format
>      check_tests reg-ranges-root.dts reg_format ranges_format

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--eMnpOGXCMazMAbfp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAloSHVIACgkQbDjKyiDZ
s5JU+BAAiEmvmljXcE061xgFMbaJO7eARHENUmhPqCFJW9W6DYRJ7KDw6x/SW0Lv
aVJI++oU1bTpTnuxtD5m/YLRn7JoC3Oii3xUis10ZVqZNG0JbWoOX6ZfTzGp5YMk
sv6FVKUtnQKfBAiF/Ul0fyvPMG36AYJMsRgcbygwFtxMKIh/GZcY9B5nlgcMKSbb
tWGIvESyv9vXLbt++yGKSV5lYmIHgwoHk9SQUfNt4dCkeBNIq/pRe7+4U/kkq/FO
nr1XvZXOR9mUDf1Q2hLsQCaxk5Crmm9wUcd7DVT8k6Wbpdk5/nAXVjd9uEgJsCPS
cIlGAvYn0BzqFTOzaabZZcjV6n6MaOLvz8CVSl5sy3dGdFh+5mZQaKyAGRTvla9z
LbGt75DL79vA6NnFPujfPsSPhAe6X788AtRFpGgNjcey05IOJAO6ERCq05aZGUMF
eR61ueWzQjisHUGmKS0Hj94A6As0UNrfnxK5ZXKbIKOApPNH2Pol0ikNl4l4uZJK
sbU3/WEQpjzh+IIFee92+i/BnXzSW84E2SCPZwsbTjBfixGG9F9nmObC0vy+yA2q
WB5wkfHJLFznAhRvKHc5YmUI+QekrukqGi/unmMLOI8FLr+vYhqdBAif3JS62FzE
sx8VRdyNnDytIpebGXck3j+i38WPDEcfRTTypj3drjyBXC9PLKg=
=HOZ4
-----END PGP SIGNATURE-----

--eMnpOGXCMazMAbfp--
