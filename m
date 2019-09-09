From: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/9] crypto: Add Allwinner sun8i-ce Crypto Engine
Date: Mon, 9 Sep 2019 15:19:06 +0200
Message-ID: <20190909131906.GA12882@Red>
References: <20190906184551.17858-1-clabbe.montjoie@gmail.com>
 <20190906184551.17858-3-clabbe.montjoie@gmail.com>
 <20190907081951.v2huvhm44jfprfop@flea>
 <20190907190408.GE2628@Red>
 <20190909113837.vrnqdfgzhsiymfpm@flea>
Reply-To: clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7YLCN32UNBBTVC3HVQKGQECWT5RUQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190909113837.vrnqdfgzhsiymfpm@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-crypto-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 09, 2019 at 01:38:37PM +0200, Maxime Ripard wrote:
> On Sat, Sep 07, 2019 at 09:04:08PM +0200, Corentin Labbe wrote:
> > > Also, I'm not sure what is the point of having the clocks names be
> > > parameters there as well. It's constant across all the compatibles,
> > > the only thing that isn't is the number of clocks and the module clock
> > > rate. It's what you should have in there.
> >
> > Since the datasheet give some max frequency, I think I will add a
> > max_freq and add a check to verify if the clock is in the right
> > range
> 
> It's a bit pointless. What are you going to do if it's not correct?
> What are you trying to fix / report with this?

I thinked to print a warning.
If someone want to play with overclocking for example, the driver should said that probably some result could be invalid.

> 
> > > > +		}
> > > > +};
> > > > +
> > > > +static const struct ce_variant ce_h5_variant = {
> > > > +	.alg_cipher = { CE_ID_NOTSUPP, CE_ALG_AES, CE_ALG_DES, CE_ALG_3DES,
> > > > +		CE_ID_NOTSUPP,
> > > > +	},
> > > > +	.op_mode = { CE_ID_NOTSUPP, CE_OP_ECB, CE_OP_CBC
> > > > +	},
> > > > +	.intreg = CE_ISR,
> > > > +	.maxflow = 4,
> > > > +	.ce_clks = {
> > > > +		{ "ahb", 200000000 },
> > > > +		{ "mod", 300000000 },
> > > > +		}
> > > > +};
> > > > +
> > > > +static const struct ce_variant ce_h6_variant = {
> > > > +	.alg_cipher = { CE_ID_NOTSUPP, CE_ALG_AES, CE_ALG_DES, CE_ALG_3DES,
> > > > +		CE_ALG_RAES,
> > > > +	},
> > > > +	.op_mode = { CE_ID_NOTSUPP, CE_OP_ECB, CE_OP_CBC
> > > > +	},
> > > > +	.model = CE_v2,
> > >
> > > Can't that be derived from the version register and / or the
> > > compatible? This seems to be redundant with each.
> >
> > I could use the compatible, but I want to avoid a string comparison
> > on each request.
> 
> Well, this is specifically what this structure is for then, right? So
> instead of having the model, just add the information that you want
> there.
> 

ok, I will change to a "bool all_size_in_bytes"

> > > > +int sun8i_ce_get_engine_number(struct sun8i_ce_dev *ce)
> > > > +{
> > > > +	return atomic_inc_return(&ce->flow) % ce->variant->maxflow;
> > > > +}
> > >
> > > I'm not sure what this is supposed to be doing, but that mod there
> > > seems pretty dangerous.
> > >
> > > ...
> >
> > This mod do a round robin on each channel.
> > I dont see why it is dangerous.
> 
> Well, you're using the atomic API here which is most commonly used for
> refcounting, while you're using a mod.
> 
> Plus, while the increment is atomic, the modulo isn't, so you can end
> up in a case where you would be preempted between the
> atomic_inc_return and the mod, which is dangerous.
> 
> Again, I'm not sure what this function is doing (which is also a
> problem in itself). I guess you should just make it clearer what it
> does, and then we can discuss it properly.

Each request need to be assigned to a channel.
Each channel are identified by a number from 1 to 4.

So this function return the channel to use, 1 then 2 then 3 then 4 then 1...
Note that this is uncritical. If, due to anything, two request are assigned to the same channel, nothing will break.

> 
> > > > +			err = clk_set_rate(ce->ceclks[i], ce->variant->ce_clks[i].freq);
> > > > +			if (err)
> > > > +				dev_err(&pdev->dev, "Fail to set %s clk speed to %lu\n",
> > > > +					ce->variant->ce_clks[i].name,
> > > > +					ce->variant->ce_clks[i].freq);
> > > > +		} else {
> > > > +			dev_info(&pdev->dev, "%s run at %lu\n",
> > > > +				 ce->variant->ce_clks[i].name, cr);
> > >
> > > Ditto.
> > >
> > > > +		}
> > > > +		err = clk_prepare_enable(ce->ceclks[i]);
> > >
> > > Do you really need this right now though?
> >
> > Not sure to understand, why I shouldnt do it now ?
> > Does it is related to your pm_runtime remark below ?
> >
> > My feeling was to submit the driver without PM and convert it after.
> 
> runtime_pm would be pretty cheap to add though judging by what you're
> doing there.
> 

