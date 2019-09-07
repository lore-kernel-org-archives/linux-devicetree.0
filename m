From: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/9] crypto: Add Allwinner sun8i-ce Crypto Engine
Date: Sat, 7 Sep 2019 21:04:08 +0200
Message-ID: <20190907190408.GE2628@Red>
References: <20190906184551.17858-1-clabbe.montjoie@gmail.com>
 <20190906184551.17858-3-clabbe.montjoie@gmail.com>
 <20190907081951.v2huvhm44jfprfop@flea>
Reply-To: clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7YLCN32UNBBLP6Z7VQKGQEF2SIVIA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190907081951.v2huvhm44jfprfop@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-crypto-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 07, 2019 at 11:19:51AM +0300, Maxime Ripard wrote:
> Hi,
> 
> I can't really comment on the crypto side, so my review is going to be
> pretty boring.
> 
> On Fri, Sep 06, 2019 at 08:45:44PM +0200, Corentin Labbe wrote:
> > +static const struct ce_variant ce_h3_variant = {
> > +	.alg_cipher = { CE_ID_NOTSUPP, CE_ALG_AES, CE_ALG_DES, CE_ALG_3DES,
> > +		CE_ID_NOTSUPP,
> > +	},
> 
> As far as I can see, it's always the same value, so I'm not sure why
> it's a parameter.
> 

No it is not the same value.
If by same value you mean "the list is the same accross variant", it will be different when I will add CTS/CTR/XTS.
Note that .alg_cipher was already different on h6, since I forgot to remove the RAES.
So it will be the same on PATChv2, but again il will be different after.

> > +	.op_mode = { CE_ID_NOTSUPP, CE_OP_ECB, CE_OP_CBC
> > +	},
> 
> Ditto
> 
> > +	.intreg = CE_ISR,
> 
> Ditto
> 
> > +	.maxflow = 4,
> 
> Ditto
> 

Both .intreg and .maxflow are remains of sun8i-ss support.
I will remove them.

> > +	.ce_clks = {
> > +		{ "ahb", 200000000 },
> 
> This is the default IIRC, and the clock driver will ignore any clock
> rate change on it anyway, so the clock rate is pretty much useless
> there.
> 
> > +		{ "mod", 48000000 },
> 
> 48MHz seems pretty slow, especially compared to the other rates you
> have listed there. Is that on purpose?

On H3, the value used on others SoC bring to random fail.
I will add a comment.

> 
> Also, I'm not sure what is the point of having the clocks names be
> parameters there as well. It's constant across all the compatibles,
> the only thing that isn't is the number of clocks and the module clock
> rate. It's what you should have in there.
> 

Since the datasheet give some max frequency, I think I will add a max_freq and add a check to verify if the clock is in the right range

> > +		}
> > +};
> > +
> > +static const struct ce_variant ce_h5_variant = {
> > +	.alg_cipher = { CE_ID_NOTSUPP, CE_ALG_AES, CE_ALG_DES, CE_ALG_3DES,
> > +		CE_ID_NOTSUPP,
> > +	},
> > +	.op_mode = { CE_ID_NOTSUPP, CE_OP_ECB, CE_OP_CBC
> > +	},
> > +	.intreg = CE_ISR,
> > +	.maxflow = 4,
> > +	.ce_clks = {
> > +		{ "ahb", 200000000 },
> > +		{ "mod", 300000000 },
> > +		}
> > +};
> > +
> > +static const struct ce_variant ce_h6_variant = {
> > +	.alg_cipher = { CE_ID_NOTSUPP, CE_ALG_AES, CE_ALG_DES, CE_ALG_3DES,
> > +		CE_ALG_RAES,
> > +	},
> > +	.op_mode = { CE_ID_NOTSUPP, CE_OP_ECB, CE_OP_CBC
> > +	},
> > +	.model = CE_v2,
> 
> Can't that be derived from the version register and / or the
> compatible? This seems to be redundant with each.
> 

I could use the compatible, but I want to avoid a string comparison on each request.

> > +	.intreg = CE_ISR,
> > +	.maxflow = 4,
> > +	.ce_clks = {
> > +		{ "ahb", 200000000 },
> > +		{ "mod", 300000000 },
> > +		{ "mbus", 400000000 },
> 
> That rate is going to be ignored as well.
> 
> > +		}
> > +};
> > +
> > +static const struct ce_variant ce_a64_variant = {
> > +	.alg_cipher = { CE_ID_NOTSUPP, CE_ALG_AES, CE_ALG_DES, CE_ALG_3DES,
> > +		CE_ID_NOTSUPP,
> > +	},
> > +	.op_mode = { CE_ID_NOTSUPP, CE_OP_ECB, CE_OP_CBC
> > +	},
> > +	.intreg = CE_ISR,
> > +	.maxflow = 4,
> > +	.ce_clks = {
> > +		{ "ahb", 200000000 },
> > +		{ "mod", 300000000 },
> > +		}
> > +};
> 
> You should order your variants by alphabetical order.
> 

