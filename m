From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/3] dmaengine: sun6i: Correct DMA support on H3
Date: Fri, 1 Sep 2017 15:35:49 +0200
Message-ID: <20170901133549.cr2ivmfr5mnrdujg@flea>
References: <20170830233609.13855-1-stefan.bruens@rwth-aachen.de>
 <20170830233609.13855-2-stefan.bruens@rwth-aachen.de>
 <20170831145135.c6a2wubcf6xu34tz@flea.lan>
 <a649f98d4ac44abc873c5110ce9363e5@rwthex-w2-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ezvmhlantquspm52"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a649f98d4ac44abc873c5110ce9363e5@rwthex-w2-b.rwth-ad.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Bruens <stefan.bruens@rwth-aachen.de>
Cc: linux-sunxi <linux-sunxi@googlegroups.com>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, vinod.koul@intel.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--ezvmhlantquspm52
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2017 at 05:04:54AM +0200, Stefan Bruens wrote:
> On Donnerstag, 31. August 2017 16:51:35 CEST Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Aug 31, 2017 at 01:36:07AM +0200, Stefan Br=FCns wrote:
> > > +/* Between SoC generations, there are some significant differences:
> > > + * - A23 added a clock gate register
> > > + * - the H3 burst length field has a different offset
> > > + */
> >=20
> > This is not the proper comment style.
> >=20
> > > +enum dmac_variant {
> > > +	DMAC_VARIANT_A31,
> > > +	DMAC_VARIANT_A23,
> > > +	DMAC_VARIANT_H3,
> > > +};
> > > +
> >=20
> > And this is redundant with what we already have in our structures.
>=20
> Actually, its not. For H3, there are currently at least 3 register compat=
ible=20
> SoCs: H5 is identical, R40 has 16 dma channels, A64 has 8 channels. So if=
 the=20
> current config structure is kept, we need 3 different compatible strings.=
 Same=20
