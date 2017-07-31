From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 2/2] tests: Add stacked overlay tests on fdtoverlay
Date: Mon, 31 Jul 2017 23:36:06 +1000
Message-ID: <20170731133606.GM2652@umbus.fritz.box>
References: <1501003476-2480-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1501003476-2480-3-git-send-email-pantelis.antoniou@konsulko.com>
 <20170731133530.GL2652@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DN8g+DOX2TxGxleI"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170731133530.GL2652-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--DN8g+DOX2TxGxleI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2017 at 11:35:30PM +1000, David Gibson wrote:
> On Tue, Jul 25, 2017 at 08:24:36PM +0300, Pantelis Antoniou wrote:
> > Add a stacked overlay unit test, piggybacking on fdtoverlay.
> >=20
> > Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > ---
> >  tests/run_tests.sh             | 15 +++++++++++++++
> >  tests/stacked_overlay_bar.dts  | 13 +++++++++++++
> >  tests/stacked_overlay_base.dts |  6 ++++++
> >  tests/stacked_overlay_baz.dts  | 13 +++++++++++++
> >  4 files changed, 47 insertions(+)
> >  create mode 100644 tests/stacked_overlay_bar.dts
> >  create mode 100644 tests/stacked_overlay_base.dts
> >  create mode 100644 tests/stacked_overlay_baz.dts
> >=20
> > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > index b8a2825..9e3d35d 100755
> > --- a/tests/run_tests.sh
> > +++ b/tests/run_tests.sh
> > @@ -791,6 +791,21 @@ fdtoverlay_tests() {
> > =20
> >      # test that the new property is installed
> >      run_fdtoverlay_test foobar "/test-node" "test-str-property" "-ts" =
${basedtb} ${targetdtb} ${overlaydtb}
> > +
> > +    stacked_base=3Dstacked_overlay_base.dts
> > +    stacked_basedtb=3Dstacked_overlay_base.fdtoverlay.test.dtb
> > +    stacked_bar=3Dstacked_overlay_bar.dts
> > +    stacked_bardtb=3Dstacked_overlay_bar.fdtoverlay.test.dtb
> > +    stacked_baz=3Dstacked_overlay_baz.dts
> > +    stacked_bazdtb=3Dstacked_overlay_baz.fdtoverlay.test.dtb
> > +    stacked_targetdtb=3Dstacked_overlay_target.fdoverlay.test.dtb
>=20
> Typo here                                       ^^^

Apart from that,

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>


>=20
> > +
> > +    run_dtc_test -@ -I dts -O dtb -o $stacked_basedtb $stacked_base
> > +    run_dtc_test -@ -I dts -O dtb -o $stacked_bardtb $stacked_bar
> > +    run_dtc_test -@ -I dts -O dtb -o $stacked_bazdtb $stacked_baz
> > +
> > +    # test that baz correctly inserted the property
> > +    run_fdtoverlay_test baz "/foonode/barnode/baznode" "baz-property" =
"-ts" ${stacked_basedtb} ${stacked_targetdtb} ${stacked_bardtb} ${stacked_b=
azdtb}
> >  }
> > =20
> >  pylibfdt_tests () {
> > diff --git a/tests/stacked_overlay_bar.dts b/tests/stacked_overlay_bar.=
dts
> > new file mode 100644
> > index 0000000..c646399
> > --- /dev/null
> > +++ b/tests/stacked_overlay_bar.dts
> > @@ -0,0 +1,13 @@
> > +/dts-v1/;
> > +/plugin/;
> > +/ {
> > +	fragment@1 {
> > +		target =3D <&foo>;
> > +		__overlay__ {
> > +			overlay-1-property;
> > +			bar: barnode {
> > +				bar-property =3D "bar";
> > +			};
> > +		};
> > +	};
> > +};
> > diff --git a/tests/stacked_overlay_base.dts b/tests/stacked_overlay_bas=
e.dts
> > new file mode 100644
> > index 0000000..2916423
> > --- /dev/null
> > +++ b/tests/stacked_overlay_base.dts
> > @@ -0,0 +1,6 @@
> > +/dts-v1/;
> > +/ {
> > +	foo: foonode {
> > +		foo-property =3D "foo";
> > +	};
> > +};
> > diff --git a/tests/stacked_overlay_baz.dts b/tests/stacked_overlay_baz.=
dts
> > new file mode 100644
> > index 0000000..a52f0cc
> > --- /dev/null
> > +++ b/tests/stacked_overlay_baz.dts
> > @@ -0,0 +1,13 @@
> > +/dts-v1/;
> > +/plugin/;
> > +/ {
> > +	fragment@1 {
> > +		target =3D <&bar>;
> > +		__overlay__ {
> > +			overlay-2-property;
> > +			baz: baznode {
> > +				baz-property =3D "baz";
> > +			};
> > +		};
> > +	};
> > +};
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DN8g+DOX2TxGxleI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll/MkYACgkQbDjKyiDZ
s5IqyRAAi1Ld/lEUfhBiNf/s5Tu0G2/v2malXXpzJ7vVgFFlttLlmyNxdZHY1LT6
2to/p2IGW1uBZT4pzrdurytZHWEwDkdYOCttsYjH3RAlCJ6CBUQTOEFdzXUMDwRh
93PTrxZmH8L0VsnE0veYYwzfdy57jUEe+FePZzO9h5PIw2q9SfVpBf1gB0U+HAT8
kDB56BSZrOiPbAJcZJwXY6dxLlk0TY5TO0uxvXq5R2zKfl1BZfEVOfnghqhG0a3g
ni4y5yradT2ly8JnflpUYdpjYErKalmpQ+bHSHNgBlN/GQSVi3IfwmMi1rQp7yDY
LrhUaijPc9/ql2Rgn3/tT6OHGhqgxGK5OPlKA6DfCUGyB8QjEwfvcdyFoTZ2mCq7
89urX4qiCBIg5HGCmct2zNHiq1zgrX7f++DRRVYS5gHcHVr4F1kppnptC7tre0EU
LWwNe4oOnXbxqk7cRtnYljAabwAonoATEpiBZATA/3uC/ir4DTDsnmt+qsHNJbaH
HPu1MKA/RhSJL4w9TEsmtVrg3/mNLOppJyTbXLDuev8LOzwkLX7F+Jpp4990WQqM
riqmk5bzhQKEK3GepfhoQhgDEa/YJMfEYdKuDtP9a4PouGoGvDmse7uX9uipg9ZA
LzP9scJQEzsI5UO82/Xvz3xU2YNXWoz5t64m5kdIRTGL/CgNqdo=
=GKnv
-----END PGP SIGNATURE-----

--DN8g+DOX2TxGxleI--