Will do.

> > +static const struct ce_variant ce_r40_variant = {
> > +	.alg_cipher = { CE_ID_NOTSUPP, CE_ALG_AES, CE_ALG_DES, CE_ALG_3DES,
> > +		CE_ID_NOTSUPP,
> > +	},
> > +	.op_mode = { CE_ID_NOTSUPP, CE_OP_ECB, CE_OP_CBC
> > +	},
> > +	.intreg = CE_ISR,
> > +	.maxflow = 4,
> > +	.ce_clks = {
> > +		{ "ahb", 200000000 },
> > +		{ "mod", 300000000 },
> > +		}
> > +};
> > +
> 
> ...
> 
> > +int sun8i_ce_get_engine_number(struct sun8i_ce_dev *ce)
> > +{
> > +	return atomic_inc_return(&ce->flow) % ce->variant->maxflow;
> > +}
> 
> I'm not sure what this is supposed to be doing, but that mod there
> seems pretty dangerous.
> 
> ...
> 

This mod do a round robin on each channel.
I dont see why it is dangerous.

> > +static int sun8i_ce_probe(struct platform_device *pdev)
> > +{
> > +	struct resource *res;
> > +	u32 v;
> > +	int err, i, ce_method, id, irq;
> > +	unsigned long cr;
> > +	struct sun8i_ce_dev *ce;
> > +
> > +	if (!pdev->dev.of_node)
> > +		return -ENODEV;
> 
> This is pretty much guaranteed already
> 

Ok, removed

> > +	ce = devm_kzalloc(&pdev->dev, sizeof(*ce), GFP_KERNEL);
> > +	if (!ce)
> > +		return -ENOMEM;
> > +
> > +	ce->variant = of_device_get_match_data(&pdev->dev);
> > +	if (!ce->variant) {
> > +		dev_err(&pdev->dev, "Missing Crypto Engine variant\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	ce->base = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(ce->base)) {
> > +		err = PTR_ERR(ce->base);
> > +		dev_err(&pdev->dev, "Cannot request MMIO err=%d\n", err);
> > +		return err;
> 
> ioremap_resource already prints an error message on failure, so this
> is redundant.
> 

Will remove.

> > +	}
> > +
> > +	for (i = 0; i < CE_MAX_CLOCKS; i++) {
> > +		if (!ce->variant->ce_clks[i].name)
> > +			continue;
> > +		dev_info(&pdev->dev, "Get %s clock\n", ce->variant->ce_clks[i].name);
> 
> There's no reason to print this at the info level
> 

Will remove.

> > +		ce->ceclks[i] = devm_clk_get(&pdev->dev, ce->variant->ce_clks[i].name);
> > +		if (IS_ERR(ce->ceclks[i])) {
> > +			err = PTR_ERR(ce->ceclks[i]);
> > +			dev_err(&pdev->dev, "Cannot get %s CE clock err=%d\n",
> > +				ce->variant->ce_clks[i].name, err);
> > +		}
> > +		cr = clk_get_rate(ce->ceclks[i]);
> 
> So on error you'd call clk_get_rate on the clock still? That seems
> pretty fragile, you should return there, it's a hard error.
> 

I will add the missing "return err"

> > +		if (ce->variant->ce_clks[i].freq) {
> > +			dev_info(&pdev->dev, "Set %s clock to %lu (%lu Mhz) from %lu (%lu Mhz)\n",
> > +				 ce->variant->ce_clks[i].name,
> > +				 ce->variant->ce_clks[i].freq,
> > +				 ce->variant->ce_clks[i].freq / 1000000,
> > +				 cr,
> > +				 cr / 1000000);
> 
> Same remark about that message than the previous one.
> 
> > +			err = clk_set_rate(ce->ceclks[i], ce->variant->ce_clks[i].freq);
> > +			if (err)
> > +				dev_err(&pdev->dev, "Fail to set %s clk speed to %lu\n",
> > +					ce->variant->ce_clks[i].name,
> > +					ce->variant->ce_clks[i].freq);
> > +		} else {
> > +			dev_info(&pdev->dev, "%s run at %lu\n",
> > +				 ce->variant->ce_clks[i].name, cr);
> 
> Ditto.
> 
> > +		}
> > +		err = clk_prepare_enable(ce->ceclks[i]);
> 
> Do you really need this right now though?
> 

Not sure to understand, why I shouldnt do it now ?
Does it is related to your pm_runtime remark below ?

My feeling was to submit the driver without PM and convert it after.

> > +		if (err) {
> > +			dev_err(&pdev->dev, "Cannot prepare_enable %s\n",
> > +				ce->variant->ce_clks[i].name);
> > +			return err;
> > +		}
> > +	}
> > +
> > +	/* Get Non Secure IRQ */
> > +	irq = platform_get_irq(pdev, 0);
> > +	if (irq < 0) {
> > +		dev_err(ce->dev, "Cannot get NS IRQ\n");
> > +		return irq;
> > +	}
> > +
> > +	err = devm_request_irq(&pdev->dev, irq, ce_irq_handler, 0,
> > +			       "sun8i-ce-ns", ce);
> > +	if (err < 0) {
> > +		dev_err(ce->dev, "Cannot request NS IRQ\n");
> > +		return err;
> > +	}
> > +
> > +	ce->reset = devm_reset_control_get_optional(&pdev->dev, "ahb");
> > +	if (IS_ERR(ce->reset)) {
> > +		if (PTR_ERR(ce->reset) == -EPROBE_DEFER)
> > +			return PTR_ERR(ce->reset);
> > +		dev_info(&pdev->dev, "No reset control found\n");
> 
> It's not optional though.
> 

I dont understand why.

> > +		ce->reset = NULL;
> > +	}
> > +
> > +	err = reset_control_deassert(ce->reset);
> > +	if (err) {
> > +		dev_err(&pdev->dev, "Cannot deassert reset control\n");
> > +		goto error_clk;
> > +	}
> 
> Again, you don't really need this at this moment. Using runtime_pm
> would make more sense.
> 
> > +	v = readl(ce->base + CE_CTR);
> > +	v >>= 16;
> > +	v &= 0x07;
> 
> This should be in a define
> 

Will fix.

> > +	dev_info(&pdev->dev, "CE_NS Die ID %x\n", v);
> 
> And if that really makes sense to print it, the error message should
> be made less cryptic.
> 

Will fix.

> > +
> > +	ce->dev = &pdev->dev;
> > +	platform_set_drvdata(pdev, ce);
> > +
> > +	mutex_init(&ce->mlock);
> > +
> > +	ce->chanlist = devm_kcalloc(ce->dev, ce->variant->maxflow,
> > +				    sizeof(struct sun8i_ce_flow), GFP_KERNEL);
> > +	if (!ce->chanlist) {
> > +		err = -ENOMEM;
> > +		goto error_flow;
> > +	}
> > +
> > +	for (i = 0; i < ce->variant->maxflow; i++) {
> > +		init_completion(&ce->chanlist[i].complete);
> > +		mutex_init(&ce->chanlist[i].lock);
> > +
> > +		ce->chanlist[i].engine = crypto_engine_alloc_init(ce->dev, true);
> > +		if (!ce->chanlist[i].engine) {
> > +			dev_err(ce->dev, "Cannot allocate engine\n");
> > +			i--;
> > +			goto error_engine;
> > +		}
> > +		err = crypto_engine_start(ce->chanlist[i].engine);
> > +		if (err) {
> > +			dev_err(ce->dev, "Cannot start engine\n");
> > +			goto error_engine;
> > +		}
> > +		ce->chanlist[i].tl = dma_alloc_coherent(ce->dev,
> > +							sizeof(struct ce_task),
> > +							&ce->chanlist[i].t_phy,
> > +							GFP_KERNEL);
> > +		if (!ce->chanlist[i].tl) {
> > +			dev_err(ce->dev, "Cannot get DMA memory for task %d\n",
> > +				i);
> > +			err = -ENOMEM;
> > +			goto error_engine;
> > +		}
> > +	}
> 
> All this initialization should be done before calling
> request_irq. You're using some of those fields in your handler.
> 

No interrupt could fire, since algorithms are still not registred.

> > +
> > +#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
> > +	ce->dbgfs_dir = debugfs_create_dir("sun8i-ce", NULL);
> > +	if (IS_ERR_OR_NULL(ce->dbgfs_dir)) {
> > +		dev_err(ce->dev, "Fail to create debugfs dir");
> > +		err = -ENOMEM;
> > +		goto error_engine;
> > +	}
> > +	ce->dbgfs_stats = debugfs_create_file("stats", 0444,
> > +					      ce->dbgfs_dir, ce,
> > +					      &sun8i_ce_debugfs_fops);
> > +	if (IS_ERR_OR_NULL(ce->dbgfs_stats)) {
> > +		dev_err(ce->dev, "Fail to create debugfs stat");
> > +		err = -ENOMEM;
> > +		goto error_debugfs;
> > +	}
> > +#endif
> > +	for (i = 0; i < ARRAY_SIZE(ce_algs); i++) {
> > +		ce_algs[i].ce = ce;
> > +		switch (ce_algs[i].type) {
> > +		case CRYPTO_ALG_TYPE_SKCIPHER:
> > +			id = ce_algs[i].ce_algo_id;
> > +			ce_method = ce->variant->alg_cipher[id];
> > +			if (ce_method == CE_ID_NOTSUPP) {
> > +				dev_info(ce->dev,
> > +					 "DEBUG: Algo of %s not supported\n",
> > +					 ce_algs[i].alg.skcipher.base.cra_name);
> > +				ce_algs[i].ce = NULL;
> > +				break;
> > +			}
> > +			id = ce_algs[i].ce_blockmode;
> > +			ce_method = ce->variant->op_mode[id];
> > +			if (ce_method == CE_ID_NOTSUPP) {
> > +				dev_info(ce->dev, "DEBUG: Blockmode of %s not supported\n",
> > +					 ce_algs[i].alg.skcipher.base.cra_name);
> > +				ce_algs[i].ce = NULL;
> > +				break;
> > +			}
> > +			dev_info(ce->dev, "DEBUG: Register %s\n",
> > +				 ce_algs[i].alg.skcipher.base.cra_name);
> > +			err = crypto_register_skcipher(&ce_algs[i].alg.skcipher);
> > +			if (err) {
> > +				dev_err(ce->dev, "Fail to register %s\n",
> > +					ce_algs[i].alg.skcipher.base.cra_name);
> > +				ce_algs[i].ce = NULL;
> > +				goto error_alg;
> > +			}
> > +			break;
> > +		default:
> > +			dev_err(ce->dev, "ERROR: tryed to register an unknown algo\n");
> > +		}
> > +	}
> > +
> > +	return 0;
> > +error_alg:
> > +	i--;
> > +	for (; i >= 0; i--) {
> > +		switch (ce_algs[i].type) {
> > +		case CRYPTO_ALG_TYPE_SKCIPHER:
> > +			if (ce_algs[i].ce)
> > +				crypto_unregister_skcipher(&ce_algs[i].alg.skcipher);
> > +			break;
> > +		}
> > +	}
> > +#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
> > +error_debugfs:
> > +	debugfs_remove_recursive(ce->dbgfs_dir);
> > +#endif
> > +	i = ce->variant->maxflow;
> > +error_engine:
> > +	while (i >= 0) {
> > +		crypto_engine_exit(ce->chanlist[i].engine);
> > +		if (ce->chanlist[i].tl)
> > +			dma_free_coherent(ce->dev, sizeof(struct ce_task),
> > +					  ce->chanlist[i].tl,
> > +					  ce->chanlist[i].t_phy);
> > +		i--;
> > +	}
> > +error_flow:
> > +	reset_control_assert(ce->reset);
> > +error_clk:
> > +	for (i = 0; i < CE_MAX_CLOCKS; i++)
> > +		clk_disable_unprepare(ce->ceclks[i]);
> > +	return err;
> > +}
> 
> So that function takes around 200-250 LoC, this is definitely too
> much and should be split into multiple functions.
> 

Will do.

Thanks for your review.
Regards
