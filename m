From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/3] reset: allow using reset_control_reset with shared
 reset
Date: Tue, 04 Oct 2016 10:36:31 +0200
Message-ID: <1475570191.3034.18.camel@pengutronix.de>
References: <20161001152134.8168-1-martin.blumenstingl@googlemail.com>
         <20161001152134.8168-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161001152134.8168-2-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Martin,

thank you for the patch. I have a few comments below.

Am Samstag, den 01.10.2016, 17:21 +0200 schrieb Martin Blumenstingl:
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
> ---
>  drivers/reset/core.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 395dc9c..1565348 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -32,6 +32,7 @@ static LIST_HEAD(reset_controller_list);
>   * @refcnt: Number of gets of this reset_control
>   * @shared: Is this a shared (1), or an exclusive (0) reset_control?
>   * @deassert_cnt: Number of times this reset line has been deasserted
> + * triggered_count: Number of times this reset line has been reset

Missing @

To avoid confusion, should we mention here that triggered_count will
always be <= 1?

>   */
>  struct reset_control {
>  	struct reset_controller_dev *rcdev;
> @@ -40,6 +41,7 @@ struct reset_control {
>  	unsigned int refcnt;
>  	int shared;
>  	atomic_t deassert_count;
> +	atomic_t triggered_count;
>  };
>  
>  /**
> @@ -134,17 +136,28 @@ EXPORT_SYMBOL_GPL(devm_reset_controller_register);
>   * reset_control_reset - reset the controlled device
>   * @rstc: reset controller
>   *
> - * Calling this on a shared reset controller is an error.
> + * On a shared reset line the actual reset pulse is only triggered once.

... for the lifetime of the reset_control instance, for all but the
first caller this is a no-op.

Add a note that it is invalid for different consumers to mix this and
reset_control_(de)assert on the same shared reset line, also to the
reset_control_(de)assert kerneldoc comments.

>   */
>  int reset_control_reset(struct reset_control *rstc)
>  {
> -	if (WARN_ON(rstc->shared))
> -		return -EINVAL;
> +	int ret;
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

I'm not worried about races between reset and (de)assert for
deassert_count because that's invalid use, but

> +		if (atomic_read(&rstc->triggered_count) != 0)
> +			return 0;

two simultaneously called _resets probably shouldn't race for
triggered_count, so I think this should be

		if (atomic_inc_return(&rstc->triggered_count) != 0)
			return 0;

instead.

> +	}
> +
> +	ret = rstc->rcdev->ops->reset(rstc->rcdev, rstc->id);
> +	if (rstc->shared && !ret)
> +		atomic_inc(&rstc->triggered_count);

With this dropped, that would mean instead of only incrementing
triggered_count if the reset callback returned without error, we'd also
increment in the error case.
I'm not sure if this could be a problem as I wouldn't expect the reset
callback to fail once and then work later, but maybe this could be
handled by instead replacing it with

	if (rstc->shared && ret)
		atomic_dec(&rstc->triggered_count)

which would again introduce a race, but only in the error case.

> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(reset_control_reset);
>  
> @@ -165,6 +178,9 @@ int reset_control_assert(struct reset_control *rstc)
>  		return -ENOTSUPP;
>  
>  	if (rstc->shared) {
> +		if (WARN_ON(atomic_read(&rstc->triggered_count) != 0))
> +			return -EINVAL;
> +
>  		if (WARN_ON(atomic_read(&rstc->deassert_count) == 0))
>  			return -EINVAL;
>  
> @@ -188,6 +204,9 @@ int reset_control_deassert(struct reset_control *rstc)
>  		return -ENOTSUPP;
>  
>  	if (rstc->shared) {
> +		if (WARN_ON(atomic_read(&rstc->triggered_count) != 0))
> +			return -EINVAL;
> +
>  		if (atomic_inc_return(&rstc->deassert_count) != 1)
>  			return 0;
>  	}

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
