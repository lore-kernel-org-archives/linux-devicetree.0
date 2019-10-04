From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH v2 02/11] crypto: Add Allwinner sun8i-ce Crypto Engine
Date: Fri, 4 Oct 2019 19:52:18 +0200
Message-ID: <20191004175218.GA11208@Red>
References: <20191001184141.27956-1-clabbe.montjoie@gmail.com>
 <20191001184141.27956-3-clabbe.montjoie@gmail.com>
 <20191002103506.zdoyhhzmroa6smwl@gilmour>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191002103506.zdoyhhzmroa6smwl@gilmour>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>
Cc: catalin.marinas@arm.com, davem@davemloft.net, herbert@gondor.apana.org.au, linux@armlinux.org.uk, mark.rutland@arm.com, robh+dt@kernel.org, wens@csie.org, will@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Wed, Oct 02, 2019 at 12:35:06PM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Oct 01, 2019 at 08:41:32PM +0200, Corentin Labbe wrote:
> > +	/* CTS and recent CE (H6) need length in bytes, in word otherwise */
> > +	if (ce->variant->model == CE_v2)
> > +		cet->t_dlen = areq->cryptlen;
> 
> It's entirely redundant withe the compatible.
> 
> How about using something like has_t_dlen or whatever name you find
> best in the variant structure?
> 

Hello

I will fix that, I started with has_t_dlen_in_bytes

> > +static int sun8i_ce_probe(struct platform_device *pdev)
> > +{
> > +	struct resource *res;
> > +	u32 v;
> > +	int err, i, ce_method, id, irq;
> > +	unsigned long cr;
> > +	struct sun8i_ce_dev *ce;
> > +
> > +	ce = devm_kzalloc(&pdev->dev, sizeof(*ce), GFP_KERNEL);
> > +	if (!ce)
> > +		return -ENOMEM;
> > +
> > +	ce->dev = &pdev->dev;
> > +	platform_set_drvdata(pdev, ce);
> > +
> > +	ce->variant = of_device_get_match_data(&pdev->dev);
> > +	if (!ce->variant) {
> > +		dev_err(&pdev->dev, "Missing Crypto Engine variant\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	ce->base = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(ce->base))
> > +		return PTR_ERR(ce->base);
> > +
> > +	for (i = 0; i < CE_MAX_CLOCKS; i++) {
> > +		if (!ce->variant->ce_clks[i].name)
> > +			continue;
> > +		ce->ceclks[i] = devm_clk_get(&pdev->dev, ce->variant->ce_clks[i].name);
> > +		if (IS_ERR(ce->ceclks[i])) {
> > +			err = PTR_ERR(ce->ceclks[i]);
> > +			dev_err(&pdev->dev, "Cannot get %s CE clock err=%d\n",
> > +				ce->variant->ce_clks[i].name, err);
> > +			return err;
> > +		}
> > +		cr = clk_get_rate(ce->ceclks[i]);
> > +		if (!cr)
> > +			return -EINVAL;
> > +		if (ce->variant->ce_clks[i].freq > 0 &&
> > +		    cr != ce->variant->ce_clks[i].freq) {
> > +			dev_info(&pdev->dev, "Set %s clock to %lu (%lu Mhz) from %lu (%lu Mhz)\n",
> > +				 ce->variant->ce_clks[i].name,
> > +				 ce->variant->ce_clks[i].freq,
> > +				 ce->variant->ce_clks[i].freq / 1000000,
> > +				 cr, cr / 1000000);
> > +			err = clk_set_rate(ce->ceclks[i], ce->variant->ce_clks[i].freq);
> > +			if (err)
> > +				dev_err(&pdev->dev, "Fail to set %s clk speed to %lu hz\n",
> > +					ce->variant->ce_clks[i].name,
> > +					ce->variant->ce_clks[i].freq);
> > +		}
> > +		if (ce->variant->ce_clks[i].max_freq > 0 &&
> > +		    cr > ce->variant->ce_clks[i].max_freq)
> > +			dev_warn(&pdev->dev, "Frequency for %s (%lu hz) is higher than datasheet's recommandation (%lu hz)",
> > +				 ce->variant->ce_clks[i].name, cr,
> > +				 ce->variant->ce_clks[i].max_freq);
> > +	}
> > +
> > +	/* Get Non Secure IRQ */
> > +	irq = platform_get_irq(pdev, 0);
> > +	if (irq < 0) {
> > +		dev_err(ce->dev, "Cannot get CryptoEngine Non-secure IRQ\n");
> > +		return irq;
> > +	}
> > +
> > +	ce->reset = devm_reset_control_get_optional(&pdev->dev, "bus");
> > +	if (IS_ERR(ce->reset)) {
> > +		if (PTR_ERR(ce->reset) == -EPROBE_DEFER)
> > +			return PTR_ERR(ce->reset);
> > +		dev_err(&pdev->dev, "No reset control found\n");
> > +		return PTR_ERR(ce->reset);
> > +	}
> > +
> > +	mutex_init(&ce->mlock);
> > +
> > +	err = allocate_chanlist(ce);
> > +	if (err)
> > +		return err;
> > +
> > +	err = sun8i_ce_pm_init(ce);
> > +	if (err)
> > +		goto error_pm;
> > +
> > +	err = devm_request_irq(&pdev->dev, irq, ce_irq_handler, 0,
> > +			       "sun8i-ce-ns", ce);
> > +	if (err) {
> > +		dev_err(ce->dev, "Cannot request CryptoEngine Non-secure IRQ (err=%d)\n", err);
> > +		goto error_irq;
> > +	}
> > +
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
> > +			ce_algs[i].ce = NULL;
> > +			dev_err(ce->dev, "ERROR: tryed to register an unknown algo\n");
> > +		}
> > +	}
> > +
> > +	err = pm_runtime_get_sync(ce->dev);
> > +	if (err < 0)
> > +		goto error_alg;
> > +
> > +	v = readl(ce->base + CE_CTR);
> > +	v >>= CE_DIE_ID_SHIFT;
> > +	v &= CE_DIE_ID_MASK;
> > +	dev_info(&pdev->dev, "CryptoEngine Die ID %x\n", v);
> > +
> > +	pm_runtime_put_sync(ce->dev);
> > +
> > +#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
> > +	/* Ignore error of debugfs */
> > +	ce->dbgfs_dir = debugfs_create_dir("sun8i-ce", NULL);
> > +	ce->dbgfs_stats = debugfs_create_file("stats", 0444,
> > +					      ce->dbgfs_dir, ce,
> > +					      &sun8i_ce_debugfs_fops);
> > +#endif
> > +	return 0;
> > +error_alg:
> > +	unregister_algs(ce);
> > +	i = MAXFLOW;
> > +error_irq:
> > +	sun8i_ce_pm_exit(ce);
> > +error_pm:
> > +	free_chanlist(ce, i);
> > +	return err;
> > +}
> 
> It's still pretty long. Can you move the clocks, algo initialisation
> (and debugfs maybe?) to a function of their own?
> 

It is much cleaner with clock and algo init in functions, thanks!

Regards
