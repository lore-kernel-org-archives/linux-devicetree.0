From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 3/4] checks: Warn on node name unit-addresses with
 '0x' or leading 0s
Date: Mon, 13 Feb 2017 15:52:41 +1100
Message-ID: <20170213045241.GY25381@umbus>
References: <20170210164717.1234-1-robh@kernel.org>
 <20170210164717.1234-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tAdHiH28s3ybHVSb"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170210164717.1234-4-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--tAdHiH28s3ybHVSb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2017 at 10:47:16AM -0600, Rob Herring wrote:
> Node name unit-addresses should never begin with 0x or leading 0s
> regardless of whether they have a bus specific address (i.e. one with
> commas) or not. Add warnings to check for these cases.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> v2:
> - Split into separate check from unit_address_vs_reg

I'm still not thrilled with applying this test unconditionally -
especially when 4/4 introduces pretty much exactly the infrastructure
to do this better.  If you add a unit name formatter function to the
bus_type structure you really can then extend unit_address_vs_reg to
verify them against each other, which will cover this as well more
subtle mismatches.

Obviously it would only do it for known bus types - but adding a
"simple-bus" type would cover a lot of the cases, and a few for i2c
and spi would cover most of the rest.

>=20
>  checks.c                       | 21 +++++++++++++++++++++
>  tests/run_tests.sh             |  2 ++
>  tests/unit-addr-leading-0s.dts | 10 ++++++++++
>  tests/unit-addr-leading-0x.dts | 10 ++++++++++
>  4 files changed, 43 insertions(+)
>  create mode 100644 tests/unit-addr-leading-0s.dts
>  create mode 100644 tests/unit-addr-leading-0x.dts
>=20
> diff --git a/checks.c b/checks.c
> index 67237ffe594e..16d17d20caec 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -296,6 +296,26 @@ static void check_unit_address_vs_reg(struct check *=
c, struct dt_info *dti,
>  }
>  WARNING(unit_address_vs_reg, check_unit_address_vs_reg, NULL);
> =20
> +static void check_unit_address_format(struct check *c, struct dt_info *d=
ti,
> +				      struct node *node)
> +{
> +	const char *unitname =3D get_unitname(node);
> +
> +	if (!unitname[0])
> +		return;
> +
> +	if (!strncmp(unitname, "0x", 2)) {
> +		FAIL(c, "Node %s unit name should not have leading \"0x\"",
> +		    node->fullpath);
> +		/* skip over 0x for next test */
> +		unitname +=3D 2;
> +	}
> +	if (unitname[0] =3D=3D '0' && isxdigit(unitname[1]))
> +		FAIL(c, "Node %s unit name should not have leading 0s",
> +		    node->fullpath);
> +}
> +WARNING(unit_address_format, check_unit_address_format, NULL, &node_name=
_format);
> +
>  static void check_property_name_chars(struct check *c, struct dt_info *d=
ti,
>  				      struct node *node)
>  {
> @@ -753,6 +773,7 @@ static struct check *check_table[] =3D {
>  	&addr_size_cells, &reg_format, &ranges_format,
> =20
>  	&unit_address_vs_reg,
> +	&unit_address_format,
> =20
>  	&avoid_default_addr_size,
>  	&obsolete_chosen_interrupt_controller,
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
> index 000000000000..7c8e2cebbc84
> --- /dev/null
> +++ b/tests/unit-addr-leading-0s.dts
> @@ -0,0 +1,10 @@
> +/dts-v1/;
> +
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	node@001 {
> +		reg =3D <1 0>;
> +	};
> +};
> diff --git a/tests/unit-addr-leading-0x.dts b/tests/unit-addr-leading-0x.=
dts
> new file mode 100644
> index 000000000000..7ed7254e8dc2
> --- /dev/null
> +++ b/tests/unit-addr-leading-0x.dts
> @@ -0,0 +1,10 @@
> +/dts-v1/;
> +
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	node@0x1 {
> +		reg =3D <1 0>;
> +	};
> +};

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tAdHiH28s3ybHVSb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYoTuXAAoJEGw4ysog2bOSJUEP/jJWtjIZFin2pMqgZPYOBNOr
WGR2if2M3u3WEnmXenF9DdFtWWE00efcGD6QmqudbGBdTTW1yeniWp+gUQj4/sSZ
Afuopymliu8oB6alTUUTmQ/Ba7yk+zPeukbU6V/otzaFklrFCCXi8gm8j7JUor1A
8yWsaES4sUkzJNK/jePnB/b4MRWte+pZ1cehiKGRpI1IzSsn1/MN+3MuZ2I00m5M
tne8ZxRqY1WYEdbH2tX+PmeoZ1D3VxrfO0xrJA+CywAnwLPNm76sgx+Ecn1NZF/4
0me08rOjt2mjxH4hv6ooGnmoBJtAu3Y5PtUHFZIiJK2FIB1/FlQzorh8IKMP/RIe
UarWvncqem+EN6ssUOvdf2zdwABUfTgTbwwem7uLaRge3YzupieKdHBiy67QCiY+
ZMeI+qPfxpfbHP9qlZGVCHgWDqJ+JAKv3UXCq01/seCTTLjLn1dg4VvwLZrGLckT
cQyTwx8xEPusQCoDtjIeClvfKCz8z/1EHDisky0IJZEEXGteZ+og2y3LIHT1P3ma
/9GnkOj2yKH9fhGDsr1UsoeC2r6jJrFmm6HsKRP7m5kt7+/Nr0pZ6PCnFUJBkLoM
+xdX78O340EwEVgrEZ9knHxHdr55/TmwvupTVhcYYrT8GWD3d6bUEYWzbxIuvrGb
yrLkRPNLD+v89u4nw3wV
=v2Yz
-----END PGP SIGNATURE-----

--tAdHiH28s3ybHVSb--
