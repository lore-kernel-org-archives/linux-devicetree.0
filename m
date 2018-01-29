From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 1/2] drm/bridge: Add Cadence DSI driver
Date: Mon, 29 Jan 2018 14:14:09 +0100
Message-ID: <20180129141409.0ec356d1@bbrezillon>
References: <20180118134309.13123-1-boris.brezillon@free-electrons.com>
        <9b45c6a3-f26b-59f5-d313-88290a2c5b42@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9b45c6a3-f26b-59f5-d313-88290a2c5b42-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Suresh Punnoose <sureshp-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, "Menon, Nishanth" <nm-l0cyMroinI0@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 29 Jan 2018 13:56:21 +0200
Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org> wrote:

> > +
> > +static void cdns_dsi_init_link(struct cdns_dsi *dsi)
> > +{
> > +	struct cdns_dsi_output *output = &dsi->output;
> > +	unsigned long sysclk_period, ulpout;
> > +	u32 val;
> > +	int i;
> > +
> > +	if (dsi->link_initialized)
> > +		return;
> > +
> > +	val = 0;
> > +	for (i = 1; i < output->dev->lanes; i++)
> > +		val |= DATA_LANE_EN(i);
> > +
> > +	if (!(output->dev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
> > +		val |= CLK_CONTINUOUS;
> > +
> > +	writel(val, dsi->regs + MCTL_MAIN_PHY_CTL);
> > +
> > +	/* ULPOUT should be set to 1ms and is expressed in sysclk cycles. */
> > +	sysclk_period = NSEC_PER_SEC / clk_get_rate(dsi->dsi_sys_clk);
> > +	ulpout = DIV_ROUND_UP(NSEC_PER_MSEC, sysclk_period);
> > +	writel(CLK_LANE_ULPOUT_TIME(ulpout) | DATA_LANE_ULPOUT_TIME(ulpout),
> > +	       dsi->regs + MCTL_ULPOUT_TIME);
> > +
> > +	writel(LINK_EN, dsi->regs + MCTL_MAIN_DATA_CTL);
> > +
> > +	val = CLK_LANE_EN | PLL_START;
> > +	for (i = 0; i < output->dev->lanes; i++)
> > +		val |= DATA_LANE_START(i);
> > +
> > +	writel(val, dsi->regs + MCTL_MAIN_EN);
> > +
> > +	ndelay(100);  
> 
> It's good to have a comment about each sleep/delay on what is for and
> where does the value come from.

Yep, I'll figure this out.

> 
> > +	dsi->link_initialized = true;
> > +}
> > +


> > +static int cdns_dsi_drm_probe(struct platform_device *pdev)
> > +{
> > +	struct cdns_dsi *dsi;
> > +	struct cdns_dsi_input *input;
> > +	struct resource *res;
> > +	int ret, irq;
> > +	u32 val;
> > +
> > +	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
> > +	if (!dsi)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, dsi);
> > +
> > +	input = &dsi->input;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	dsi->regs = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(dsi->regs))
> > +		return PTR_ERR(dsi->regs);
> > +
> > +	dsi->dsi_p_clk = devm_clk_get(&pdev->dev, "dsi_p_clk");
> > +	if (IS_ERR(dsi->dsi_p_clk))
> > +		return PTR_ERR(dsi->dsi_p_clk);
> > +
> > +	dsi->dsi_p_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
> > +								"dsi_p_rst");
> > +	if (IS_ERR(dsi->dsi_p_rst))
> > +		return PTR_ERR(dsi->dsi_p_rst);
> > +
> > +	dsi->dsi_sys_clk = devm_clk_get(&pdev->dev, "dsi_sys_clk");
> > +	if (IS_ERR(dsi->dsi_sys_clk))
> > +		return PTR_ERR(dsi->dsi_sys_clk);
> > +
> > +	irq = platform_get_irq(pdev, 0);
> > +	if (irq < 0)
> > +		return irq;
> > +
> > +	ret = clk_prepare_enable(dsi->dsi_p_clk);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = clk_prepare_enable(dsi->dsi_sys_clk);
> > +	if (ret)
> > +		goto err_disable_pclk;
> > +
> > +	val = readl(dsi->regs + ID_REG);
> > +	if (REV_VENDOR_ID(val) != 0xcad) {
> > +		dev_err(&pdev->dev, "invalid vendor id\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	val = readl(dsi->regs + IP_CONF);
> > +	dsi->direct_cmd_fifo_depth = 1 << (DIRCMD_FIFO_DEPTH(val) + 2);
> > +	dsi->rx_fifo_depth = RX_FIFO_DEPTH(val);
> > +	init_completion(&dsi->direct_cmd_comp);
> > +
> > +	writel(0, dsi->regs + MCTL_MAIN_DATA_CTL);
> > +	writel(0, dsi->regs + MCTL_MAIN_EN);
> > +	writel(0, dsi->regs + MCTL_MAIN_PHY_CTL);
> > +
> > +	/*
> > +	 * We only support the DPI input, so force input->id to
> > +	 * CDNS_DPI_INPUT.
> > +	 */
> > +	input->id = CDNS_DPI_INPUT;
> > +	input->bridge.funcs = &cdns_dsi_bridge_funcs;
> > +	input->bridge.of_node = pdev->dev.of_node;
> > +
> > +	/* Mask all interrupts before registering the IRQ handler. */
> > +	writel(0, dsi->regs + MCTL_MAIN_STS_CTL);
> > +	writel(0, dsi->regs + MCTL_DPHY_ERR_CTL1);
> > +	writel(0, dsi->regs + CMD_MODE_STS_CTL);
> > +	writel(0, dsi->regs + DIRECT_CMD_STS_CTL);
> > +	writel(0, dsi->regs + DIRECT_CMD_RD_STS_CTL);
> > +	writel(0, dsi->regs + VID_MODE_STS_CTL);
> > +	writel(0, dsi->regs + TVG_STS_CTL);
> > +	writel(0, dsi->regs + DPI_IRQ_EN);
> > +	ret = devm_request_irq(&pdev->dev, irq, cdns_dsi_interrupt, 0,
> > +			       dev_name(&pdev->dev), dsi);
> > +	if (ret)
> > +		goto err_disable_pclk;
> > +
> > +	pm_runtime_enable(&pdev->dev);
> > +	dsi->base.dev = &pdev->dev;
> > +	dsi->base.ops = &cdns_dsi_ops;
> > +
> > +	ret = mipi_dsi_host_register(&dsi->base);
> > +	if (ret)
> > +		goto err_disable_runtime_pm;
> > +
> > +	clk_disable_unprepare(dsi->dsi_p_clk);
> > +
> > +	return 0;
> > +
> > +err_disable_runtime_pm:
> > +	pm_runtime_disable(&pdev->dev);
> > +
> > +err_disable_pclk:
> > +	clk_disable_unprepare(dsi->dsi_p_clk);
> > +
> > +	return ret;
> > +}  
> 
> You don't disable the dsi_sys_clk neither in the ok nor in the error paths.

Hm, it shouldn't be enabled in the first place: the runtime resume
hook takes care of enabling it, and we don't need this clock to access
IP registers (which is all we do in the probe).

I'll fix that.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
