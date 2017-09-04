From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 02/10] dmaengine: sun6i: Correct burst length field
 offsets for H3
Date: Mon, 4 Sep 2017 09:59:24 +0200
Message-ID: <20170904075924.jufrqijrtxcqvztd@flea>
References: <20170903224100.17893-1-stefan.bruens@rwth-aachen.de>
 <20170903224100.17893-3-stefan.bruens@rwth-aachen.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xoyxyd4ub5zg7sc5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170903224100.17893-3-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--xoyxyd4ub5zg7sc5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 04, 2017 at 12:40:53AM +0200, Stefan Br=FCns wrote:
> For the H3, the burst lengths field offsets in the channel configuration
> register differs from earlier SoC generations.
>=20
> Using the A31 register macros actually configured the H3 controller
> do to bursts of length 1 always, which although working leads to higher
> bus utilisation.
>=20
> Signed-off-by: Stefan Br=FCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> ---
>  drivers/dma/sun6i-dma.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 1d9b3be30d22..f1a139f0102f 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -68,13 +68,15 @@
>  #define DMA_CHAN_CFG_SRC_DRQ(x)		((x) & 0x1f)
>  #define DMA_CHAN_CFG_SRC_IO_MODE	BIT(5)
>  #define DMA_CHAN_CFG_SRC_LINEAR_MODE	(0 << 5)
> -#define DMA_CHAN_CFG_SRC_BURST(x)	(((x) & 0x3) << 7)
> +#define DMA_CHAN_CFG_SRC_BURST_A31(x)	(((x) & 0x3) << 7)
> +#define DMA_CHAN_CFG_SRC_BURST_H3(x)	(((x) & 0x3) << 6)
>  #define DMA_CHAN_CFG_SRC_WIDTH(x)	(((x) & 0x3) << 9)
> =20
>  #define DMA_CHAN_CFG_DST_DRQ(x)		(DMA_CHAN_CFG_SRC_DRQ(x) << 16)
>  #define DMA_CHAN_CFG_DST_IO_MODE	(DMA_CHAN_CFG_SRC_IO_MODE << 16)
>  #define DMA_CHAN_CFG_DST_LINEAR_MODE	(DMA_CHAN_CFG_SRC_LINEAR_MODE << 16)
> -#define DMA_CHAN_CFG_DST_BURST(x)	(DMA_CHAN_CFG_SRC_BURST(x) << 16)
> +#define DMA_CHAN_CFG_DST_BURST_A31(x)	(DMA_CHAN_CFG_SRC_BURST_A31(x) << =
16)
> +#define DMA_CHAN_CFG_DST_BURST_H3(x)	(DMA_CHAN_CFG_SRC_BURST_H3(x) << 16)
>  #define DMA_CHAN_CFG_DST_WIDTH(x)	(DMA_CHAN_CFG_SRC_WIDTH(x) << 16)
> =20
>  #define DMA_CHAN_CUR_SRC	0x10
> @@ -554,11 +556,17 @@ static int set_config(struct sun6i_dma_dev *sdev,
>  	if (dst_width < 0)
>  		return dst_width;
> =20
> -	*p_cfg =3D DMA_CHAN_CFG_SRC_BURST(src_burst) |
> -		DMA_CHAN_CFG_SRC_WIDTH(src_width) |
> -		DMA_CHAN_CFG_DST_BURST(dst_burst) |
> +	*p_cfg =3D DMA_CHAN_CFG_SRC_WIDTH(src_width) |
>  		DMA_CHAN_CFG_DST_WIDTH(dst_width);
> =20
> +	if (sdev->cfg->dmac_variant =3D=3D DMAC_VARIANT_H3) {
> +		*p_cfg |=3D DMA_CHAN_CFG_SRC_BURST_H3(src_burst) |
> +			  DMA_CHAN_CFG_DST_BURST_H3(dst_burst);
> +	} else {
> +		*p_cfg |=3D DMA_CHAN_CFG_SRC_BURST_A31(src_burst) |
> +			  DMA_CHAN_CFG_DST_BURST_A31(dst_burst);
> +	}
> +

I guess we have two options to support that properly. We could either
have a different function that would generate that register value
based on the parameters we have, or duplicate the set_config function
entirely, with function pointer stored in the configuration.

I think I prefer the former, as it reduces the code duplication.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xoyxyd4ub5zg7sc5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZrQfcAAoJEBx+YmzsjxAgk9EQAKHQmYxeKLZMxPxDuasilkGS
2e4wSQvnMa85Ed84z/694OmZ36r6sxsOo0hhWRCi07KvLzlfZYy3ykWXbjSm77XQ
XuTQkLpg06KSdiWdM12V1HjHEL5fkkcm9w4jBLlINPspQA0fOhhL7vnf3hvwmpdT
OU8jWdHTfnMt4FIEhwjVb06jlzja42srsPBVNUXOWmxkfz0vgbCimw6l/u+xYiys
EidlCFhW+KxygMhelgfd++7Jxgh0toj+9/yl3u5uENgtba2m8NjUGEcVaz4k+BvX
h2swypj2R/vVwvEhlsY4M61ui6TLVu7CAd6BrmL4RQHnpYQHOAgfAUHaM7SBKlPv
ngfvSOjP62tQWtI8zqW59LIgReLZZBGwhe0T8pIX+KJrGE1VuJ3hHEFjLqgRIkqy
nV749IgFgv/oUVZK4ndwa+Yr25g6ac2/KAdQZQ61ZG6C1h5nlFMxGEJdVt3vIQDP
k6gvMLCXYFASDH97aOGBY/1f4H/AL68JJ7KCZJ1r6wJ904zW47tl2rdJnxfvKt75
gwMEtkLtyLjju2yy8Sre+VRNy3kyMzkWyL7HaXHWPUjk4fdF3MDL+IjAK74a8b5l
ZqnypABJjqn2oQLkcANmelEOfwpZNkefoO7/ZKa/E6jNc5kRhTJPpcyjqWfhXj2A
LsGXOsi9Mf8XRs/n3xeP
=7xO7
-----END PGP SIGNATURE-----

--xoyxyd4ub5zg7sc5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
