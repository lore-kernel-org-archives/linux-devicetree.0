From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 22/32] drm/exynos: Move display implementation into dp
Date: Mon, 11 Nov 2013 02:53:01 +0100
Message-ID: <1826717.IzaikOO07J@flatron>
References: <1383063198-10526-1-git-send-email-seanpaul@chromium.org> <1383063198-10526-23-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383063198-10526-23-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sean,

[CCing devicetree ML and some DT maintainers]

On Tuesday 29 of October 2013 12:13:08 Sean Paul wrote:
> This patch moves the exynos_drm_display implementation from fimd into
> the dp driver. This will allow for tighter integration of the dp driver
> into the exynos drm driver.
> 
> Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> 
> Changes in v2: None
> Changes in v3: None
> 
>  .../devicetree/bindings/video/exynos_dp.txt        |  17 +++
>  .../devicetree/bindings/video/samsung-fimd.txt     |   2 +
>  drivers/gpu/drm/exynos/exynos_dp_core.c            | 137 ++++++++++++++++-----
>  drivers/gpu/drm/exynos/exynos_dp_core.h            |   5 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.c            |  14 +++
>  drivers/gpu/drm/exynos/exynos_drm_drv.h            |   1 +
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c           |  78 +++---------
>  7 files changed, 156 insertions(+), 98 deletions(-)

Technically the changes in code look fine, but how does it play with
panels connected directly to FIMD (using RGB or i80 interface)?

> diff --git a/Documentation/devicetree/bindings/video/exynos_dp.txt b/Documentation/devicetree/bindings/video/exynos_dp.txt
> index 84f10c1..a073e15 100644
> --- a/Documentation/devicetree/bindings/video/exynos_dp.txt
> +++ b/Documentation/devicetree/bindings/video/exynos_dp.txt
> @@ -45,6 +45,8 @@ Required properties for dp-controller:
>  	-samsung,lane-count:
>  		number of lanes supported by the panel.
>  			LANE_COUNT1 = 1, LANE_COUNT2 = 2, LANE_COUNT4 = 4
> +	- display-timings: timings for the connected panel as described by
> +		Documentation/devicetree/bindings/video/display-timing.txt

I'm afraid this is breaking compatibility with existing device trees.
Unless we can guarantee that there are no existing devices shipped using
the old binding, we should keep compatibility with it.

Also, since this patch is changing a binding, it must go through the
devicetree ML (now on CC) and be reviewed and acked by at least one of DT
maintainers.

Of course this new binding makes more sense, but that's another story.

>  
>  Optional properties for dp-controller:
>  	-interlaced:
> @@ -83,4 +85,19 @@ Board Specific portion:
>  		samsung,color-depth = <1>;
>  		samsung,link-rate = <0x0a>;
>  		samsung,lane-count = <4>;
> +
> +		display-timings {
> +			native-mode = <&lcd_timing>;
> +			lcd_timing: 1366x768 {
> +				clock-frequency = <70589280>;
> +				hactive = <1366>;
> +				vactive = <768>;
> +				hfront-porch = <40>;
> +				hback-porch = <40>;
> +				hsync-len = <32>;
> +				vback-porch = <10>;
> +				vfront-porch = <12>;
> +				vsync-len = <6>;
> +			};
> +		};
>  	};
> diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt b/Documentation/devicetree/bindings/video/samsung-fimd.txt
> index 778838a..fa465c3 100644
> --- a/Documentation/devicetree/bindings/video/samsung-fimd.txt
> +++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
> @@ -39,6 +39,8 @@ Required properties:
>  
>  Optional Properties:
>  - samsung,power-domain: a phandle to FIMD power domain node.
> +- samsung,invert-vden: video enable signal is inverted
> +- samsung,invert_vclk: video clock signal is inverted

s/_/-/ in property names

