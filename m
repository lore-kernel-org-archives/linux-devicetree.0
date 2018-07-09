From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH 01/14] dmaengine: dma-jz4780: Avoid hardcoding number of
 channels
Date: Mon, 9 Jul 2018 22:29:45 +0530
Message-ID: <20180709165945.GH22377@vkoul-mobl>
References: <20180703123214.23090-1-paul@crapouillou.net>
 <20180703123214.23090-2-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180703123214.23090-2-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On 03-07-18, 14:32, Paul Cercueil wrote:

>  struct jz4780_dma_dev {
>  	struct dma_device dma_device;
>  	void __iomem *base;
>  	struct clk *clk;
>  	unsigned int irq;
> +	unsigned int nb_channels;
> +	enum jz_version version;
>  
>  	uint32_t chan_reserved;
> -	struct jz4780_dma_chan chan[JZ_DMA_NR_CHANNELS];
> +	struct jz4780_dma_chan chan[];

why array, why not channel pointer?

> +static const unsigned int jz4780_dma_nb_channels[] = {
> +	[ID_JZ4780] = 32,
> +};
> +
> +static const struct of_device_id jz4780_dma_dt_match[] = {
> +	{ .compatible = "ingenic,jz4780-dma", .data = (void *)ID_JZ4780 },
> +	{},
> +};

Looking at description I was hoping that channels would be in DT,
channels is hardware information, so should come from DT rather than
coding the kernel...

> -	jzdma = devm_kzalloc(dev, sizeof(*jzdma), GFP_KERNEL);
> +	if (of_id)
> +		version = (enum jz_version)of_id->data;
> +	else
> +		version = ID_JZ4780; /* Default when not probed from DT */

where else would it be probed from.... ?
-- 
~Vinod
