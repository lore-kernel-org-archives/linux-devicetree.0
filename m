From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: media: Add Cadence MIPI-CSI2 RX
 Device Tree bindings
Date: Fri, 22 Sep 2017 16:54:04 +0200
Message-ID: <20170922145404.444dqynmqz34jm7c@flea.lan>
References: <20170922100823.18184-1-maxime.ripard@free-electrons.com>
 <20170922100823.18184-2-maxime.ripard@free-electrons.com>
 <20170922113522.4nbls3bb3sglsu55@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vbujyc7vulhtlheg"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170922113522.4nbls3bb3sglsu55-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Steve Creaney <screaney-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, nm-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vbujyc7vulhtlheg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Fri, Sep 22, 2017 at 11:35:23AM +0000, Sakari Ailus wrote:
> Hi Maxime,
>=20
> On Fri, Sep 22, 2017 at 12:08:22PM +0200, Maxime Ripard wrote:
> > The Cadence MIPI-CSI2 RX controller is a CSI2RX bridge that supports up=
 to
> > 4 CSI-2 lanes, and can route the frames to up to 4 streams, depending on
> > the hardware implementation.
> >=20
> > It can operate with an external D-PHY, an internal one or no D-PHY at a=
ll
> > in some configurations.
> >=20
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Acked-by: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
> > Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  .../devicetree/bindings/media/cdns,csi2rx.txt      | 97 ++++++++++++++=
++++++++
> >  1 file changed, 97 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/cdns,csi2rx=
=2Etxt
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt b/=
Documentation/devicetree/bindings/media/cdns,csi2rx.txt
> > new file mode 100644
> > index 000000000000..e9c30f964a96
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
> > @@ -0,0 +1,97 @@
> > +Cadence MIPI-CSI2 RX controller
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The Cadence MIPI-CSI2 RX controller is a CSI-2 bridge supporting up to=
 4 CSI
> > +lanes in input, and 4 different pixel streams in output.
> > +
> > +Required properties:
> > +  - compatible: must be set to "cdns,csi2rx" and an SoC-specific compa=
tible
> > +  - reg: base address and size of the memory mapped region
> > +  - clocks: phandles to the clocks driving the controller
> > +  - clock-names: must contain:
> > +    * sys_clk: main clock
> > +    * p_clk: register bank clock
> > +    * pixel_if[0-3]_clk: pixel stream output clock, one for each stream
> > +                         implemented in hardware, between 0 and 3
> > +
> > +Optional properties:
> > +  - phys: phandle to the external D-PHY, phy-names must be provided
> > +  - phy-names: must contain dphy, if the implementation uses an
> > +               external D-PHY
> > +
> > +Required subnodes:
> > +  - ports: A ports node with one port child node per device input and =
output
> > +           port, in accordance with the video interface bindings defin=
ed in
> > +           Documentation/devicetree/bindings/media/video-interfaces.tx=
t. The
> > +           port nodes numbered as follows.
> > +
> > +           Port Description
> > +           -----------------------------
> > +           0    CSI-2 input
> > +           1    Stream 0 output
> > +           2    Stream 1 output
> > +           3    Stream 2 output
> > +           4    Stream 3 output
> > +
> > +           The stream output port nodes are optional if they are not c=
onnected
> > +           to anything at the hardware level or implemented in the des=
ign.
>=20
> Could you add supported endpoint numbers, please?
>=20
> <URL:https://patchwork.linuxtv.org/patch/44409/>

So in the case where you have a single endpoint, usually you don't
provide an endpoint number at all. Should I document it as zero, or as
"no number"?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vbujyc7vulhtlheg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZxSQMAAoJEBx+YmzsjxAgp98P/iJlzB29PSyNmxlyawkyHn4B
wdvu2loL2MYSYLUkfENHczLlM/f1OrOt2n/59FJ3MLl/Vdgbc1hB4yebBIPc1OY0
voj9VWa5ystbkcswmwa3rLPU+FvOkU6Lo4ynJ/vFpJQFeWEjn9SSfVTiwH75K4E9
jsNeaZPldRNRlSmjzbKJB327NeFfeQZvx7giHDh3g5g7OudEeZnP2BSt00bPXx20
LM4kb0tH7w1ivnNBeBxg1w5OeRwydWpWyKLYmQPwWQ4xETdYiqIXz9wcyz1fnH1t
hDjkCLp8EOOusLxFWNawb6Ua6spMjhgRi0xd3Ke3nH1iAtUDYJK1FXINPEEJMhxB
WqjU8ecDdONIkGbMQFkmG1sUlU2l88WaBF7f+VSn6KM2I/F5ypRoFrLcBUDOLKh2
KCDpX+CRJBulPBqdqUh0fMQyf5TzB4leKNzTspHFTpd6dAlyMxfIZ3zvZE4/c1xn
/OzMZdtHsr61RW0t8TDJ1V4ltTuTqzRbdLh650Y5w5jXGx6L3Yf8cx4GvqYhlBvM
Mc19J9W3AFTE4AV0YoOdCx+MPDJJ2sH8oIGO1ycufcrU9qW6gbztTrCfYMDPRiWK
Z29ZjvG23GFFeQuhrvYXKA1pzwZDsusNqSze+H9Q8rCAnhGLwVabI4Pght3yqbY8
YvABAgHprmF45NKbaPZc
=Xw0U
-----END PGP SIGNATURE-----

--vbujyc7vulhtlheg--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
