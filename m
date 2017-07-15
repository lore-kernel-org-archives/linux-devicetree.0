From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 2/2] tests: Add stacked overlay tests on fdtoverlay
Date: Sat, 15 Jul 2017 18:08:40 +1000
Message-ID: <20170715080840.GK17539@umbus.fritz.box>
References: <1499894659-25775-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1499894659-25775-3-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yiup30KVCQiHUZFC"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1499894659-25775-3-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--yiup30KVCQiHUZFC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2017 at 12:24:19AM +0300, Pantelis Antoniou wrote:
> Add a stacked overlay unit test, piggybacking on fdtoverlay.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

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
> index d20729c..cecc6d2 100755
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

--yiup30KVCQiHUZFC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAllpzX8ACgkQbDjKyiDZ
s5IjqQ/7BV8BdYe8x9bkZWKl/+R/1sEJLf+kpSsePGS//2+BUGkvU8lDmylxbWPb
gaU7zTrR8MlpIWbVWOYBWJ2+lTuNbNp6b4e9Qt80zHEoqFWFOk+Zxt+KPsInR+pd
PKVuqfQWTLmIPGJlG+rrvUXcmthFhlRcYhVvndF3PM41Md1Az6ARQYYtHYYpESp6
aDCiYs20Vso+nXE6VhrxEdTsZSepJfUKp/Va61QHt8BWBudHcoTMrDYSybrv+HlY
KOn0NbRRVjaj/P6LTeeIxyqs2fbuuaSUWMIb4QctvpzMjCd36Ap1+NM8SXacp2C2
9Y4eF0ZIbm34JCmyd9iry48pg8FYCH/QuSGosTvuWrLBPXO1B4ujwev2h+nEKPtk
ygx76MjeDViBkPCQPZtzLq/vyRctUktPjcALNBKo8WcTtAvuRxpEqpVPRmbbTG16
mLzLYuEy5/wsERIAbwZ8Gnwf+2t7XaTVClpaTXPCEBdiGkeLQih7ZcVP7buuy1Od
3s8Z8+0ijyE6zg1smUBa7BgWCwPYdtsoLV9PmEQvlTC4MxKK1N7CdzTRvbLWjMgq
pvI0kTov/I0wnSZZAZ0ICNuY5aGrNFd4aO664wDtHdbT6fZ6F4DPfH7EC5xk1ePQ
Z20OuMBVlo1Dl1HDYX2Tcqi3qfXIF8iTb/iMJqedbE0RPYLCDG8=
=ob+G
-----END PGP SIGNATURE-----

--yiup30KVCQiHUZFC--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
