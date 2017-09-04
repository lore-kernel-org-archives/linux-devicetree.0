From: =?iso-8859-1?Q?Br=FCns=2C_Stefan?= <Stefan.Bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [PATCH 02/10] dmaengine: sun6i: Correct burst
 length field offsets for H3
Date: Mon, 4 Sep 2017 14:47:24 +0000
Message-ID: <2223782.bf3lvqWUP7@sbruens-linux>
References: <20170903224100.17893-1-stefan.bruens@rwth-aachen.de>
 <20170903224100.17893-3-stefan.bruens@rwth-aachen.de>
 <20170904075924.jufrqijrtxcqvztd@flea>
Reply-To: stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDIYL7P2SAMRB7OOWXGQKGQEMVCNWLQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170904075924.jufrqijrtxcqvztd@flea>
Content-Language: en-US
Content-ID: <D227364364E62C42AFA09309565AAC68-KnNo0XtUZUuELgA04lAiVw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Montag, 4. September 2017 09:59:24 CEST Maxime Ripard wrote:
> On Mon, Sep 04, 2017 at 12:40:53AM +0200, Stefan Br=C3=BCns wrote:
> > For the H3, the burst lengths field offsets in the channel configuratio=
n
> > register differs from earlier SoC generations.
> >=20
> > Using the A31 register macros actually configured the H3 controller
> > do to bursts of length 1 always, which although working leads to higher
> > bus utilisation.
> >=20
> > Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> > ---
> >=20
> >  drivers/dma/sun6i-dma.c | 28 +++++++++++++++++++++-------
> >  1 file changed, 21 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> > index 1d9b3be30d22..f1a139f0102f 100644
> > --- a/drivers/dma/sun6i-dma.c
> > +++ b/drivers/dma/sun6i-dma.c
> > @@ -68,13 +68,15 @@
> >=20
> >  #define DMA_CHAN_CFG_SRC_DRQ(x)		((x) & 0x1f)
> >  #define DMA_CHAN_CFG_SRC_IO_MODE	BIT(5)
> >  #define DMA_CHAN_CFG_SRC_LINEAR_MODE	(0 << 5)
> >=20
> > -#define DMA_CHAN_CFG_SRC_BURST(x)	(((x) & 0x3) << 7)
> > +#define DMA_CHAN_CFG_SRC_BURST_A31(x)	(((x) & 0x3) << 7)
> > +#define DMA_CHAN_CFG_SRC_BURST_H3(x)	(((x) & 0x3) << 6)
> >=20
> >  #define DMA_CHAN_CFG_SRC_WIDTH(x)	(((x) & 0x3) << 9)
> > =20
> >  #define DMA_CHAN_CFG_DST_DRQ(x)		(DMA_CHAN_CFG_SRC_DRQ(x) << 16)
> >  #define DMA_CHAN_CFG_DST_IO_MODE	(DMA_CHAN_CFG_SRC_IO_MODE << 16)
> >  #define DMA_CHAN_CFG_DST_LINEAR_MODE	(DMA_CHAN_CFG_SRC_LINEAR_MODE << =
16)
> >=20
> > -#define DMA_CHAN_CFG_DST_BURST(x)	(DMA_CHAN_CFG_SRC_BURST(x) << 16)
> > +#define DMA_CHAN_CFG_DST_BURST_A31(x)	(DMA_CHAN_CFG_SRC_BURST_A31(x) <=
<
> > 16) +#define DMA_CHAN_CFG_DST_BURST_H3(x)	(DMA_CHAN_CFG_SRC_BURST_H3(x)
> > << 16)>=20
> >  #define DMA_CHAN_CFG_DST_WIDTH(x)	(DMA_CHAN_CFG_SRC_WIDTH(x) << 16)
> > =20
> >  #define DMA_CHAN_CUR_SRC	0x10
> >=20
> > @@ -554,11 +556,17 @@ static int set_config(struct sun6i_dma_dev *sdev,
> >=20
> >  	if (dst_width < 0)
> >  =09
> >  		return dst_width;
> >=20
> > -	*p_cfg =3D DMA_CHAN_CFG_SRC_BURST(src_burst) |
> > -		DMA_CHAN_CFG_SRC_WIDTH(src_width) |
> > -		DMA_CHAN_CFG_DST_BURST(dst_burst) |
> > +	*p_cfg =3D DMA_CHAN_CFG_SRC_WIDTH(src_width) |
> >=20
> >  		DMA_CHAN_CFG_DST_WIDTH(dst_width);
> >=20
> > +	if (sdev->cfg->dmac_variant =3D=3D DMAC_VARIANT_H3) {
> > +		*p_cfg |=3D DMA_CHAN_CFG_SRC_BURST_H3(src_burst) |
> > +			  DMA_CHAN_CFG_DST_BURST_H3(dst_burst);
> > +	} else {
> > +		*p_cfg |=3D DMA_CHAN_CFG_SRC_BURST_A31(src_burst) |
> > +			  DMA_CHAN_CFG_DST_BURST_A31(dst_burst);
> > +	}
> > +
>=20
> I guess we have two options to support that properly. We could either
> have a different function that would generate that register value
> based on the parameters we have, or duplicate the set_config function
> entirely, with function pointer stored in the configuration.
>=20
> I think I prefer the former, as it reduces the code duplication.

Duplicating "set_config" would also mean duplicating sun6i_dma_prep_dma_mem=
cpy=20
- there are two hunks which change setting of the burst length register val=
ue.

A function pointer in the config would work.

Kind regards,

Stefan

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
