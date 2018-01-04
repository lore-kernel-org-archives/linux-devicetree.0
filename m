From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v5 03/12] dt-bindings: display: sun4i-drm: Add LVDS
 properties
Date: Thu, 4 Jan 2018 20:03:24 +0100
Message-ID: <20180104190324.zrrsmdamd7ch2qe5@flea.lan>
References: <cover.e5a47cc96ec5274dd932daa2bde47df073087da9.1513854122.git-series.maxime.ripard@free-electrons.com>
 <ddbde28fe2e4f21412974e4c69fbfe1c5ff9383f.1513854122.git-series.maxime.ripard@free-electrons.com>
 <1927811.df6406f6u0@jernej-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1969796506=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1927811.df6406f6u0@jernej-laptop>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, plaes@plaes.org, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, thierry.reding@gmail.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org, icenowy@aosc.io
List-Id: devicetree@vger.kernel.org


--===============1969796506==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ldgtus3ucqyhfy4m"
Content-Disposition: inline


--ldgtus3ucqyhfy4m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Dec 30, 2017 at 12:45:19PM +0100, Jernej =C5=A0krabec wrote:
> Hi Maxime,
>=20
> Dne =C4=8Detrtek, 21. december 2017 ob 12:02:29 CET je Maxime Ripard napi=
sal(a):
> > Some clocks and resets supposed to drive the LVDS logic in the display
> > engine have been overlooked when the driver was first introduced.
> >=20
> > Add those additional resources to the binding, and we'll deal with the =
ABI
> > stability in the code.
> >=20
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt |  9 +++=
++++-
> > 1 file changed, 9 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.=
txt
> > b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt index
> > 50cc72ee1168..1e21cfaac9e2 100644
> > --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > @@ -121,6 +121,15 @@ Required properties:
> >  On SoCs other than the A33 and V3s, there is one more clock required:
> >     - 'tcon-ch1': The clock driving the TCON channel 1
> >=20
> > +On SoCs that support LVDS (all SoCs but the A13, H3, H5 and V3s), you
> > +need one more reset line:
> > +   - 'lvds': The reset line driving the LVDS logic
> > +
> > +And on the SoCs newer than the A31 (sun6i and sun8i families), you
> > +need one more clock line:
> > +   - 'lvds-alt': An alternative clock source, separate from the TCON
> > channel 0 +                 clock, that can be used to drive the LVDS c=
lock
>=20
> I think this wording is imprecise, since A83T is part of the sun8i family=
, but=20
> from the code (patch 7) and DT changes (patch 9) you do, it doesn't need =
this=20
> property.
>=20
> Maybe it would be just easier to enumerate all compatibles which needs th=
is=20
> property?=20

You're right, but the rest of the document uses the SoC name
instead. In order to remain consistent, I listed the (currently
supported) SoCs that need that property and applied that patch.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ldgtus3ucqyhfy4m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpOenwACgkQ0rTAlCFN
r3RxhQ//YyAWFnFRiS3JBUiX3MTXPY82O6mXnq3lXs6n6z3SlLlJavs4A0WKZe9c
KerJTXCT/iA5LAiKfqnY8aymVh9bgowScie/0Cpn7YovttlSrheexVM0TQFq8vTz
1mKwOrvjH1b4C2yKZfwL6T8TKPGIFwW9SIJ6sD2XliEhjAKGLDEumakVVOlpK+aE
jHO4B4rlPyrv1qZaVcAFLwHXvzpYqsPdtEprvgPPmME/+PjuBtKpvWk86EKjlejc
7P3IvOSgFvAbtPJfia+MRjLljgK/O/hVwwL7OzAWqed7QiGJizEWrWo+HB7H2/YK
b7qz+8JmhV/7Jfyi7zQ/CJk8eN0O+FfgjX/j1sEP3v0fSeQvprWn24eeKMfPg6ag
wT7xIPiwF/9tVj2+/kF2H2V0A47nY/L0Ltw+lf6JHMmcHr/VXD4qofgDphYU5utM
Dblgw2jJ4Z4YtryuiKtgJWy2wHUqT2zgBCppWmX75fDxt1VKET5he2wSvvAISnyq
ca/fj5xpTxhxyHyqYuLOI+SsSII3TU7geOs1jdFv8ZyYWxc6l/sY5Ng0q1h2iDKp
5BobXEH7GnBWU+N5NoJVqADRo0KagsBsbM5VNeX2pOljyiJ3e+ZhYo+ArdQxiFN2
CkjemSKYfg26uJK2o9MadzdjIMGoRGLmB9+yQ5XNAQN27zqozmM=
=NF2V
-----END PGP SIGNATURE-----

--ldgtus3ucqyhfy4m--

--===============1969796506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1969796506==--
