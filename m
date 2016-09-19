From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 1/4] drm/bridge: Add RGB to VGA bridge support
Date: Mon, 19 Sep 2016 11:23:16 +0200
Message-ID: <20160919092316.GH8719@lukather>
References: <20160908121751.16911-1-maxime.ripard@free-electrons.com>
 <20160908121751.16911-2-maxime.ripard@free-electrons.com>
 <2115773.yQojqqIjGI@avalon>
 <1682784.hDdFQltm22@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Dx9iWuMxHO1cCoFc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1682784.hDdFQltm22@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Dx9iWuMxHO1cCoFc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 18, 2016 at 01:04:17PM +0300, Laurent Pinchart wrote:
> On Sunday 18 Sep 2016 13:01:16 Laurent Pinchart wrote:
> > On Thursday 08 Sep 2016 14:17:48 Maxime Ripard wrote:
> > > Some boards have an entirely passive RGB to VGA bridge, based on eith=
er
> > > DACs or resistor ladders.
> > >=20
> > > Those might or might not have an i2c bus routed to the VGA connector =
in
> > > order to access the screen EDIDs.
> > >=20
> > > Add a bridge that doesn't do anything but expose the modes available =
on
> > > the screen, either based on the EDIDs if available, or based on the X=
GA
> > > standards.
> > >=20
> > > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > > ---
> > >=20
> > >  .../bindings/display/bridge/rgb-to-vga-bridge.txt  |  52 +++++
> > >  drivers/gpu/drm/bridge/Kconfig                     |   6 +
> > >  drivers/gpu/drm/bridge/Makefile                    |   1 +
> > >  drivers/gpu/drm/bridge/rgb-to-vga.c                | 232 +++++++++++=
+++++
> > >  4 files changed, 291 insertions(+)
> > >  create mode 100644
> > >=20
> > > Documentation/devicetree/bindings/display/bridge/rgb-to-vga-bridge.txt
> > > create mode 100644 drivers/gpu/drm/bridge/rgb-to-vga.c
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/bridge/rgb-to-vga-bridge.=
txt
> > > b/Documentation/devicetree/bindings/display/bridge/rgb-to-vga-bridge.=
txt
> > > new file mode 100644
> > > index 000000000000..83a053fb51a0
> > > --- /dev/null
> > > +++
> > > b/Documentation/devicetree/bindings/display/bridge/rgb-to-vga-bridge.=
txt
> > > @@ -0,0 +1,52 @@
> > > +Passive RGB to VGA bridge
> > > +-------------------------
> > > +
> > > +This binding is aimed for entirely passive RGB to VGA bridges that d=
o not
> > > +require any configuration.
> >=20
> > Couldn't it also support active RGB to VGA bridges that don't require a=
ny
> > configuration ? It would seem a bit pointless to define a separate DT
> > binding for them.
>=20
> I'm thinking in particular about the ADV7123
> (http://www.analog.com/media/en/technical-documentation/data-sheets/ADV71=
23.pdf)
> that already has a DT binding.

I guess we don't have the same definition of passive, but I was
thinking of devices that do not need any configuration in order to
operate properly. And this one seems to fall in that category.

> Would it be feasible to combine the two, and support both devices
> with a single driver ?

I don't see why not. But converting the renesas DRM driver seems a bit
out of scope, and the ADV compatible can definitely be added later.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--Dx9iWuMxHO1cCoFc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX366EAAoJEBx+YmzsjxAgHi8QALSFzRmTPZIaXuzOYyXybGoM
T4x4R97e5W9cQFRp2nD0gPquyJvYRJe37HJv8WcfsmfajRzXOHkC0Tzb1f5leEV8
4DJ+BEkPLFZ2L+h3WkUAIkboD99tW60VWHE1UdIob+o8EDaKPldPExwCtX5D6F/l
tjuozgMLGXAkA2oVQDYYghpNpIPM6kF8nYn4897KtrSRkKZh8egE/QBXhoaEuAuS
8cOgezn3y+qff1F4aiUY4FquZzzGEN5xtS69qds3BtLtS/IlyqMEyLZASyNjpN5d
GmcpVNd7nyjVQCRxGoNSwoJyc3uh3TmTJuCh0BQu63pYxoQPLaxENtoktKHIVP/W
tprJJKe1KSpi1I21WpSe8wNA5am8AaMLYWmKfi7ZlqGxH6e5rz+2a9mmKuPtNJlX
ReR6iMZP2DowQCm283LIYko64/6Ie2os7JA5SYCdGy/JBw8d4isma2BhUS995tEi
R1FGgOgfL3UcUqDZRzBzJpDHLE0g1f2pUJYgHFfWM9vpKpN9NE/f/aeOdoGnYG0j
fXQDyX1r9P2VmeQfl6Wy3lx6IUUUBulTSgUGZRkA2VA204papFP0eDe9AiUBd8AC
y/zvUM2J3jFTBKDsL/ezVlvIDtdNQl7y1hbDseqj5SoaeAqSWwHdB7XCgxPUMjjo
iTQXGx6XRhi6RWkz+i1V
=z2TS
-----END PGP SIGNATURE-----

--Dx9iWuMxHO1cCoFc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
