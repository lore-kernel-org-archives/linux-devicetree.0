From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH v5 02/11] clk: sunxi-ng: add support
 for DE2 CCU
Date: Thu, 27 Apr 2017 09:12:37 +0200
Message-ID: <20170427071237.eqv2pyp6t2i4auv2@lukather>
References: <20170423103754.50012-1-icenowy@aosc.io>
 <20170423103754.50012-3-icenowy@aosc.io>
 <20170424085109.p44bmzbyjkuf7ckv@lukather>
 <9def8a6b635880095e6b75e3a53af1f4@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pzucutq7d4x42opo"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9def8a6b635880095e6b75e3a53af1f4-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--pzucutq7d4x42opo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2017 at 06:26:51PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> =E5=9C=A8 2017-04-24 16:51=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > Hi,
> >=20
> > On Sun, Apr 23, 2017 at 06:37:45PM +0800, Icenowy Zheng wrote:
> > > +static const struct of_device_id sunxi_de2_clk_ids[] =3D {
> > > +	{
> > > +		.compatible =3D "allwinner,sun8i-a83t-de2-clk",
> > > +		.data =3D &sun8i_a83t_de2_clk_desc,
> > > +	},
> > > +	{
> > > +		.compatible =3D "allwinner,sun50i-h5-de2-clk",
> > > +		.data =3D &sun50i_a64_de2_clk_desc,
> > > +	},
> > > +	/*
> > > +	 * The Allwinner A64 SoC needs some bit to be poke in syscon to make
> > > +	 * DE2 really working.
> > > +	 * So there's currently no A64 compatible here.
> > > +	 * H5 shares the same reset line with A64, so here H5 is using the
> > > +	 * clock description of A64.
> > > +	 */
> > > +	{ }
> > > +};
> >=20
> > So that A64 driver would require more than just what you defined in
> > the binding in order to operate?
>=20
> Yes. When trying to do A64 driver, I will send out first a patch to
> add the needed binding bit.

Then remove the A64 compatible from the binding document.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--pzucutq7d4x42opo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZAZnlAAoJEBx+YmzsjxAgAVsP/1M8THXWL5F2JlzIdE6qolJe
fw3ZrVK8r140LFjNGQj6oQvaifnFig1CnLMG6oWD4yInX91NxnKZlGgSIjH1atBn
2JmEBqoYa594qbhujG9qbgnqSaVWA0nTscOOgOiyECfmMBqrRjUtPhyhEJKl8T3f
BD1VjuzYdk2hy7SENOclL2wMKn+z7pWwUvcFLWe1gcI3qWd+OoDlVHIZDBxsvklB
WF7fal0edmeSLv3hGBdYE2RedjYotRxum/1Cn3LD+ZPoOsNT8OCCVXbAwXvVvztV
m5WGHjetA8huz0/qTqj3f/LtH1z6jceRlUgOj2FI8HK4NT2daPh0cRUa4LdP6dMK
V9Le4R90zTvJZDPGMsNxkqlrEGsHhHS2F7xmTWe59O0yB62ayUd+Eck0+rhQUJmy
2uR0V0TqulN7AGHIDsooFZhg+sz9ziHSE6TtIuKKDkOnQBRpa2C5/kQUnf6YAQib
JgBQRhqXf9TQKSnkOTtTZ3QR0mp18Ij6OOah/tA+exMzYWQUmzXWOhZHwVP/o4sT
FihdIBuA98HSwrZ9nM0U+VN/eiBAurVN4vrrINIkFlMIXpnX/IR851W904lB/DhM
5H0DspqIrjzx1Un9wTMOCstvsufCGDAQY2osyqbYak0QkO+zZGMy4ZtRE6tnT4w4
0RLwdLi0AHfPCkgMLTDL
=6vSS
-----END PGP SIGNATURE-----

--pzucutq7d4x42opo--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
