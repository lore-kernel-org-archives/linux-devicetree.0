From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3] dmaengine: sun6i: Add support for
 Allwinner A64
Date: Fri, 1 Sep 2017 08:04:45 +0200
Message-ID: <20170901060445.vboici7qxfkztp3s@flea>
References: <20170830233609.13855-4-stefan.bruens@rwth-aachen.de>
 <20170901003135.10058-1-andre.przywara@arm.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vpmdrrlv5hiemtst"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB7XQUPGQKGQEF6S2L6Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170901003135.10058-1-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vpmdrrlv5hiemtst
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2017 at 01:31:35AM +0100, Andre Przywara wrote:
> Hi,
>=20
> On 31/08/17 00:36, Stefan Br=C3=BCns wrote:
> > The A64 SoC has the same dma engine as the H3 (sun8i), with a
> > reduced amount of physical channels. Add the proper config data
> > and compatible string to support it.
>=20
> ...
>=20
> > diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> > index 5f4eee4513e5..6a17c5d63582 100644
> > --- a/drivers/dma/sun6i-dma.c
> > +++ b/drivers/dma/sun6i-dma.c
> > @@ -1068,6 +1068,12 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg =
=3D {
> >  	.nr_max_vchans   =3D 34,
> >  	.dmac_variant    =3D DMAC_VARIANT_H3,
> >  };
> > +
> > +static struct sun6i_dma_config sun50i_a64_dma_cfg =3D {
> > +	.nr_max_channels =3D 8,
> > +	.nr_max_requests =3D 27,
> > +	.nr_max_vchans   =3D 38,
> > +	.dmac_variant    =3D DMAC_VARIANT_H3,
> >  };
> > =20
> >  static const struct of_device_id sun6i_dma_match[] =3D {
> > @@ -1075,6 +1081,7 @@ static const struct of_device_id sun6i_dma_match[=
] =3D {
> >  	{ .compatible =3D "allwinner,sun8i-a23-dma", .data =3D &sun8i_a23_dma=
_cfg },
> >  	{ .compatible =3D "allwinner,sun8i-a83t-dma", .data =3D &sun8i_a83t_d=
ma_cfg },
> >  	{ .compatible =3D "allwinner,sun8i-h3-dma", .data =3D &sun8i_h3_dma_c=
fg },
> > +	{ .compatible =3D "allwinner,sun50i-a64-dma", .data =3D &sun50i_a64_d=
ma_cfg },
> >  	{ /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, sun6i_dma_match);
>=20
> I was wondering if should use the opportunity to expose those values as
> DT properties instead of hard-wiring them to a compatible string in the
> driver every time we add support for a new SoC?
> We could introduce a new compatible string (say: "allwinner,sunxi-dma"),
> then describe properties for the number of channels and requests and
> vchans and parse those from the DT at probe time.
> With this we might be able to support future SoCs without Linux *driver*
> changes, by just providing the right DT. This would have worked already
> for instance for the A83T support, which just changed those values.
>=20
> For instance with this quick patch below (just compile tested, and withou=
t
> your refactoring).
> The DT node would then read something like:
> 	dma: dma-controller@01c02000 {
> 		compatible =3D "allwinner,sun50i-a64-dma",
> 			     "allwinner,sunxi-dma";
> 		reg =3D <0x01c02000 0x1000>;
> 		interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> 		clocks =3D <&ccu CLK_BUS_DMA>;
> 		resets =3D <&ccu RST_BUS_DMA>;
> 		#dma-cells =3D <1>;
> 		allwinner,max_channels =3D <8>;
> 		allwinner,max_requests =3D <27>;
> 		allwinner,max_vchans =3D <38>;
> 	};

We're still going to need a different compatible anyway, so it's not
really like it would change anything.

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

--vpmdrrlv5hiemtst
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZqPh9AAoJEBx+YmzsjxAgdsIP/jNnKflxaeLhDEL3k/HXbxMv
FELEKhYj/ezV9Idd3/vKics9EnIc6O5xjdTycYhnYtbgcQcCY6LgKvwRs1cL3f5M
16al3yYQUeEfFjiW6ml53mh5jFa1YwbgW2IkAsQ29TbL+8hJEfWKP41AXRhN2UR/
oPTOXvQu40Ec6etz0EjhERe8HhDaQeV75H7BS5h2VvojYlDvnIm+vXx0ZA2r1hP2
q1mRc93K8DAXfZiShSJKPdnq6p/SkO0hGviqDLzeepvwXvUwiUwTZ/Q0I5Rcl00+
+bXrRLLcu0HFG2lbJi5d9gTJ6hEu/XJvtlbr9Ap6JACawU5+dcRVB4qsbuDkYZS5
OsIG/HHTzGL6psOiN9PeGt8pPwNnsFK4F+B4V9dKvnrRZkIRzP0VXES28tk1ipX9
Te1pRN5+zPaGUmgz0WokErX+8YaaWS6BQRbef0gKTd55IjgSdSPYQCm7deUD3t4O
JOv28sPSxWJ57QRwBNb5U7PThwvsCVdfVIvrfcRTcfv7pwGrL9cOswr0Ben4GmCh
0ZyJ7MGnmppbMakqDK35sHpYwQX7PuU11GKR0m34qxGzfDAS1w7riKkC3zC3QF28
MYJICzi5hfleQEdP/mjKWn9CwrVWHUAzSB9XWKpjuP0ixMObgaBrdxSdYt/19YR1
QA9QJnzIqTCoZnYaOgLF
=gUmU
-----END PGP SIGNATURE-----

--vpmdrrlv5hiemtst--