> for the A23, which is register compatible to e.g. A83t and V3s, but with=
=20
> different numbers of DMA channels.
>=20
> So either you decorate the code with a cascade of
>=20
> if ((of_is_compatible(..A23..) || of_is_compatible(..A83T..) || ...) {
> } else if ((of_is_compatible(..H3..) || of_is_compatible(..A64..) || ...)=
 {
> } else { /* A31 */
> }
>=20
> in a number of places, or you do it just once.

That's not how you retrieve the structures. They are already
associated to the compatible, and you need to do a single lookup to
get them. So that's nowhere near what you're suggesting. You can have
a look at the of_match_device in the probe function.

>=20
> >=20
> > >  /*
> > > =20
> > >   * Hardware channels / ports representation
> > >   *
> > >=20
> > > @@ -101,6 +116,7 @@ struct sun6i_dma_config {
> > >=20
> > >  	u32 nr_max_channels;
> > >  	u32 nr_max_requests;
> > >  	u32 nr_max_vchans;
> > >=20
> > > +	enum dmac_variant dmac_variant;
> > >=20
> > >  };
> > > =20
> > >  /*
> > >=20
> > > @@ -240,8 +256,12 @@ static inline s8 convert_burst(u32 maxburst)
> > >=20
> > >  	switch (maxburst) {
> > >  =09
> > >  	case 1:
> > >  		return 0;
> > >=20
> > > +	case 4:
> > > +		return 1;
> > >=20
> > >  	case 8:
> > >  		return 2;
> > >=20
> > > +	case 16:
> > > +		return 3;
> > >=20
> > >  	default:
> > >  		return -EINVAL;
> > >  =09
> > >  	}
> > >=20
> > > @@ -249,11 +269,7 @@ static inline s8 convert_burst(u32 maxburst)
> > >=20
> > >  static inline s8 convert_buswidth(enum dma_slave_buswidth addr_width)
> > >  {
> > >=20
> > > -	if ((addr_width < DMA_SLAVE_BUSWIDTH_1_BYTE) ||
> > > -	    (addr_width > DMA_SLAVE_BUSWIDTH_4_BYTES))
> > > -		return -EINVAL;
> > > -
> > > -	return addr_width >> 1;
> > > +	return ilog2(addr_width);
> > >=20
> > >  }
> >=20
> > This isn't really the same operation. There should be some explanation
> > about why it's the right thing to do.
>=20
> For 1, 2 and 4 it is the same. The correct register value for 8 bytes,=20
> supported by H3, H5, A64 and R40, is 3.

That should be in a separate patch, with that in the commit log.

> > >  static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
> > >=20
> > > @@ -499,45 +515,58 @@ static int set_config(struct sun6i_dma_dev *sde=
v,
> > >=20
> > >  			enum dma_transfer_direction direction,
> > >  			u32 *p_cfg)
> > > =20
> > >  {
> > >=20
> > > +	enum dma_slave_buswidth src_addr_width, dst_addr_width;
> > > +	u32 src_maxburst, dst_maxburst, supported_burst_length;
> > >=20
> > >  	s8 src_width, dst_width, src_burst, dst_burst;
> > >=20
> > > +	src_addr_width =3D sconfig->src_addr_width;
> > > +	dst_addr_width =3D sconfig->dst_addr_width;
> > > +	src_maxburst =3D sconfig->src_maxburst;
> > > +	dst_maxburst =3D sconfig->dst_maxburst;
> > > +
> > > +	if (sdev->cfg->dmac_variant =3D=3D DMAC_VARIANT_H3)
> > > +		supported_burst_length =3D BIT(1) | BIT(4) | BIT(8) | BIT(16);
> > > +	else
> > > +		supported_burst_length =3D BIT(1) | BIT(8);
> >=20
> > This could be stored in the structure for example.
>=20
> Which one? sun6i_dma_dev? sun6i_dma_config?

The one associated with the compatible, so sun6i_dma_config.

> =20
> > >  	switch (direction) {
> > >=20
> > >  	case DMA_MEM_TO_DEV:
> > > -		src_burst =3D convert_burst(sconfig->src_maxburst ?
> > > -					sconfig->src_maxburst : 8);
> > > -		src_width =3D convert_buswidth(sconfig->src_addr_width !=3D
> > > -						DMA_SLAVE_BUSWIDTH_UNDEFINED ?
> > > -				sconfig->src_addr_width :
> > > -				DMA_SLAVE_BUSWIDTH_4_BYTES);
> > > -		dst_burst =3D convert_burst(sconfig->dst_maxburst);
> > > -		dst_width =3D convert_buswidth(sconfig->dst_addr_width);
> > > +		if (src_addr_width =3D=3D DMA_SLAVE_BUSWIDTH_UNDEFINED)
> > > +			src_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> > > +		src_maxburst =3D src_maxburst ? src_maxburst : 8;
> > >=20
> > >  		break;
> > >  =09
> > >  	case DMA_DEV_TO_MEM:
> > > -		src_burst =3D convert_burst(sconfig->src_maxburst);
> > > -		src_width =3D convert_buswidth(sconfig->src_addr_width);
> > > -		dst_burst =3D convert_burst(sconfig->dst_maxburst ?
> > > -					sconfig->dst_maxburst : 8);
> > > -		dst_width =3D convert_buswidth(sconfig->dst_addr_width !=3D
> > > -						DMA_SLAVE_BUSWIDTH_UNDEFINED ?
> > > -				sconfig->dst_addr_width :
> > > -				DMA_SLAVE_BUSWIDTH_4_BYTES);
> > > +		if (dst_addr_width =3D=3D DMA_SLAVE_BUSWIDTH_UNDEFINED)
> > > +			dst_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> > > +		dst_maxburst =3D dst_maxburst ? dst_maxburst : 8;
> > >=20
> > >  		break;
> > >  =09
> > >  	default:
> > >  		return -EINVAL;
> > >  =09
> > >  	}
> > >=20
> > > -	if (src_burst < 0)
> > > -		return src_burst;
> > > -	if (src_width < 0)
> > > -		return src_width;
> > > -	if (dst_burst < 0)
> > > -		return dst_burst;
> > > -	if (dst_width < 0)
> > > -		return dst_width;
> > > -
> > > -	*p_cfg =3D DMA_CHAN_CFG_SRC_BURST(src_burst) |
> > > -		DMA_CHAN_CFG_SRC_WIDTH(src_width) |
> > > -		DMA_CHAN_CFG_DST_BURST(dst_burst) |
> > > +	if (!(BIT(src_addr_width) & sdev->slave.src_addr_widths))
> > > +		return -EINVAL;
> > > +	if (!(BIT(dst_addr_width) & sdev->slave.dst_addr_widths))
> > > +		return -EINVAL;
> > > +	if (!(BIT(src_maxburst) & supported_burst_length))
> > > +		return -EINVAL;
> > > +	if (!(BIT(dst_maxburst) & supported_burst_length))
> > > +		return -EINVAL;
> > > +
> > > +	src_width =3D convert_buswidth(src_addr_width);
> > > +	dst_width =3D convert_buswidth(dst_addr_width);
> > > +	dst_burst =3D convert_burst(dst_maxburst);
> > > +	src_burst =3D convert_burst(src_maxburst);
> >=20
> > I'm not sure what you're trying to do here. Could you split your patch
> > by logical change, this doesn't seem related to just supporting the
> > H3, but a heavier refactoring.
>=20
> Untangling 3 independent steps - handling of DMA_SLAVE_BUSWIDTH_UNDEFINED=
,=20
> range checking, and conversion to register value. As the valid ranges dep=
end=20
> on the controller, the code is much easier to read if the range check is =
done=20
> first, and then the conversion.

Please make separate patches as well for the splitting up of each of
those steps.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ezvmhlantquspm52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZqWI1AAoJEBx+YmzsjxAg6OYP/RpN0EuE1by3Su03FSJHKVEH
a2CzQ3T2MdVucROV4yHjNAhoH9nC8NMihF16NAAwub8Eqtm3uG2fNx2psGFOBAx+
0+R2YeEWmgGo40kDMJGD+MkcB5yE/S28CX5cb0PkbBBePYUXXwlQlp/hW4h2A35D
bbKagoC24FUeOcnLHlv68KmisQGclkNzQoXHN9e4q6IUKTgvQGaoV2+8eclOeAy2
qLSHjHDVtYyiuAb8iSrxYyNwKTwM5SkrgskHGR9mI7uTv5WYyJcHdjZ/X7m7ZPu3
Ut8leArHi1OnMrySJz72ow5a3nY6wJf4RPxrRLt/cFko2jcxtdW3/VGe/9FigN1D
IAOD4MOdgDJv++SrFqw2gKAcy1tr0tLcO2uHspH8vDl8ZIDJDMnA5lbBOIUs83oU
YtdRH4lKcIiRQAAo5F8/0o7SvM4PEMqZfuu+B0GtJKwUW4wrQQkTHDs1yg75wi66
Kpc8KvBWv58+i01qMgmhQt2EA+mJvrFEJS31l8LHnMVmulT2djz7YHm+vF3AxRxW
ez4MhCUi6mgicy2wQ4/ik282bI1vvNeUZ8scNqaWw9NRFbXdARanUUVCwUu8ugA2
xg73TiLbnH69YjLFWfNmmU1Yy1DNb1nYMm8XORgG7tXvz+Ojv/0FmWlIsu5/OS9l
HeuS9zruBqcZ5W8NogGS
=b5en
-----END PGP SIGNATURE-----

--ezvmhlantquspm52--
