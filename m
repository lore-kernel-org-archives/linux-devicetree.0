From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 02/14] dmaengine: dma-jz4780: Separate chan/ctrl registers
Date: Tue, 3 Jul 2018 09:53:02 -0700
Message-ID: <20180703165302.3gdukxwwro5cwqba@pburton-laptop>
References: <20180703123214.23090-1-paul@crapouillou.net>
 <20180703123214.23090-3-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180703123214.23090-3-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Hi Paul,

On Tue, Jul 03, 2018 at 02:32:02PM +0200, Paul Cercueil wrote:
> @@ -804,9 +818,19 @@ static int jz4780_dma_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	jzdma->base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(jzdma->base))
> -		return PTR_ERR(jzdma->base);
> +	jzdma->chn_base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(jzdma->chn_base))
> +		return PTR_ERR(jzdma->chn_base);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!res) {
> +		dev_err(dev, "failed to get I/O memory\n");
> +		return -EINVAL;
> +	}
> +
> +	jzdma->ctrl_base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(jzdma->ctrl_base))
> +		return PTR_ERR(jzdma->ctrl_base);

Could we have this failure case fall back to the existing behaviour
where we only have a single resource covering all the registers? That
would avoid breaking bisection between this patch & the one that updates
the JZ4780 DT.

For example:

	#define JZ4780_DMA_CTRL_OFFSET	0x1000

	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
	if (res) {
		jzdma->ctrl_base = devm_ioremap_resource(dev, res);
		if (IS_ERR(jzdma->ctrl_base))
			return PTR_ERR(jzdma->ctrl_base);
	} else {
		jzdma->ctrl_base = jzdma->chn_base + JZ4780_DMA_CTRL_OFFSET;
	}

Then you could remove the fallback after patch 13, to end up with the
same code you have now but without breaking bisection.

Most correct might be to move patch 13 to right after this one, so that
the JZ4780-specific fallback can be removed before adding support for
any of the other SoCs.

Thanks,
    Paul
