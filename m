From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [linux-sunxi] Re: [PATCH v7 05/13] drm/sun4i: abstract a engine
 type
Date: Tue, 16 May 2017 14:14:50 +0200
Message-ID: <20170516121450.oz3peeushg557lji@flea.home>
References: <20170514163045.40366-1-icenowy@aosc.io>
 <20170514163045.40366-6-icenowy@aosc.io>
 <20170515092001.ik7qrqmg5pgtp2ct@flea.home>
 <4F7E36DB-B5F9-4DDE-A80D-0C1A75F0A882@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2yogxss3tc7yfbpz"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F7E36DB-B5F9-4DDE-A80D-0C1A75F0A882@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--2yogxss3tc7yfbpz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2017 at 05:35:02PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B45=E6=9C=8815=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
5:20:01, Maxime Ripard <maxime.ripard@free-electrons.com> =E5=86=99=E5=88=
=B0:
> >On Mon, May 15, 2017 at 12:30:37AM +0800, Icenowy Zheng wrote:
> >> As we are going to add support for the Allwinner DE2 engine in
> >sun4i-drm
> >> driver, we will finally have two types of display engines -- the DE1
> >> backend and the DE2 mixer. They both do some display blending and
> >feed
> >> graphics data to TCON, and is part of the "Display Engine" called by
> >> Allwinner, so I choose to call them both "engine" here.
> >>=20
> >> Abstract the engine type to a new struct with an ops struct, which
> >contains
> >> functions that should be called outside the engine-specified code (in
> >> TCON, CRTC or TV Encoder code).
> >>=20
> >> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> >> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> >> ---
> >> Changes in v7:
> >> - Mention "Display Engine" for the name "engine".
> >> - Fixed some small issues found by Chen-Yu and added his ACK.
> >> Changes in v6:
> >> - Rebased on wens's multi-pipeline patchset.
> >> - Split out Makefile changes.
> >
> >You also added a get_id callback here...
> >
> >> +static const struct sunxi_engine_ops sun4i_backend_engine_ops =3D {
> >> +	.commit				=3D sun4i_backend_commit,
> >> +	.layers_init			=3D sun4i_layers_init,
> >> +	.apply_color_correction		=3D sun4i_backend_apply_color_correction,
> >> +	.disable_color_correction	=3D sun4i_backend_disable_color_correction,
> >> +};
> >> +
> >
> >... that you don't populate ...
> >
> >> @@ -477,7 +481,7 @@ static int sun4i_tcon_bind(struct device *dev,
> >struct device *master,
> >>  	dev_set_drvdata(dev, tcon);
> >>  	tcon->drm =3D drm;
> >>  	tcon->dev =3D dev;
> >> -	tcon->id =3D backend->id;
> >> +	tcon->id =3D sunxi_engine_get_id(engine);
> >
> >... that you call to fill the TCON ID ...
> >
> >> +/**
> >> + * sunxi_engine_get_id - Get the ID of the engine.
> >> + * @engine:	pointer to the engine
> >> + *
> >> + * If the ID is not necessary, just do not implement it in
> >sunxi_engine_ops,
> >> + * and a default -1 will be returned.
> >> + */
> >> +static inline int
> >> +sunxi_engine_get_id(struct sunxi_engine *engine)
> >> +{
> >> +	if (engine->ops && engine->ops->get_id)
> >> +		return engine->ops->get_id(engine);
> >> +
> >> +	return -1;
> >
> >... and will return -1 if not populated, which essentially means that
> >instead of having 0 or 1, we're now having -1 as our id.
> >
> >This is a regression, and I'm even wondering if we can't just store
> >the ID in the sunxi_engine structure. Is anything preventing us to do
> >that, instead of using a callback?
>=20
> Some engines (de2 mixer) doesn't use the ID. But 0 is a valid ID here.

Surely it will at some point.

> If we just store it in sunxi_engine, it should be assigned -1 for de2 mix=
er.
> Is this applicable?
>=20
> If it's okay I will do so.

Yes, it sounds reasonable.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--2yogxss3tc7yfbpz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZGu06AAoJEBx+YmzsjxAgNNMP/R0pnekF8qH1gAsc8ckZs8mD
LLzhkq72SZvQIsPIrfJzBx63/eSEzdUbm3LiF7pgAIpx5TAheojug4kV4K+XX5IK
e/fgcpfEuyxH8ANEws3C4iEuo3c9zqQuWALmsXKUz88Irnv2vYzvzRDVUiLGBhtu
NuZWikOM1HEE5DMI1v9k1DDq1ckbQDBviv580Nc3ll/zVSWZvz6Gun0CXDovuahm
CFOR9sixsO58/WhGRQFEtmuqnr/t+sVx0EOiobqzgFU1j90XMsVapuumOs0zEaii
HO4P7gH7b3XcNDqOwjsRGP3eHFTUdRFTaNMb/Wh/N07u0krTO+ifak9lWVUP11zq
wTS8DsOJlYv3QQPCGiAgQPdEwYFSDXgIktjHOTeKQaYMvgdErlJtkcnYJ9n2dAWy
mQa6ztivKDHUnF8AelgtOQWOurHR6wJZjF0dY5UzOZD08SA+E0uhBQ2wMmiukssV
d2EKUWY9M7quD2bB9Fs2c70J6Ls6wCIiPKBO3RfE4YVT3Tp5NELBrSOYVlZa3SaQ
gVcOC1ofTAXPPioGbmefNtnpQu4SbAuEm3HSwndZaX1xHGdTsXNdIJA7GW7FCsmb
flZ7Z2bg5fsFh2e6uGoMMh5hcqXKLzMWWTmH7xGC+loMoerM5DO/Yul3gvH1RczT
xsnUAhJyUTAGEqACh4k/
=52Sd
-----END PGP SIGNATURE-----

--2yogxss3tc7yfbpz--
