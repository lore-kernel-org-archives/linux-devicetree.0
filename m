From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v5] drm/fsl-dcu: Implement gamma_lut atomic crtc
 properties
Date: Fri, 30 Sep 2016 09:23:43 -0700
Message-ID: <f539ebe1fe2086d67e74e5b7e8ce2e6a@agner.ch>
References: <1475051069-24452-1-git-send-email-meng.yi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475051069-24452-1-git-send-email-meng.yi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: daniel-/w4YWyX8dFk@public.gmane.org, ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2016-09-28 01:24, Meng Yi wrote:
> Gamma correction is optional and can be used to adjust the color
> output values to match the gamut of a particular TFT LCD panel
> 
> Split the DCU regs into "regs", "palette", "gamma" and "cursor".
> Create a second regmap for gamma memory space using little endian.
> The registers after the first address space are not accessed yet,
> hence new device trees would even work with old kernels. Just new
> kernel need the new format so we can access the separate gamma
> reg space.
> 
> Suggested-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> Signed-off-by: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
> ---
> Changes since V1:
> -created a second regmap for gamma
> -updated the DCU DT binding
> -removed Kconfig for gamma and enable gamma when valid data filled.
> -extended and simplified comment lines.
> ---
>  .../devicetree/bindings/display/fsl,dcu.txt        | 12 +++++++-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c         | 33 ++++++++++++++++++++
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          | 35 +++++++++++++++++++++-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h          |  7 +++++
>  4 files changed, 85 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,dcu.txt
> b/Documentation/devicetree/bindings/display/fsl,dcu.txt
> index 63ec2a6..8140b5d 100644
> --- a/Documentation/devicetree/bindings/display/fsl,dcu.txt
> +++ b/Documentation/devicetree/bindings/display/fsl,dcu.txt
> @@ -6,6 +6,12 @@ Required properties:
>  	* "fsl,vf610-dcu".
>  
>  - reg:			Address and length of the register set for dcu.
> +			Must contain four address/length tuples:
> +			1. Register address space
> +			2. Palette/Tile address space
> +			3. Gamma address space
> +			4. Cursor address space
> +- reg-names:		Should be "regs", "palette", "gamma" and "cursor"

Looks good to me, device tree folks?

--
Stefan

