From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC][PATCH 3/4] power: reset: Add sram-reboot-mode driver
Date: Wed, 3 Aug 2016 18:03:41 -0700
Message-ID: <20160804010341.GH13516@tuxbot>
References: <1470265523-27557-1-git-send-email-john.stultz@linaro.org>
 <1470265523-27557-4-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470265523-27557-4-git-send-email-john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Heiko St?bner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vishal Bhoj <vishal.bhoj-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Android Kernel Team <kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed 03 Aug 16:05 PDT 2016, John Stultz wrote:

[..]
> diff --git a/drivers/power/reset/sram-reboot-mode.c b/drivers/power/reset/sram-reboot-mode.c
[..]
> +
> +struct sram_reboot_mode {
> +	struct reboot_mode_driver reboot;
> +	void __iomem *reboot_reason_val_addr;

23 characters is...a lot of characters...

> +};
> +
> +static int sram_reboot_mode_write(struct reboot_mode_driver *reboot,
> +					unsigned int magic)
> +{
> +	struct sram_reboot_mode *sram_rbm;
> +
> +	sram_rbm = container_of(reboot, struct sram_reboot_mode, reboot);
> +
> +	writel(magic, sram_rbm->reboot_reason_val_addr);
> +	return 0;
> +}
> +
> +static int sram_reboot_mode_probe(struct platform_device *pdev)
> +{
> +	struct sram_reboot_mode *sram_rbm;
> +	struct resource *res;
> +	int ret;
> +
> +	sram_rbm = devm_kzalloc(&pdev->dev, sizeof(*sram_rbm), GFP_KERNEL);
> +	if (!sram_rbm)
> +		return -ENOMEM;
> +
> +	sram_rbm->reboot.dev = &pdev->dev;
> +	sram_rbm->reboot.write = sram_reboot_mode_write;
> +
> +	dev_set_drvdata(&pdev->dev, sram_rbm);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return PTR_ERR(res);
> +
> +	sram_rbm->reboot_reason_val_addr = devm_ioremap(&pdev->dev, res->start,
> +							 resource_size(res));

Use devm_ioremap_resource() instead, it saves you the return value check
on platform_get_resource() and is cleaner.

> +	if (IS_ERR(sram_rbm->reboot_reason_val_addr))
> +		return PTR_ERR(sram_rbm->reboot_reason_val_addr);
> +
> +	ret = reboot_mode_register(&sram_rbm->reboot);

I think you should take the time to throw in a
devm_reboot_mode_register(), it would save you from the
dev_set_drvdata() and you can drop the remove function.

> +	if (ret)
> +		dev_err(&pdev->dev, "can't register reboot mode\n");
> +
> +	return ret;
> +}
> +

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
