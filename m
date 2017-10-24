From: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Subject: Re: [PATCH v1 2/2] mtd: mtk-nor: add suspend/resume support
Date: Wed, 25 Oct 2017 00:03:30 +0200
Message-ID: <f501c5bd-7df0-015d-cf1d-5e650249b568@wedev4u.fr>
References: <1505997906-30921-1-git-send-email-guochun.mao@mediatek.com>
 <1505997906-30921-3-git-send-email-guochun.mao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1505997906-30921-3-git-send-email-guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 21/09/2017 à 14:45, Guochun Mao a écrit :
> Abstract functions of clock setting, to avoid duplicated code,
> these functions been used in new feature.
> Implement suspend/resume functions.
> 
> Signed-off-by: Guochun Mao <guochun.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Applied to the spi-nor/next branch of l2-mtd

Thanks!

> ---
>  drivers/mtd/spi-nor/mtk-quadspi.c |   70 ++++++++++++++++++++++++++++++-------
>  1 file changed, 58 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
> index c258c7a..abe455c 100644
> --- a/drivers/mtd/spi-nor/mtk-quadspi.c
> +++ b/drivers/mtd/spi-nor/mtk-quadspi.c
> @@ -404,6 +404,29 @@ static int mt8173_nor_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
>  	return ret;
>  }
>  
> +static void mt8173_nor_disable_clk(struct mt8173_nor *mt8173_nor)
> +{
> +	clk_disable_unprepare(mt8173_nor->spi_clk);
> +	clk_disable_unprepare(mt8173_nor->nor_clk);
> +}
> +
> +static int mt8173_nor_enable_clk(struct mt8173_nor *mt8173_nor)
> +{
> +	int ret;
> +
> +	ret = clk_prepare_enable(mt8173_nor->spi_clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(mt8173_nor->nor_clk);
> +	if (ret) {
> +		clk_disable_unprepare(mt8173_nor->spi_clk);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int mtk_nor_init(struct mt8173_nor *mt8173_nor,
>  			struct device_node *flash_node)
>  {
> @@ -468,15 +491,11 @@ static int mtk_nor_drv_probe(struct platform_device *pdev)
>  		return PTR_ERR(mt8173_nor->nor_clk);
>  
>  	mt8173_nor->dev = &pdev->dev;
> -	ret = clk_prepare_enable(mt8173_nor->spi_clk);
> +
> +	ret = mt8173_nor_enable_clk(mt8173_nor);
>  	if (ret)
>  		return ret;
>  
> -	ret = clk_prepare_enable(mt8173_nor->nor_clk);
> -	if (ret) {
> -		clk_disable_unprepare(mt8173_nor->spi_clk);
> -		return ret;
> -	}
>  	/* only support one attached flash */
>  	flash_np = of_get_next_available_child(pdev->dev.of_node, NULL);
>  	if (!flash_np) {
> @@ -487,10 +506,9 @@ static int mtk_nor_drv_probe(struct platform_device *pdev)
>  	ret = mtk_nor_init(mt8173_nor, flash_np);
>  
>  nor_free:
> -	if (ret) {
> -		clk_disable_unprepare(mt8173_nor->spi_clk);
> -		clk_disable_unprepare(mt8173_nor->nor_clk);
> -	}
> +	if (ret)
> +		mt8173_nor_disable_clk(mt8173_nor);
> +
>  	return ret;
>  }
>  
> @@ -498,11 +516,38 @@ static int mtk_nor_drv_remove(struct platform_device *pdev)
>  {
>  	struct mt8173_nor *mt8173_nor = platform_get_drvdata(pdev);
>  
> -	clk_disable_unprepare(mt8173_nor->spi_clk);
> -	clk_disable_unprepare(mt8173_nor->nor_clk);
> +	mt8173_nor_disable_clk(mt8173_nor);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int mtk_nor_suspend(struct device *dev)
> +{
> +	struct mt8173_nor *mt8173_nor = dev_get_drvdata(dev);
> +
> +	mt8173_nor_disable_clk(mt8173_nor);
> +
>  	return 0;
>  }
>  
> +static int mtk_nor_resume(struct device *dev)
> +{
> +	struct mt8173_nor *mt8173_nor = dev_get_drvdata(dev);
> +
> +	return mt8173_nor_enable_clk(mt8173_nor);
> +}
> +
> +static const struct dev_pm_ops mtk_nor_dev_pm_ops = {
> +	.suspend = mtk_nor_suspend,
> +	.resume = mtk_nor_resume,
> +};
> +
> +#define MTK_NOR_DEV_PM_OPS	(&mtk_nor_dev_pm_ops)
> +#else
> +#define MTK_NOR_DEV_PM_OPS	NULL
> +#endif
> +
>  static const struct of_device_id mtk_nor_of_ids[] = {
>  	{ .compatible = "mediatek,mt8173-nor"},
>  	{ /* sentinel */ }
> @@ -514,6 +559,7 @@ static int mtk_nor_drv_remove(struct platform_device *pdev)
>  	.remove = mtk_nor_drv_remove,
>  	.driver = {
>  		.name = "mtk-nor",
> +		.pm = MTK_NOR_DEV_PM_OPS,
>  		.of_match_table = mtk_nor_of_ids,
>  	},
>  };
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
