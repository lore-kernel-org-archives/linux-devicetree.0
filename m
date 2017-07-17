From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: media: Add Cadence MIPI-CSI2RX Device
 Tree bindings
Date: Mon, 17 Jul 2017 11:52:32 +0200
Message-ID: <20170717095232.hjm2xtlmgndroura@flea>
References: <20170703124023.28352-1-maxime.ripard@free-electrons.com>
 <20170703124023.28352-2-maxime.ripard@free-electrons.com>
 <20170707162105.fhafcpzwlnxco2pn@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bvozhmqsvao6jbn5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170707162105.fhafcpzwlnxco2pn@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Neil Webb <neilw-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Steve Creaney <screaney-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--bvozhmqsvao6jbn5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Sorry for the slow answer.

On Fri, Jul 07, 2017 at 11:21:05AM -0500, Rob Herring wrote:
> On Mon, Jul 03, 2017 at 02:40:22PM +0200, Maxime Ripard wrote:
> > The Cadence MIPI-CSI2 RX controller is a CSI2RX bridge that supports up=
 to
> > 4 CSI-2 lanes, and can route the frames to up to 4 streams, depending on
> > the hardware implementation.
>=20
> Streams and lanes are separate, right? Do you need to know how many=20
> lanes are configured/connected?

Streams are the output interfaces, lanes are in input. The number of
lanes used is basically defined by the device attached to the other
side, and each device can use between 1 to 4 lanes, depending on the
device.

On those lanes, the CSI protocol defines virtual channels, usually to
support multiple devices on the same set of lanes. This device is then
able to route the virtual channels in input to any of its streams in
output.

It doesn't really matter how many lanes are configured or connected,
beside some basic setup, and this is already described through the
media additions to the OF-graph through a property of the link.

What matters is how many streams you have in output to know your
routing options, and the number of virtual channels you will have, but
that's dynamic iirc.

> > It can operate with an external D-PHY, an internal one or no D-PHY at a=
ll
> > in some configurations.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  .../devicetree/bindings/media/cdns-csi2rx.txt      | 87 ++++++++++++++=
++++++++
> >  1 file changed, 87 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/cdns-csi2rx=
=2Etxt
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/cdns-csi2rx.txt b/=
Documentation/devicetree/bindings/media/cdns-csi2rx.txt
> > new file mode 100644
> > index 000000000000..b5bcb6ad18fc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/cdns-csi2rx.txt
> > @@ -0,0 +1,87 @@
> > +Cadence CSI2RX controller
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > +
> > +The Cadence CSI2RX controller is a CSI-2 bridge supporting up to 4 CSI
> > +lanes in input, and 4 different pixel streams in output.
> > +
> > +Required properties:
> > +  - compatible: must be set to "cdns,csi2rx"
>=20
> Should have a "and an SoC specific compatible string" statement.

Ok.

> > +  - reg: base address and size of the memory mapped region
> > +  - clocks: phandles to the clocks driving the controller
> > +  - clock-names: must contain:
> > +    * sys_clk: main clock
> > +    * p_clk: register bank clock
> > +    * p_free_clk: free running register bank clock
> > +    * pixel_ifX_clk: pixel stream output clock, one for each stream
> > +                     implemented in hardware, between 0 and 3
> > +    * dphy_rx_clk: D-PHY byte clock, if implemented in hardware
>=20
> "if implemented in hardare" means internal D-PHY?

It means if we have a D-PHY, either internal or external. In the case
where we don't have any D-PHY, then we'll obviously won't have that
clock.

> > +  - phys: phandle to the external D-PHY
> > +  - phy-names: must contain dphy, if the implementation uses an
> > +               external D-PHY
>=20
> If? Should phys/phy-names be optional?

Yes and no, and I don't really know how it's usually handled in the
documentation. The property is mandatory if the hardware uses a
D-PHY. But it shouldn't be there if it doesn't. So it's not really
optional, it's mandatory in one case, and useless in the other.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bvozhmqsvao6jbn5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbIjgAAoJEBx+YmzsjxAguxcP/RJSGfk812PBjg2Ulv0Hect7
yhwf+iEFfoj5qvtcAYaEWgHAS68r8N+Ki28e8LwNshCqh2O0mYsr3HQb6f36k24P
+RYOaM+VQrZbUeEqFnjifryfts14h/9g7onek3ijoHbrxinXG3LGG2Lgu3i8Xt8/
M9ia7K083ZUfXjKokSBaY99jlrxzOeafumvRqiMzM8WxrQXJQxISv+OHuZ1zodgC
mgKyRbRUfpviKHPIwhxdbHpnGjpPwXBTPr8AFz4kgcPKZMs6FWi76cWBGwi1c0Zz
Zj4U4OAMySxF3PI3IjxgUTTJUcM/RHIhU6h+KMUhDNGxZcKz9zw9Epl7/rVwU9U0
dy4Z3ewNaynywPdVzrZfgYbuaqCLOhgyu92z7p8yIzI8+TDhE2xjqLT6YAN1WSnL
X9nl1fR/cq0ZBluGQtyf3gX4BPSnUs1xM5ZSxb1Ioa1a0VvmENifH3KqQa1pDbZL
DUudR+iN8AD4iYFbT06z/aP/gY2bUWUVqQWuf/njygXBGjHArjq/T72dsVQiYz5x
M9UnXISD0vq+m4o91SlMh+EMNDg+vjUlVxNbCIEPcha7JxSsdW2kyhNEBeWj8/bK
4Z6t2anze6X/OeuoKng/lPgKvydK8WtVfsexPwRICAofinLmOb8nQedvYmxeRb2W
jlwoLQCsv3OBRqZc0ecc
=KHHm
-----END PGP SIGNATURE-----

--bvozhmqsvao6jbn5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
