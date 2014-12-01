From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/2] mtd: hisilicon: add a new NAND controller driver
 for hisilicon hip04 Soc
Date: Mon, 1 Dec 2014 01:25:29 -0800
Message-ID: <20141201092529.GM29070@brian-ubuntu>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
 <1415105221-7732-2-git-send-email-wangzhou.bry@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415105221-7732-2-git-send-email-wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, caizhiyong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

I forgot to mention these comments:

On Tue, Nov 04, 2014 at 08:47:00PM +0800, Zhou Wang wrote:
> +static int hisi_nfc_remove(struct platform_device *pdev)
> +{
> +	struct hinfc_host *host = platform_get_drvdata(pdev);
> +	struct mtd_info *mtd = &host->mtd;
> +
> +	nand_release(mtd);
> +	dma_free_coherent(&pdev->dev, mtd->writesize + mtd->oobsize,
> +			  host->buffer, host->dma_buffer);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int hisi_nfc_suspend(struct platform_device *pdev,
> +			       pm_message_t state)

This is the wrong prototype. See struct dev_pm_ops.

> +{
> +	struct hinfc_host *host = platform_get_drvdata(pdev);
> +
> +	while ((hinfc_read(host, HINFC504_STATUS) & 0x1) == 0x0)
> +		;
> +
> +	while ((hinfc_read(host, HINFC504_DMA_CTRL))
> +		& HINFC504_DMA_CTRL_DMA_START)
> +		_cond_resched();
> +
> +	return 0;
> +}
> +
> +static int hisi_nfc_resume(struct platform_device *pdev)

Same here.

> +{
> +	int cs;
> +	struct hinfc_host *host = platform_get_drvdata(pdev);
> +	struct nand_chip *chip = &host->chip;
> +
> +	for (cs = 0; cs < chip->numchips; cs++)
> +		hisi_nfc_send_cmd_reset(host, cs);
> +	hinfc_write(host, SET_HINFC504_PWIDTH(HINFC504_W_LATCH,
> +		    HINFC504_R_LATCH, HINFC504_RW_LATCH), HINFC504_PWIDTH);
> +
> +	return 0;
> +}
> +#endif
> +static SIMPLE_DEV_PM_OPS(hisi_nfc_pm_ops, hisi_nfc_suspend, hisi_nfc_resume);

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
