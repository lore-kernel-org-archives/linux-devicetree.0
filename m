From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/3] drm: rcar-du: add R8A77970 support
Date: Fri, 12 Jan 2018 03:13:57 +0200
Message-ID: <8239904.rdcckmYW4i@avalon>
References: <20180111170103.676775968@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180111170103.676775968@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov vi <sergei.shtylyov@cogentembedded.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sergei,

Thank you for the patch.

On Thursday, 11 January 2018 18:54:35 EET Sergei Shtylyov wrote:
> Add support for the R-Car  V3M  (R8A77970) SoC to the DU driver (this SoC
> has only  1 display port). Note that there are some differences  with the
> other R-Car gen3 SoCs in the LVDS encoder part, e.g. LVDPLLCR has the same
> layout  as  on the R-Car gen2 SoCs...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Could you please rebase this series on top of the LVDS rework posted as 
"[PATCH 00/10] R-Car DU: Convert LVDS code to bridge driver" (https://
www.spinics.net/lists/dri-devel/msg161931.html) ? It should make it easier to 
implement support for V3M. Please then split the DU and LVDS drivers changes 
in two patches.

> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt |    1

Please split the DT bindings changes to a separate patch.

>  drivers/gpu/drm/rcar-du/rcar_du_drv.c                    |   23 +++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h                    |    1
>  drivers/gpu/drm/rcar-du/rcar_du_group.c                  |   10 +++---
>  drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c                |   20 +++++++----
>  5 files changed, 45 insertions(+), 10 deletions(-)
> 
> Index: linux/Documentation/devicetree/bindings/display/renesas,du.txt
> ===================================================================
> --- linux.orig/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ linux/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -13,6 +13,7 @@ Required Properties:
>      - "renesas,du-r8a7794" for R8A7794 (R-Car E2) compatible DU
>      - "renesas,du-r8a7795" for R8A7795 (R-Car H3) compatible DU
>      - "renesas,du-r8a7796" for R8A7796 (R-Car M3-W) compatible DU
> +    - "renesas,du-r8a77970" for R8A77970 (R-Car V3M) compatible DU
> 
>    - reg: A list of base address and length of each memory resource, one for
> each entry in the reg-names property.

You also need to update the ports table further down in this file.

> Index: linux/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> ===================================================================
> --- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ linux/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -258,6 +258,28 @@ static const struct rcar_du_device_info
>  	.dpll_ch =  BIT(1),
>  };
> 
> +static const struct rcar_du_device_info rcar_du_r8a77970_info = {
> +	.gen = 3,
> +	.model = R8A77970,
> +	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> +		  | RCAR_DU_FEATURE_EXT_CTRL_REGS
> +		  | RCAR_DU_FEATURE_VSP1_SOURCE,
> +	.num_crtcs = 1,
> +	.routes = {
> +		/* R8A77970 has one RGB output and one LVDS output. */
> +		[RCAR_DU_OUTPUT_DPAD0] = {
> +			.possible_crtcs = BIT(0),
> +			.port = 1,
> +		},
> +		[RCAR_DU_OUTPUT_LVDS0] = {
> +			.possible_crtcs = BIT(0),
> +			.port = 0,
> +		},

All the other SoCs have DPAD0 as port 0. Unless there's a specific need for a 
different implementation with V3M I'd keep the same order.

> +	},
> +	.num_lvds = 1,
> +	.dpll_ch  = BIT(1),

This doesn't seem to be correct, there's no DPLL in V3M.

> +};
> +
>  static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
>  	{ .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },
> @@ -269,6 +291,7 @@ static const struct of_device_id rcar_du
>  	{ .compatible = "renesas,du-r8a7794", .data = &rcar_du_r8a7794_info },
>  	{ .compatible = "renesas,du-r8a7795", .data = &rcar_du_r8a7795_info },
>  	{ .compatible = "renesas,du-r8a7796", .data = &rcar_du_r8a7796_info },
> +	{ .compatible = "renesas,du-r8a77970", .data = &rcar_du_r8a77970_info },
>  	{ }
>  };
> Index: linux/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> ===================================================================
> --- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ linux/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -59,6 +59,7 @@ enum rcar_du_model {
>  	R8A7794,
>  	R8A7795,
>  	R8A7796,
> +	R8A77970,
>  };
> 
>  /*
> Index: linux/drivers/gpu/drm/rcar-du/rcar_du_group.c
> ===================================================================
> --- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ linux/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -133,10 +133,12 @@ static void rcar_du_group_setup(struct r
>  	rcar_du_group_write(rgrp, DORCR, DORCR_PG1D_DS1 | DORCR_DPRS);
> 
>  	/* Apply planes to CRTCs association. */
> -	mutex_lock(&rgrp->lock);
> -	rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> -			    rgrp->dptsr_planes);
> -	mutex_unlock(&rgrp->lock);
> +	if (rcdu->info->num_crtcs > 1) {
> +		mutex_lock(&rgrp->lock);
> +		rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> +				    rgrp->dptsr_planes);
> +		mutex_unlock(&rgrp->lock);
> +	}

