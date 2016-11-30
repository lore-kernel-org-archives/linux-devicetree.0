From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v11 4/7] tests: Add overlay tests
Date: Wed, 30 Nov 2016 11:35:49 +1100
Message-ID: <20161130003549.GB19891@umbus>
References: <1480349141-14145-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480349141-14145-5-git-send-email-pantelis.antoniou@konsulko.com>
 <20161129030807.GH13307@umbus.fritz.box>
 <17F182F7-CDF7-4052-86C2-B40505706ED4@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <17F182F7-CDF7-4052-86C2-B40505706ED4-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2016 at 01:11:43PM +0200, Pantelis Antoniou wrote:
> Hi David,
>=20
> > On Nov 29, 2016, at 05:08 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >=20
> > On Mon, Nov 28, 2016 at 06:05:38PM +0200, Pantelis Antoniou wrote:
> >> Add a number of tests for dynamic objects/overlays.
> >>=20
> >> Re-use the original test by moving the contents to a .dtsi include
> >>=20
> >> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >> ---
> >> tests/overlay_overlay_dtc.dts     | 76 +------------------------------=
----
> >> tests/overlay_overlay_dtc.dtsi    | 83 +++++++++++++++++++++++++++++++=
++++++++
> >> tests/overlay_overlay_new_dtc.dts | 11 ++++++
> >> tests/overlay_overlay_simple.dts  | 12 ++++++
> >> tests/run_tests.sh                | 41 +++++++++++++++++++
> >> 5 files changed, 148 insertions(+), 75 deletions(-)
> >> create mode 100644 tests/overlay_overlay_dtc.dtsi
> >> create mode 100644 tests/overlay_overlay_new_dtc.dts
> >> create mode 100644 tests/overlay_overlay_simple.dts
> >>=20
> >> diff --git a/tests/overlay_overlay_dtc.dts b/tests/overlay_overlay_dtc=
=2Edts
> >> index 30d2362..ca943ea 100644
> >> --- a/tests/overlay_overlay_dtc.dts
> >> +++ b/tests/overlay_overlay_dtc.dts
> >> @@ -8,78 +8,4 @@
> >> /dts-v1/;
> >> /plugin/;
> >>=20
> >> -/ {
> >> -	/* Test that we can change an int by another */
> >> -	fragment@0 {
> >> -		target =3D <&test>;
> >> -
> >> -		__overlay__ {
> >> -			test-int-property =3D <43>;
> >> -		};
> >> -	};
> >> -
> >> -	/* Test that we can replace a string by a longer one */
> >> -	fragment@1 {
> >> -		target =3D <&test>;
> >> -
> >> -		__overlay__ {
> >> -			test-str-property =3D "foobar";
> >> -		};
> >> -	};
> >> -
> >> -	/* Test that we add a new property */
> >> -	fragment@2 {
> >> -		target =3D <&test>;
> >> -
> >> -		__overlay__ {
> >> -			test-str-property-2 =3D "foobar2";
> >> -		};
> >> -	};
> >> -
> >> -	/* Test that we add a new node (by phandle) */
> >> -	fragment@3 {
> >> -		target =3D <&test>;
> >> -
> >> -		__overlay__ {
> >> -			new-node {
> >> -				new-property;
> >> -			};
> >> -		};
> >> -	};
> >> -
> >> -	fragment@5 {
> >> -		target =3D <&test>;
> >> -
> >> -		__overlay__ {
> >> -			local: new-local-node {
> >> -				new-property;
> >> -			};
> >> -		};
> >> -	};
> >> -
> >> -	fragment@6 {
> >> -		target =3D <&test>;
> >> -
> >> -		__overlay__ {
> >> -			test-phandle =3D <&test>, <&local>;
> >> -		};
> >> -	};
> >> -
> >> -	fragment@7 {
> >> -		target =3D <&test>;
> >> -
> >> -		__overlay__ {
> >> -			test-several-phandle =3D <&local>, <&local>;
> >> -		};
> >> -	};
> >> -
> >> -	fragment@8 {
> >> -		target =3D <&test>;
> >> -
> >> -		__overlay__ {
> >> -			sub-test-node {
> >> -				new-sub-test-property;
> >> -			};
> >> -		};
> >> -	};
> >> -};
> >> +/include/ "overlay_overlay_dtc.dtsi"
> >=20
> > Don't duplicate this, just replace it with the new style.  This only
> > existed as essentially documentation for the libfdt overlay
> > application stuff.  Since the new dtc won't support the old tag
> > format, there's no point having a test for it.
>=20
> The parser now handles both tag formats just fine. I could remove support
> for it if you=E2=80=99re willing to tackle the flak.

