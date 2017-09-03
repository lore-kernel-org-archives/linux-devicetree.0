From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 07/10] dmaengine: sun6i: Retrieve channel
 count/max request from devicetree
Date: Mon, 4 Sep 2017 00:44:54 +0100
Message-ID: <d211b11c-09f6-8a69-2560-6be89f3b9c3c@arm.com>
References: <20170903224100.17893-1-stefan.bruens@rwth-aachen.de>
 <20170903224100.17893-8-stefan.bruens@rwth-aachen.de>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBU5JWLGQKGQERI5RLLA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170903224100.17893-8-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?Q?Stefan_Br=c3=bcns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 03/09/17 23:40, Stefan Br=C3=BCns wrote:
> To avoid introduction of a new compatible for each small SoC/DMA controll=
er
> variation, move the definition of the channel count to the devicetree.
>=20
> The number of vchans is no longer explicit, but limited by the highest
> port/DMA request number. The result is a slight overallocation for SoCs
> with a sparse port mapping.
>=20
> Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> ---
>  drivers/dma/sun6i-dma.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index c69dadb853d2..bd4c2e4a759b 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -42,6 +42,9 @@
> =20
>  #define DMA_STAT		0x30
> =20
> +/* Offset between DMA_IRQ_EN and DMA_IRQ_STAT limits number of channels =
*/
> +#define DMA_MAX_CHANNELS	(DMA_IRQ_CHAN_NR * 0x10 / 4)
> +
>  /*
>   * sun8i specific registers
>   */
> @@ -65,7 +68,8 @@
>  #define DMA_CHAN_LLI_ADDR	0x08
> =20
>  #define DMA_CHAN_CUR_CFG	0x0c
> -#define DMA_CHAN_CFG_SRC_DRQ(x)		((x) & 0x1f)
> +#define DMA_CHAN_MAX_DRQ		0x1f
> +#define DMA_CHAN_CFG_SRC_DRQ(x)		((x) & DMA_CHAN_MAX_DRQ)
>  #define DMA_CHAN_CFG_SRC_IO_MODE	BIT(5)
>  #define DMA_CHAN_CFG_SRC_LINEAR_MODE	(0 << 5)
>  #define DMA_CHAN_CFG_SRC_BURST_A31(x)	(((x) & 0x3) << 7)
> @@ -1173,6 +1177,35 @@ static int sun6i_dma_probe(struct platform_device =
*pdev)
>  	sdc->num_vchans =3D sdc->cfg->nr_max_vchans;
>  	sdc->max_request =3D sdc->cfg->nr_max_requests;
> =20
> +	ret =3D of_property_read_u32(np, "dma-channels", &sdc->num_pchans);
> +	if (ret && !sdc->num_pchans) {
> +		dev_err(&pdev->dev, "Can't get dma-channels.\n");
> +		return ret;
> +	}
> +
> +	if (sdc->num_pchans > DMA_MAX_CHANNELS) {
> +		dev_err(&pdev->dev, "Number of dma-channels out of range.\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D of_property_read_u32(np, "dma-requests", &sdc->max_request);
> +	if (ret && !sdc->max_request) {
> +		dev_info(&pdev->dev, "Missing dma-requests, using %u.\n",
> +			 DMA_CHAN_MAX_DRQ);

Mmmh, is this mapping of "!sdc->max_request" -> DMA_CHAN_MAX_DRQ
implemented somewhere else? Or is it just missing here:
		sdc->max_request =3D DMA_CHAN_MAX_DRQ;

Otherwise this is looking good, thanks for picking up the DT property
approach!

Cheers,
Andre.

> +	}
> +
> +	if (sdc->max_request > DMA_CHAN_MAX_DRQ) {
> +		dev_err(&pdev->dev, "Value of dma-requests out of range.\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * If the number of vchans is not specified, derive it from the
> +	 * highest port number, at most one channel per port and direction.
> +	 */
> +	if (!sdc->num_vchans)
> +		sdc->num_vchans =3D 2 * (sdc->max_request + 1);
> +
>  	sdc->pchans =3D devm_kcalloc(&pdev->dev, sdc->num_pchans,
>  				   sizeof(struct sun6i_pchan), GFP_KERNEL);
>  	if (!sdc->pchans)
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
