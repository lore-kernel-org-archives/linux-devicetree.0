From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH 04/14] dmaengine: dma-jz4780: Add support for the JZ4770
 SoC
Date: Mon, 9 Jul 2018 22:40:32 +0530
Message-ID: <20180709171032.GJ22377@vkoul-mobl>
References: <20180703123214.23090-1-paul@crapouillou.net>
 <20180703123214.23090-5-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180703123214.23090-5-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On 03-07-18, 14:32, Paul Cercueil wrote:

> +static inline void jz4780_dma_chan_disable(struct jz4780_dma_dev *jzdma,
> +	unsigned int chn)
> +{
> +	if (jzdma->version == ID_JZ4770)
> +		jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DCKEC, BIT(chn));
> +}

this sounds as hardware behaviour, so why not describe as a property in
DT?

> +
>  static struct jz4780_dma_desc *jz4780_dma_desc_alloc(
>  	struct jz4780_dma_chan *jzchan, unsigned int count,
>  	enum dma_transaction_type type)
> @@ -228,8 +246,15 @@ static void jz4780_dma_desc_free(struct virt_dma_desc *vdesc)
>  	kfree(desc);
>  }
>  
> -static uint32_t jz4780_dma_transfer_size(unsigned long val, uint32_t *shift)
> +static const unsigned int jz4780_dma_ord_max[] = {
> +	[ID_JZ4770] = 6,
> +	[ID_JZ4780] = 7,
> +};

So this gives the transfer length supported?
-- 
~Vinod
