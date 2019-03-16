From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/6] dmaengine: sun6i: Add a quirk for additional mbus
 clock
Date: Sat, 16 Mar 2019 16:37:53 +0530
Message-ID: <20190316110753.GH5348@vkoul-mobl>
References: <20190307165829.9086-1-jernej.skrabec@siol.net>
 <20190307165829.9086-3-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190307165829.9086-3-jernej.skrabec@siol.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, maxime.ripard@bootlin.com, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, dmaengine@vger.kernel.org, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 07-03-19, 17:58, Jernej Skrabec wrote:
> H6 DMA controller needs additional mbus clock to be enabled.
> 
> Add a quirk for it and handle it accordingly.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/dma/sun6i-dma.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 0cd13f17fc11..761555080325 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -129,6 +129,7 @@ struct sun6i_dma_config {
>  	u32 dst_burst_lengths;
>  	u32 src_addr_widths;
>  	u32 dst_addr_widths;
> +	bool mbus_clk;
>  };
>  
>  /*
> @@ -182,6 +183,7 @@ struct sun6i_dma_dev {
>  	struct dma_device	slave;
>  	void __iomem		*base;
>  	struct clk		*clk;
> +	struct clk		*clk_mbus;

So rather than have mbus_clk and then a ptr, why not use the ptr and use
NULL value to check for..?

>  	int			irq;
>  	spinlock_t		lock;
>  	struct reset_control	*rstc;
> @@ -1208,6 +1210,14 @@ static int sun6i_dma_probe(struct platform_device *pdev)
>  		return PTR_ERR(sdc->clk);
>  	}
>  
> +	if (sdc->cfg->mbus_clk) {

where is the populated? I was expecting this to be set based on DT!

> +		sdc->clk_mbus = devm_clk_get(&pdev->dev, "mbus");
> +		if (IS_ERR(sdc->clk_mbus)) {
> +			dev_err(&pdev->dev, "No mbus clock specified\n");
> +			return PTR_ERR(sdc->clk_mbus);
> +		}
> +	}
> +
>  	sdc->rstc = devm_reset_control_get(&pdev->dev, NULL);
>  	if (IS_ERR(sdc->rstc)) {
>  		dev_err(&pdev->dev, "No reset controller specified\n");
> @@ -1312,11 +1322,19 @@ static int sun6i_dma_probe(struct platform_device *pdev)
>  		goto err_reset_assert;
>  	}
>  
> +	if (sdc->cfg->mbus_clk) {
> +		ret = clk_prepare_enable(sdc->clk_mbus);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Couldn't enable mbus clock\n");
> +			goto err_clk_disable;
> +		}
> +	}
> +
>  	ret = devm_request_irq(&pdev->dev, sdc->irq, sun6i_dma_interrupt, 0,
>  			       dev_name(&pdev->dev), sdc);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Cannot request IRQ\n");
> -		goto err_clk_disable;
> +		goto err_mbus_clk_disable;
>  	}
>  
>  	ret = dma_async_device_register(&sdc->slave);
> @@ -1341,6 +1359,8 @@ static int sun6i_dma_probe(struct platform_device *pdev)
>  	dma_async_device_unregister(&sdc->slave);
>  err_irq_disable:
>  	sun6i_kill_tasklet(sdc);
> +err_mbus_clk_disable:
> +	clk_disable_unprepare(sdc->clk_mbus);
>  err_clk_disable:
>  	clk_disable_unprepare(sdc->clk);
>  err_reset_assert:
> @@ -1359,6 +1379,7 @@ static int sun6i_dma_remove(struct platform_device *pdev)
>  
>  	sun6i_kill_tasklet(sdc);
>  
> +	clk_disable_unprepare(sdc->clk_mbus);
>  	clk_disable_unprepare(sdc->clk);
>  	reset_control_assert(sdc->rstc);
>  
> -- 
> 2.21.0

-- 
~Vinod
