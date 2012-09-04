From: InKi Dae <inki.dae@samsung.com>
Subject: Re: [PATCH V3 1/2] drm/exynos: add platform_device_id table and
	driver data for exynos5 drm fimd
Date: Tue, 4 Sep 2012 07:15:56 -0700
Message-ID: <CAAQKjZM_xrosDeBytOySJBagNyzNz5t6fk7uAepTq64C0kcejw@mail.gmail.com>
References: <1345111689-14601-1-git-send-email-l.krishna@samsung.com>
	<1345111689-14601-2-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1345111689-14601-2-git-send-email-l.krishna@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

2012/8/16 Leela Krishna Amudala <l.krishna@samsung.com>:
> The name of the exynos drm fimd device is renamed to exynos-drm-fimd
> and two device ids are created for exynos4-fb and exynos5-drm-fimd.
> Also, added driver data for exynos5 to pick the fimd version at runtime and
> to choose the VIDTCON register offsets accordingly.
>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c |   56 +++++++++++++++++++++++++++---
>  1 files changed, 51 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 24c0bd4..8379c59 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -57,6 +57,18 @@
>
>  #define get_fimd_context(dev)  platform_get_drvdata(to_platform_device(dev))
>
> +enum fimd_version_type {
> +       VERSION_8, /* FIMD_VERSION8 */
> +};
> +
> +struct drm_fimd_driver_data {
> +       enum fimd_version_type fimd_ver;
> +};
> +
> +struct drm_fimd_driver_data exynos5_drm_fimd_driver_data = {
> +       .fimd_ver = VERSION_8,
> +};
> +
>  struct fimd_win_data {
>         unsigned int            offset_x;
>         unsigned int            offset_y;
> @@ -91,6 +103,13 @@ struct fimd_context {
>         struct exynos_drm_panel_info *panel;
>  };
>
> +static inline struct drm_fimd_driver_data *drm_fimd_get_driver_data(
> +       struct platform_device *pdev)
> +{
> +       return (struct drm_fimd_driver_data *)
> +               platform_get_device_id(pdev)->driver_data;
> +}
> +
>  static bool fimd_display_is_connected(struct device *dev)
>  {
>         DRM_DEBUG_KMS("%s\n", __FILE__);
> @@ -194,32 +213,47 @@ static void fimd_commit(struct device *dev)
>         struct fimd_context *ctx = get_fimd_context(dev);
>         struct exynos_drm_panel_info *panel = ctx->panel;
>         struct fb_videomode *timing = &panel->timing;
> +       struct drm_fimd_driver_data *driver_data;
> +       struct platform_device *pdev = to_platform_device(dev);
>         u32 val;
>
> +       driver_data = drm_fimd_get_driver_data(pdev);
>         if (ctx->suspended)
>                 return;
>
>         DRM_DEBUG_KMS("%s\n", __FILE__);
>
>         /* setup polarity values from machine code. */
> -       writel(ctx->vidcon1, ctx->regs + VIDCON1);
> +       if (driver_data->fimd_ver == VERSION_8)
> +               writel(ctx->vidcon1, ctx->regs + FIMD_V8_VIDCON1);

where are FIMD_V8_VIDCON0/1/2 defined? it seems like that you missed some codes.

> +       else
> +               writel(ctx->vidcon1, ctx->regs + VIDCON1);
>
>         /* setup vertical timing values. */
>         val = VIDTCON0_VBPD(timing->upper_margin - 1) |
>                VIDTCON0_VFPD(timing->lower_margin - 1) |
>                VIDTCON0_VSPW(timing->vsync_len - 1);
> -       writel(val, ctx->regs + VIDTCON0);
> +       if (driver_data->fimd_ver == VERSION_8)
> +               writel(val, ctx->regs + FIMD_V8_VIDTCON0);
> +       else
> +               writel(val, ctx->regs + VIDTCON0);
>
>         /* setup horizontal timing values.  */
>         val = VIDTCON1_HBPD(timing->left_margin - 1) |
>                VIDTCON1_HFPD(timing->right_margin - 1) |
>                VIDTCON1_HSPW(timing->hsync_len - 1);
> -       writel(val, ctx->regs + VIDTCON1);
> +       if (driver_data->fimd_ver == VERSION_8)
> +               writel(val, ctx->regs + FIMD_V8_VIDTCON1);
> +       else
> +               writel(val, ctx->regs + VIDTCON1);
>
>         /* setup horizontal and vertical display size. */
>         val = VIDTCON2_LINEVAL(timing->yres - 1) |
>                VIDTCON2_HOZVAL(timing->xres - 1);
> -       writel(val, ctx->regs + VIDTCON2);
> +       if (driver_data->fimd_ver == VERSION_8)
> +               writel(val, ctx->regs + FIMD_V8_VIDTCON2);
> +       else
> +               writel(val, ctx->regs + VIDTCON2);
>
>         /* setup clock source, clock divider, enable dma. */
>         val = ctx->vidcon0;
> @@ -982,6 +1016,17 @@ static int fimd_runtime_resume(struct device *dev)
>  }
>  #endif
>
> +static struct platform_device_id exynos_drm_fimd_driver_ids[] = {
> +       {
> +               .name           = "exynos4-fb",
> +       }, {
> +               .name           = "exynos5-drm-fimd",
> +               .driver_data    = (unsigned long)&exynos5_drm_fimd_driver_data,
> +       },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(platform, exynos_drm_fimd_driver_ids);
> +
>  static const struct dev_pm_ops fimd_pm_ops = {
>         SET_SYSTEM_SLEEP_PM_OPS(fimd_suspend, fimd_resume)
>         SET_RUNTIME_PM_OPS(fimd_runtime_suspend, fimd_runtime_resume, NULL)
> @@ -990,8 +1035,9 @@ static const struct dev_pm_ops fimd_pm_ops = {
>  struct platform_driver fimd_driver = {
>         .probe          = fimd_probe,
>         .remove         = __devexit_p(fimd_remove),
> +       .id_table       = exynos_drm_fimd_driver_ids,
>         .driver         = {
> -               .name   = "exynos4-fb",
> +               .name   = "exynos-drm-fimd",
>                 .owner  = THIS_MODULE,
>                 .pm     = &fimd_pm_ops,
>         },
> --
> 1.7.0.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
