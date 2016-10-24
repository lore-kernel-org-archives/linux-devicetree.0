From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: pinctrl: Deprecate sunxi pinctrl
 bindings
Date: Mon, 24 Oct 2016 21:49:17 +0200
Message-ID: <20161024194917.g5oezqc4uacsyt24@lukather>
References: <cover.f893b02a9f816dad8fad3986672b05c4b211e2b1.1476971126.git-series.maxime.ripard@free-electrons.com>
 <6aec73cd3b9d3dbf1085d042ec6c23f385a300de.1476971126.git-series.maxime.ripard@free-electrons.com>
 <CACRpkdb7zs7Nhs3i1o=WUt787vJCuePre3Tj3wLu++qwpO0atQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="24z5hglkfpgu6hib"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb7zs7Nhs3i1o=WUt787vJCuePre3Tj3wLu++qwpO0atQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--24z5hglkfpgu6hib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, Oct 24, 2016 at 02:03:59AM +0200, Linus Walleij wrote:
> On Thu, Oct 20, 2016 at 3:49 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>=20
> > The generic pin configuration and multiplexing should be preferred now,
> > even though we still support the old one.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>=20
> Patch applied.

Thanks a lot.

However, it looks like the first patch from this serie is missing from
your tree, is there a reason for that?

Also, in order to preserve bisectability, could you create an
immutable branch for those sunxi patches so that I can merge the DT
bits?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--24z5hglkfpgu6hib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYDmW0AAoJEBx+YmzsjxAgv24P/1ErGBnx2cRtwfc5xIbVhdph
WwmJuq0N5P/pwFGBF1xrZ0n0qkIAfyZ0BVl/gnrAVg6ieBJ3Sp99/FVLuJ4HIV7P
DcGuSgUVhjtQINc5SHFqu/kmn4rpPlid7uu336Hi76COc/aaeHZDHU1guvN33NvW
MGCVESuNbd6ANx9CNPIw1RAHfE2DCdxp6NraApJvoEHeAtv40ttqrphb5yYUWNXn
p4CPcaFziPblIB7Kli04jD7u9mNMcdg60IN/4zNXj91ni2vtbjy3/aacngrMBP9N
p6+hdYJkzReZVZX2d32m6e32HWQ4TnRrNbWgCP83b0yLDkxwUhyl4R5zpwhdTy9M
YAFLM6y85wuUJXk5LYjpun3azBHL6V+r86NbPTTs8Mj53LLfnA7QWJxZVtNEdbBs
MJG3MT0V9kAjZ+3CPOvm36DvTiLuUcG04W1J2g4AUX+aCHClEYjYs6jvl8UeF0JS
qJmgLfwRCPzQheS3IghL1nRVZXQhbmb5GsCYGFIHR1umFkVjJSXNxyr1Fx7azz/H
yKAWVJpbK0J31LQGewQ5iHYV1Ge6sOMFa1sFtNczxvuJ8VOFCtyRqgr1bi/ijvy+
rF1jsR9zoxoO79lPM0nHkWpKx3RE2guNJJ81G1hlRMsttQlKQMxa5NETrKkNeZLJ
p/7JEfdB6xpwKjxWc4Km
=M4hJ
-----END PGP SIGNATURE-----

--24z5hglkfpgu6hib--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
