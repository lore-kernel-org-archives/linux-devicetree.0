From: Stefan Bruens <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [PATCH 1/3] dmaengine: sun6i: Correct DMA support
 on H3
Date: Fri, 1 Sep 2017 05:04:54 +0200
Message-ID: <a649f98d4ac44abc873c5110ce9363e5@rwthex-w2-b.rwth-ad.de>
References: <20170830233609.13855-1-stefan.bruens@rwth-aachen.de> <20170830233609.13855-2-stefan.bruens@rwth-aachen.de> <20170831145135.c6a2wubcf6xu34tz@flea.lan>
Reply-To: stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDIYL7P2SAMRBW44UPGQKGQEGVDQPRY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170831145135.c6a2wubcf6xu34tz-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Stefan =?ISO-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Donnerstag, 31. August 2017 16:51:35 CEST Maxime Ripard wrote:
> Hi,
>=20
> On Thu, Aug 31, 2017 at 01:36:07AM +0200, Stefan Br=C3=BCns wrote:
> > +/* Between SoC generations, there are some significant differences:
> > + * - A23 added a clock gate register
> > + * - the H3 burst length field has a different offset
> > + */
>=20
> This is not the proper comment style.
>=20
> > +enum dmac_variant {
> > +	DMAC_VARIANT_A31,
> > +	DMAC_VARIANT_A23,
> > +	DMAC_VARIANT_H3,
> > +};
> > +
>=20
> And this is redundant with what we already have in our structures.

Actually, its not. For H3, there are currently at least 3 register compatib=
le=20
SoCs: H5 is identical, R40 has 16 dma channels, A64 has 8 channels. So if t=
he=20
current config structure is kept, we need 3 different compatible strings. S=
ame=20
for the A23, which is register compatible to e.g. A83t and V3s, but with=20
different numbers of DMA channels.

So either you decorate the code with a cascade of

