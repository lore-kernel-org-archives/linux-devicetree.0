From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 5/8] dmaengine: fsl-edma: add drvdata for vf610
Date: Tue, 4 Jun 2019 18:03:31 +0530
Message-ID: <20190604123331.GE15118@vkoul-mobl>
References: <20190529090848.34350-1-yibin.gong@nxp.com>
 <20190529090848.34350-6-yibin.gong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190529090848.34350-6-yibin.gong@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yibin.gong@nxp.com
Cc: robh@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, mark.rutland@arm.com, dan.j.williams@intel.com, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On 29-05-19, 17:08, yibin.gong@nxp.com wrote:

> @@ -205,8 +228,9 @@ static int fsl_edma_probe(struct platform_device *pdev)
>  	if (!fsl_edma)
>  		return -ENOMEM;
>  
> -	fsl_edma->version = v1;
> -	fsl_edma->dmamux_nr = DMAMUX_NR;
> +	fsl_edma->drvdata = drvdata;
> +	fsl_edma->version = drvdata->version;
> +	fsl_edma->dmamux_nr = drvdata->dmamuxs;

And can we avoid the duplication here, you have version and dmamuxs
represented in two places. But right now it looks logical so the removal
should be done after this series

-- 
~Vinod
