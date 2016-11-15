From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/3] reset: allow using reset_control_reset with shared
 reset
Date: Tue, 15 Nov 2016 13:48:05 +0100
Message-ID: <1479214085.2456.26.camel@pengutronix.de>
References: <20161001152134.8168-1-martin.blumenstingl@googlemail.com>
         <20161112131305.26088-1-martin.blumenstingl@googlemail.com>
         <20161112131305.26088-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161112131305.26088-2-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Martin,

Am Samstag, den 12.11.2016, 14:13 +0100 schrieb Martin Blumenstingl:
> Some SoCs (for example Amlogic GXBB) implement a reset controller which
> only supports a reset pulse (triggered via reset_control_reset). At the
> same time multiple devices (in case of the Amlogic GXBB SoC both USB
> PHYs) are sharing the same reset line.
> 
> This patch allows using reset_control_reset also for shared resets.
> There are limitations though:
> reset_control_reset can only be used if reset_control_assert was not
> used yet.
> reset_control_assert can only be used if reset_control_reset was not
> used yet.
> For shared resets the reset is only triggered once for the lifetime of
> the reset_control instance (the reset can be triggered again if all
> consumers of that specific reset_control are gone, as the reset
> framework will free the reset_control instance in that case).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

Looks good to me, I've applied it to the reset/next branch.

thanks
Philipp

> ---
>  drivers/reset/core.c | 43 +++++++++++++++++++++++++++++++++++++------
>  1 file changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index b8ae1db..10368ed 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -32,6 +32,9 @@ static LIST_HEAD(reset_controller_list);
>   * @refcnt: Number of gets of this reset_control
>   * @shared: Is this a shared (1), or an exclusive (0) reset_control?
>   * @deassert_cnt: Number of times this reset line has been deasserted
> + * @triggered_count: Number of times this reset line has been reset. Currently
> + *                   only used for shared resets, which means that the value
> + *                   will be either 0 or 1.
>   */
>  struct reset_control {
>  	struct reset_controller_dev *rcdev;
> @@ -40,6 +43,7 @@ struct reset_control {
>  	unsigned int refcnt;
>  	int shared;
>  	atomic_t deassert_count;
> +	atomic_t triggered_count;
>  };
>  
>  /**
> @@ -134,18 +138,35 @@ EXPORT_SYMBOL_GPL(devm_reset_controller_register);
>   * reset_control_reset - reset the controlled device
>   * @rstc: reset controller
>   *
> - * Calling this on a shared reset controller is an error.
> + * On a shared reset line the actual reset pulse is only triggered once for the
> + * lifetime of the reset_control instance: for all but the first caller this is
> + * a no-op.
> + * Consumers must not use reset_control_(de)assert on shared reset lines when
> + * reset_control_reset has been used.
>   */
>  int reset_control_reset(struct reset_control *rstc)
>  {
> -	if (WARN_ON(IS_ERR_OR_NULL(rstc)) ||
> -	    WARN_ON(rstc->shared))
> +	int ret;
> +
> +	if (WARN_ON(IS_ERR_OR_NULL(rstc)))
>  		return -EINVAL;
>  
> -	if (rstc->rcdev->ops->reset)
> -		return rstc->rcdev->ops->reset(rstc->rcdev, rstc->id);
> +	if (!rstc->rcdev->ops->reset)
> +		return -ENOTSUPP;
>  
> -	return -ENOTSUPP;
> +	if (rstc->shared) {
> +		if (WARN_ON(atomic_read(&rstc->deassert_count) != 0))
> +			return -EINVAL;
> +
> +		if (atomic_inc_return(&rstc->triggered_count) != 1)
> +			return 0;
> +	}
> +
> +	ret = rstc->rcdev->ops->reset(rstc->rcdev, rstc->id);
> +	if (rstc->shared && !ret)
> +		atomic_dec(&rstc->triggered_count);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(reset_control_reset);
>  
> @@ -159,6 +180,8 @@ EXPORT_SYMBOL_GPL(reset_control_reset);
>   *
>   * For shared reset controls a driver cannot expect the hw's registers and
>   * internal state to be reset, but must be prepared for this to happen.
> + * Consumers must not use reset_control_reset on shared reset lines when
> + * reset_control_(de)assert has been used.
>   */
>  int reset_control_assert(struct reset_control *rstc)
>  {
> @@ -169,6 +192,9 @@ int reset_control_assert(struct reset_control *rstc)
>  		return -ENOTSUPP;
>  
>  	if (rstc->shared) {
> +		if (WARN_ON(atomic_read(&rstc->triggered_count) != 0))
> +			return -EINVAL;
> +
>  		if (WARN_ON(atomic_read(&rstc->deassert_count) == 0))
>  			return -EINVAL;
>  
> @@ -185,6 +211,8 @@ EXPORT_SYMBOL_GPL(reset_control_assert);
>   * @rstc: reset controller
>   *
>   * After calling this function, the reset is guaranteed to be deasserted.
> + * Consumers must not use reset_control_reset on shared reset lines when
> + * reset_control_(de)assert has been used.
>   */
>  int reset_control_deassert(struct reset_control *rstc)
>  {
> @@ -195,6 +223,9 @@ int reset_control_deassert(struct reset_control *rstc)
>  		return -ENOTSUPP;
>  
>  	if (rstc->shared) {
> +		if (WARN_ON(atomic_read(&rstc->triggered_count) != 0))
> +			return -EINVAL;
> +
>  		if (atomic_inc_return(&rstc->deassert_count) != 1)
>  			return 0;
>  	}


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
