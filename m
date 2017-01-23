From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/5] drm: zte: move struct vou_inf into zx_vou driver
Date: Mon, 23 Jan 2017 10:30:05 -0500
Message-ID: <20170123153005.GC19505@trickycodes.roam.corp.google.com>
References: <1484843100-16284-1-git-send-email-shawnguo@kernel.org>
 <1484843100-16284-3-git-send-email-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484843100-16284-3-git-send-email-shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Baoyou Xie <xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 20, 2017 at 12:24:57AM +0800, Shawn Guo wrote:
> From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Although data in struct vou_inf is defined per output device, it doesn't
> belong to the device itself but VOU control module.  All these data can
> just be defined in VOU driver, and output device driver only needs to
> invoke VOU driver function with device ID to enable/disable specific
> output device.
> 

Reviewed-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/gpu/drm/zte/zx_hdmi.c | 12 ++----------
>  drivers/gpu/drm/zte/zx_vou.c  | 31 ++++++++++++++++++++++++-------
>  drivers/gpu/drm/zte/zx_vou.h  | 11 ++---------
>  3 files changed, 28 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/zte/zx_hdmi.c b/drivers/gpu/drm/zte/zx_hdmi.c
> index 6bf6c364811e..2f1e278ab50e 100644
> --- a/drivers/gpu/drm/zte/zx_hdmi.c
> +++ b/drivers/gpu/drm/zte/zx_hdmi.c
> @@ -53,13 +53,6 @@ struct zx_hdmi {
>  
>  #define to_zx_hdmi(x) container_of(x, struct zx_hdmi, x)
>  
> -static const struct vou_inf vou_inf_hdmi = {
> -	.id = VOU_HDMI,
> -	.data_sel = VOU_YUV444,
> -	.clocks_en_bits = BIT(24) | BIT(18) | BIT(6),
> -	.clocks_sel_bits = BIT(13) | BIT(2),
> -};
> -
>  static inline u8 hdmi_readb(struct zx_hdmi *hdmi, u16 offset)
>  {
>  	return readl_relaxed(hdmi->mmio + offset * 4);
> @@ -238,14 +231,14 @@ static void zx_hdmi_encoder_enable(struct drm_encoder *encoder)
>  
>  	zx_hdmi_hw_enable(hdmi);
>  
> -	vou_inf_enable(hdmi->inf, encoder->crtc);
> +	vou_inf_enable(VOU_HDMI, encoder->crtc);
>  }
>  
>  static void zx_hdmi_encoder_disable(struct drm_encoder *encoder)
>  {
>  	struct zx_hdmi *hdmi = to_zx_hdmi(encoder);
>  
> -	vou_inf_disable(hdmi->inf, encoder->crtc);
> +	vou_inf_disable(VOU_HDMI, encoder->crtc);
>  
>  	zx_hdmi_hw_disable(hdmi);
>  
> @@ -523,7 +516,6 @@ static int zx_hdmi_bind(struct device *dev, struct device *master, void *data)
>  
>  	hdmi->dev = dev;
>  	hdmi->drm = drm;
> -	hdmi->inf = &vou_inf_hdmi;
>  
>  	dev_set_drvdata(dev, hdmi);
>  
> diff --git a/drivers/gpu/drm/zte/zx_vou.c b/drivers/gpu/drm/zte/zx_vou.c
> index 8c4f0e2885f3..c48704b4425a 100644
> --- a/drivers/gpu/drm/zte/zx_vou.c
> +++ b/drivers/gpu/drm/zte/zx_vou.c
> @@ -158,6 +158,21 @@ struct zx_vou_hw {
>  	struct zx_crtc *aux_crtc;
>  };
>  
> +struct vou_inf {
> +	enum vou_inf_id id;
> +	enum vou_inf_data_sel data_sel;
> +	u32 clocks_en_bits;
> +	u32 clocks_sel_bits;
> +};
> +
> +static struct vou_inf vou_infs[] = {
> +	[VOU_HDMI] = {
> +		.data_sel = VOU_YUV444,
> +		.clocks_en_bits = BIT(24) | BIT(18) | BIT(6),
> +		.clocks_sel_bits = BIT(13) | BIT(2),
> +	},
> +};
> +
>  static inline struct zx_vou_hw *crtc_to_vou(struct drm_crtc *crtc)
>  {
>  	struct zx_crtc *zcrtc = to_zx_crtc(crtc);
> @@ -165,20 +180,21 @@ static inline struct zx_vou_hw *crtc_to_vou(struct drm_crtc *crtc)
>  	return zcrtc->vou;
>  }
>  
> -void vou_inf_enable(const struct vou_inf *inf, struct drm_crtc *crtc)
> +void vou_inf_enable(enum vou_inf_id id, struct drm_crtc *crtc)
>  {
>  	struct zx_crtc *zcrtc = to_zx_crtc(crtc);
>  	struct zx_vou_hw *vou = zcrtc->vou;
> +	struct vou_inf *inf = &vou_infs[id];
>  	bool is_main = zcrtc->chn_type == VOU_CHN_MAIN;
> -	u32 data_sel_shift = inf->id << 1;
> +	u32 data_sel_shift = id << 1;
>  
>  	/* Select data format */
>  	zx_writel_mask(vou->vouctl + VOU_INF_DATA_SEL, 0x3 << data_sel_shift,
>  		       inf->data_sel << data_sel_shift);
>  
>  	/* Select channel */
> -	zx_writel_mask(vou->vouctl + VOU_INF_CH_SEL, 0x1 << inf->id,
> -		       zcrtc->chn_type << inf->id);
> +	zx_writel_mask(vou->vouctl + VOU_INF_CH_SEL, 0x1 << id,
> +		       zcrtc->chn_type << id);
>  
>  	/* Select interface clocks */
>  	zx_writel_mask(vou->vouctl + VOU_CLK_SEL, inf->clocks_sel_bits,
> @@ -189,15 +205,16 @@ void vou_inf_enable(const struct vou_inf *inf, struct drm_crtc *crtc)
>  		       inf->clocks_en_bits);
>  
>  	/* Enable the device */
> -	zx_writel_mask(vou->vouctl + VOU_INF_EN, 1 << inf->id, 1 << inf->id);
> +	zx_writel_mask(vou->vouctl + VOU_INF_EN, 1 << id, 1 << id);
>  }
>  
> -void vou_inf_disable(const struct vou_inf *inf, struct drm_crtc *crtc)
> +void vou_inf_disable(enum vou_inf_id id, struct drm_crtc *crtc)
>  {
>  	struct zx_vou_hw *vou = crtc_to_vou(crtc);
> +	struct vou_inf *inf = &vou_infs[id];
>  
>  	/* Disable the device */
> -	zx_writel_mask(vou->vouctl + VOU_INF_EN, 1 << inf->id, 0);
> +	zx_writel_mask(vou->vouctl + VOU_INF_EN, 1 << id, 0);
>  
>  	/* Disable interface clocks */
>  	zx_writel_mask(vou->vouctl + VOU_CLK_EN, inf->clocks_en_bits, 0);
> diff --git a/drivers/gpu/drm/zte/zx_vou.h b/drivers/gpu/drm/zte/zx_vou.h
> index 4b4339be641b..a41a0ad49857 100644
> --- a/drivers/gpu/drm/zte/zx_vou.h
> +++ b/drivers/gpu/drm/zte/zx_vou.h
> @@ -30,15 +30,8 @@ enum vou_inf_data_sel {
>  	VOU_RGB_666	= 3,
>  };
>  
> -struct vou_inf {
> -	enum vou_inf_id id;
> -	enum vou_inf_data_sel data_sel;
> -	u32 clocks_en_bits;
> -	u32 clocks_sel_bits;
> -};
> -
> -void vou_inf_enable(const struct vou_inf *inf, struct drm_crtc *crtc);
> -void vou_inf_disable(const struct vou_inf *inf, struct drm_crtc *crtc);
> +void vou_inf_enable(enum vou_inf_id id, struct drm_crtc *crtc);
> +void vou_inf_disable(enum vou_inf_id id, struct drm_crtc *crtc);
>  
>  int zx_vou_enable_vblank(struct drm_device *drm, unsigned int pipe);
>  void zx_vou_disable_vblank(struct drm_device *drm, unsigned int pipe);
> -- 
> 1.9.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Sean Paul, Software Engineer, Google / Chromium OS
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
