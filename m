From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 2/2] drm/stm: ltdc: add a 2nd endpoint
Date: Tue, 7 Nov 2017 14:58:28 +0100
Message-ID: <CA+M3ks6T5zcHr3uoyRCdg69LS5be-Erc20YHX7_e645WkmvTmg@mail.gmail.com>
References: <1509018489-19641-1-git-send-email-philippe.cornu@st.com> <1509018489-19641-3-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509018489-19641-3-git-send-email-philippe.cornu-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-10-26 13:48 GMT+02:00 Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>:
> ltdc can have up to 2 endpoints:
>  - dpi external gpios: for rgb panels or external bridge ICs.
>  - dpi internal ios: connected internally to dsi.
>
> Note: Refer to the reference manual to know if the dsi is
> present on your device.

Applied on drm-misc-next
Thanks

Benjamin

> Signed-off-by: Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>
> ---
>  drivers/gpu/drm/stm/ltdc.c | 64 ++++++++++++++++++++++++++++++++--------------
>  1 file changed, 45 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index d5c8a42..38a6739 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -33,6 +33,8 @@
>
>  #define MAX_IRQ 4
>
> +#define MAX_ENDPOINTS 2
> +
>  #define HWVER_10200 0x010200
>  #define HWVER_10300 0x010300
>  #define HWVER_20101 0x020101
> @@ -886,18 +888,33 @@ int ltdc_load(struct drm_device *ddev)
>         struct ltdc_device *ldev = ddev->dev_private;
>         struct device *dev = ddev->dev;
>         struct device_node *np = dev->of_node;
> -       struct drm_bridge *bridge;
> -       struct drm_panel *panel;
> +       struct drm_bridge *bridge[MAX_ENDPOINTS] = {NULL};
> +       struct drm_panel *panel[MAX_ENDPOINTS] = {NULL};
>         struct drm_crtc *crtc;
>         struct reset_control *rstc;
>         struct resource *res;
> -       int irq, ret, i;
> +       int irq, ret, i, endpoint_not_ready = -ENODEV;
>
>         DRM_DEBUG_DRIVER("\n");
>
> -       ret = drm_of_find_panel_or_bridge(np, 0, 0, &panel, &bridge);
> -       if (ret)
> -               return ret;
> +       /* Get endpoints if any */
> +       for (i = 0; i < MAX_ENDPOINTS; i++) {
> +               ret = drm_of_find_panel_or_bridge(np, 0, i, &panel[i],
> +                                                 &bridge[i]);
> +
> +               /*
> +                * If at least one endpoint is ready, continue probing,
> +                * else if at least one endpoint is -EPROBE_DEFER and
> +                * there is no previous ready endpoints, defer probing.
> +                */
> +               if (!ret)
> +                       endpoint_not_ready = 0;
> +               else if (ret == -EPROBE_DEFER && endpoint_not_ready)
> +                       endpoint_not_ready = -EPROBE_DEFER;
> +       }
> +
> +       if (endpoint_not_ready)
> +               return endpoint_not_ready;
>
>         rstc = devm_reset_control_get_exclusive(dev, NULL);
>
> @@ -958,19 +975,25 @@ int ltdc_load(struct drm_device *ddev)
>
>         DRM_INFO("ltdc hw version 0x%08x - ready\n", ldev->caps.hw_version);
>
> -       if (panel) {
> -               bridge = drm_panel_bridge_add(panel, DRM_MODE_CONNECTOR_DPI);
> -               if (IS_ERR(bridge)) {
> -                       DRM_ERROR("Failed to create panel-bridge\n");
> -                       ret = PTR_ERR(bridge);
> -                       goto err;
> +       /* Add endpoints panels or bridges if any */
> +       for (i = 0; i < MAX_ENDPOINTS; i++) {
> +               if (panel[i]) {
> +                       bridge[i] = drm_panel_bridge_add(panel[i],
> +                                                       DRM_MODE_CONNECTOR_DPI);
> +                       if (IS_ERR(bridge[i])) {
> +                               DRM_ERROR("panel-bridge endpoint %d\n", i);
> +                               ret = PTR_ERR(bridge[i]);
> +                               goto err;
> +                       }
>                 }
> -       }
>
> -       ret = ltdc_encoder_init(ddev, bridge);
> -       if (ret) {
> -               DRM_ERROR("Failed to init encoder\n");
> -               goto err;
> +               if (bridge[i]) {
> +                       ret = ltdc_encoder_init(ddev, bridge[i]);
> +                       if (ret) {
> +                               DRM_ERROR("init encoder endpoint %d\n", i);
> +                               goto err;
> +                       }
> +               }
>         }
>
>         crtc = devm_kzalloc(dev, sizeof(*crtc), GFP_KERNEL);
> @@ -998,7 +1021,8 @@ int ltdc_load(struct drm_device *ddev)
>         return 0;
>
>  err:
> -       drm_panel_bridge_remove(bridge);
> +       for (i = 0; i < MAX_ENDPOINTS; i++)
> +               drm_panel_bridge_remove(bridge[i]);
>
>         clk_disable_unprepare(ldev->pixel_clk);
>
> @@ -1008,10 +1032,12 @@ int ltdc_load(struct drm_device *ddev)
>  void ltdc_unload(struct drm_device *ddev)
>  {
>         struct ltdc_device *ldev = ddev->dev_private;
> +       int i;
>
>         DRM_DEBUG_DRIVER("\n");
>
> -       drm_of_panel_bridge_remove(ddev->dev->of_node, 0, 0);
> +       for (i = 0; i < MAX_ENDPOINTS; i++)
> +               drm_of_panel_bridge_remove(ddev->dev->of_node, 0, i);
>
>         clk_disable_unprepare(ldev->pixel_clk);
>  }
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
