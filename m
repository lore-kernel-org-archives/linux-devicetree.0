From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/3] dmaengine: sun6i: Correct DMA support on H3
Date: Thu, 31 Aug 2017 16:51:35 +0200
Message-ID: <20170831145135.c6a2wubcf6xu34tz@flea.lan>
References: <20170830233609.13855-1-stefan.bruens@rwth-aachen.de>
 <20170830233609.13855-2-stefan.bruens@rwth-aachen.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6ccoewc44gprs6ks"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170830233609.13855-2-stefan.bruens@rwth-aachen.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens@rwth-aachen.de>
Cc: linux-sunxi@googlegroups.com, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--6ccoewc44gprs6ks
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 31, 2017 at 01:36:07AM +0200, Stefan Br=FCns wrote:
> +/* Between SoC generations, there are some significant differences:
> + * - A23 added a clock gate register
> + * - the H3 burst length field has a different offset
> + */

This is not the proper comment style.

> +enum dmac_variant {
> +	DMAC_VARIANT_A31,
> +	DMAC_VARIANT_A23,
> +	DMAC_VARIANT_H3,
> +};
> +

And this is redundant with what we already have in our structures.

>  /*
>   * Hardware channels / ports representation
>   *
> @@ -101,6 +116,7 @@ struct sun6i_dma_config {
>  	u32 nr_max_channels;
>  	u32 nr_max_requests;
>  	u32 nr_max_vchans;
> +	enum dmac_variant dmac_variant;
>  };
> =20
>  /*
> @@ -240,8 +256,12 @@ static inline s8 convert_burst(u32 maxburst)
>  	switch (maxburst) {
>  	case 1:
>  		return 0;
> +	case 4:
> +		return 1;
>  	case 8:
>  		return 2;
> +	case 16:
> +		return 3;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -249,11 +269,7 @@ static inline s8 convert_burst(u32 maxburst)
> =20
>  static inline s8 convert_buswidth(enum dma_slave_buswidth addr_width)
>  {
> -	if ((addr_width < DMA_SLAVE_BUSWIDTH_1_BYTE) ||
> -	    (addr_width > DMA_SLAVE_BUSWIDTH_4_BYTES))
> -		return -EINVAL;
> -
> -	return addr_width >> 1;
> +	return ilog2(addr_width);
>  }

This isn't really the same operation. There should be some explanation
about why it's the right thing to do.

>  static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
> @@ -499,45 +515,58 @@ static int set_config(struct sun6i_dma_dev *sdev,
>  			enum dma_transfer_direction direction,
>  			u32 *p_cfg)
>  {
> +	enum dma_slave_buswidth src_addr_width, dst_addr_width;
> +	u32 src_maxburst, dst_maxburst, supported_burst_length;
>  	s8 src_width, dst_width, src_burst, dst_burst;
> =20
> +	src_addr_width =3D sconfig->src_addr_width;
> +	dst_addr_width =3D sconfig->dst_addr_width;
> +	src_maxburst =3D sconfig->src_maxburst;
> +	dst_maxburst =3D sconfig->dst_maxburst;
> +
> +	if (sdev->cfg->dmac_variant =3D=3D DMAC_VARIANT_H3)
> +		supported_burst_length =3D BIT(1) | BIT(4) | BIT(8) | BIT(16);
> +	else
> +		supported_burst_length =3D BIT(1) | BIT(8);

This could be stored in the structure for example.

>  	switch (direction) {
>  	case DMA_MEM_TO_DEV:
> -		src_burst =3D convert_burst(sconfig->src_maxburst ?
> -					sconfig->src_maxburst : 8);
> -		src_width =3D convert_buswidth(sconfig->src_addr_width !=3D
> -						DMA_SLAVE_BUSWIDTH_UNDEFINED ?
> -				sconfig->src_addr_width :
> -				DMA_SLAVE_BUSWIDTH_4_BYTES);
> -		dst_burst =3D convert_burst(sconfig->dst_maxburst);
> -		dst_width =3D convert_buswidth(sconfig->dst_addr_width);
> +		if (src_addr_width =3D=3D DMA_SLAVE_BUSWIDTH_UNDEFINED)
> +			src_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> +		src_maxburst =3D src_maxburst ? src_maxburst : 8;
>  		break;
>  	case DMA_DEV_TO_MEM:
> -		src_burst =3D convert_burst(sconfig->src_maxburst);
> -		src_width =3D convert_buswidth(sconfig->src_addr_width);
> -		dst_burst =3D convert_burst(sconfig->dst_maxburst ?
> -					sconfig->dst_maxburst : 8);
> -		dst_width =3D convert_buswidth(sconfig->dst_addr_width !=3D
> -						DMA_SLAVE_BUSWIDTH_UNDEFINED ?
> -				sconfig->dst_addr_width :
> -				DMA_SLAVE_BUSWIDTH_4_BYTES);
> +		if (dst_addr_width =3D=3D DMA_SLAVE_BUSWIDTH_UNDEFINED)
> +			dst_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> +		dst_maxburst =3D dst_maxburst ? dst_maxburst : 8;
>  		break;
>  	default:
>  		return -EINVAL;
>  	}
> =20
> -	if (src_burst < 0)
> -		return src_burst;
> -	if (src_width < 0)
> -		return src_width;
> -	if (dst_burst < 0)
> -		return dst_burst;
> -	if (dst_width < 0)
> -		return dst_width;
> -
> -	*p_cfg =3D DMA_CHAN_CFG_SRC_BURST(src_burst) |
> -		DMA_CHAN_CFG_SRC_WIDTH(src_width) |
> -		DMA_CHAN_CFG_DST_BURST(dst_burst) |
> +	if (!(BIT(src_addr_width) & sdev->slave.src_addr_widths))
> +		return -EINVAL;
> +	if (!(BIT(dst_addr_width) & sdev->slave.dst_addr_widths))
> +		return -EINVAL;
> +	if (!(BIT(src_maxburst) & supported_burst_length))
> +		return -EINVAL;
> +	if (!(BIT(dst_maxburst) & supported_burst_length))
> +		return -EINVAL;
> +
> +	src_width =3D convert_buswidth(src_addr_width);
> +	dst_width =3D convert_buswidth(dst_addr_width);
> +	dst_burst =3D convert_burst(dst_maxburst);
> +	src_burst =3D convert_burst(src_maxburst);

I'm not sure what you're trying to do here. Could you split your patch
by logical change, this doesn't seem related to just supporting the
H3, but a heavier refactoring.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--6ccoewc44gprs6ks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZqCJ3AAoJEBx+YmzsjxAgWGgP/3UMnSaueeYbH6srcgK5mEn3
HiNw8m3jEO4fdN9VfjEF7A8JpBr4zpL+GMNiKu64s5vgI1fcgAVzzgSWrHbU0uta
evjoJkr0CpEAdqmxi6PlFAudm8dEyAiqz5oNL/4dIqVs0HUGwWKVx90Tct7U2fMc
fV57vkEmsuGOQ6YoM3BuLFbXdMT3NW5hQFfv/q8Q2l40FkYUIiMxqN6/jlQ8rZiR
cCABkmiZ0XxsX0FCy+g28Q6rWjS3H3sDx4RVlIiq95jAT1SPPDHdw+qW6b6g8aZ9
PxYOwOU8bzg23T4ePeRCvOpf8d3N9UDZyaUYPiCemFPBYkSXU4gCW+016igENLP/
bX21l9CzJfk+lslRvKKfERltkv13mFZCWqs7xJBzZ6arRDv+U/1zT0S2zEUNRZXk
MRzAlv8RROo+Q2LhhwjP56W3EcjbnYPnSQXjjHT2ICLBdT3gVPL27nKf85/nobp9
8pH1QWYdgGnpMdG4yX5DcxBqkR6wHzo9x3sxIDcJVsEhkA/Q/osvYIcNSy2cFiRE
Dh3DNrH1S3xYOHPecgAbn8DS6Ed7hHtKbXvUIU6s/xf9DPN0GF5If76GjuMhkML9
DLC54yrxVvjBKwJKY50LHqtYblPm6+Gh5S9LsztF2KJu+2+2IiRHqMGF1D1KzrOQ
qDvbsxafZTUcK99nB7NV
=RLAB
-----END PGP SIGNATURE-----

--6ccoewc44gprs6ks--
