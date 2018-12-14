From: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [Freedreno] [DPU PATCH] drm/msm/dpu: Clean up dpu hw interrupts
Date: Fri, 14 Dec 2018 08:32:17 -0700
Message-ID: <20181214153217.GC29770@jcrouse-lnx.qualcomm.com>
References: <1544777352-11455-1-git-send-email-jshekhar@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544777352-11455-1-git-send-email-jshekhar@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jayant Shekhar <jshekhar@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, robdclark@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org, hoegsberg@chromium.org, jsanka@codeaurora.org, chandanu@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 14, 2018 at 02:19:12PM +0530, Jayant Shekhar wrote:
> Remove unused functions and macros from dpu hw interrupts
> file.
> 
> Signed-off-by: Jayant Shekhar <jshekhar@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 30 --------------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 34 -----------------------
>  2 files changed, 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index c0b7f00..0f70cee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -170,10 +170,6 @@
>  /**
>   * AD4 interrupt status bit definitions
>   */
> -#define DPU_INTR_BRIGHTPR_UPDATED BIT(4)
> -#define DPU_INTR_DARKENH_UPDATED BIT(3)
> -#define DPU_INTR_STREN_OUTROI_UPDATED BIT(2)
> -#define DPU_INTR_STREN_INROI_UPDATED BIT(1)
>  #define DPU_INTR_BACKLIGHT_UPDATED BIT(0)
>  /**
>   * struct dpu_intr_reg - array of DPU register sets
> @@ -782,18 +778,6 @@ static int dpu_hw_intr_irqidx_lookup(enum dpu_intr_type intr_type,
>  	return -EINVAL;
>  }
>  
> -static void dpu_hw_intr_set_mask(struct dpu_hw_intr *intr, uint32_t reg_off,
> -		uint32_t mask)
> -{
> -	if (!intr)
> -		return;
> -
> -	DPU_REG_WRITE(&intr->hw, reg_off, mask);
> -
> -	/* ensure register writes go through */
> -	wmb();
> -}
> -
>  static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
>  		void (*cbfunc)(void *, int),
>  		void *arg)
> @@ -1004,18 +988,6 @@ static int dpu_hw_intr_disable_irqs(struct dpu_hw_intr *intr)
>  	return 0;
>  }
>  
> -static int dpu_hw_intr_get_valid_interrupts(struct dpu_hw_intr *intr,
> -		uint32_t *mask)
> -{
> -	if (!intr || !mask)
> -		return -EINVAL;
> -
> -	*mask = IRQ_SOURCE_MDP | IRQ_SOURCE_DSI0 | IRQ_SOURCE_DSI1
> -		| IRQ_SOURCE_HDMI | IRQ_SOURCE_EDP;
> -
> -	return 0;
> -}
> -
>  static void dpu_hw_intr_get_interrupt_statuses(struct dpu_hw_intr *intr)
>  {
>  	int i;
> @@ -1113,14 +1085,12 @@ static u32 dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
>  
>  static void __setup_intr_ops(struct dpu_hw_intr_ops *ops)
>  {
> -	ops->set_mask = dpu_hw_intr_set_mask;
>  	ops->irq_idx_lookup = dpu_hw_intr_irqidx_lookup;
>  	ops->enable_irq = dpu_hw_intr_enable_irq;
>  	ops->disable_irq = dpu_hw_intr_disable_irq;
>  	ops->dispatch_irqs = dpu_hw_intr_dispatch_irq;
>  	ops->clear_all_irqs = dpu_hw_intr_clear_irqs;
>  	ops->disable_all_irqs = dpu_hw_intr_disable_irqs;
> -	ops->get_valid_interrupts = dpu_hw_intr_get_valid_interrupts;
>  	ops->get_interrupt_statuses = dpu_hw_intr_get_interrupt_statuses;
>  	ops->clear_interrupt_status = dpu_hw_intr_clear_interrupt_status;

I think you can zap clear_interrupt_status too.  Other than that, this looks
real good. Lots of nice negative lines.


>  	ops->clear_intr_status_nolock = dpu_hw_intr_clear_intr_status_nolock;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 61e4cba..985f873 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -20,13 +20,6 @@
>  #include "dpu_hw_util.h"
>  #include "dpu_hw_mdss.h"
>  
> -#define IRQ_SOURCE_MDP		BIT(0)
> -#define IRQ_SOURCE_DSI0		BIT(4)
> -#define IRQ_SOURCE_DSI1		BIT(5)
> -#define IRQ_SOURCE_HDMI		BIT(8)
> -#define IRQ_SOURCE_EDP		BIT(12)
> -#define IRQ_SOURCE_MHL		BIT(16)
> -
>  /**
>   * dpu_intr_type - HW Interrupt Type
>   * @DPU_IRQ_TYPE_WB_ROT_COMP:		WB rotator done
> @@ -96,18 +89,6 @@ enum dpu_intr_type {
>   */
>  struct dpu_hw_intr_ops {
>  	/**
> -	 * set_mask - Programs the given interrupt register with the
> -	 *            given interrupt mask. Register value will get overwritten.
> -	 * @intr:	HW interrupt handle
> -	 * @reg_off:	MDSS HW register offset
> -	 * @irqmask:	IRQ mask value
> -	 */
> -	void (*set_mask)(
> -			struct dpu_hw_intr *intr,
> -			uint32_t reg,
> -			uint32_t irqmask);
> -
> -	/**
>  	 * irq_idx_lookup - Lookup IRQ index on the HW interrupt type
>  	 *                 Used for all irq related ops
>  	 * @intr_type:		Interrupt type defined in dpu_intr_type
> @@ -206,21 +187,6 @@ struct dpu_hw_intr_ops {
>  			struct dpu_hw_intr *intr,
>  			int irq_idx,
>  			bool clear);
> -
> -	/**
> -	 * get_valid_interrupts - Gets a mask of all valid interrupt sources
> -	 *                        within DPU. These are actually status bits
> -	 *                        within interrupt registers that specify the
> -	 *                        source of the interrupt in IRQs. For example,
> -	 *                        valid interrupt sources can be MDP, DSI,
> -	 *                        HDMI etc.
> -	 * @intr:	HW interrupt handle
> -	 * @mask:	Returning the interrupt source MASK
> -	 * @return:	0 for success, otherwise failure
> -	 */
> -	int (*get_valid_interrupts)(
> -			struct dpu_hw_intr *intr,
> -			uint32_t *mask);
>  };
>  
>  /**

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
