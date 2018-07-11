From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH 02/14] dmaengine: dma-jz4780: Separate chan/ctrl registers
Date: Wed, 11 Jul 2018 17:46:55 +0530
Message-ID: <20180711121655.GS3219@vkoul-mobl>
References: <20180703123214.23090-1-paul@crapouillou.net>
 <20180703123214.23090-3-paul@crapouillou.net>
 <20180709170359.GI22377@vkoul-mobl>
 <1531237019.17118.1@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531237019.17118.1@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On 10-07-18, 17:36, Paul Cercueil wrote:

> > >  @@ -3,7 +3,8 @@
> > >   Required properties:
> > > 
> > >   - compatible: Should be "ingenic,jz4780-dma"
> > >  -- reg: Should contain the DMA controller registers location and
> > > length.
> > >  +- reg: Should contain the DMA channel registers location and
> > > length, followed
> > >  +  by the DMA controller registers location and length.
> > >   - interrupts: Should contain the interrupt specifier of the DMA
> > > controller.
> > >   - interrupt-parent: Should be the phandle of the interrupt
> > > controller that
> > >   - clocks: Should contain a clock specifier for the JZ4780 PDMA
> > > clock.
> > >  @@ -22,7 +23,8 @@ Example:
> > > 
> > >   dma: dma@13420000 {
> > >   	compatible = "ingenic,jz4780-dma";
> > >  -	reg = <0x13420000 0x10000>;
> > >  +	reg = <0x13420000 0x400
> > >  +	       0x13421000 0x40>;
> > 
> > Second should be optional or we break platform which may not have
> > updated DT..
> 
> See comment below.
> 
> > >  -	jzdma->base = devm_ioremap_resource(dev, res);
> > >  -	if (IS_ERR(jzdma->base))
> > >  -		return PTR_ERR(jzdma->base);
> > >  +	jzdma->chn_base = devm_ioremap_resource(dev, res);
> > >  +	if (IS_ERR(jzdma->chn_base))
> > >  +		return PTR_ERR(jzdma->chn_base);
> > >  +
> > >  +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > >  +	if (!res) {
> > >  +		dev_err(dev, "failed to get I/O memory\n");
> > >  +		return -EINVAL;
> > >  +	}
> > 
> > okay and this breaks if you happen to get probed on older DT. I think DT
> > is treated as ABI so you need to continue support older method while
> > finding if DT has split resources
> 
> See my response to PrasannaKumar. All the Ingenic-based boards do compile
> the devicetree within the kernel, so I think it's still fine to add breaking
> changes. I'll wait on @Rob to give his point of view on this, though.
> 
> (It's not something hard to change, but I'd like to know what's the policy
> in that case. I have other DT-breaking patches to submit)

The policy is that DT is an ABI and should not break :)

Who maintains Ingenic arch. MAINTAINERS doesn't tell me.

-- 
~Vinod
