From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: input: Add R_LRADC support for A83T
Date: Tue, 27 Jun 2017 19:31:59 +0200
Message-ID: <20170627173159.g3t3rbts3y7z6jf7@flea>
References: <20170624024515.4669-1-techping.chan@gmail.com>
 <20170624024515.4669-3-techping.chan@gmail.com>
 <20170626171524.cqfyasetpsfr6xfg@flea.lan>
 <CAAST=9x+fS41tznuJ9hQ-cQxecKN751=61YkhEt31DvpeqeEcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hgdi7c3ntk77ik7a"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAST=9x+fS41tznuJ9hQ-cQxecKN751=61YkhEt31DvpeqeEcA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--hgdi7c3ntk77ik7a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2017 at 11:18:17PM +0800, Ziping Chen wrote:
> 2017-06-27 1:15 GMT+08:00 Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org=
>:
> > Hi,
> >
> > On Sat, Jun 24, 2017 at 10:45:14AM +0800, Ziping Chen wrote:
> >> From: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>
> >> Allwinner A83T SoC has a low res adc like the one
> >> in Allwinner A10 SoC.
> >>
> >> Add binding for it.
> >>
> >> Signed-off-by: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> ---
> >>  Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt | 6 ++++=
--
> >>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.=
txt b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> >> index 4357e498ef04..525d85e3043f 100644
> >> --- a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> >> +++ b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> >> @@ -2,12 +2,14 @@ Allwinner sun4i low res adc attached tablet keys
> >>  ------------------------------------------------
> >>
> >>  Required properties:
> >> - - compatible: "allwinner,sun4i-a10-lradc-keys"
> >> + - compatible: should be one of the following string:
> >> +             "allwinner,sun4i-a10-lradc-keys"
> >> +             "allwinner,sun8i-a83t-r-lradc-keys"
> >
> > This doesn't really have anything related to keys, and can be used
> > purely as an ADC.
> >
> > I know this is the compatible that was used for the A10, but I'd
> > rather drop the keys for the the new compatible.
> >
>=20
> LRADC is named KEYADC in some other SoCs' User Manual(such as R40 User
> Manual V1.0), thus LRADC is related to keys.

It's still called LRADC on the A83T, so we'll use that name. If we
ever need another compatible for the R40, then yes, keyadc would make
sense in that case.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hgdi7c3ntk77ik7a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZUpaPAAoJEBx+YmzsjxAg+PIP/iK+b2N6IqR0cZkLnlGyS51q
yQGRfX6ld0CE30JJFAH+IZ7wqksQauuBCwyh2jNBOruBoezcCCnUIndEMKaptbDD
BNVCdXjKRNabB0f0hzPbiCo+GXD1R7Xh0lPy7ZDScMS7GhCcYgLK4Y3rH619jAMz
KqtJ6SeHgwNqxlVv1eAdIv8NqWZarDQH01Ahl4MBXDMw5lP2ulpvnNNWymolQAR/
+kPC7fkEDmGaySGmHXcYq69x18CKsZPUrSiy42trRfteEA232FBNJu9Oqz1Lc2VD
J8At2XPebLr/G14f0ln6FRWb5wqu2lsh5al/3E37e5pfuxb97brqa3HwRGPu2we8
JPrHD52q4JMDIZWQdg4xu6IgqKIrbiKd7tjTX3LuUsOOzppDjtNAL52RdF7YYbvN
28ZHxElDbymMy1mr21K6q3ooMU1NiHkaK807XbAzCraTqUD4lbaSLjaJVfclux20
1QjWxPw3sV/VzBKBF+ts7uVb19+NjaEyrK1jMR3/J2ppixF+wiXTtR7EmeKSEuOE
71ljQMk7d4FLbzLQZjV8+fP4wRbOjQF5hIzxDGSIYgnfTHXYpaAIhGl5swbxejHh
QN0BQ6SqZDhRZ1pxcqF9k0R1ZqAnQdBaJiyCwF2VLv2WoWISbDMuNtaqb3FcKueC
fi4LTwTktBxx5vhTVQs6
=6nFf
-----END PGP SIGNATURE-----

--hgdi7c3ntk77ik7a--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
