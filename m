From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v11 5/7] overlay: Documentation for the overlay sugar
 syntax
Date: Tue, 29 Nov 2016 16:10:42 +1100
Message-ID: <20161129051042.GO13307@umbus.fritz.box>
References: <1480349141-14145-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480349141-14145-6-git-send-email-pantelis.antoniou@konsulko.com>
 <20161129031054.GI13307@umbus.fritz.box>
 <583D05B7.4040109@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="E187YRO8KGM40JwS"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <583D05B7.4040109-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--E187YRO8KGM40JwS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2016 at 08:36:07PM -0800, Frank Rowand wrote:
> On 11/28/16 19:10, David Gibson wrote:
> > On Mon, Nov 28, 2016 at 06:05:39PM +0200, Pantelis Antoniou wrote:
> >> There exists a syntactic sugar version of overlays which
> >> make them simpler to write for the trivial case of a single target.
>=20
> It also works for multiple targets.  (See the example I provided in
> my comment to v10.)
>=20
>=20
> >>
> >> Document it in the device tree object internals.
> >>
> >> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >=20
> > I'm with Frank that I think this, rather than being regarded mere
> > syntactic sugar, should be considered the primary way of describing
> > overlays.
> >=20
> > Obviously we need to support the fully written out version as well.
>=20
> If we need to support the fully written out version, can we make that
> a discouraged, non-preferred method?  Maybe require an option to
> enable compiling this style of dts?

Yeah.  To avoid further proliferation of options, I'm thinking a
single "backwards compat" option which would:
	- Use the dtb magic instead of dtb magic
	- Disable checks which would reject explicit creation of
	  __overlay__ / __symbols__ / __fixups__ nodes
	- Anything other special behaviour we need
=09
> I can imagine some reasons to support the fully written out version,
> but can we document what those reasons are?

I believe the main one is the dts files in this format out in the
field.  Mind you, I guess we're already requiring them to tweak how
they declare the /plugin/ option.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--E187YRO8KGM40JwS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYPQ3SAAoJEGw4ysog2bOS37IQAK/LfAQLbwhaO2Z7qs1yehiP
ctT1Nujy2zUAdOGGWL/uF1+FNxPQ0pj5M47mnD/pm/ep7eWQLet8SwsNxbTELeKj
sm0nMAydU3vmlAvzpp4MfKRXLgvbCzNl2s2QBzfmUTu/rFDjJqrdCqt4czgwJcrl
vWb4J7+6QPAJqkfCRlRLQYm0h9uaFWivg/eOWv9IMGQGSFkXpjb/rf35/CPN8ToU
QeiWTPAdBVI2b42q7l5vE69V8hLLN9TcePEfxCYCOnN2skxrWL7UMYu+3QUVHkRS
8fVL7+s9qQl/3m1hCCPiVO6jph/HY1B9zPi6Gc+SMqJrqW2vuNAwc4mMoiIQdu/9
5QowFHa9mEA/8GquQhDlu4EbS0UuFC7yt1Tft0F7Hnk3nyk2dBItw878+OUj1B43
lSSnDVaeYg0+IZ++uQll6UhICy6SGU4iU5jUNVLtBKxM+8AZgzpOh6M2gUMd2XGu
aoG4bCj8eGLEw4xwCd3ufQEl35iPCPeLEjiMdizLP4az4juE/+m2rneRYhZwlSn8
6yW+GwT2OOu2lV8JwyoFtCLmPW/oLr6aD4kyyO8J2MxLMXgzZO9iVWHx2ZUUw6UN
MbY88umUK0462/dkFwenxMrp94GmPnBr9T0hAr9ZXkKLxg5CQuVa4ZYtGQk7wstX
q8bRIfvGR69K2cHf5PTE
=rEIx
-----END PGP SIGNATURE-----

--E187YRO8KGM40JwS--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
