From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 6/9] dt-bindings: pinctrl: Deprecate sunxi pinctrl
 bindings
Date: Fri, 7 Oct 2016 11:04:12 +0200
Message-ID: <20161007090412.GM4684@lukather>
References: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard@free-electrons.com>
 <fad5a977d8ecdd43b37d7028b1bc32d8667b65a2.1475489558.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v67wk_DANTyzaxTM6Stgh-u2kZXn_kjb0vbWDYUd-DUxGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/jvaajy/zP2g41+Q"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67wk_DANTyzaxTM6Stgh-u2kZXn_kjb0vbWDYUd-DUxGA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--/jvaajy/zP2g41+Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 04, 2016 at 10:32:12AM +0800, Chen-Yu Tsai wrote:
> On Mon, Oct 3, 2016 at 6:21 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > The generic pin configuration and multiplexing should be preferred now,
> > even though we still support the old one.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt =
| 5 +++++
> >  1 file changed, 5 insertions(+), 0 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-=
pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pin=
ctrl.txt
> > index 69617220c5d6..e8b7cf64fdf1 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl=
=2Etxt
> > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl=
=2Etxt
> > @@ -36,6 +36,11 @@ pins it needs, and how they should be configured, wi=
th regard to muxer
> >  configuration, drive strength and pullups. If one of these options is
> >  not set, its actual value will be unspecified.
> >
> > +This driver supports the generic pin multiplexing and configuration
> > +bindings.
>=20
> Should we list which options are supported? We don't support them all.

Yep, I'll add that.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--/jvaajy/zP2g41+Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX92UMAAoJEBx+YmzsjxAgqeEQAJbgJeZlMMGVCPDBYAOJI2il
yQln8GTewGH8BHlpfvm20AS61sCX3UvIgRH5wDY0wEyqPHQBXkYiz0ZcYqxc6dTC
D6xKKpWID+9kO8fpQEWOA0XjleSXDzkAU1q9CAviN4S4JLTz4r2rjtRJQib84A3L
kuD/Rii/XONB917jLDaU4UYdwPknB2DgU/zbqekxgGUCiNacvr0l0cBLDTSw8MeN
jMyZv8+6K4jUb3xLMJoJw6K5s8Ifp6lHHJYWiEzkxu7unmhLfHMvLVhVRFBxEjJe
lBfg5Sr5O57JpqpIGvvNuSTbRnPklQ1oJI3PBY7oO062wuLS3Cm/lXJoDcKhcG51
ucVf3ZRXMadmjJaKyoCwf5szqiyKmnVJAi61e+Ys4yRfSrJaybR+R4Su2GQMVtSK
yPEiRCITELiHf5C8RgFvNyAti7kg/MLH67lFuQXFgmMjAluUGYKKKT2DQqWjCJJr
Qj8RdBHiQHB0yNpvyPZFRhs6mo2oXS0DdSsOtsjrreHP3kDrqYVtm4iZKvqDpJvR
CnG+ZOB4rwqXVqQqR/d7C3043Ng+wcy54GHG6qon2UI7EC+vOBqDRgSpPmQz7foo
vZVXIv/ifySo+ghVt9dSgEhl4yPs3QFnlO91+T7i6dgex5GLmt/XmvVEDSt2a2Tw
XsjIcqzzwqsN5QvagCrg
=ZAWe
-----END PGP SIGNATURE-----

--/jvaajy/zP2g41+Q--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
