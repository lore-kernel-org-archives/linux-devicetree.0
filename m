From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 3/5] checks: Warn on node name unit-addresses with '0x'
 or leading 0s
Date: Tue, 31 Jan 2017 11:17:11 +1100
Message-ID: <20170131001711.GC14879@umbus.fritz.box>
References: <20170124174534.3865-1-robh@kernel.org>
 <20170124174534.3865-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170124174534.3865-4-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2017 at 11:45:32AM -0600, Rob Herring wrote:
> Node name unit-addresses should never begin with 0x or leading 0s
> regardless of whether they have a bus specific address (i.e. one with
> commas) or not. Add warnings to check for these cases.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I'd prefer to see this check split out on its own rather than folded
into unit_address_vs_reg.  Strictly speaking you could have a bus
binding which does specify unit addresses starting with leading 0 or
0x, although it's pretty unlikely.  Splitting this out will make it
easier to override this when we start having cases where we can really
check the unit address is correct versus the bus binding.

> ---
>  checks.c                       | 10 ++++++++++
>  tests/run_tests.sh             |  2 ++
>  tests/unit-addr-leading-0s.dts | 10 ++++++++++
>  tests/unit-addr-leading-0x.dts | 10 ++++++++++
>  4 files changed, 32 insertions(+)
>  create mode 100644 tests/unit-addr-leading-0s.dts
>  create mode 100644 tests/unit-addr-leading-0x.dts
>=20
> diff --git a/checks.c b/checks.c
> index 0c78d69316bc..8e310d69ca3d 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -288,6 +288,16 @@ static void check_unit_address_vs_reg(struct check *=
c, struct dt_info *dti,
>  		if (!unitname[0])
>  			FAIL(c, "Node %s has a reg or ranges property, but no unit name",
>  			    node->fullpath);
> +
> +		if (!strncmp(unitname, "0x", 2)) {
> +			FAIL(c, "Node %s unit name should not have leading \"0x\"",
> +			    node->fullpath);
> +			/* skip over 0x for next test */
> +			unitname +=3D 2;
> +		}
> +		if (unitname[0] =3D=3D '0' && isxdigit(unitname[1]))
> +			FAIL(c, "Node %s unit name should not have leading 0s",
> +			    node->fullpath);
>  	} else {
>  		if (unitname[0])
>  			FAIL(c, "Node %s has a unit name, but no reg property",
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 157dbaea7600..2c06666a9e23 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -539,6 +539,8 @@ dtc_tests () {
>      check_tests obsolete-chosen-interrupt-controller.dts obsolete_chosen=
_interrupt_controller
>      check_tests reg-without-unit-addr.dts unit_address_vs_reg
>      check_tests unit-addr-without-reg.dts unit_address_vs_reg
> +    check_tests unit-addr-leading-0x.dts unit_address_vs_reg
> +    check_tests unit-addr-leading-0s.dts unit_address_vs_reg
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

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYj9eEAAoJEGw4ysog2bOSa7UQAIyAlO30uIr0wdjPezEKLC5v
KT51pbdiYJ1xW++RW5QbrOl/gsaHSq9BgdLN8pRteyyPBAR2gUKKAqfgqS9GJgxn
TAEjGFAnaRPspp74Fb3wx5dxXcJbBaywYsaRrj/QiG5IByRuXWOKJ4vHDuuuNw8H
OrMOmv/n4jO7EYRw3SNW6hJnclLFAmgF4JxM223uNv9W6/JvLqtEcacwk0hp9Fvl
W7Tq4MNgTXxGBhaIf9QGFpX8PXHPuC5CYQgbLvwypUyfSaj6K79tZiR2T0sxJVqy
Hcz54K8EmBHym/Te99rl1TPsRkvMhFZmnHt2es3NEaWmfZRw24HN91uZgPnaHWcY
fBSq8lsy+HHYXStR6gBSjUZQ24Py7lIJ4su0LGp+iTescM3Tg2HZAip7ednJLZhm
291028GYcuK2NR0zp1XzqXky8uEmPcnFTby1CLvMr9IO+1jrVPhojyWT/LIU4VJN
hUs1BczT8M67TKDN5eUpPi6lxykdH4yZPeSYZ73zpy5UvdR8RE19otuhj4ZLM3Mp
SjW5XOa6MywKrP6MCCQskkC4yUSDk4EzVvdz+XxcrPGdKxF/9DfEQ2BOvjPS+uAY
OQESsmMwiuseexX8tGtwES+M/b+3q9SuHCB/Br4kg6YyurfyuwYOKPh1tqZojFws
Rdjmd/TDH5+mmgKx+cFu
=OWWl
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