if ((of_is_compatible(..A23..) || of_is_compatible(..A83T..) || ...) {
} else if ((of_is_compatible(..H3..) || of_is_compatible(..A64..) || ...) {
} else { /* A31 */
}

in a number of places, or you do it just once.

>=20
> >  /*
> > =20
> >   * Hardware channels / ports representation
> >   *
> >=20
> > @@ -101,6 +116,7 @@ struct sun6i_dma_config {
> >=20
> >  	u32 nr_max_channels;
> >  	u32 nr_max_requests;
> >  	u32 nr_max_vchans;
> >=20
> > +	enum dmac_variant dmac_variant;
> >=20
> >  };
> > =20
> >  /*
> >=20
> > @@ -240,8 +256,12 @@ static inline s8 convert_burst(u32 maxburst)
> >=20
> >  	switch (maxburst) {
> >  =09
> >  	case 1:
> >  		return 0;
> >=20
> > +	case 4:
> > +		return 1;
> >=20
> >  	case 8:
> >  		return 2;
> >=20
> > +	case 16:
> > +		return 3;
> >=20
> >  	default:
> >  		return -EINVAL;
> >  =09
> >  	}
> >=20
> > @@ -249,11 +269,7 @@ static inline s8 convert_burst(u32 maxburst)
> >=20
> >  static inline s8 convert_buswidth(enum dma_slave_buswidth addr_width)
> >  {
> >=20
> > -	if ((addr_width < DMA_SLAVE_BUSWIDTH_1_BYTE) ||
> > -	    (addr_width > DMA_SLAVE_BUSWIDTH_4_BYTES))
> > -		return -EINVAL;
> > -
> > -	return addr_width >> 1;
> > +	return ilog2(addr_width);
> >=20
> >  }
>=20
> This isn't really the same operation. There should be some explanation
> about why it's the right thing to do.

For 1, 2 and 4 it is the same. The correct register value for 8 bytes,=20
supported by H3, H5, A64 and R40, is 3.

>=20
> >  static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
> >=20
> > @@ -499,45 +515,58 @@ static int set_config(struct sun6i_dma_dev *sdev,
> >=20
> >  			enum dma_transfer_direction direction,
> >  			u32 *p_cfg)
> > =20
> >  {
> >=20
> > +	enum dma_slave_buswidth src_addr_width, dst_addr_width;
> > +	u32 src_maxburst, dst_maxburst, supported_burst_length;
> >=20
> >  	s8 src_width, dst_width, src_burst, dst_burst;
> >=20
> > +	src_addr_width =3D sconfig->src_addr_width;
> > +	dst_addr_width =3D sconfig->dst_addr_width;
> > +	src_maxburst =3D sconfig->src_maxburst;
> > +	dst_maxburst =3D sconfig->dst_maxburst;
> > +
> > +	if (sdev->cfg->dmac_variant =3D=3D DMAC_VARIANT_H3)
> > +		supported_burst_length =3D BIT(1) | BIT(4) | BIT(8) | BIT(16);
> > +	else
> > +		supported_burst_length =3D BIT(1) | BIT(8);
>=20
> This could be stored in the structure for example.

Which one? sun6i_dma_dev? sun6i_dma_config?
=20
> >  	switch (direction) {
> >=20
> >  	case DMA_MEM_TO_DEV:
> > -		src_burst =3D convert_burst(sconfig->src_maxburst ?
> > -					sconfig->src_maxburst : 8);
> > -		src_width =3D convert_buswidth(sconfig->src_addr_width !=3D
> > -						DMA_SLAVE_BUSWIDTH_UNDEFINED ?
> > -				sconfig->src_addr_width :
> > -				DMA_SLAVE_BUSWIDTH_4_BYTES);
> > -		dst_burst =3D convert_burst(sconfig->dst_maxburst);
> > -		dst_width =3D convert_buswidth(sconfig->dst_addr_width);
> > +		if (src_addr_width =3D=3D DMA_SLAVE_BUSWIDTH_UNDEFINED)
> > +			src_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> > +		src_maxburst =3D src_maxburst ? src_maxburst : 8;
> >=20
> >  		break;
> >  =09
> >  	case DMA_DEV_TO_MEM:
> > -		src_burst =3D convert_burst(sconfig->src_maxburst);
> > -		src_width =3D convert_buswidth(sconfig->src_addr_width);
> > -		dst_burst =3D convert_burst(sconfig->dst_maxburst ?
> > -					sconfig->dst_maxburst : 8);
> > -		dst_width =3D convert_buswidth(sconfig->dst_addr_width !=3D
> > -						DMA_SLAVE_BUSWIDTH_UNDEFINED ?
> > -				sconfig->dst_addr_width :
> > -				DMA_SLAVE_BUSWIDTH_4_BYTES);
> > +		if (dst_addr_width =3D=3D DMA_SLAVE_BUSWIDTH_UNDEFINED)
> > +			dst_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> > +		dst_maxburst =3D dst_maxburst ? dst_maxburst : 8;
> >=20
> >  		break;
> >  =09
> >  	default:
> >  		return -EINVAL;
> >  =09
> >  	}
> >=20
> > -	if (src_burst < 0)
> > -		return src_burst;
> > -	if (src_width < 0)
> > -		return src_width;
> > -	if (dst_burst < 0)
> > -		return dst_burst;
> > -	if (dst_width < 0)
> > -		return dst_width;
> > -
> > -	*p_cfg =3D DMA_CHAN_CFG_SRC_BURST(src_burst) |
> > -		DMA_CHAN_CFG_SRC_WIDTH(src_width) |
> > -		DMA_CHAN_CFG_DST_BURST(dst_burst) |
> > +	if (!(BIT(src_addr_width) & sdev->slave.src_addr_widths))
> > +		return -EINVAL;
> > +	if (!(BIT(dst_addr_width) & sdev->slave.dst_addr_widths))
> > +		return -EINVAL;
> > +	if (!(BIT(src_maxburst) & supported_burst_length))
> > +		return -EINVAL;
> > +	if (!(BIT(dst_maxburst) & supported_burst_length))
> > +		return -EINVAL;
> > +
> > +	src_width =3D convert_buswidth(src_addr_width);
> > +	dst_width =3D convert_buswidth(dst_addr_width);
> > +	dst_burst =3D convert_burst(dst_maxburst);
> > +	src_burst =3D convert_burst(src_maxburst);
>=20
> I'm not sure what you're trying to do here. Could you split your patch
> by logical change, this doesn't seem related to just supporting the
> H3, but a heavier refactoring.

Untangling 3 independent steps - handling of DMA_SLAVE_BUSWIDTH_UNDEFINED,=
=20
range checking, and conversion to register value. As the valid ranges depen=
d=20
on the controller, the code is much easier to read if the range check is do=
ne=20
first, and then the conversion.

Kind regards,

Stefan

--=20
Stefan Br=C3=BCns  /  Bergstra=C3=9Fe 21  /  52062 Aachen
home: +49 241 53809034     mobile: +49 151 50412019

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
