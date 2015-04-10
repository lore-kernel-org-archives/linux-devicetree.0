From: Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 01/12] drm/exynos: add Exynos5433 decon driver
Date: Fri, 10 Apr 2015 11:35:02 +0530
Message-ID: <5527680E.6010709@gmail.com>
References: <1428645330-1043-1-git-send-email-human.hwang@samsung.com> <1428645330-1043-2-git-send-email-human.hwang@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428645330-1043-2-git-send-email-human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org
Cc: sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/10/2015 11:25 AM, Hyungwon Hwang wrote:

> From: Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> DECON(Display and Enhancement Controller) is new IP replacing FIMD in
> Exynos5433. This patch adds Exynos5433 decon driver.
>
> Signed-off-by: Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Changes for v2:
> - change file names and variable names of decon to represnt exynos5433 instead
> of exynos to distinguish them from exynos7 decon
>
> Changes for v3:
> - fail fast when the proper image format is not set
> - remove unnecessary checking code
> - add and modify the function to make DPMS work well
>
> Changes for v4:
> - rebased to exynos-drm-next with the clean-up patchset by Gustavo Padovan.
>
> Changes for v5:
> - None
>  .../devicetree/bindings/video/exynos5433-decon.txt |  65 +++
>  drivers/gpu/drm/exynos/Kconfig                     |   6 +
>  drivers/gpu/drm/exynos/Makefile                    |   1 +
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c      | 617 +++++++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_drv.c            |   3 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.h            |   1 +
>  include/video/exynos5433_decon.h                   | 163 ++++++
>  7 files changed, 856 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/exynos5433-decon.txt
>  create mode 100644 drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>  create mode 100644 include/video/exynos5433_decon.h
>
(...)

> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(dev, "cannot find IO resource\n");
> +		return -ENXIO;
> +	}
> +

Remove the above check. Check one *res* will be done by *devm_ioremap_resource()*

> +	ctx->addr = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(ctx->addr)) {
> +		dev_err(dev, "ioremap failed\n");
> +		return PTR_ERR(ctx->addr);
> +	}
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ,
> +			ctx->i80_if ? "lcd_sys" : "vsync");
> +	if (!res) {
> +		dev_err(dev, "cannot find IRQ resource\n");
> +		return -ENXIO;
> +	}
> +
> +	ret = devm_request_irq(dev, res->start, ctx->i80_if ?
> +			decon_lcd_sys_irq_handler : decon_vsync_irq_handler, 0,
> +			"drm_decon", ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "lcd_sys irq request failed\n");
> +		return ret;
> +	}
> +
> +	ret = exynos_drm_component_add(dev, EXYNOS_DEVICE_TYPE_CRTC,
> +				       EXYNOS_DISPLAY_TYPE_LCD);
> +	if (ret < 0)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, ctx);
> +
> +	ret = component_add(dev, &decon_component_ops);
> +	if (ret < 0) {
> +		exynos_drm_component_del(dev, EXYNOS_DEVICE_TYPE_CRTC);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int exynos5433_decon_remove(struct platform_device *pdev)
> +{
> +	component_del(&pdev->dev, &decon_component_ops);
> +	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id exynos5433_decon_driver_dt_match[] = {
> +	{ .compatible = "samsung,exynos5433-decon" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, exynos5433_decon_driver_dt_match);
> +
> +struct platform_driver exynos5433_decon_driver = {
> +	.probe		= exynos5433_decon_probe,
> +	.remove		= exynos5433_decon_remove,
> +	.driver		= {
> +		.name	= "exynos5433-decon",
> +		.owner	= THIS_MODULE,

Remove this field. It will be updated by platform core.

> +		.of_match_table = exynos5433_decon_driver_dt_match,
> +	},
> +};

-- 
Varka Bhadram

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
