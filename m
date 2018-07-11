From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH 01/14] dmaengine: dma-jz4780: Avoid hardcoding number of
 channels
Date: Wed, 11 Jul 2018 17:44:03 +0530
Message-ID: <20180711121403.GR3219@vkoul-mobl>
References: <20180703123214.23090-1-paul@crapouillou.net>
 <20180703123214.23090-2-paul@crapouillou.net>
 <20180709165945.GH22377@vkoul-mobl>
 <1531236550.17118.0@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531236550.17118.0@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Hi Paul,

On 10-07-18, 17:29, Paul Cercueil wrote:
> > >  +static const unsigned int jz4780_dma_nb_channels[] = {
> > >  +	[ID_JZ4780] = 32,
> > >  +};
> > >  +
> > >  +static const struct of_device_id jz4780_dma_dt_match[] = {
> > >  +	{ .compatible = "ingenic,jz4780-dma", .data = (void *)ID_JZ4780 },
> > >  +	{},
> > >  +};
> > 
> > Looking at description I was hoping that channels would be in DT,
> > channels is hardware information, so should come from DT rather than
> > coding the kernel...
> 
> I had a talk with Linus Walleij (GPIO maintainer) about that:
> http://lkml.iu.edu/hypermail/linux/kernel/1701.3/05422.html
> 
> And I agree with him, we shouldn't have in devicetree what we can deduce
> from the compatible string. But there doesn't seem to be an enforced
> policy about it.

Looking at this, yes that can be done as you have implemented but adding
new compatible and tables every time seems not so great to me.

If DT can describe these hardware features then driver can take action generically
and we avoid these tables and skip some patches here..

> 
> @Rob, what do you think?

Rob what is the recommendation here?

> 
> > >  -	jzdma = devm_kzalloc(dev, sizeof(*jzdma), GFP_KERNEL);
> > >  +	if (of_id)
> > >  +		version = (enum jz_version)of_id->data;
> > >  +	else
> > >  +		version = ID_JZ4780; /* Default when not probed from DT */
> > 
> > where else would it be probed from.... ?
> 
> Platform, MFD driver, etc. But not likely to happen.
> I can remove these lines if you want.

Lets add when we land support for those.

-- 
~Vinod
