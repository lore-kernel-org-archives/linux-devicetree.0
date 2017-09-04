From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3] dmaengine: sun6i: Add support for Allwinner A64
Date: Mon, 4 Sep 2017 09:04:15 +0200
Message-ID: <20170904070415.e6nclz5n23bo7f4v@flea>
References: <20170830233609.13855-4-stefan.bruens@rwth-aachen.de>
 <20170901003135.10058-1-andre.przywara@arm.com>
 <20170901060445.vboici7qxfkztp3s@flea>
 <743ae23a-372a-762b-c345-b914f09fd718@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="osp5xcro3npejx47"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <743ae23a-372a-762b-c345-b914f09fd718-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--osp5xcro3npejx47
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2017 at 11:35:40PM +0100, Andr=E9 Przywara wrote:
> On 01/09/17 07:04, Maxime Ripard wrote:
> > On Fri, Sep 01, 2017 at 01:31:35AM +0100, Andre Przywara wrote:
> >> Hi,
> >>
> >> On 31/08/17 00:36, Stefan Br=FCns wrote:
> >>> The A64 SoC has the same dma engine as the H3 (sun8i), with a
> >>> reduced amount of physical channels. Add the proper config data
> >>> and compatible string to support it.
> >>
> >> ...
> >>
> >>> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> >>> index 5f4eee4513e5..6a17c5d63582 100644
> >>> --- a/drivers/dma/sun6i-dma.c
> >>> +++ b/drivers/dma/sun6i-dma.c
> >>> @@ -1068,6 +1068,12 @@ static struct sun6i_dma_config sun8i_h3_dma_cf=
g =3D {
> >>>  	.nr_max_vchans   =3D 34,
> >>>  	.dmac_variant    =3D DMAC_VARIANT_H3,
> >>>  };
> >>> +
> >>> +static struct sun6i_dma_config sun50i_a64_dma_cfg =3D {
> >>> +	.nr_max_channels =3D 8,
> >>> +	.nr_max_requests =3D 27,
> >>> +	.nr_max_vchans   =3D 38,
> >>> +	.dmac_variant    =3D DMAC_VARIANT_H3,
> >>>  };
> >>> =20
> >>>  static const struct of_device_id sun6i_dma_match[] =3D {
> >>> @@ -1075,6 +1081,7 @@ static const struct of_device_id sun6i_dma_matc=
h[] =3D {
> >>>  	{ .compatible =3D "allwinner,sun8i-a23-dma", .data =3D &sun8i_a23_d=
ma_cfg },
> >>>  	{ .compatible =3D "allwinner,sun8i-a83t-dma", .data =3D &sun8i_a83t=
_dma_cfg },
> >>>  	{ .compatible =3D "allwinner,sun8i-h3-dma", .data =3D &sun8i_h3_dma=
_cfg },
> >>> +	{ .compatible =3D "allwinner,sun50i-a64-dma", .data =3D &sun50i_a64=
_dma_cfg },
> >>>  	{ /* sentinel */ }
> >>>  };
> >>>  MODULE_DEVICE_TABLE(of, sun6i_dma_match);
> >>
> >> I was wondering if should use the opportunity to expose those values as
> >> DT properties instead of hard-wiring them to a compatible string in the
> >> driver every time we add support for a new SoC?
> >> We could introduce a new compatible string (say: "allwinner,sunxi-dma"=
),
> >> then describe properties for the number of channels and requests and
> >> vchans and parse those from the DT at probe time.
> >> With this we might be able to support future SoCs without Linux *drive=
r*
> >> changes, by just providing the right DT. This would have worked already
> >> for instance for the A83T support, which just changed those values.
> >>
> >> For instance with this quick patch below (just compile tested, and wit=
hout
> >> your refactoring).
> >> The DT node would then read something like:
> >> 	dma: dma-controller@01c02000 {
> >> 		compatible =3D "allwinner,sun50i-a64-dma",
> >> 			     "allwinner,sunxi-dma";
> >> 		reg =3D <0x01c02000 0x1000>;
> >> 		interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> >> 		clocks =3D <&ccu CLK_BUS_DMA>;
> >> 		resets =3D <&ccu RST_BUS_DMA>;
> >> 		#dma-cells =3D <1>;
> >> 		allwinner,max_channels =3D <8>;
> >> 		allwinner,max_requests =3D <27>;
> >> 		allwinner,max_vchans =3D <38>;
> >> 	};
> >=20
> > We're still going to need a different compatible anyway, so it's not
> > really like it would change anything.
>=20
> Well, not for now, but possibly in the future. And we should start with
> this at one point. If we would have had this type of binding already for
> H3, we could have added the A64 support without driver changes just by a
> DT change.

That's not true. As usual with these kinds of generic binding
arguments (it's definitely not personal, you're far from the only one
making them), it completely ignores the fact that the IP itself might
change from one revision to another, and its behaviour might too.

The A64 for example moved at least one register off, and has a
different set of burst size / width.

It's something you can't account for when you initially define the
binding, unless you describe all the registers, plus all their
parameters and the way you interact with them, which isn't going to
happen if you want to keep your sanity.

And obviously, while maintaining the stability of the binding of those
hundreds properties.

Or, you can base all this on the compatible, and be done with it once
and for all.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--osp5xcro3npejx47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZrPruAAoJEBx+YmzsjxAg1mcQAJT7douDqRx54NhrgmKnXCNj
2gsUhuW/7rRwxiBKusEJnEAhFzv7iQeS3f/odxWVQF7R7aLZUwPbM/TJ4394HQQW
ptDE2VIB/yPkDKw/d2x657z+CzwqthvcU9SKssex6ht8kP2q8DN4C/bwg1QRXgDD
/uGgNKw1t2r7Im2WuWZuzYBTNXQCXA5l+d+60BALp/SvRInhPiKAE+8zNlWFXRCv
dqh54nLBQiQUyQvvHUfXwwqDBVcxwjAz4PPyMaDycaJhUGP2qmFtB6+jbQA3sIuh
m+c90S/CgCyNyeG4KtSORwcIjT1sPHHMg1nzdouRMi2WXquv+FfWSM89XA1wwoEQ
dgPY+9ZQemfrAmtbLM8f5YR+Cqs7YEyGqAkIMvamhKKOd/4ebtFVyIaP+AF5Njws
Edp4IhRLCOwVmmz0qI6Z54QIiCs/atvhDQ14RWbHVfEDoTK9VFk0fp4cb75inBuF
ulWOfNCC1vzj7Rf0zaKOrSETMOq/183hlFBBwi7W/FfNvj/2jBz5nvw+7MThTOx5
QIzYzcFUfG1TjSfML+a10h/OwT1NwIG19w2uYUvI4Nwj08pnPFdCqWpxrDhjZS/F
YQ/erNra0drK85L+vnKNmetgy5PN35D5z6yGuy9yPWqCdPc99R59A9PbpEGGoxGE
brnnBwXlnFTfqY6cSESy
=DV3m
-----END PGP SIGNATURE-----

--osp5xcro3npejx47--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
