From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 04/10] dmaengine: sun6i: Enable additional burst
 lengths/widths on H3
Date: Mon, 4 Sep 2017 10:00:25 +0200
Message-ID: <20170904080025.eilcinu4ennj5fmb@flea>
References: <20170903224100.17893-1-stefan.bruens@rwth-aachen.de>
 <20170903224100.17893-5-stefan.bruens@rwth-aachen.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="huxm5lncrvognyil"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170903224100.17893-5-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--huxm5lncrvognyil
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 04, 2017 at 12:40:55AM +0200, Stefan Br=FCns wrote:
> The H3 supports bursts lengths of 1, 4, 8 and 16 transfers, each with
> a width of 1, 2, 4 or 8 bytes.
>=20
> The register value for the the width is log2-encoded, change the
> conversion function to provide the correct value for width =3D=3D 8.
>=20
> Signed-off-by: Stefan Br=FCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> ---
>  drivers/dma/sun6i-dma.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index c5644bd0f91a..335a8ec88b0b 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -263,8 +263,12 @@ static inline s8 convert_burst(u32 maxburst)
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
> @@ -272,7 +276,7 @@ static inline s8 convert_burst(u32 maxburst)
> =20
>  static inline s8 convert_buswidth(enum dma_slave_buswidth addr_width)
>  {
> -	return addr_width >> 1;
> +	return ilog2(addr_width);
>  }
> =20
>  static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
> @@ -1152,6 +1156,12 @@ static int sun6i_dma_probe(struct platform_device =
*pdev)
>  						  BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
>  	sdc->src_burst_lengths			=3D BIT(1) | BIT(8);
>  	sdc->dst_burst_lengths			=3D BIT(1) | BIT(8);
> +	if (sdc->cfg->dmac_variant =3D=3D DMAC_VARIANT_H3) {
> +		sdc->slave.src_addr_widths |=3D BIT(DMA_SLAVE_BUSWIDTH_8_BYTES);
> +		sdc->slave.dst_addr_widths |=3D BIT(DMA_SLAVE_BUSWIDTH_8_BYTES);
> +		sdc->src_burst_lengths     |=3D BIT(4) | BIT(16);
> +		sdc->dst_burst_lengths     |=3D BIT(4) | BIT(16);
> +	}

The rest looks good, but that should be stored in the sun6i_dma_config
structure too.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--huxm5lncrvognyil
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZrQgZAAoJEBx+YmzsjxAgY+cQAMCPzaAsQY3oNxuEg4sExr+Q
IpBlAwyDSzrBQlqeO4PgPP1veeutXwOLKL96D+x6r4Lsovip94sxh+q2h5SIrmYo
mR/hxaRfH4kiJuryTxD4ymonP+q5u5xdOalf15CUQ5c9Vmb5dipZ92gHJBZgJ85E
necGIPuITAbq9adoQUa4WxIogSS7HJnJEJwh0MOzfKRrsX/pAqTEk+M6yszvDonG
B/dK1Jw4S+52+L90+zpRdis13oUUre5o/ctqIl+YqXy75ECrIXAehuYuWdjGZmFS
6ZrEcHfKs1lbkHQFK3hfc8LdYU4MDlRg8wsd2NjpOMhCBNlhJqFgxc2Zj6sIvOCd
Mc4jOtp5AJT3JgxRCwEVAX7O4DAHu6fgVheJZUanNojZKBTtgAJtNS58k+/wcAv6
ScsvC2pZKVMn3G9+9uaKDcDgbdGXIgAWUDeIOPWGezCIb0GfOP1746zF12oSQb4x
d8GQxeyasUZY2I+rQCYdYG+qqFqisoeu6rcr/N9WAg9fwIm4CQ8VUwhd2MULAg2I
dBQAQjVdZvRbbqWzgbvHhslT7GHhwOP7hws32Q5yHGUzbLVkTRDVQwq51FjpDzaV
jiBpY4Db5BGj8NZb8m5UocRx8rpfm1MjjT7DeHx9EMCn0FtyayCdzKYQSbilygiB
WBTh8ft2B/Ed8In7laCd
=3QcD
-----END PGP SIGNATURE-----

--huxm5lncrvognyil--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