I will try to add runtime_pm

> > > > +		if (err) {
> > > > +			dev_err(&pdev->dev, "Cannot prepare_enable %s\n",
> > > > +				ce->variant->ce_clks[i].name);
> > > > +			return err;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	/* Get Non Secure IRQ */
> > > > +	irq = platform_get_irq(pdev, 0);
> > > > +	if (irq < 0) {
> > > > +		dev_err(ce->dev, "Cannot get NS IRQ\n");
> > > > +		return irq;
> > > > +	}
> > > > +
> > > > +	err = devm_request_irq(&pdev->dev, irq, ce_irq_handler, 0,
> > > > +			       "sun8i-ce-ns", ce);
> > > > +	if (err < 0) {
> > > > +		dev_err(ce->dev, "Cannot request NS IRQ\n");
> > > > +		return err;
> > > > +	}
> > > > +
> > > > +	ce->reset = devm_reset_control_get_optional(&pdev->dev, "ahb");
> > > > +	if (IS_ERR(ce->reset)) {
> > > > +		if (PTR_ERR(ce->reset) == -EPROBE_DEFER)
> > > > +			return PTR_ERR(ce->reset);
> > > > +		dev_info(&pdev->dev, "No reset control found\n");
> > >
> > > It's not optional though.
> >
> > I dont understand why.
> 
> On all the SoCs, you need that reset line to be deasserted, otherwise
> the IP (and therefore the driver) will be non-functional. It's not an
> option to run without it.

Currently all the SoC have a reset, but nothing prevent a new SoC with CE without reset.
Anyway, I will made the reset mandatory for the moment.

> 
> > > > +		ce->reset = NULL;
> > > > +	}
> > > > +
> > > > +	err = reset_control_deassert(ce->reset);
> > > > +	if (err) {
> > > > +		dev_err(&pdev->dev, "Cannot deassert reset control\n");
> > > > +		goto error_clk;
> > > > +	}
> > >
> > > Again, you don't really need this at this moment. Using runtime_pm
> > > would make more sense.
> > >
> > > > +	v = readl(ce->base + CE_CTR);
> > > > +	v >>= 16;
> > > > +	v &= 0x07;
> > >
> > > This should be in a define
> > >
> >
> > Will fix.
> >
> > > > +	dev_info(&pdev->dev, "CE_NS Die ID %x\n", v);
> > >
> > > And if that really makes sense to print it, the error message should
> > > be made less cryptic.
> > >
> >
> > Will fix.
> >
> > > > +
> > > > +	ce->dev = &pdev->dev;
> > > > +	platform_set_drvdata(pdev, ce);
> > > > +
> > > > +	mutex_init(&ce->mlock);
> > > > +
> > > > +	ce->chanlist = devm_kcalloc(ce->dev, ce->variant->maxflow,
> > > > +				    sizeof(struct sun8i_ce_flow), GFP_KERNEL);
> > > > +	if (!ce->chanlist) {
> > > > +		err = -ENOMEM;
> > > > +		goto error_flow;
> > > > +	}
> > > > +
> > > > +	for (i = 0; i < ce->variant->maxflow; i++) {
> > > > +		init_completion(&ce->chanlist[i].complete);
> > > > +		mutex_init(&ce->chanlist[i].lock);
> > > > +
> > > > +		ce->chanlist[i].engine = crypto_engine_alloc_init(ce->dev, true);
> > > > +		if (!ce->chanlist[i].engine) {
> > > > +			dev_err(ce->dev, "Cannot allocate engine\n");
> > > > +			i--;
> > > > +			goto error_engine;
> > > > +		}
> > > > +		err = crypto_engine_start(ce->chanlist[i].engine);
> > > > +		if (err) {
> > > > +			dev_err(ce->dev, "Cannot start engine\n");
> > > > +			goto error_engine;
> > > > +		}
> > > > +		ce->chanlist[i].tl = dma_alloc_coherent(ce->dev,
> > > > +							sizeof(struct ce_task),
> > > > +							&ce->chanlist[i].t_phy,
> > > > +							GFP_KERNEL);
> > > > +		if (!ce->chanlist[i].tl) {
> > > > +			dev_err(ce->dev, "Cannot get DMA memory for task %d\n",
> > > > +				i);
> > > > +			err = -ENOMEM;
> > > > +			goto error_engine;
> > > > +		}
> > > > +	}
> > >
> > > All this initialization should be done before calling
> > > request_irq. You're using some of those fields in your handler.
> >
> > No interrupt could fire, since algorithms are still not registred.
> 
> That's not true. Spurious interrupts are a thing, the engine could
> have been left in a weird state by the bootloader / kexec / reboot
> with some pending interrupts, etc.
> 
> You have registered that handler already, you should expect it to be
> called at any point in time.
> 

Ok will fix.

Thanks for your review.
