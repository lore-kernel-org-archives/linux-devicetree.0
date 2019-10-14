From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v4 04/14] drm/mxsfb: Reset vital registers for a proper
 initialization
Date: Mon, 14 Oct 2019 14:59:05 +0200
Message-ID: <29759c86d92f5f59da16a2ae2438c649@agner.ch>
References: <1567078215-31601-1-git-send-email-robert.chiras@nxp.com>
 <1567078215-31601-5-git-send-email-robert.chiras@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567078215-31601-5-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Chiras <robert.chiras@nxp.com>
Cc: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2019-08-29 13:30, Robert Chiras wrote:
> Some of the registers, like LCDC_CTRL, CTRL2_OUTSTANDING_REQS and
> CTRL1_RECOVERY_ON_UNDERFLOW needs to be properly cleared/initialized
> for a better start and stop routine.


This patch uses CTRL2_OUTSTANDING_REQS which is only introduced in the
next patch. This breaks bisectability.

--
Stefan

> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> Tested-by: Guido Günther <agx@sigxcpu.org>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> index b69ace8..5e44f57 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> @@ -127,6 +127,10 @@ static void mxsfb_enable_controller(struct
> mxsfb_drm_private *mxsfb)
>  		clk_prepare_enable(mxsfb->clk_disp_axi);
>  	clk_prepare_enable(mxsfb->clk);
>  
> +	if (mxsfb->devdata->ipversion >= 4)
> +		writel(CTRL2_OUTSTANDING_REQS(REQ_16),
> +		       mxsfb->base + LCDC_V4_CTRL2 + REG_SET);
> +
>  	/* If it was disabled, re-enable the mode again */
>  	writel(CTRL_DOTCLK_MODE, mxsfb->base + LCDC_CTRL + REG_SET);
>  
> @@ -136,12 +140,19 @@ static void mxsfb_enable_controller(struct
> mxsfb_drm_private *mxsfb)
>  	writel(reg, mxsfb->base + LCDC_VDCTRL4);
>  
>  	writel(CTRL_RUN, mxsfb->base + LCDC_CTRL + REG_SET);
> +	writel(CTRL1_RECOVERY_ON_UNDERFLOW, mxsfb->base + LCDC_CTRL1 + REG_SET);
>  }
>  
>  static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
>  {
>  	u32 reg;
>  
> +	if (mxsfb->devdata->ipversion >= 4)
> +		writel(CTRL2_OUTSTANDING_REQS(0x7),
> +		       mxsfb->base + LCDC_V4_CTRL2 + REG_CLR);
> +
> +	writel(CTRL_RUN, mxsfb->base + LCDC_CTRL + REG_CLR);
> +
>  	/*
>  	 * Even if we disable the controller here, it will still continue
>  	 * until its FIFOs are running out of data
> @@ -295,6 +306,7 @@ void mxsfb_crtc_enable(struct mxsfb_drm_private *mxsfb)
>  	dma_addr_t paddr;
>  
>  	mxsfb_enable_axi_clk(mxsfb);
> +	writel(0, mxsfb->base + LCDC_CTRL);
>  	mxsfb_crtc_mode_set_nofb(mxsfb);
>  
>  	/* Write cur_buf as well to avoid an initial corrupt frame */