>  - clocks:		Handle to "dcu" and "pix" clock (in the order below)
>  			This can be the same clock (e.g. LS1021a)
>  			See ../clocks/clock-bindings.txt for details.
> @@ -20,7 +26,11 @@ Optional properties:
>  Examples:
>  dcu: dcu@2ce0000 {
>  	compatible = "fsl,ls1021a-dcu";
> -	reg = <0x0 0x2ce0000 0x0 0x10000>;
> +	reg = <0x0 0x2ce0000 0x0 0x2000>,
> +	      <0x0 0x2ce2000 0x0 0x2000>,
> +	      <0x0 0x2ce4000 0x0 0xc00>,
> +	      <0x0 0x2ce4c00 0x0 0x400>;
> +	reg-names = "regs", "palette", "gamma", "cursor";
>  	clocks = <&platform_clk 0>, <&platform_clk 0>;
>  	clock-names = "dcu", "pix";
>  	big-endian;
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
> b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
> index 3371635..6371e4d 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
> @@ -22,6 +22,31 @@
>  #include "fsl_dcu_drm_drv.h"
>  #include "fsl_dcu_drm_plane.h"
>  
> +static void fsl_crtc_gamma_set(struct drm_crtc *crtc, struct
> drm_color_lut *lut,
> +			      uint32_t size)
> +{
> +	struct fsl_dcu_drm_device *fsl_dev = crtc->dev->dev_private;
> +	unsigned int i;
> +
> +	if (crtc->state->gamma_lut->data) {
> +		for (i = 0; i < size; i++) {
> +			regmap_write(fsl_dev->regmap_gamma, FSL_GAMMA_R + 4 * i,
> +				     lut[i].red);
> +			regmap_write(fsl_dev->regmap_gamma, FSL_GAMMA_G + 4 * i,
> +				     lut[i].green);
> +			regmap_write(fsl_dev->regmap_gamma, FSL_GAMMA_B + 4 * i,
> +				     lut[i].blue);
> +		}
> +
> +		regmap_update_bits(fsl_dev->regmap, DCU_DCU_MODE,
> +				   DCU_MODE_EN_GAMMA_MASK,
> +				   DCU_MODE_GAMMA_ENABLE);
> +	} else {
> +		regmap_update_bits(fsl_dev->regmap, DCU_DCU_MODE,
> +				   DCU_MODE_EN_GAMMA_MASK, 0);
> +	}
> +}
> +
>  static void fsl_dcu_drm_crtc_atomic_flush(struct drm_crtc *crtc,
>  					  struct drm_crtc_state *old_crtc_state)
>  {
> @@ -37,6 +62,10 @@ static void fsl_dcu_drm_crtc_atomic_flush(struct
> drm_crtc *crtc,
>  			drm_crtc_send_vblank_event(crtc, event);
>  		spin_unlock_irq(&crtc->dev->event_lock);
>  	}
> +
> +	if (crtc->state->color_mgmt_changed && crtc->state->gamma_lut)
> +		fsl_crtc_gamma_set(crtc, (struct drm_color_lut *)
> +				   crtc->state->gamma_lut->data, 256);
>  }
>  
>  static void fsl_dcu_drm_disable_crtc(struct drm_crtc *crtc)
> @@ -135,6 +164,7 @@ static const struct drm_crtc_funcs
> fsl_dcu_drm_crtc_funcs = {
>  	.page_flip = drm_atomic_helper_page_flip,
>  	.reset = drm_atomic_helper_crtc_reset,
>  	.set_config = drm_atomic_helper_set_config,
> +	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  };
>  
>  int fsl_dcu_drm_crtc_create(struct fsl_dcu_drm_device *fsl_dev)
> @@ -158,5 +188,8 @@ int fsl_dcu_drm_crtc_create(struct
> fsl_dcu_drm_device *fsl_dev)
>  
>  	drm_crtc_helper_add(crtc, &fsl_dcu_drm_crtc_helper_funcs);
>  
> +	drm_crtc_enable_color_mgmt(crtc, 0, false, 256);
> +	drm_mode_crtc_set_gamma_size(crtc, 256);
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> index 092aaec..e662890 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> @@ -48,6 +48,20 @@ static const struct regmap_config fsl_dcu_regmap_config = {
>  	.volatile_reg = fsl_dcu_drm_is_volatile_reg,
>  };
>  
> +/*
> + * force using little endian here since ls1021a's gamma regs are little
> + * endian while the other regs are big endian, and all vf610s's regs
> + * are little endian
> + */
> +static const struct regmap_config fsl_dcu_regmap_gamma_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +
> +	.volatile_reg = fsl_dcu_drm_is_volatile_reg,
> +};
> +
>  static int fsl_dcu_drm_irq_init(struct drm_device *dev)
>  {
>  	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
> @@ -327,7 +341,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
>  	struct drm_device *drm;
>  	struct device *dev = &pdev->dev;
>  	struct resource *res;
> -	void __iomem *base;
> +	void __iomem *base, *base_gamma;
>  	struct drm_driver *driver = &fsl_dcu_drm_driver;
>  	struct clk *pix_clk_in;
>  	char pix_clk_name[32];
> @@ -370,6 +384,25 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
>  		return PTR_ERR(fsl_dev->regmap);
>  	}
>  
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gamma");
> +	if (!res) {
> +		dev_err(dev, "could not get gamma memory resource\n");
> +		return -ENODEV;
> +	}
> +
> +	base_gamma = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(base_gamma)) {
> +		ret = PTR_ERR(base_gamma);
> +		return ret;
> +	}
> +
> +	fsl_dev->regmap_gamma = devm_regmap_init_mmio(dev, base_gamma,
> +			&fsl_dcu_regmap_gamma_config);
> +	if (IS_ERR(fsl_dev->regmap_gamma)) {
> +		dev_err(dev, "regmap_gamma init failed\n");
> +		return PTR_ERR(fsl_dev->regmap_gamma);
> +	}
> +
>  	fsl_dev->clk = devm_clk_get(dev, "dcu");
>  	if (IS_ERR(fsl_dev->clk)) {
>  		dev_err(dev, "failed to get dcu clock\n");
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> index 3b371fe7..2610b6c 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> @@ -25,6 +25,8 @@
>  #define DCU_MODE_NORMAL			1
>  #define DCU_MODE_TEST			2
>  #define DCU_MODE_COLORBAR		3
> +#define DCU_MODE_EN_GAMMA_MASK		0x04
> +#define DCU_MODE_GAMMA_ENABLE		BIT(2)
>  
>  #define DCU_BGND			0x0014
>  #define DCU_BGND_R(x)			((x) << 16)
> @@ -165,6 +167,10 @@
>  #define VF610_LAYER_REG_NUM		9
>  #define LS1021A_LAYER_REG_NUM		10
>  
> +#define FSL_GAMMA_R			0x000
> +#define FSL_GAMMA_G			0x400
> +#define FSL_GAMMA_B			0x800
> +
>  struct clk;
>  struct device;
>  struct drm_device;
> @@ -182,6 +188,7 @@ struct fsl_dcu_drm_device {
>  	struct device *dev;
>  	struct device_node *np;
>  	struct regmap *regmap;
> +	struct regmap *regmap_gamma;
>  	int irq;
>  	struct clk *clk;
>  	struct clk *pix_clk;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
