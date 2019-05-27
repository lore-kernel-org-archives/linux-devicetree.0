From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 6/7] dmaengine: fsl-edma: add i.mx7ulp edma2 version
 support
Date: Mon, 27 May 2019 11:05:53 +0200
Message-ID: <20190527090553.lek7tm3lyst3bhrd@pengutronix.de>
References: <20190527085118.40423-1-yibin.gong@nxp.com>
 <20190527085118.40423-7-yibin.gong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190527085118.40423-7-yibin.gong@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yibin.gong@nxp.com
Cc: robh@kernel.org, shawnguo@kernel.org, festevam@gmail.com, mark.rutland@arm.com, vkoul@kernel.org, dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, May 27, 2019 at 04:51:17PM +0800, yibin.gong@nxp.com wrote:
> From: Robin Gong <yibin.gong@nxp.com>
> 
> +static const struct of_device_id fsl_edma_dt_ids[] = {
> +	{ .compatible = "fsl,vf610-edma", .data = (void *)v1 },
> +	{ .compatible = "fsl,imx7ulp-edma", .data = (void *)v3 },
> +	{ /* sentinel */ }

Please put a struct type behind the .data pointer so that you can
configure...

> +};
> +MODULE_DEVICE_TABLE(of, fsl_edma_dt_ids);
> +
> @@ -218,6 +272,22 @@ static int fsl_edma_probe(struct platform_device *pdev)
>  	fsl_edma_setup_regs(fsl_edma);
>  	regs = &fsl_edma->regs;
>  
> +	if (fsl_edma->version == v3) {
> +		fsl_edma->dmamux_nr = 1;

...things like this...

> @@ -264,7 +334,11 @@ static int fsl_edma_probe(struct platform_device *pdev)
>  	}
>  
>  	edma_writel(fsl_edma, ~0, regs->intl);
> -	ret = fsl_edma_irq_init(pdev, fsl_edma);
> +
> +	if (fsl_edma->version == v3)
> +		ret = fsl_edma2_irq_init(pdev, fsl_edma);
> +	else
> +		ret = fsl_edma_irq_init(pdev, fsl_edma);

...and this one in that struct rather than littering the code more and
more with such version tests.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
