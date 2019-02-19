From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/5] nvmem: sunxi-sid: add support for H5's SID controller
Date: Tue, 19 Feb 2019 16:03:11 +0100
Message-ID: <20190219150311.yfqkr5svs6b3arjy@flea>
References: <20190217162316.14111-1-tiny.windzz@gmail.com>
 <20190217162316.14111-3-tiny.windzz@gmail.com>
 <20190218084931.fdut6d4cgwkwvihx@flea>
 <CAGb2v65Frw+=DjcuqNUPd-UG6qsiVDBH0bd5btx+5=ns7VAQrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a5jbqqvrdaqbxyhn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v65Frw+=DjcuqNUPd-UG6qsiVDBH0bd5btx+5=ns7VAQrQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Yangtao Li <tiny.windzz@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--a5jbqqvrdaqbxyhn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 18, 2019 at 05:19:40PM +0800, Chen-Yu Tsai wrote:
> On Mon, Feb 18, 2019 at 4:49 PM Maxime Ripard <maxime.ripard@bootlin.com>=
 wrote:
> >
> > On Sun, Feb 17, 2019 at 11:23:13AM -0500, Yangtao Li wrote:
> > > Add support for H5's SID controller.
> > >
> > > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > > ---
> > >  drivers/nvmem/sunxi_sid.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
> > > index 570a2e354f30..036029e90921 100644
> > > --- a/drivers/nvmem/sunxi_sid.c
> > > +++ b/drivers/nvmem/sunxi_sid.c
> > > @@ -219,11 +219,17 @@ static const struct sunxi_sid_cfg sun50i_a64_cf=
g =3D {
> > >       .size =3D 0x100,
> > >  };
> > >
> > > +static const struct sunxi_sid_cfg sun50i_h5_cfg =3D {
> > > +     .value_offset =3D 0x200,
> > > +     .size =3D 0x100,
> > > +};
> >
> > IIRC, there was an endianness issue on the newer SoCs, with the driver
> > converting the data from big endian to little endian, while it's
> > actually stored little endian in the SID.
>=20
> About that, it seems the internals are either little endian or native (sa=
me
> as the bus). Either way the nvmem the driver currently exposes is wrong.

Do you mean that it can be configured either way, or it's little
endian and since you are running a little endian system you can't
tell?

> My idea is to keep the current one with the current name, but have it not
> associate itself with the DT node. We then register an extra one, called
> "sunxi-sid-native" which uses the native endian. This one will be associa=
ted
> with the DT node, so the THS driver can consume nvmem cells.
>=20
> What do you think?

I thought about this some more, and I don't think anyone really has
used the sysfs interface for it. Since the data are in an unusable
order (without an additional conversion at least), we would have had a
bug report by now (just like we had when someone tried to use it for
the thermal calibration).

So maybe the easy way out is just to disable the conversion on the
affected SoCs, and see if anyone complains?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--a5jbqqvrdaqbxyhn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXGwarwAKCRDj7w1vZxhR
xRlQAP9SuuNNe+uQxmVUomjF7GRR7ixRMF2zFKil/KKkT6MwzQD+LppkfKh/by7K
sUOXOlTBwGw8BGOtEByqkfFONxx9/wo=
=n1MX
-----END PGP SIGNATURE-----

--a5jbqqvrdaqbxyhn--
