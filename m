From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH 06/14] dmaengine: dma-jz4780: Add support for the JZ4725B
 SoC
Date: Mon, 9 Jul 2018 22:44:58 +0530
Message-ID: <20180709171458.GL22377@vkoul-mobl>
References: <20180703123214.23090-1-paul@crapouillou.net>
 <20180703123214.23090-7-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180703123214.23090-7-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On 03-07-18, 14:32, Paul Cercueil wrote:
> The JZ4725B has one DMA core starring six DMA channels.
> As for the JZ4770, each DMA channel's clock can be enabled with
> a register write, the difference here being that once started, it
> is not possible to turn it off.

ok so disable for this, right..

> @@ -204,6 +205,8 @@ static inline void jz4780_dma_chan_enable(struct jz4780_dma_dev *jzdma,
>  {
>  	if (jzdma->version == ID_JZ4770)
>  		jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DCKES, BIT(chn));
> +	else if (jzdma->version == ID_JZ4725B)
> +		jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DCKE, BIT(chn));

but you are writing to a different register here.. 

-- 
~Vinod
