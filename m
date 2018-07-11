From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH 06/14] dmaengine: dma-jz4780: Add support for the JZ4725B
 SoC
Date: Wed, 11 Jul 2018 17:48:18 +0530
Message-ID: <20180711121818.GT3219@vkoul-mobl>
References: <20180703123214.23090-1-paul@crapouillou.net>
 <20180703123214.23090-7-paul@crapouillou.net>
 <20180709171458.GL22377@vkoul-mobl>
 <1531237502.17118.3@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531237502.17118.3@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On 10-07-18, 17:45, Paul Cercueil wrote:
> 
> 
> Le lun. 9 juil. 2018 à 19:14, Vinod <vkoul@kernel.org> a écrit :
> > On 03-07-18, 14:32, Paul Cercueil wrote:
> > >  The JZ4725B has one DMA core starring six DMA channels.
> > >  As for the JZ4770, each DMA channel's clock can be enabled with
> > >  a register write, the difference here being that once started, it
> > >  is not possible to turn it off.
> > 
> > ok so disable for this, right..
> > 
> > >  @@ -204,6 +205,8 @@ static inline void
> > > jz4780_dma_chan_enable(struct jz4780_dma_dev *jzdma,
> > >   {
> > >   	if (jzdma->version == ID_JZ4770)
> > >   		jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DCKES, BIT(chn));
> > >  +	else if (jzdma->version == ID_JZ4725B)
> > >  +		jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DCKE, BIT(chn));
> > 
> > but you are writing to a different register here..
> 
> Yes. SoCs >= JZ4770 have the DCKE read-only register, and DCKES/DCKEC to
> set/clear bits in DCKE.
> On JZ4725B, DCKE is read/write, but the zeros written are ignored (at least
> that's what the
> documentation says).

and that was not documented in the log... so i though it maybe a typo.

-- 
~Vinod
