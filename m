From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v5 01/12] dt-bindings: panel: lvds: Document power-supply
 property
Date: Thu, 4 Jan 2018 20:44:36 +0100
Message-ID: <20180104194436.reka6nw5hf32o4p3@flea.lan>
References: <cover.e5a47cc96ec5274dd932daa2bde47df073087da9.1513854122.git-series.maxime.ripard@free-electrons.com>
 <0a6a3abcf1a6b7f0e66a81af8a44c5c0566ce06c.1513854122.git-series.maxime.ripard@free-electrons.com>
 <2493504.1OPucrC18r@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="woaiir26rjmrhcin"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2493504.1OPucrC18r@avalon>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, plaes@plaes.org, icenowy@aosc.io, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, jernej.skrabec@siol.net, devicetree@vger.kernel.org, thierry.reding@gmail.com
List-Id: devicetree@vger.kernel.org


--woaiir26rjmrhcin
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Fri, Dec 22, 2017 at 02:08:20PM +0200, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> Thank you for the patch.
>=20
> On Thursday, 21 December 2017 13:02:27 EET Maxime Ripard wrote:
> > The power-supply property is used by a vast majority of panels, includi=
ng
> > panel-simple. Let's document it as a common property
> >=20
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  Documentation/devicetree/bindings/display/panel/panel-common.txt | 6 +=
+++++
> > Documentation/devicetree/bindings/display/panel/panel-lvds.txt   | 1 +
> > Documentation/devicetree/bindings/display/panel/simple-panel.txt | 2 +-=
 3
> > files changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/display/panel/panel-common.txt
> > b/Documentation/devicetree/bindings/display/panel/panel-common.txt index
> > ec52c472c845..125ea68052af 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-common.txt
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-common.txt
> > @@ -78,6 +78,12 @@ used for panels that implement compatible control
> > signals. while active. Active high reset signals can be supported by
> > inverting the GPIO specifier polarity flag.
> >=20
> > +Power
> > +-----
> > +
> > +- power-supply: many display panels need an additional power supply in
> > +  order to be fully powered-up. For such panels, power-supply contains
> > +  a phandle to the regulator powering the panel.
>=20
> I think we should give more details here about the limitations of this=20
> property. How about the following explanation ?
>=20
> - power-supply: display panels require power to be supplied. While severa=
l=20
> panels need more than one power supply with panel-specific constraints=20
> governing the order and timings of the power supplies, in many cases a si=
ngle=20
> power supply is sufficient, either because the panel has a single power r=
ail,=20
> or because all its power rails can be driven by the same supply. In that =
case=20
> the power-supply property specifies the supply powering the panel as a ph=
andle=20
> to a regulator.

That works for me. Do you want me to resend it with that text, or
should I merge it (and if so, with your Reviewed-by or Acked-by?)?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--woaiir26rjmrhcin
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpOhCMACgkQ0rTAlCFN
r3SflQ//Y9OW9OxnA5ZyAIjP6p89CuRfVMg8DYdVrpcOzQXz6D4WAX5tDqwz+4cc
eOzmm/nuoNyXF65laAWJrR3qcqCqhY/zMC06Zby+r0dMaWndW1hcKlSXTBdf3gw0
jxZeRJxjoel8EsblgqVdwMJ8x990huMEbl0Ki5jdKfw5xkoOdivBzofdrjsXGYaX
lP4/WvAExLNTai0DT7WQIo6mYj/vvhCeZTJSKIIDqEpCmOLRPhjE6acg3jGGa8lw
tgi+LQsY1A8fJkdGm1hNaIzap7jIvJonoPvCYwyNSavFAenMWvMaruMf+X6fBSjD
9liXqM56fn4y4vLhdaQWJ+9diMQIpngNkvUb3+Y1qVy4pHaZaAEbOENtYUgU/UPW
yuVEOV4FVk/UNB0P+OYpdwYB/oCoQ0fQswVrv+hc4Rs2Zry+64B2VCzmaYiR/Ep4
eS7kfevBxf9iwe62X/T0/FTJW7hnRaWi0zSUfdyxPqw/LM3brq8+TWm7+5MRGDmp
DhAmsxRV2PXycSIaHaspkz5j82Pp6IbpEuifWAAFyzvPPox+cRBnzkjtOtCzU3Ye
ybTqSeaLL+H1DQqcAuvWuVUuK+X444vWpCDA/cBO4dwulC44squ8p5rV9/Ont2CF
sp5F3mYofmse03uS5Sy1lG83oXHRtk/kAy0qnYWYed8EnTwX9Zo=
=v92t
-----END PGP SIGNATURE-----

--woaiir26rjmrhcin--
