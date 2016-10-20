From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: Add support for interrupt debouncing
Date: Thu, 20 Oct 2016 15:56:25 +0200
Message-ID: <20161020135625.vro5cxkf3rxevwyn@lukather>
References: <cover.ed6c19bdf01ae70096f3d96af4805f59ef16f94a.1476868462.git-series.maxime.ripard@free-electrons.com>
 <fa022cca9917917ace4af7d5e852c9348ec5b553.1476868462.git-series.maxime.ripard@free-electrons.com>
 <CACRpkdaoEH7OixJDkjuZ0qqYVURLvXwn8b41-OvqjZGJ=neh+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="e2kjvejo65ffhns6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaoEH7OixJDkjuZ0qqYVURLvXwn8b41-OvqjZGJ=neh+Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--e2kjvejo65ffhns6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, Oct 20, 2016 at 03:04:46PM +0200, Linus Walleij wrote:
> On Wed, Oct 19, 2016 at 11:15 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>=20
> > The pin controller found in the Allwinner SoCs has support for interrup=
ts
> > debouncing.
> >
> > However, this is not done per-pin, preventing us from using the generic
> > pinconf binding for that,
>=20
> How typical.
>=20
> > but per irq bank, which, depending on the SoC,
> > ranges from one to five.
> >
> > Introduce a device-wide property to deal with this using a nanosecond
> > resolution.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> (...)
> > +Note: For backward compatibility reasons, the hosc and losc clocks are
> > +only required if you need to use the optional
> > +allwinner,debounce-time-ns property. Any new device tree should set th=
em.
> > +
> > +Optional properties:
> > +  - allwinner,debounce-time-ns: Array of debouncing periods in
> > +    nanoseconds. One period per irq bank found in the controller
>=20
> Do you really *need* to specify this with nanosecond resolution?
>
> Else I would suggest to use microsecond resolution and just use
> the generic binding (input-debounce) but on the device node instead
> of the specific handler.

Theorically, the debouncing clock can be set at 24MHz, which means a
42ns resolution.

I've seen that the other bindings usually use microseconds, but in our
case, we can really go lower than that.

I don't really know if it makes sense though.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--e2kjvejo65ffhns6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYCM0EAAoJEBx+YmzsjxAg+S4P/1543ZBStK3Ec3Tl+CIY8mOh
vm2E7t5q4BxPGobUWzsM7mxOsG9Pk0bA2a/Kz2kSdOTxDguqEU5W6yoEavOAkujt
Jzh+hNDsNanh6G4hLHX8RxSMm6ab86tWLMa2uIoOFakiiTBGcE3oiEK+Qr7L0gVn
kaK5tPxfid+Xw52c56LrHskswP7mAC1k25f1PJ8FQlHZc8/IQJ583V4ZlM8cIqh0
zrWkdc2uml1oprCBV1DMUbFB3XC1aie8Gp4LWSn6vKGb2+qppQQWS4bVIuV4wUAV
BnA6C8i3BcKKy7HmtruEiC/onXsSmez+3TdvtWOAA/EZI5gFLsLdH9ElOQqUblKA
uqTDMrcrl3k8LtbmAEkcfeqzB01JsG0FVhOBK+MV3lIjJSe7B2skUhK9t8BYO/IN
qXvfA657DnKQVdHDGt1Mr8xz6j5ugX+FBShCY1QG00PwA/uct1kvlb/8kcTKOXgx
kOCT1poYZkJ7kCOSSY4LgO62PhP+agOItSPFMguutGXHoXafbXlXUEZ9lcxp7z2T
Djf5koJjzizegvlk70VwD2Q93QRqN9EMzNSO7GhcIlKAMhNWgc+Ax+JeTRIbHBHd
jelZ467Xr2mv7x4Y2JQHRVVbJ+Dz7vxIkBg4NfQ42AGPW3l1MKPBlRbxvvB3T59K
gbTmH58v7Gc6dwFQYhSH
=+X1D
-----END PGP SIGNATURE-----

--e2kjvejo65ffhns6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
