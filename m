From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: input: Add R_LRADC support for A83T
Date: Thu, 29 Jun 2017 09:52:55 +0200
Message-ID: <20170629075255.7vvzhiaqll457em4@flea>
References: <20170624024515.4669-1-techping.chan@gmail.com>
 <20170624024515.4669-3-techping.chan@gmail.com>
 <20170626171524.cqfyasetpsfr6xfg@flea.lan>
 <CAAST=9x+fS41tznuJ9hQ-cQxecKN751=61YkhEt31DvpeqeEcA@mail.gmail.com>
 <20170627173159.g3t3rbts3y7z6jf7@flea>
 <CAAST=9wKRA=EiU6U85N7k9mtnbkfDwa-N5DyfkF88zYk5-EDiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5n3emvwy2wxtfzhq"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAST=9wKRA=EiU6U85N7k9mtnbkfDwa-N5DyfkF88zYk5-EDiQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--5n3emvwy2wxtfzhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 29, 2017 at 12:35:30PM +0800, Ziping Chen wrote:
> 2017-06-28 1:31 GMT+08:00 Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org=
>:
> > On Tue, Jun 27, 2017 at 11:18:17PM +0800, Ziping Chen wrote:
> >> 2017-06-27 1:15 GMT+08:00 Maxime Ripard <maxime.ripard@free-electrons.=
com>:
> >> > Hi,
> >> >
> >> > On Sat, Jun 24, 2017 at 10:45:14AM +0800, Ziping Chen wrote:
> >> >> From: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> >>
> >> >> Allwinner A83T SoC has a low res adc like the one
> >> >> in Allwinner A10 SoC.
> >> >>
> >> >> Add binding for it.
> >> >>
> >> >> Signed-off-by: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> >> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> >> ---
> >> >>  Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt | 6 +=
+++--
> >> >>  1 file changed, 4 insertions(+), 2 deletions(-)
> >> >>
> >> >> diff --git a/Documentation/devicetree/bindings/input/sun4i-lradc-ke=
ys.txt b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> >> >> index 4357e498ef04..525d85e3043f 100644
> >> >> --- a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> >> >> +++ b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> >> >> @@ -2,12 +2,14 @@ Allwinner sun4i low res adc attached tablet keys
> >> >>  ------------------------------------------------
> >> >>
> >> >>  Required properties:
> >> >> - - compatible: "allwinner,sun4i-a10-lradc-keys"
> >> >> + - compatible: should be one of the following string:
> >> >> +             "allwinner,sun4i-a10-lradc-keys"
> >> >> +             "allwinner,sun8i-a83t-r-lradc-keys"
> >> >
> >> > This doesn't really have anything related to keys, and can be used
> >> > purely as an ADC.
> >> >
> >> > I know this is the compatible that was used for the A10, but I'd
> >> > rather drop the keys for the the new compatible.
> >> >
> >>
> >> LRADC is named KEYADC in some other SoCs' User Manual(such as R40 User
> >> Manual V1.0), thus LRADC is related to keys.
> >
> > It's still called LRADC on the A83T, so we'll use that name. If we
> > ever need another compatible for the R40, then yes, keyadc would make
> > sense in that case.
>=20
> Hi,
>=20
> So... whether to use "sun4i-lradc" to replace "sun4i-lradc-keys"?
>=20
> I think it should be separated, one is the input subsystem, the other
> is the iio subsystem.

I was just talking about your compatible here, and was basically
suggesting to do sed 's/sun8i-a83t-r-lradc-keys/sun8i-a83t-r-lradc/',
that's all.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--5n3emvwy2wxtfzhq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZVLHXAAoJEBx+YmzsjxAgR1wP/0gvQIQkbw0oDUuIRM0+hWSb
LFKEs7rS6G4dXiyI02uPjMmLsG0TBXjjdYa98iawoEqb73Sj/oKegSKm0D90y8PY
11FkBNn3qwHc9uxU0aIJtQz1UGXF8p6//3Cbj0MulFJL8c4/Kq17yfdhkgLC+pCJ
BnpmT2Wv/7tqOhyGlGjjoYrhd+Ye226fYwKP8XM6UToFA+gvj+sqDsPs+qgg+oag
AvesT/L2m4NPsKRGQoTMLUm+rpncq5FCIhtB/2jllZG2U3xHgGFpSLrPz+wrsjJk
5daEkRm9iTgHer4TiuhUxOD9IpQ6WGqG1oTXidxqh3TomNNVfxEiRKDLcCqZKXgl
EBBwZoxTfz6O3SWxdSDac1YFpUgKOh/5HkDPZovxd78dxy1gOWZQNz/d1ZW6X3Kj
zFYBwtPyZb9/v9wJHm6pg70kqEruESnVIc+L2/mSpyyyRc+y4GE6/mxOsc7Q2b0f
YxKpxT4M4JYPJOYiCl1k4ma/T0wH5R3ocWxYh+aY1iZEWTrXApqqGadIx/Ir+PIU
DhiWO+eVt2AfERZM0IrkL4Pxt9OQefkA6xd3+mrFigCkylBkuaEdBj93dahEPaL0
XnethjOe9yLLTHuy8Ml6PjiD44MetIgTR/xgzXOuOZ9Ud+pZHSwhzeDdttLn0AG8
23F9GGKlwuNCQaI6hIFD
=zSsj
-----END PGP SIGNATURE-----

--5n3emvwy2wxtfzhq--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