Oh, sorry, I missed that.

I'd suggest having that controlled by the same "backwards compat"
option to control magic number and other things.  Although changing
parser behaviour based on flags can get fiddly.

>=20
> >> diff --git a/tests/overlay_overlay_dtc.dtsi b/tests/overlay_overlay_dt=
c.dtsi
> >> new file mode 100644
> >> index 0000000..8ea8d5d
> >> --- /dev/null
> >> +++ b/tests/overlay_overlay_dtc.dtsi
> >> @@ -0,0 +1,83 @@
> >> +/*
> >> + * Copyright (c) 2016 NextThing Co
> >> + * Copyright (c) 2016 Free Electrons
> >> + * Copyright (c) 2016 Konsulko Inc.
> >> + *
> >> + * SPDX-License-Identifier:	GPL-2.0+
> >> + */
> >> +
> >> +/ {
> >> +	/* Test that we can change an int by another */
> >> +	fragment@0 {
> >> +		target =3D <&test>;
> >> +
> >> +		__overlay__ {
> >> +			test-int-property =3D <43>;
> >> +		};
> >> +	};
> >> +
> >> +	/* Test that we can replace a string by a longer one */
> >> +	fragment@1 {
> >> +		target =3D <&test>;
> >> +
> >> +		__overlay__ {
> >> +			test-str-property =3D "foobar";
> >> +		};
> >> +	};
> >> +
> >> +	/* Test that we add a new property */
> >> +	fragment@2 {
> >> +		target =3D <&test>;
> >> +
> >> +		__overlay__ {
> >> +			test-str-property-2 =3D "foobar2";
> >> +		};
> >> +	};
> >> +
> >> +	/* Test that we add a new node (by phandle) */
> >> +	fragment@3 {
> >> +		target =3D <&test>;
> >> +
> >> +		__overlay__ {
> >> +			new-node {
> >> +				new-property;
> >> +			};
> >> +		};
> >> +	};
> >> +
> >> +	fragment@5 {
> >> +		target =3D <&test>;
> >> +
> >> +		__overlay__ {
> >> +			local: new-local-node {
> >> +				new-property;
> >> +			};
> >> +		};
> >> +	};
> >> +
> >> +	fragment@6 {
> >> +		target =3D <&test>;
> >> +
> >> +		__overlay__ {
> >> +			test-phandle =3D <&test>, <&local>;
> >> +		};
> >> +	};
> >> +
> >> +	fragment@7 {
> >> +		target =3D <&test>;
> >> +
> >> +		__overlay__ {
> >> +			test-several-phandle =3D <&local>, <&local>;
> >> +		};
> >> +	};
> >> +
> >> +	fragment@8 {
> >> +		target =3D <&test>;
> >> +
> >> +		__overlay__ {
> >> +			sub-test-node {
> >> +				new-sub-test-property;
> >> +			};
> >> +		};
> >> +	};
> >> +};
> >> diff --git a/tests/overlay_overlay_new_dtc.dts b/tests/overlay_overlay=
_new_dtc.dts
> >> new file mode 100644
> >> index 0000000..14d3f54
> >> --- /dev/null
> >> +++ b/tests/overlay_overlay_new_dtc.dts
> >> @@ -0,0 +1,11 @@
> >> +/*
> >> + * Copyright (c) 2016 NextThing Co
> >> + * Copyright (c) 2016 Free Electrons
> >> + * Copyright (c) 2016 Konsulko Inc.
> >> + *
> >> + * SPDX-License-Identifier:	GPL-2.0+
> >> + */
> >> +
> >> +/dts-v1/ /plugin/;
> >> +
> >> +/include/ "overlay_overlay_dtc.dtsi"
> >> diff --git a/tests/overlay_overlay_simple.dts b/tests/overlay_overlay_=
simple.dts
> >> new file mode 100644
> >> index 0000000..8657e1e
> >> --- /dev/null
> >> +++ b/tests/overlay_overlay_simple.dts
> >> @@ -0,0 +1,12 @@
> >> +/*
> >> + * Copyright (c) 2016 Konsulko Inc.
> >> + *
> >> + * SPDX-License-Identifier:	GPL-2.0+
> >> + */
> >> +
> >> +/dts-v1/;
> >> +/plugin/;
> >> +
> >> +&test {
> >> +	test-int-property =3D <43>;
> >> +};
> >> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> >> index e4139dd..74af0ff 100755
> >> --- a/tests/run_tests.sh
> >> +++ b/tests/run_tests.sh
> >> @@ -181,6 +181,47 @@ overlay_tests () {
> >>         run_dtc_test -@ -I dts -O dtb -o overlay_base_with_symbols.tes=
t.dtb overlay_base.dts
> >>         run_dtc_test -@ -I dts -O dtb -o overlay_overlay_with_symbols.=
test.dtb overlay_overlay_dtc.dts
> >>         run_test overlay overlay_base_with_symbols.test.dtb overlay_ov=
erlay_with_symbols.test.dtb
> >> +
> >> +        # new /plugin/ format
> >> +        run_dtc_test -@ -I dts -O dtb -o overlay_overlay_new_with_sym=
bols.test.dtb overlay_overlay_new_dtc.dts
> >> +	run_test check_path overlay_overlay_new_with_symbols.test.dtb exists=
 "/__symbols__"
> >> +	run_test check_path overlay_overlay_new_with_symbols.test.dtb exists=
 "/__fixups__"
> >> +	run_test check_path overlay_overlay_new_with_symbols.test.dtb exists=
 "/__local_fixups__"
> >=20
> > Looks like you're mixing tabs and spaces here.  I don't really mind
> > which, but keep it consistent at least at the same indentation level.
> >=20
>=20
> Oh, sorry, I use tabs but this sections has spaces=E2=80=A6 Will fix.

Well, it's more tha the first line in the block seems to be using
spaces, then the rest using tabs.

>=20
> >> +        # test new magic option
> >> +        run_dtc_test -M@ -I dts -O dtb -o overlay_overlay_with_symbol=
s_new_magic.test.dtb overlay_overlay_dtc.dts
> >> +	run_test check_path overlay_overlay_with_symbols_new_magic.test.dtb =
exists "/__symbols__"
> >> +	run_test check_path overlay_overlay_with_symbols_new_magic.test.dtb =
exists "/__fixups__"
> >> +	run_test check_path overlay_overlay_with_symbols_new_magic.test.dtb =
exists "/__local_fixups__"
> >> +
> >> +        # test plugin source to dtb and back
> >> +        run_dtc_test -@ -I dtb -O dts -o overlay_overlay_dtc.test.dts=
 overlay_overlay_with_symbols.test.dtb
> >> +        run_dtc_test -@ -I dts -O dtb -o overlay_overlay_with_symbols=
=2Etest.test.dtb overlay_overlay_dtc.test.dts
> >> +        run_test dtbs_equal_ordered overlay_overlay_with_symbols.test=
=2Edtb overlay_overlay_with_symbols.test.test.dtb
> >> +
> >> +	# test plugin source to dtb and back (with new magic)
> >> +        run_dtc_test -@ -I dtb -O dts -o overlay_overlay_dtc_new_magi=
c.test.dts overlay_overlay_with_symbols_new_magic.test.dtb
> >> +        run_dtc_test -@ -I dts -O dtb -o overlay_overlay_with_symbols=
_new_magic.test.test.dtb overlay_overlay_dtc_new_magic.test.dts
> >> +        run_test dtbs_equal_ordered overlay_overlay_with_symbols_new_=
magic.test.dtb overlay_overlay_with_symbols_new_magic.test.test.dtb
> >> +
> >> +        # test plugin auto-generation without using -@
> >> +        run_dtc_test -I dts -O dtb -o overlay_overlay_new_with_symbol=
s_auto.test.dtb overlay_overlay_dtc.dts
> >> +	run_test check_path overlay_overlay_new_with_symbols_auto.test.dtb e=
xists "/__symbols__"
> >> +	run_test check_path overlay_overlay_new_with_symbols_auto.test.dtb e=
xists "/__fixups__"
> >> +	run_test check_path overlay_overlay_new_with_symbols_auto.test.dtb e=
xists "/__local_fixups__"
> >> +
> >> +        # Test suppression of fixups
> >> +        run_dtc_test -F -@ -I dts -O dtb -o overlay_base_with_symbols=
_no_fixups.test.dtb overlay_base.dts
> >> +	run_test check_path overlay_base_with_symbols_no_fixups.test.dtb exi=
sts "/__symbols__"
> >> +	run_test check_path overlay_base_with_symbols_no_fixups.test.dtb not=
-exists "/__fixups__"
> >> +	run_test check_path overlay_base_with_symbols_no_fixups.test.dtb not=
-exists "/__local_fixups__"
> >> +
> >> +        # Test generation of aliases insted of symbols
> >> +        run_dtc_test -A -I dts -O dtb -o overlay_overlay_with_aliases=
=2Edtb overlay_overlay_dtc.dts
> >> +	run_test check_path overlay_overlay_with_aliases.dtb exists "/aliase=
s"
> >> +	run_test check_path overlay_overlay_with_aliases.dtb exists "/__symb=
ols__"
> >> +	run_test check_path overlay_overlay_with_aliases.dtb exists "/__fixu=
ps__"
> >> +	run_test check_path overlay_overlay_with_aliases.dtb exists "/__loca=
l_fixups__"
> >>     fi
> >>=20
> >>     # Bad fixup tests
> >=20
>=20
> Regards
>=20
> =E2=80=94 Pantelis
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYPh7iAAoJEGw4ysog2bOSs9wP/3zW+rrCW27ZyNy3pL91EYDw
Bsxv/ijX3sbXBgXuxhNWHiR+lHHamkRTlMEgOo6f/4Nwk3j3updktiL0w5RleFx/
U/iVsiCRf8ybMtjThvpl9f1alaX42QNZjIO5ip36RTqWFIOg5LfNt9vr9l/68dh2
2pQKCDYnEYkI3ZYCM1NlSXpuIWgAA+eZbSIy9a8ZaM6cX73qtBQib9ejzY8pClm/
b8TtjGL5PDhfA/QOhlVyKV0ocGeZrOgyL8WhYtTc2VxmHfy3Pv3IYDeJty5N2e5e
+sxTdy/Rb3/IUNcnwuJdaZuxlAVP9QghTfBwDIUJgQhKUNNcdvnhuZtR91Zw1Ewq
iaoMqbHGntsisQXdUiR5/m7bHnZokfNHt97zkVktiDzz0PrHtKyUuHHJLEh4SSv/
15tu1y4MAUgeHyzlXHWwe2SOF5GHJONyPsh2Ek//1FRUU/+rOz/R15OYj92yVEST
kX9aOYiXaFDxQhubWYGmsWz4IifcREUMNqlgLdMojPSC7UyEln3+tMv4Ugo28f91
CCcDu339zS5SKPuGNibWIpHlP1oIy+XdPaHmhLM9xHRRgqACk3RZeqZoyUe8q8gT
1ok+zdVyArO4oIc1umVcbPCzvkuLXk/4M2yNU+2zxBFBx6hoNxrSlG+gd4tBQslP
XjuBdd7vG2WtwXtlEmSR
=j7DN
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
