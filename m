From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v3 07/18] dmaengine: dma-jz4780: Add support for the
 JZ4770 SoC
Date: Tue, 24 Jul 2018 19:02:29 +0530
Message-ID: <20180724133229.GG3661@vkoul-mobl>
References: <20180721110643.19624-1-paul@crapouillou.net>
 <20180721110643.19624-8-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180721110643.19624-8-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On 21-07-18, 13:06, Paul Cercueil wrote:
> +static inline void jz4780_dma_chan_enable(struct jz4780_dma_dev *jzdma,
> +	unsigned int chn)

right justified and aligned with preceding please. While adding new
code to a existing driver it is a good idea to conform to existing style

> +{
> +	if (jzdma->version == ID_JZ4770)
> +		jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DCKES, BIT(chn));
> +}
> +
> +static inline void jz4780_dma_chan_disable(struct jz4780_dma_dev *jzdma,
> +	unsigned int chn)
> +{
> +	if (jzdma->version == ID_JZ4770)
> +		jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DCKEC, BIT(chn));

so if another version has this feature we would do:
        if (jzdma->version == ID_JZ4770) ||
                if (jzdma->version == ID_JZXXXX))

and so on.. why not add a value, clk_enable in the description and use
that. For each controller it is set to true or false

-- 
~Vinod
