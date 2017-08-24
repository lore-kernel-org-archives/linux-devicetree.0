From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 2/3] checks: add gpio binding properties check
Date: Thu, 24 Aug 2017 12:11:05 +1000
Message-ID: <20170824021105.GW5379@umbus.fritz.box>
References: <20170822230208.20987-1-robh@kernel.org>
 <20170822230208.20987-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="glDgwcODtpHomn63"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170822230208.20987-3-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--glDgwcODtpHomn63
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2017 at 06:02:07PM -0500, Rob Herring wrote:
> The GPIO binding is different compared to other phandle plus args
> properties in that the property name has a variable, optional prefix.
> The format of the property name is [<name>-]gpio{s} where <name> can
> be any legal property string. Therefore, custom matching of property
> names is needed, but the common check_property_phandle_args() function
> can still be used.
>=20
> It's possible that there are property names matching which are not GPIO
> binding specifiers. There's only been one case found in testing which is
> "[<vendor>,]nr-gpio{s}". This property has been blacklisted and the same
> should be done to any others we find. This check will prevent getting
> any more of these, too.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Not merging right now, just in case it needs any tweaks to apply on
top of a revised patch #1.

> ---
> v2:
> - New patch with GPIO checks split to separate patch
> - Add check for deprecated [<name>-]gpio form
> - Rework property name matching to include "gpio" and "gpios"
> - Skip the "gpios" property in gpio hogs binding
> - Improve the blacklisting comment
> - Add a test
>=20
>  checks.c           | 73 ++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  tests/bad-gpio.dts | 13 ++++++++++
>  tests/run_tests.sh |  2 ++
>  3 files changed, 88 insertions(+)
>  create mode 100644 tests/bad-gpio.dts
>=20
> diff --git a/checks.c b/checks.c
> index 548d7e118c42..3315a4646497 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1043,6 +1043,76 @@ WARNING_PROPERTY_PHANDLE_CELLS(resets, "resets", "=
#reset-cells");
>  WARNING_PROPERTY_PHANDLE_CELLS(sound_dais, "sound-dais", "#sound-dai-cel=
ls");
>  WARNING_PROPERTY_PHANDLE_CELLS(thermal_sensors, "thermal-sensors", "#the=
rmal-sensor-cells");
> =20
> +static bool prop_is_gpio(struct property *prop)
> +{
> +	char *str;
> +
> +	/*
> +	 * *-gpios and *-gpio can appear in property names,
> +	 * so skip over any false matches (only one known ATM)
> +	 */
> +	if (strstr(prop->name, "nr-gpio"))
> +		return false;
> +
> +	str =3D strrchr(prop->name, '-');
> +	if (str)
> +		str++;
> +	else
> +		str =3D prop->name;
> +	if (!(streq(str, "gpios") || streq(str, "gpio")))
> +		return false;
> +
> +	return true;
> +}
> +
> +static void check_gpios_property(struct check *c,
> +					  struct dt_info *dti,
> +				          struct node *node)
> +{
> +	struct property *prop;
> +
> +	/* Skip GPIO hog nodes which have 'gpios' property */
> +	if (get_property(node, "gpio-hog"))
> +		return;
> +
> +	for_each_property(node, prop) {
> +		struct provider provider;
> +
> +		if (!prop_is_gpio(prop))
> +			continue;
> +
> +		provider.prop_name =3D prop->name;
> +		provider.cell_name =3D "#gpio-cells";
> +		provider.optional =3D false;
> +		check_property_phandle_args(c, dti, node, prop, &provider);
> +	}
> +
> +}
> +WARNING(gpios_property, check_gpios_property, NULL, &phandle_references);
> +
> +static void check_deprecated_gpio_property(struct check *c,
> +					   struct dt_info *dti,
> +				           struct node *node)
> +{
> +	struct property *prop;
> +
> +	for_each_property(node, prop) {
> +		char *str;
> +
> +		if (!prop_is_gpio(prop))
> +			continue;
> +
> +		str =3D strstr(prop->name, "gpio");
> +		if (!streq(str, "gpio"))
> +			continue;
> +
> +		FAIL(c, dti, "'[*-]gpio' is deprecated, use '[*-]gpios' instead for %s=
:%s",
> +		     node->fullpath, prop->name);
> +	}
> +
> +}
> +CHECK(deprecated_gpio_property, check_deprecated_gpio_property, NULL);
> +
>  static struct check *check_table[] =3D {
>  	&duplicate_node_names, &duplicate_property_names,
>  	&node_name_chars, &node_name_format, &property_name_chars,
> @@ -1091,6 +1161,9 @@ static struct check *check_table[] =3D {
>  	&sound_dais_property,
>  	&thermal_sensors_property,
> =20
> +	&deprecated_gpio_property,
> +	&gpios_property,
> +
>  	&always_fail,
>  };
> =20
> diff --git a/tests/bad-gpio.dts b/tests/bad-gpio.dts
> new file mode 100644
> index 000000000000..6b77be447b82
> --- /dev/null
> +++ b/tests/bad-gpio.dts
> @@ -0,0 +1,13 @@
> +/dts-v1/;
> +
> +/ {
> +	gpio: gpio-controller {
> +		#gpio-cells =3D <3>;
> +	};
> +
> +	node {
> +		nr-gpios =3D <1>;
> +		foo-gpios =3D <&gpio>;
> +		bar-gpio =3D <&gpio 1 2 3>;
> +	};
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 7cbc6971130a..2a29fa4ee451 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -551,6 +551,8 @@ dtc_tests () {
>      check_tests unit-addr-leading-0x.dts unit_address_format
>      check_tests unit-addr-leading-0s.dts unit_address_format
>      check_tests bad-phandle-cells.dts interrupts_extended_property
> +    check_tests bad-gpio.dts gpios_property
> +    run_sh_test dtc-checkfails.sh deprecated_gpio_property -- -Wdeprecat=
ed_gpio_property -I dts -O dtb bad-gpio.dts
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

--glDgwcODtpHomn63
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmeNbkACgkQbDjKyiDZ
s5L3dA//TFJBZFMcdo6pR/pTVZyrcv8qx0zz5P/TTjTzwmsn0zHgQrg8Ubt0YqyJ
S7SiY3PF248/R87uaOV7Jm5Bud+fD5PPkFFxB/MHnARaODlUF8kYPRKkbxnr0tCL
d4DbzVFLXLEWogPBl79m0TkJ0JmGHACCckgNv5dpGtlzmsK5IV05J5uWpZVUxJN/
s05pCXpJukny/4Q+2GF0DZSV8IDFYhMSXFpWgmOJl2+MXuzR9Zl19jaGpgnKjnZr
DEwSJLzdNVu52VpOzxWkbXZQ4UhVXsE+m3b94bPsOcCKzEUdvl6svwKDaAbJOTQj
tOPDG1HCXETHbWgeiLRozxkWcEMJVmdgmXbDvDgKzEVn39nvYJn8sQ1OhgpyxQYl
+fmWETny3Ns2iVNRkmBzDtpKt7s2A6lQYGESe12loSJC/idDmXbKvyeFGwm2R7E+
kKFSBFdnLbhMQ/PTvMopVLoTkEHM9tNMLaZCrqXgJW2tHHnmWjmDvalGDGyEJeuB
ulWKt4qsQTnc60oCy0tbPLAzWvpkKhq5jr0KvMT9/X/3jhz/s2s865y235S/HPqu
Ffr1f6vsV6QReKG1axQd/Ge6fKOVNEf8gwAN1RVgMPtM0580N+8I15YntY0Ai9kU
qUGuDEctdLMzMtT6AsoF0c+TBNOt5U6CNo+oantBehFQIzR6qxg=
=9H1t
-----END PGP SIGNATURE-----

--glDgwcODtpHomn63--
