From: Tony Lindgren <tony@atomide.com>
Subject: Re: [RFC PATCH] pinctrl-single: Use of pinctrl-single for external
 device over I2C
Date: Thu, 9 Jul 2015 02:10:51 -0700
Message-ID: <20150709091051.GJ10644@atomide.com>
References: <1435855992-10312-1-git-send-email-vaibhav.hiremath@linaro.org>
 <20150706063532.GB10705@atomide.com>
 <559A6E5D.9040202@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <559A6E5D.9040202@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org, will.deacon@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

* Vaibhav Hiremath <vaibhav.hiremath@linaro.org> [150706 05:05]:
> On Monday 06 July 2015 12:05 PM, Tony Lindgren wrote:
> >
> >Sorry this won't work. Most platforms don't need regmap here, and I
> >certainly don't want to use regmap for toggling pins for runtime
> >PM because of the extra overhead.
> >
> 
> That's exactly my question was in my first email. It's ok.
> 
> What is your openion on overall code changes for regmap support ?
> Any other feedback or suggestions?

Seems it should work just fine once you get the IO functions
configured :)
 
> >It seems you need to stash the regmap pointer to struct pcs_device
> >and just the function pointers. As this driver is ioremapping the
> >region, we certainly want to keep things using void __iomem * too.
> >You can cast that to whatever regmap needs in the wrapper functions
> >for regmap. Note that the extra overhead there won't matter as we
> >are using regmap mostly for devices over I2C and so on.
> >
> 
> The issue I have here with the signature of read/write fn
> 
> static unsigned __maybe_unused pcs_read(void __iomem *reg)
> static void __maybe_unused pcs_writeX(unsigned val, void __iomem *reg)
> 
> 
> For regmap, I need 2 arguments,
> 
> 1. Pointer to regmap
> 2. Offset to register
> 
> 
> So I will have to change the signature to
> 
> static unsigned __maybe_unused pcs_read(void __iomem *reg, unsigned int
> offset)
> static void __maybe_unused pcs_write(void __iomem *reg, unsigned val,
> unsigned int offset)
> 
> 
> And,
> On the same direction, will having separate functions for regmap.
> 
> static unsigned pcs_read_regmap(void __iomem *reg, unsigned int offset)
> {
> 	unsigned int val;
> 
> 	regmap_read((struct regmap *)reg, offset, &val);
> }
> 
> static void pcs_write_regmap(void __iomem *reg, unsigned val, unsigned int
> offset)
> {
>        regmap_write((struct regmap *)reg, offset, val);
>  }

OK yeah that should work.
 
> This functions will be initialized to pcs_device->read/write.
> 
> I will have to do some more changes, specially around pcs_interrupt
> usage.

OK I suggest a separate patch to add support for interrupts.

Regards,

Tony
