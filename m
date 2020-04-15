Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A603EC2BB85
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 06:26:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9062F206D9
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 06:26:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634856AbgDOG06 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 02:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634828AbgDOG0z (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Apr 2020 02:26:55 -0400
X-Greylist: delayed 71687 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 14 Apr 2020 23:26:54 PDT
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709D7C061A0C
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 23:26:54 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jObVc-0002qR-TC; Wed, 15 Apr 2020 08:26:52 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jObVc-0000vN-CE; Wed, 15 Apr 2020 08:26:52 +0200
Date:   Wed, 15 Apr 2020 08:26:52 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Rohit Visavalia <rohit.visavalia@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dhaval Shah <dshah@xilinx.com>, kernel@pengutronix.de
Subject: Re: [PATCH v2 3/6] soc: xilinx: vcu: implement clock provider for
 output clocks
Message-ID: <20200415062652.GB1078@pengutronix.de>
References: <20200414103202.4288-1-m.tretter@pengutronix.de>
 <20200414103202.4288-4-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200414103202.4288-4-m.tretter@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:23:31 up 55 days, 13:54, 86 users,  load average: 0.02, 0.10,
 0.14
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Apr 14, 2020 at 12:31:59PM +0200, Michael Tretter wrote:
> The VCU System-Level Control uses an internal PLL to drive the core and
> MCU clock for the allegro encoder and decoder based on an external PL
> clock.
> 
> In order be able to ensure that the clocks are enabled and to get their
> rate from other drivers, the module must implement a clock provider and
> register the clocks at the common clock framework. Other drivers are
> then able to access the clock via devicetree bindings.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changelog:
> 
> v1 -> v2:
> - unregister registered clocks when removing the driver
> ---
>  drivers/soc/xilinx/Kconfig    |  2 +-
>  drivers/soc/xilinx/xlnx_vcu.c | 76 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 75 insertions(+), 3 deletions(-)
> 
[...]
> diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
> index dcd8e7824b06..f07a1361a2a8 100644
> --- a/drivers/soc/xilinx/xlnx_vcu.c
> +++ b/drivers/soc/xilinx/xlnx_vcu.c
[...]
> @@ -485,6 +490,63 @@ static int xvcu_set_pll(struct xvcu_device *xvcu)
>  	return -ETIMEDOUT;
>  }
>  
> +static int xvcu_register_clock_provider(struct xvcu_device *xvcu)
> +{
> +	struct device *dev = xvcu->dev;
> +	const char *parent_name = __clk_get_name(xvcu->pll_ref);
> +	struct clk_onecell_data *data = &xvcu->clk_data;
> +	struct clk **clks;
> +	size_t num_clks = CLK_XVCU_MAX;
> +
> +	clks = devm_kcalloc(dev, num_clks, sizeof(*clks), GFP_KERNEL);
> +	if (!clks)
> +		return -ENOMEM;
> +
> +	data->clk_num = num_clks;
> +	data->clks = clks;
> +
> +	clks[CLK_XVCU_ENC_CORE] =
> +		clk_register_fixed_rate(dev, "venc_core_clk",
> +					parent_name, 0, xvcu->coreclk);
> +	clks[CLK_XVCU_ENC_MCU] =
> +		clk_register_fixed_rate(dev, "venc_mcu_clk",
> +					parent_name, 0, xvcu->mcuclk);
> +	clks[CLK_XVCU_DEC_CORE] =
> +		clk_register_fixed_rate(dev, "vdec_core_clk",
> +					parent_name, 0, xvcu->coreclk);
> +	clks[CLK_XVCU_DEC_MCU] =
> +		clk_register_fixed_rate(dev, "vdec_mcu_clk",
> +					parent_name, 0, xvcu->mcuclk);
> +
> +	return of_clk_add_provider(dev->of_node, of_clk_src_onecell_get, data);
> +}
> +
> +static void xvcu_unregister_clock_provider(struct xvcu_device *xvcu)
> +{
> +	struct device *dev = xvcu->dev;
> +	struct clk_onecell_data *data = &xvcu->clk_data;
> +	struct clk **clks = data->clks;
> +
> +	of_clk_del_provider(dev->of_node);
> +
> +	clk_unregister_fixed_rate(clks[CLK_XVCU_DEC_MCU]);
> +	clk_unregister_fixed_rate(clks[CLK_XVCU_DEC_CORE]);
> +	clk_unregister_fixed_rate(clks[CLK_XVCU_ENC_MCU]);
> +	clk_unregister_fixed_rate(clks[CLK_XVCU_ENC_CORE]);
> +}
> +
> +static void xvcu_reset(struct xvcu_device *xvcu)
> +{
> +	if (!xvcu->reset_gpio)
> +		return;
> +
> +	gpiod_set_value(xvcu->reset_gpio, 0);
> +	/* min 2 clock cycle of vcu pll_ref, slowest freq is 33.33KHz */
> +	usleep_range(60, 120);
> +	gpiod_set_value(xvcu->reset_gpio, 1);
> +	usleep_range(60, 120);
> +}
> +

The xvcu_reset function shouldn't have been there at all. Looks like it
slipped through, when I rebased the patches. I'll send a v3.

Michael

>  /**
>   * xvcu_probe - Probe existence of the logicoreIP
>   *			and initialize PLL
> @@ -569,10 +631,18 @@ static int xvcu_probe(struct platform_device *pdev)
>  		goto error_pll_ref;
>  	}
>  
> +	ret = xvcu_register_clock_provider(xvcu);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to register clock provider\n");
> +		goto error_clk_provider;
> +	}
> +
>  	dev_set_drvdata(&pdev->dev, xvcu);
>  
>  	return 0;
>  
> +error_clk_provider:
> +	xvcu_unregister_clock_provider(xvcu);
>  error_pll_ref:
>  	clk_disable_unprepare(xvcu->pll_ref);
>  error_aclk:
> @@ -596,6 +666,8 @@ static int xvcu_remove(struct platform_device *pdev)
>  	if (!xvcu)
>  		return -ENODEV;
>  
> +	xvcu_unregister_clock_provider(xvcu);
> +
>  	/* Add the the Gasket isolation and put the VCU in reset. */
>  	xvcu_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, 0);
>  
> -- 
> 2.20.1
> 
> 
