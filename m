From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH 02/14] dmaengine: dma-jz4780: Separate chan/ctrl registers
Date: Mon, 9 Jul 2018 22:33:59 +0530
Message-ID: <20180709170359.GI22377@vkoul-mobl>
References: <20180703123214.23090-1-paul@crapouillou.net>
 <20180703123214.23090-3-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180703123214.23090-3-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On 03-07-18, 14:32, Paul Cercueil wrote:
> The register area of the JZ4780 DMA core can be split into different
> sections for different purposes:
> 
> * one set of registers is used to perform actions at the DMA core level,
> that will generally affect all channels;
> 
> * one set of registers per DMA channel, to perform actions at the DMA
> channel level, that will only affect the channel in question.
> 
> The problem rises when trying to support new versions of the JZ47xx
> Ingenic SoC. For instance, the JZ4770 has two DMA cores, each one
> with six DMA channels, and the register sets are interleaved:
> <DMA0 chan regs> <DMA1 chan regs> <DMA0 ctrl regs> <DMA1 ctrl regs>
> 
> By using one memory resource for the channel-specific registers and
> one memory resource for the core-specific registers, we can support
> the JZ4770, by initializing the driver once per DMA core with different
> addresses.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../devicetree/bindings/dma/jz4780-dma.txt    |   6 +-

Pls move to separate patch.

>  drivers/dma/dma-jz4780.c                      | 106 +++++++++++-------
>  2 files changed, 69 insertions(+), 43 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/jz4780-dma.txt b/Documentation/devicetree/bindings/dma/jz4780-dma.txt
> index f25feee62b15..f9b1864f5b77 100644
> --- a/Documentation/devicetree/bindings/dma/jz4780-dma.txt
> +++ b/Documentation/devicetree/bindings/dma/jz4780-dma.txt
> @@ -3,7 +3,8 @@
>  Required properties:
>  
>  - compatible: Should be "ingenic,jz4780-dma"
> -- reg: Should contain the DMA controller registers location and length.
> +- reg: Should contain the DMA channel registers location and length, followed
> +  by the DMA controller registers location and length.
>  - interrupts: Should contain the interrupt specifier of the DMA controller.
>  - interrupt-parent: Should be the phandle of the interrupt controller that
>  - clocks: Should contain a clock specifier for the JZ4780 PDMA clock.
> @@ -22,7 +23,8 @@ Example:
>  
>  dma: dma@13420000 {
>  	compatible = "ingenic,jz4780-dma";
> -	reg = <0x13420000 0x10000>;
> +	reg = <0x13420000 0x400
> +	       0x13421000 0x40>;

Second should be optional or we break platform which may not have
updated DT..

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

okay and this breaks if you happen to get probed on older DT. I think DT
is treated as ABI so you need to continue support older method while
finding if DT has split resources

-- 
~Vinod