Shouldn't you skip writing to the DPTSR register if there's a single DPTSR in 
the group ? That would then apply to M3-W as well, which doesn't have the 
DPTSR2 register. I'd split this change to a separate patch.

>  }
> 
>  /*
> Index: linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
> ===================================================================
> --- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
> +++ linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
> @@ -71,8 +71,10 @@ static int rcar_du_lvdsenc_start(struct
>  				 struct rcar_du_crtc *rcrtc)
>  {
>  	u32 lvdhcr, lvdpllcr, lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
> +	const struct rcar_du_device_info *info = lvds->dev->info;
>  	const struct drm_display_mode *mode = &rcrtc->crtc.mode;
> -	unsigned int gen = lvds->dev->info->gen;
> +	unsigned int gen = info->gen;
> +	enum rcar_du_model model = info->model;
>  	unsigned int freq = mode->clock;
>  	int ret;
> 
> @@ -104,7 +106,7 @@ static int rcar_du_lvdsenc_start(struct
>  	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
> 
>  	/* PLL clock configuration */
> -	if (gen < 3)
> +	if (gen < 3 || model == R8A77970)
>  		lvdpllcr = rcar_lvds_gen2_lvdpllcr(freq);
>  	else
>  		lvdpllcr = rcar_lvds_gen3_lvdpllcr(freq);
> @@ -136,6 +138,12 @@ static int rcar_du_lvdsenc_start(struct
>  		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>  	}
> 
> +	/* Turn on the LVDS PHY on R-Car V3M. */
> +	if (model == R8A77970) {
> +		lvdcr0 |= LVDCR0_LVEN;
> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +	}
> +
>  	/* Wait for the startup delay. */
>  	usleep_range(100, 150);
> 
> @@ -177,14 +185,14 @@ int rcar_du_lvdsenc_enable(struct rcar_d
>  void rcar_du_lvdsenc_atomic_check(struct rcar_du_lvdsenc *lvds,
>  				  struct drm_display_mode *mode)
>  {
> -	struct rcar_du_device *rcdu = lvds->dev;
> +	const struct rcar_du_device_info *info = lvds->dev->info;
> 
>  	/*
>  	 * The internal LVDS encoder has a restricted clock frequency operating
> -	 * range (30MHz to 150MHz on Gen2, 25.175MHz to 148.5MHz on Gen3). Clamp
> -	 * the clock accordingly.
> +	 * range (30MHz to 150MHz on Gen2 and R-Car V3M, 25.175MHz to 148.5MHz
> +	 * on Gen3). Clamp the clock accordingly.
>  	 */
> -	if (rcdu->info->gen < 3)
> +	if (info->gen < 3 || info->model == R8A77970)
>  		mode->clock = clamp(mode->clock, 30000, 150000);

According to the datasheet the frequency range for V3M is the same as for the 
H3 and M3 SoCs. The range seems to have changed starting in datasheet version 
0.52. I would fix the range in a separate patch first.

If you want I can send patches to fix this issue and the previous one, or you 
can write them and include them in v2. Let me know what you'd prefer.

>  	else
>  		mode->clock = clamp(mode->clock, 25175, 148500);

-- 
Regards,

Laurent Pinchart
