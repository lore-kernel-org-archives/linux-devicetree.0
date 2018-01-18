From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 05/12] drm/bridge/synopsys: dw-hdmi: don't clobber
 drvdata
Date: Thu, 18 Jan 2018 14:04:08 +0100
Message-ID: <91cd3ffd-e5cc-8149-2c57-6f93da55a0e4@baylibre.com>
References: <20180117201421.25954-1-jernej.skrabec@siol.net>
 <20180117201421.25954-6-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180117201421.25954-6-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 17/01/2018 21:14, Jernej Skrabec wrote:
> dw_hdmi shouldn't set drvdata since some drivers might need to store
> it's own data there. Rework dw_hdmi in a way to return struct dw_hdmi
> instead to store it in drvdata. This way drivers are responsible to
> store and pass structure when needed.
> 
> Idea was taken from the following commit:
> 8242ecbd597d ("drm/bridge/synopsys: stop clobbering drvdata")
> 
> Cc: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
> Cc: narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
> Cc: Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
> Cc: hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org
> Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   | 31 ++++++++++++-----------------
>  drivers/gpu/drm/imx/dw_hdmi-imx.c           | 13 +++++++++---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c       | 14 +++++++++----
>  drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c      | 12 +++++++++--
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 13 +++++++++---
>  include/drm/bridge/dw_hdmi.h                | 13 ++++++------
>  6 files changed, 60 insertions(+), 36 deletions(-)
> 

[...]
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index e8c3ef8a94ce..d49af17310c9 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -140,6 +140,7 @@ struct meson_dw_hdmi {
>  	struct clk *venci_clk;
>  	struct regulator *hdmi_supply;
>  	u32 irq_stat;
> +	struct dw_hdmi *hdmi;
>  };
>  #define encoder_to_meson_dw_hdmi(x) \
>  	container_of(x, struct meson_dw_hdmi, encoder)
> @@ -878,9 +879,12 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  	dw_plat_data->input_bus_format = MEDIA_BUS_FMT_YUV8_1X24;
>  	dw_plat_data->input_bus_encoding = V4L2_YCBCR_ENC_709;
>  
> -	ret = dw_hdmi_bind(pdev, encoder, &meson_dw_hdmi->dw_plat_data);
> -	if (ret)
> -		return ret;
> +	platform_set_drvdata(pdev, meson_dw_hdmi);
> +
> +	meson_dw_hdmi->hdmi = dw_hdmi_bind(pdev, encoder,
> +					   &meson_dw_hdmi->dw_plat_data);
> +	if (IS_ERR(meson_dw_hdmi->hdmi))
> +		return PTR_ERR(meson_dw_hdmi->hdmi);
>  
>  	DRM_DEBUG_DRIVER("HDMI controller initialized\n");
>  
> @@ -890,7 +894,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  static void meson_dw_hdmi_unbind(struct device *dev, struct device *master,
>  				   void *data)
>  {
> -	dw_hdmi_unbind(dev);
> +	struct meson_dw_hdmi *meson_dw_hdmi = dev_get_drvdata(dev);
> +
> +	dw_hdmi_unbind(meson_dw_hdmi->hdmi);
>  }
>  
>  static const struct component_ops meson_dw_hdmi_ops = {

[..]

> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index f3f3f0e1b2d3..dd2a8cf7d20b 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -143,12 +143,13 @@ struct dw_hdmi_plat_data {
>  			     unsigned long mpixelclock);
>  };
>  
> -int dw_hdmi_probe(struct platform_device *pdev,
> -		  const struct dw_hdmi_plat_data *plat_data);
> -void dw_hdmi_remove(struct platform_device *pdev);
> -void dw_hdmi_unbind(struct device *dev);
> -int dw_hdmi_bind(struct platform_device *pdev, struct drm_encoder *encoder,
> -		 const struct dw_hdmi_plat_data *plat_data);
> +struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
> +			      const struct dw_hdmi_plat_data *plat_data);
> +void dw_hdmi_remove(struct dw_hdmi *hdmi);
> +void dw_hdmi_unbind(struct dw_hdmi *hdmi);
> +struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
> +			     struct drm_encoder *encoder,
> +			     const struct dw_hdmi_plat_data *plat_data);
>  
>  void dw_hdmi_setup_rx_sense(struct device *dev, bool hpd, bool rx_sense);
>  
> 

For meson-drm and dw-hdmi bridge changes :
Acked-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
