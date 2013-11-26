From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 4/4] drm: exynos: hdmi: Add dt support for hdmiphy settings
Date: Tue, 26 Nov 2013 10:00:48 +0900
Message-ID: <CAAQKjZNGHX2wsoBguhYnrQxg56x0BqTtfce7a6=Lp_MugN=feA@mail.gmail.com>
References: <1385369679-4337-1-git-send-email-s.shirish@samsung.com>
	<1385369679-4337-6-git-send-email-s.shirish@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385369679-4337-6-git-send-email-s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Shirish S <shirish-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shirish,

2013/11/25 Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>:
> This patch adds dt support to hdmiphy config settings
> as it is board specific and depends on the signal pattern
> of board.
>
> Signed-off-by: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../devicetree/bindings/video/exynos_hdmi.txt      |   31 ++++++++
>  drivers/gpu/drm/exynos/exynos_hdmi.c               |   77 +++++++++++++++++++-
>  2 files changed, 104 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> index 323983b..6eeb333 100644
> --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> @@ -13,6 +13,30 @@ Required properties:
>         b) pin number within the gpio controller.
>         c) optional flags and pull up/down.
>
> +- hdmiphy-configs: following information about the hdmiphy config settings.
> +       a) "config<N>: config<N>" specifies the phy configuration settings,
> +               where 'N' denotes the number of configuration, since every
> +               pixel clock can have its unique configuration.
> +               "pixel-clock" specifies the pixel clock
> +               "conifig-de-emphasis-level" provides fine control of TMDS data
> +                pre emphasis, below shown is example for
> +               data de-emphasis register at address 0x145D0040.
> +                       hdmiphy@38[16] for bits[3:0] permitted values are in
> +                       the range of 760 mVdiff to 1400 mVdiff at 20mVdiff
> +                       increments for every LSB
> +                       hdmiphy@38[16] for bits[7:4] permitted values are in
> +                       the range of 0dB to -7.45dB at increments of -0.45dB
> +                       for every LSB.
> +               "config-clock-level" provides fine control of TMDS data
> +               amplitude for each channel,
> +               for example if 0x145D005C is the address of clock level
> +               register then,
> +                       hdmiphy@38[23] for bits [1:0] permitted values are in
> +                       the range of 0 mVdiff & 60 mVdiff for each channel at
> +                       increments 20 mVdiff of amplitude levels for every LSB,
> +                       hdmiphy@38[23] for bits [7:3] permitted values are in
> +                       the range of 790 and 1430 mV at 20mV increments for
> +                       every LSB.
>  Example:
>
>         hdmi {
> @@ -20,4 +44,11 @@ Example:
>                 reg = <0x14530000 0x100000>;
>                 interrupts = <0 95 0>;
>                 hpd-gpio = <&gpx3 7 1>;
> +               hdmiphy-configs {
> +                       config0: config0 {
> +                               pixel-clock = <25200000>;
> +                               config-de-emphasis-level =  /bits/ 8 <0x26>;
> +                               config-clock-level =  /bits/ 8 < 0x66>;
> +                       };
> +               }
>         };
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 32ce9a6..5f599e3 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -197,6 +197,9 @@ struct hdmi_context {
>
>         struct hdmi_resources           res;
>
> +       struct hdmiphy_config           *confs;
> +       int                             nr_confs;
> +
>         int                             hpd_gpio;
>
>         enum hdmi_type                  type;
> @@ -256,7 +259,7 @@ static const struct hdmiphy_config hdmiphy_v13_configs[] = {
>         },
>  };
>
> -static const struct hdmiphy_config hdmiphy_v14_configs[] = {
> +static struct hdmiphy_config hdmiphy_v14_configs[] = {
>         {
>                 .pixel_clock = 25200000,
>                 .conf = {
> @@ -785,8 +788,8 @@ static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
>                 confs = hdmiphy_v13_configs;
>                 count = ARRAY_SIZE(hdmiphy_v13_configs);
>         } else if (hdata->type == HDMI_TYPE14) {
> -               confs = hdmiphy_v14_configs;
> -               count = ARRAY_SIZE(hdmiphy_v14_configs);
> +               confs = hdata->confs;
> +               count = hdata->nr_confs;
>         } else
>                 return -EINVAL;
>
> @@ -1415,7 +1418,7 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
>         if (hdata->type == HDMI_TYPE13)
>                 hdmiphy_data = hdmiphy_v13_configs[i].conf;
>         else
> -               hdmiphy_data = hdmiphy_v14_configs[i].conf;
> +               hdmiphy_data = hdata->confs[i].conf;
>
>         memcpy(buffer, hdmiphy_data, 32);
>         ret = i2c_master_send(hdata->hdmiphy_port, buffer, 32);
> @@ -1894,6 +1897,63 @@ fail:
>         return -ENODEV;
>  }
>
> +static int drm_hdmi_dt_parse_phy_conf(struct platform_device *pdev,
> +                                               struct hdmi_context *hdata)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *dev_np = dev->of_node;
> +       struct device_node *phy_conf, *cfg_np;
> +       int i, pixel_clock = 0;
> +
> +       /* Initialize with default config */
> +       hdata->confs = hdmiphy_v14_configs;
> +       hdata->nr_confs = ARRAY_SIZE(hdmiphy_v14_configs);
> +
> +       phy_conf = of_find_node_by_name(dev_np, "hdmiphy-configs");
> +       if (phy_conf == NULL) {
> +               hdata->nr_confs = ARRAY_SIZE(hdmiphy_v14_configs);
> +               DRM_ERROR("Did not find hdmiphy-configs node\n");
> +               return -ENODEV;
> +       }
> +
> +       for_each_child_of_node(phy_conf, cfg_np) {
> +               if (!of_find_property(cfg_np, "pixel-clock", NULL))
> +                       continue;
> +
> +               if (of_property_read_u32(cfg_np, "pixel-clock",
> +                                                       &pixel_clock, 1)) {

Have you ever built? see the below declaration,

static inline int of_property_read_u32(const struct device_node *np,
                                                      const char *propname,
                                                      u32 *out_value);

> +                               DRM_ERROR("Failed to get pixel clock\n");
> +                               return -EINVAL;
> +               }
> +
> +               for (i = 0; i < ARRAY_SIZE(hdmiphy_v14_configs); i++) {
> +                       if (hdata->confs[i].pixel_clock == pixel_clock)
> +                               /* Update the data de-emphasis and data level */
> +                               if (of_property_read_u8_array(cfg_np,
> +                                        "config-de-emphasis-level",
> +                                       &hdata->confs[i].conf[16], 1)) {
> +                                       DRM_ERROR("Failed to get conf\n");
> +                                       return -EINVAL;
> +                               }
> +                               if (of_property_read_u8_array(cfg_np,
> +                                        "config-de-emphasis-level",
> +                                       &hdata->confs[i].conf[16], 1)) {
> +                                       DRM_ERROR("Failed to get conf\n");
> +                                       return -EINVAL;
> +                               }
> +                               /* Update the clock level diff */
> +                               if (of_property_read_u8_array(cfg_np,
> +                                        "config-clock-level",
> +                                       &hdata->confs[i].conf[23], 1)) {
> +                                       DRM_ERROR("Failed to get conf\n");
> +                                       return -EINVAL;
> +                               }
> +               }
> +       }
> +       return 0;
> +
> +}
> +
>  static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
>                                         (struct device *dev)
>  {
> @@ -2024,6 +2084,15 @@ static int hdmi_probe(struct platform_device *pdev)
>                 goto err_hdmiphy;
>         }
>
> +       /* get hdmiphy confs */
> +       if (hdata->type == HDMI_TYPE14) {
> +               ret = drm_hdmi_dt_parse_phy_conf(pdev, hdata);
> +               if (ret) {
> +                       DRM_ERROR("failed to get user defined config,will use
> +                       default configs, eye diagram tests may fail\n");

build error?

> +               }
> +       }
> +
>         hdmi_display.dev = dev;
>         exynos_drm_display_register(&hdmi_display);
>
> --
> 1.7.9.5
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
