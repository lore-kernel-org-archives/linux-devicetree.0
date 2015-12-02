From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH (v7) 2/2] mtd: brcmnand: Add support for the BCM63268
Date: Wed, 2 Dec 2015 12:10:58 -0800
Message-ID: <20151202201058.GM64635@google.com>
References: <56541BD3.4070202@simon.arlott.org.uk>
 <5654AF69.7040901@gmail.com>
 <afc6fb02d51a5378e315ade84a134eaf7a58a94f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <210ac819ff369893bd7d10640026a5b75455e684@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <CAOiHx==RsnZKb93hp1PXhz-Am_uJ4g_RR3R8VQ_dnd8hd1Wcpw@mail.gmail.com>
 <772c4df64731e4e4f5bbbb9051cea28aaf805f4e@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <CAOiHx=mTPfiU40Tbz24vWELcoKEWhi=N2mqwL92SnV61dA2Myg@mail.gmail.com>
 <565610B9.5040407@simon.arlott.org.uk>
 <20151202191811.GK64635@google.com>
 <565F4C89.5030609@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <565F4C89.5030609@simon.arlott.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Jonas Gorski <jogo@openwrt.org>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, MTD Maling List <linux-mtd@lists.infradead.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Dec 02, 2015 at 07:54:49PM +0000, Simon Arlott wrote:
> On 02/12/15 19:18, Brian Norris wrote:
> > On Wed, Nov 25, 2015 at 07:49:13PM +0000, Simon Arlott wrote:
> >> +static int bcm63268_nand_probe(struct platform_device *pdev)
> >> +{
> >> +	struct device *dev = &pdev->dev;
> >> +	struct bcm63268_nand_soc *priv;
> >> +	struct brcmnand_soc *soc;
> >> +	struct resource *res;
> >> +	int ret;
> >> +
> >> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> >> +	if (!priv)
> >> +		return -ENOMEM;
> >> +	soc = &priv->soc;
> >> +
> >> +	res = platform_get_resource_byname(pdev,
> >> +		IORESOURCE_MEM, "nand-intr-base");
> >> +	if (!res)
> >> +		return -EINVAL;
> >> +
> >> +	priv->base = devm_ioremap_resource(dev, res);
> >> +	if (IS_ERR(priv->base))
> >> +		return PTR_ERR(priv->base);
> >> +
> >> +	priv->clk = devm_clk_get(&pdev->dev, "nand");
> >> +	if (IS_ERR(priv->clk))
> >> +		return PTR_ERR(priv->clk);
> > 
> > Perhaps we should put this clock handling in brcmnand.c? Just have it
> > treat the clock as optional (i.e., ignore errors except for
> > EPROBE_DEFER?), so we don't fail if no clock was provided? This could
> > help other platforms too, if they gain clock support.
> 
> Unless most soc variants have clocks I'd prefer to leave it in this
> module.

I'm quite confident your SoC is not the only one with clocks.

> > If we do this, you'll want to document the clock in the common binding,
> > not the bcm63268-specific part.
> > 
> > Also, could it help to disable/enable the clock during suspend/resume?
> > If you move it to brcmnand.c, this would also be pretty simple.
> 
> Alternatively, it could proxy the brcmnand_pm_ops functions. I don't
> have any way to test suspend/resume.

OK, no need to add it now then. It can be added if/when it's needed.

> >> +
> >> +	ret = clk_prepare_enable(priv->clk);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	soc->ctlrdy_ack = bcm63268_nand_intc_ack;
> >> +	soc->ctlrdy_set_enabled = bcm63268_nand_intc_set;
> >> +
> >> +	/* Disable and ack all interrupts  */
> >> +	brcmnand_writel(0, priv->base + BCM63268_NAND_INT);
> >> +	brcmnand_writel(BCM63268_NAND_STATUS_MASK,
> >> +			priv->base + BCM63268_NAND_INT);
> >> +
> >> +	ret = brcmnand_probe(pdev, soc);
> >> +	if (ret)
> >> +		clk_disable_unprepare(priv->clk);
> >> +
> >> +	return ret;
> >> +}

> >> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> >> index 2c8f67f..5f26b8a 100644
> >> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> >> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> >> @@ -2262,6 +2262,14 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
> >>  }
> >>  EXPORT_SYMBOL_GPL(brcmnand_probe);
> >>  
> >> +struct brcmnand_soc *brcmnand_get_socdata(struct platform_device *pdev)
> >> +{
> >> +	struct brcmnand_controller *ctrl = dev_get_drvdata(&pdev->dev);
> >> +
> >> +	return ctrl ? ctrl->soc : NULL;
> >> +}
> >> +EXPORT_SYMBOL_GPL(brcmnand_get_socdata);
> > 
> > If you move the clk handling to the core brcmnand.c, then you won't need
> > this still.
> 
> Would you prefer a clock name in the soc data structure that is used to
> call devm_clk_get()?

Not really. If we specify a clock name now, we can suggest other SoC's
to use the same name (where possible). So we wouldn't need any new code
or documentation, and we definitely don't need each snowflake sub-driver
to pass a new name.

Brian
