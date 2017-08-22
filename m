From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: sunxi: add support for R40 SoC
Date: Tue, 22 Aug 2017 22:00:04 +0200
Message-ID: <20170822200004.cuuj63j7am6xypdw@flea.home>
References: <20170820052957.34597-1-icenowy@aosc.io>
 <20170820052957.34597-2-icenowy@aosc.io>
 <20170821093405.n4bum7j6nswnv6wr@flea.lan>
 <0809ae2d75f210b9bfee49b383f226b2@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="htx2btc2ybnn2izh"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBUE26LGAKGQE6XWI54Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <0809ae2d75f210b9bfee49b383f226b2-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--htx2btc2ybnn2izh
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2017 at 01:14:09PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> =E5=9C=A8 2017-08-21 17:34=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > Hi,
> >=20
> > On Sun, Aug 20, 2017 at 01:29:57PM +0800, Icenowy Zheng wrote:
> > > Allwinner R40 is a new SoC, with Quad Core Cortex-A7 and peripherals
> > > like A20.
> > >=20
> > > Add support for it.
> > >=20
> > > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > > ---
> > >  Documentation/arm/sunxi/README                  | 6 ++++++
> > >  Documentation/devicetree/bindings/arm/sunxi.txt | 1 +
> > >  arch/arm/mach-sunxi/sunxi.c                     | 1 +
> > >  3 files changed, 8 insertions(+)
> > >=20
> > > diff --git a/Documentation/arm/sunxi/README
> > > b/Documentation/arm/sunxi/README
> > > index d7b1f016bd62..4fa836782e46 100644
> > > --- a/Documentation/arm/sunxi/README
> > > +++ b/Documentation/arm/sunxi/README
> > > @@ -75,6 +75,12 @@ SunXi family
> > >          + Datasheet
> > > http://linux-sunxi.org/File:Allwinner_V3s_Datasheet_V1.0.pdf
> > >=20
> > > +      - Allwinner R40 (sun8i)
> > > +        + Datasheet
> > > +
> > > https://github.com/tinalinux/docs/raw/r40-v1.y/R40_Datasheet_V1.0.pdf
> > > +        + User Manual
> > > +          https://github.com/tinalinux/docs/raw/r40-v1.y/Allwinner_R=
40_User_Manual_V1.0.pdf
> > > +
> >=20
> > Please sort it by alphabetical order.
>=20
> I prefer to sort it by the wafer ID (the number after w in the
> official ID).
>=20
> The current document can be explained to follow the alphabetical
> order or the wafer ID.

You should know who your audience is. Whoever is going to end up here
to have a list of the SoC names and their datasheet is very likely to
not know by heart the wafer IDs, while anyone that can read knows the
alphabet.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--htx2btc2ybnn2izh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZnI1EAAoJEBx+YmzsjxAgYhQP/0UGAGm3xC090yp6cMjH4iUd
Vd2cGHUywnQwcuWKLx+L07Z+qquofVrn1yF6G1tP61pFeIwiofDicUeVKE3uRM2C
PYUGH1AxK5nX6FSjzfDung/w0jAqr4L0hCUUdj0cDktVtj/i3jfzAC+U/85wAzCt
XnMxpQ2XGJrQHhWBZ4UhouUbvtNHF/YdIjpjUtjgF7rPLbfbIVmQAXGtNGsO5eNA
sDwEcI8TMI1eb+uxo4qlllvI2PT9JKm2bIAzwFeOr0jVojuPRdAZwv2MSMBeiwwZ
2AYDvRJNpz0TTtNQRPf7Q3d9c6sKTyNEtMF6Wl7WIfdLu2urGPKI6JUGSpml2NSt
R2okiXZ72+ctBWR7+boRR7pv5GTDKNDlGV+sasewO8gIC4xLIJpJ3dhAUIu83mI5
7ucMGZpPvqbdEdxYlN+Vp8vE4fO8D0UcZMjwTLPPA5MZG2WG9FpzFA3U1SiowPnl
2c9yB5rWrWoxnTCeuiYy19/fIWeIYloVTXNlivYYmt8R9hZuvZ7t+Tcw3AjTpbfb
U1VxzcJTncTu3s9U3LFQyVRIKVim6iBMj0aaqshkbezPiDF6+sxMrpEZnNDJNxRl
R21bsfE0g6Q84+JfqhMq2c3TDI8yhT7+sP3rBiC96jmnUPy09dudK1GieolZLlKs
vhc6H5Bo6ErcOjmcC1P+
=an8P
-----END PGP SIGNATURE-----

--htx2btc2ybnn2izh--