>  
>  Example:
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
> index 089ae22..13ea8b7 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
[snip]
> @@ -1142,45 +1241,17 @@ static int exynos_dp_remove(struct platform_device *pdev)
>  #ifdef CONFIG_PM_SLEEP
>  static int exynos_dp_suspend(struct device *dev)
>  {
> -	struct exynos_dp_platdata *pdata = dev->platform_data;
>  	struct exynos_dp_device *dp = dev_get_drvdata(dev);
>  
> -	disable_irq(dp->irq);
> -
> -	flush_work(&dp->hotplug_work);
> -
> -	if (dev->of_node) {
> -		if (dp->phy_addr)
> -			exynos_dp_phy_exit(dp);
> -	} else {
> -		if (pdata->phy_exit)
> -			pdata->phy_exit();
> -	}
> -
> -	clk_disable_unprepare(dp->clock);
> -
> +	exynos_dp_poweroff(dp);

This change (moving this code to separate function) could be done in
a separate patch.

>  	return 0;
>  }
>  
>  static int exynos_dp_resume(struct device *dev)
>  {
> -	struct exynos_dp_platdata *pdata = dev->platform_data;
>  	struct exynos_dp_device *dp = dev_get_drvdata(dev);
>  
> -	if (dev->of_node) {
> -		if (dp->phy_addr)
> -			exynos_dp_phy_init(dp);
> -	} else {
> -		if (pdata->phy_init)
> -			pdata->phy_init();
> -	}
> -
> -	clk_prepare_enable(dp->clock);
> -
> -	exynos_dp_init_dp(dp);
> -
> -	enable_irq(dp->irq);
> -
> +	exynos_dp_poweron(dp);

Along with this one.

>  	return 0;
>  }
>  #endif
[snip]
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 61124ca..c6a05f6 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
[snip]
>  static void fimd_win_mode_set(struct exynos_drm_manager *mgr,
>  			struct exynos_drm_overlay *overlay)
>  {
> @@ -611,6 +578,16 @@ static void fimd_mode_set(struct exynos_drm_manager *mgr,
>  	mode->hfpd = hblank - mode->hsync_len - mode->hbpd;
>  
>  	mode->clkdiv = fimd_calc_clkdiv(ctx, in_mode);
> +
> +	if (in_mode->flags & DRM_MODE_FLAG_NVSYNC)
> +		ctx->vidcon1 |= VIDCON1_INV_VSYNC;
> +	else
> +		ctx->vidcon1 &= ~VIDCON1_INV_VSYNC;
> +
> +	if (in_mode->flags & DRM_MODE_FLAG_NHSYNC)
> +		ctx->vidcon1 |= VIDCON1_INV_HSYNC;
> +	else
> +		ctx->vidcon1 &= ~VIDCON1_INV_HSYNC;
>  }
>  
>  static void fimd_commit(struct exynos_drm_manager *mgr)
> @@ -888,30 +865,6 @@ static int fimd_activate(struct exynos_drm_manager *mgr, bool enable)
>  	return 0;
>  }
>  
> -static int fimd_get_platform_data(struct fimd_context *ctx, struct device *dev)
> -{
> -	struct videomode *vm;
> -	int ret;
> -
> -	vm = &ctx->panel.vm;
> -	ret = of_get_videomode(dev->of_node, vm, OF_USE_NATIVE_MODE);
> -	if (ret) {
> -		DRM_ERROR("failed: of_get_videomode() : %d\n", ret);
> -		return ret;
> -	}
> -
> -	if (vm->flags & DISPLAY_FLAGS_VSYNC_LOW)
> -		ctx->vidcon1 |= VIDCON1_INV_VSYNC;
> -	if (vm->flags & DISPLAY_FLAGS_HSYNC_LOW)
> -		ctx->vidcon1 |= VIDCON1_INV_HSYNC;
> -	if (vm->flags & DISPLAY_FLAGS_DE_LOW)
> -		ctx->vidcon1 |= VIDCON1_INV_VDEN;
> -	if (vm->flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
> -		ctx->vidcon1 |= VIDCON1_INV_VCLK;
> -
> -	return 0;
> -}
> -
>  static int fimd_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -929,9 +882,10 @@ static int fimd_probe(struct platform_device *pdev)
>  
>  	ctx->dev = dev;
>  
> -	ret = fimd_get_platform_data(ctx, dev);
> -	if (ret)
> -		return ret;
> +	if (of_property_read_bool(dev->of_node, "samsung,invert-vden"))
> +		ctx->vidcon1 |= VIDCON1_INV_VDEN;
> +	if (of_property_read_bool(dev->of_node, "samsung,invert-vclk"))
> +		ctx->vidcon1 |= VIDCON1_INV_VCLK;

This is a step backwards. Why add separate properties, when this can be
retrieved from the display timings node?

Anyway, you can't just break compatibility with the old way, since there
might be devices shipped with DTB using it and they must be able to work
on newer kernels.

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
