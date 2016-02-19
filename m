From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/2] Warn on node name unit-addresses with '0x' or
 leading 0s
Date: Fri, 19 Feb 2016 16:07:09 +1100
Message-ID: <20160219050709.GB15224@voom.fritz.box>
References: <1455223619-16052-1-git-send-email-robh@kernel.org>
 <1455223619-16052-3-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PAKmkkBo0+rTwAqJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455223619-16052-3-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--PAKmkkBo0+rTwAqJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2016 at 02:46:59PM -0600, Rob Herring wrote:
> Node name unit-addresses should never begin with 0x or leading 0s
> regardless of whether they have a bus specific address (i.e. one with
> commas) or not. Add warnings to check for these cases.

Hmm.. I'm pretty sure that's true in practice, but it's not true in
theory.  A bus could define it's unit address format just about
however it wants, including with leading 0s.

I think a better approach would be to add a test specific to
simple-bus devices (by looking at compatible on the parent) that fully
checks the unit address.

=46rom there we can start adding tests for other bus types.

>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
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
> index 4001b8c..300ab43 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -310,6 +310,16 @@ static void check_unit_address_vs_reg(struct check *=
c, struct node *dt,
>  		if (!unitname[0])
>  			FAIL(c, "Node %s has a reg or ranges property, but no unit name",
>  			    node->fullpath);
> +
> +		if (strstr(unitname, "0x") =3D=3D unitname) {
> +			FAIL(c, "Node %s unit name should not have leading \"0x\"",
> +			    node->fullpath);
> +			/* skip over 0x for next test */
> +			unitname +=3D 2;
> +		}
> +		if (unitname[0] =3D=3D '0' && isxdigit(unitname[1]))
> +			FAIL(c, "Node %s unit name should not have leading 0s",
> +			    node->fullpath);

I'd also prefer to see these extensions (or ones like them) as
separate checjs from the basic "is unit address present" test.  Makes
the output easier to interpret and allows easier control of which
checks are active.

>  	} else {
>  		if (unitname[0])
>  			FAIL(c, "Node %s has a unit name, but no reg property",
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 4b7a131..502caa6 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -445,6 +445,8 @@ dtc_tests () {
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
> index 0000000..7c8e2ce
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
> index 0000000..7ed7254
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

--PAKmkkBo0+rTwAqJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWxqL9AAoJEGw4ysog2bOSv0oQAOO1+auh2cY6p9E7suhApk5D
LHPmNekKc3IqKPx8xOfsikYTz0RAGpT4OxS2YDqXRU54usS1uc/9nSvq/BWsiFti
1+nLPVfmQPo1eSPbKOP1F5bS98UUbUeA1Ui66o1VtTyNrEmhW5aOO2m7nwHpXLZr
SVfatBfhQZsL8Tacmc2ZkzJVVeBN3p8CBcHev2+QZO+ZeORBY13mE7az0MheXiIp
bpaEbrdmKrmQAu3enqfYyNfs4rrdA3Ad0E0pFOhdGPYvZ8WFT5q9J3SGSNYqsX+1
THaqRfnXqfiz9rCwamEvmZPn2fzCWyTW45kB5yYbue1TYY1BF+cnJLTBLuuhYDn7
xlW4fMkLhQmIrdJRk1HAe0lMSSvxCJddzNzzFm67xcDGpBzzUacYpODCi9RpbLKC
4Wug2Nvg0/FhrH7v/y3EJiejXfvu3OiTZbWvZi4UqDf7INs05ZygSTaw3dytHcRY
F1xDDO4A9Kra2G1tv+fmyBJWOup/TW3a+JDmQC1Qh3PlUnyGDvKzBVDtVGkMioK4
TEmf39md0dJF0Md5Cn7DIr/KGJ55K40x7gmNG5OUzlRDLx9fG1z/jmbIMQIyCHfb
57krf3oYg0TqaKEQB49rhqC7yUsLqF/F3Uxc7Zzm4v2Xwt0xbgs4YtngScEd7qvF
if6yYiPdBk2AKvZZ+S7k
=x9TA
-----END PGP SIGNATURE-----

--PAKmkkBo0+rTwAqJ--
