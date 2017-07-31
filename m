From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 2/2] tests: Add stacked overlay tests on fdtoverlay
Date: Mon, 31 Jul 2017 23:35:30 +1000
Message-ID: <20170731133530.GL2652@umbus.fritz.box>
References: <1501003476-2480-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1501003476-2480-3-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3MHXEHrrXKLGx71o"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501003476-2480-3-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--3MHXEHrrXKLGx71o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2017 at 08:24:36PM +0300, Pantelis Antoniou wrote:
> Add a stacked overlay unit test, piggybacking on fdtoverlay.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  tests/run_tests.sh             | 15 +++++++++++++++
>  tests/stacked_overlay_bar.dts  | 13 +++++++++++++
>  tests/stacked_overlay_base.dts |  6 ++++++
>  tests/stacked_overlay_baz.dts  | 13 +++++++++++++
>  4 files changed, 47 insertions(+)
>  create mode 100644 tests/stacked_overlay_bar.dts
>  create mode 100644 tests/stacked_overlay_base.dts
>  create mode 100644 tests/stacked_overlay_baz.dts
>=20
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index b8a2825..9e3d35d 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -791,6 +791,21 @@ fdtoverlay_tests() {
> =20
>      # test that the new property is installed
>      run_fdtoverlay_test foobar "/test-node" "test-str-property" "-ts" ${=
basedtb} ${targetdtb} ${overlaydtb}
> +
> +    stacked_base=3Dstacked_overlay_base.dts
> +    stacked_basedtb=3Dstacked_overlay_base.fdtoverlay.test.dtb
> +    stacked_bar=3Dstacked_overlay_bar.dts
> +    stacked_bardtb=3Dstacked_overlay_bar.fdtoverlay.test.dtb
> +    stacked_baz=3Dstacked_overlay_baz.dts
> +    stacked_bazdtb=3Dstacked_overlay_baz.fdtoverlay.test.dtb
> +    stacked_targetdtb=3Dstacked_overlay_target.fdoverlay.test.dtb

Typo here                                       ^^^

> +
> +    run_dtc_test -@ -I dts -O dtb -o $stacked_basedtb $stacked_base
> +    run_dtc_test -@ -I dts -O dtb -o $stacked_bardtb $stacked_bar
> +    run_dtc_test -@ -I dts -O dtb -o $stacked_bazdtb $stacked_baz
> +
> +    # test that baz correctly inserted the property
> +    run_fdtoverlay_test baz "/foonode/barnode/baznode" "baz-property" "-=
ts" ${stacked_basedtb} ${stacked_targetdtb} ${stacked_bardtb} ${stacked_baz=
dtb}
>  }
> =20
>  pylibfdt_tests () {
> diff --git a/tests/stacked_overlay_bar.dts b/tests/stacked_overlay_bar.dts
> new file mode 100644
> index 0000000..c646399
> --- /dev/null
> +++ b/tests/stacked_overlay_bar.dts
> @@ -0,0 +1,13 @@
> +/dts-v1/;
> +/plugin/;
> +/ {
> +	fragment@1 {
> +		target =3D <&foo>;
> +		__overlay__ {
> +			overlay-1-property;
> +			bar: barnode {
> +				bar-property =3D "bar";
> +			};
> +		};
> +	};
> +};
> diff --git a/tests/stacked_overlay_base.dts b/tests/stacked_overlay_base.=
dts
> new file mode 100644
> index 0000000..2916423
> --- /dev/null
> +++ b/tests/stacked_overlay_base.dts
> @@ -0,0 +1,6 @@
> +/dts-v1/;
> +/ {
> +	foo: foonode {
> +		foo-property =3D "foo";
> +	};
> +};
> diff --git a/tests/stacked_overlay_baz.dts b/tests/stacked_overlay_baz.dts
> new file mode 100644
> index 0000000..a52f0cc
> --- /dev/null
> +++ b/tests/stacked_overlay_baz.dts
> @@ -0,0 +1,13 @@
> +/dts-v1/;
> +/plugin/;
> +/ {
> +	fragment@1 {
> +		target =3D <&bar>;
> +		__overlay__ {
> +			overlay-2-property;
> +			baz: baznode {
> +				baz-property =3D "baz";
> +			};
> +		};
> +	};
> +};

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3MHXEHrrXKLGx71o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll/MiIACgkQbDjKyiDZ
s5KyJQ//RS4CvxOE6rz1zs2I9T6aL5TsqmUHchnUgKPstnIkZMwcrvVDGKWn10wH
rLNStdomR14GV4vUW26hQxnSnrYTH07qJjm0dLOo0OrmdPLbPrp31qeu8TsZW6z1
KeZ9vTPFSw1Ni/Ufhu5JJQXmHcdsFMEl2xTD+0ThRX5lGQzhHOjJdvEuZNVCjH6j
PaNz58PqArx9x45Ni07uxUrey2hgq4tNy5LHnoFxKSoGzdgpRuOxx0q4pmSr8HOz
F41T2ovhH+0AECDBbR8vHRS7JVoMCeY9xjreoDRuZpMZGrjcXwGzJ/LdhKcbRU7D
UOLNLX8kd6pgODCk7z5Ex07iG4fD1KWySbzBbmDCMlsVwVPcc0o+VmmgTGkJjPJT
zoZshWZK7ET1OukjuQseGw9yXxSGwtVvqGWuvuozYJSqXlNd0KC5HSkrjo7tNWMK
Y06bEYZcJarzxxR3nQzokxItv9lp63ihec4VuX1CyDX4PRAQHjmad5kJS7Vovmmo
MXtII2QM31Nc9xKc+s0z52hPpVdsBgXfk8qptrOeQelRf0IfAfkGvqui6FscPhnL
E3qAjWbGnkkwTKZ3zpsScuy1hZJkEI7BoDqmBvfhHEMAhqzQnl0vejPUSWIN54z8
Rvwm/XuNtuqMHtJO3MOGZ5KyJs+oCPXBQjldNK8NxljrN/WCPyY=
=twty
-----END PGP SIGNATURE-----

--3MHXEHrrXKLGx71o--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
