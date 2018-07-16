From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/14] dmaengine: dma-jz4780: Separate chan/ctrl registers
Date: Mon, 16 Jul 2018 15:28:52 -0600
Message-ID: <20180716212852.GA6323@rob-hp-laptop>
References: <20180703123214.23090-1-paul@crapouillou.net>
 <20180703123214.23090-3-paul@crapouillou.net>
 <20180709170359.GI22377@vkoul-mobl>
 <1531237019.17118.1@crapouillou.net>
 <20180711121655.GS3219@vkoul-mobl>
 <20180711232715.djxrbgmcski5xtjp@pburton-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180711232715.djxrbgmcski5xtjp@pburton-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@mips.com>
Cc: Vinod <vkoul@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Cercueil <paul@crapouillou.net>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 11, 2018 at 04:27:15PM -0700, Paul Burton wrote:
> Hi Vinod,
> 
> On Wed, Jul 11, 2018 at 05:46:55PM +0530, Vinod wrote:
> > > > >  -	jzdma->base = devm_ioremap_resource(dev, res);
> > > > >  -	if (IS_ERR(jzdma->base))
> > > > >  -		return PTR_ERR(jzdma->base);
> > > > >  +	jzdma->chn_base = devm_ioremap_resource(dev, res);
> > > > >  +	if (IS_ERR(jzdma->chn_base))
> > > > >  +		return PTR_ERR(jzdma->chn_base);
> > > > >  +
> > > > >  +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > > > >  +	if (!res) {
> > > > >  +		dev_err(dev, "failed to get I/O memory\n");
> > > > >  +		return -EINVAL;
> > > > >  +	}
> > > > 
> > > > okay and this breaks if you happen to get probed on older DT. I think DT
> > > > is treated as ABI so you need to continue support older method while
> > > > finding if DT has split resources
> > > 
> > > See my response to PrasannaKumar. All the Ingenic-based boards do compile
> > > the devicetree within the kernel, so I think it's still fine to add breaking
> > > changes. I'll wait on @Rob to give his point of view on this, though.
> > > 
> > > (It's not something hard to change, but I'd like to know what's the policy
> > > in that case. I have other DT-breaking patches to submit)
> > 
> > The policy is that DT is an ABI and should not break :)
> 
> I think in general that's a good policy to have for compatibility, but
> if it's known for certain that the DT for all users of a driver is
> always built into the kernel then I don't see why we shouldn't feel free
> to change a binding. I agree with Paul that it'd be interesting to hear
> the DT binding maintainers take on this.

If the platform maintainers (and their users) don't care, then I don't 
have an issue with the change. It should still be an exception and not 
just any change goes. The commit message should still highlight that 
compatibility is being broken and why.

Rob
