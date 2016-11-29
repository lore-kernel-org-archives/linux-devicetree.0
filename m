From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v11 5/7] overlay: Documentation for the overlay sugar
 syntax
Date: Tue, 29 Nov 2016 14:10:54 +1100
Message-ID: <20161129031054.GI13307@umbus.fritz.box>
References: <1480349141-14145-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480349141-14145-6-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/GPgYEyhnw15BExa"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480349141-14145-6-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--/GPgYEyhnw15BExa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2016 at 06:05:39PM +0200, Pantelis Antoniou wrote:
> There exists a syntactic sugar version of overlays which
> make them simpler to write for the trivial case of a single target.
>=20
> Document it in the device tree object internals.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

I'm with Frank that I think this, rather than being regarded mere
syntactic sugar, should be considered the primary way of describing
overlays.

Obviously we need to support the fully written out version as well.

> ---
>  Documentation/dt-object-internal.txt | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt-obje=
ct-internal.txt
> index 026d4ee..d5b841e 100644
> --- a/Documentation/dt-object-internal.txt
> +++ b/Documentation/dt-object-internal.txt
> @@ -300,3 +300,19 @@ local reference is being made. No matter how phandle=
s are allocated from dtc
>  the run time loader must apply an offset to each phandle in every dynamic
>  DT object loaded. The __local_fixups__ node records the place of every
>  local reference so that the loader can apply the offset.
> +
> +There is an alternative syntax to the expanded form for overlays with ph=
andle
> +targets which makes the format similar to the one using in .dtsi include=
 files.
> +
> +So for the &ocp target example above one can simply write:
> +
> +/dts-v1/ /plugin/;
> +&ocp {
> +	/* bar peripheral */
> +	bar {
> +		compatible =3D "corp,bar";
> +		... /* various properties and child nodes */
> +	}
> +};
> +
> +The resulting dtb object is identical.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/GPgYEyhnw15BExa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYPPG9AAoJEGw4ysog2bOS8fQQANxy8f5fI+cV97rpdbO/Akbj
O0yS7sKBuMEVqVVRVQOG+LGQI7zwBqIuA8v/t0hi0FrugMcH0djuZ90V9tw9ZpMf
cp8//gjFucbLllvRNTaTyoSw97uPRnKcn3RHZggtiP7ZRe8rLf8vcmJxS4khHgBs
7ehTyI/xjCh1DN4pe/N5iZbO45u65oMiz4vNoLxYO2f1ZUtXkzKYm5Fh05LMWy1B
t89yfRUbiy3hXvsE56kYUX8618dBDTLHQHmuic1Z560F5PAss0bummB0D6k3DzfL
Iip6vvMh7nM0oChnJKD31jx6kvy1xcplK+f5wNIo1eWv8KLakpcsregYP9jDbMkx
qUca+Jx0CdxHgg41D4gzKRtGNWzJag52eTu373lfd/H4GqpiS5ho3S5R5Jy+raMY
4X/gMCeXfBTNPRtZ2+bgHKlKdZVfHIah0R7hKNcA19MU00uN0QN0xBv6T5RdfOSn
AbbWs+ajyb9+/0SZL8IHllXx7O1O7g8NFN6pxTtWvlD2EtDtxvNRzH03wbcuX7r3
JjXZXIyo2Ud4dH1ndtRhC2XMQH0Uujp1LrTVeUJuuRizmSgAu/dJBrUPPhl/PQHC
qwHwhn8wJgTk1GmRya/wFORBfd2e8rIjBV/yWk11/bFTW7JhOC8rel4+XHZouZw0
JRHrlzmcvYSc1uIkCBGM
=o6Qv
-----END PGP SIGNATURE-----

--/GPgYEyhnw15BExa--
