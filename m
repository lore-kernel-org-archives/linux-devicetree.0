From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 6/6] iio: adc: stm32: add support for EXTI trigger
Date: Sun, 5 Mar 2017 12:21:50 +0000
Message-ID: <d2f25e67-a598-3d28-01d2-f6aa277e2f67@kernel.org>
References: <1488300679-3259-1-git-send-email-fabrice.gasnier@st.com>
 <1488300679-3259-7-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488300679-3259-7-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 28/02/17 16:51, Fabrice Gasnier wrote:
> EXTi (external interrupt) signal can be routed internally as trigger
> source for ADC conversions: STM32F4 ADC can use EXTI11.
> 
> Retrieve interrupt trigger from DT, so it can be muxed into ADC IP,
> via extsel.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Minor question inline.
J
> ---
>  drivers/iio/adc/stm32-adc.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 9b49a6ad..4d9040d 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -108,6 +108,9 @@ enum stm32_adc_extsel {
>  	STM32_EXT15,
>  };
>  
> +/* EXTI 11 trigger selection on STM32F4 */
> +#define STM32F4_EXTI11_EXTSEL		STM32_EXT15
> +
>  /**
>   * struct stm32_adc_trig_info - ADC trigger info
>   * @name:		name of the trigger, corresponding to its source
> @@ -146,6 +149,7 @@ struct stm32_adc_regs {
>   * @rx_buf:		dma rx buffer cpu address
>   * @rx_dma_buf:		dma rx buffer bus address
>   * @rx_buf_sz:		dma rx buffer size
> + * @exti_trig		EXTI trigger
>   */
>  struct stm32_adc {
>  	struct stm32_adc_common	*common;
> @@ -162,6 +166,7 @@ struct stm32_adc {
>  	u8			*rx_buf;
>  	dma_addr_t		rx_dma_buf;
>  	unsigned int		rx_buf_sz;
> +	struct iio_trigger	*exti_trig;
>  };
>  
>  /**
> @@ -395,10 +400,15 @@ static int stm32_adc_conf_scan_seq(struct iio_dev *indio_dev,
>   *
>   * Returns trigger extsel value, if trig matches, -EINVAL otherwise.
>   */
> -static int stm32_adc_get_trig_extsel(struct iio_trigger *trig)
> +static int stm32_adc_get_trig_extsel(struct iio_dev *indio_dev,
> +				     struct iio_trigger *trig)
>  {
> +	struct stm32_adc *adc = iio_priv(indio_dev);
>  	int i;
>  
> +	if (trig == adc->exti_trig)
> +		return STM32F4_EXTI11_EXTSEL;
> +
>  	/* lookup triggers registered by stm32 timer trigger driver */
>  	for (i = 0; stm32f4_adc_trigs[i].name; i++) {
>  		/**
> @@ -432,7 +442,7 @@ static int stm32_adc_set_trig(struct iio_dev *indio_dev,
>  	int ret;
>  
>  	if (trig) {
> -		ret = stm32_adc_get_trig_extsel(trig);
> +		ret = stm32_adc_get_trig_extsel(indio_dev, trig);
>  		if (ret < 0)
>  			return ret;
>  
> @@ -604,7 +614,7 @@ static irqreturn_t stm32_adc_isr(int irq, void *data)
>  static int stm32_adc_validate_trigger(struct iio_dev *indio_dev,
>  				      struct iio_trigger *trig)
>  {
> -	return stm32_adc_get_trig_extsel(trig) < 0 ? -EINVAL : 0;
> +	return stm32_adc_get_trig_extsel(indio_dev, trig) < 0 ? -EINVAL : 0;
>  }
>  
>  static int stm32_adc_set_watermark(struct iio_dev *indio_dev, unsigned int val)
> @@ -1030,6 +1040,17 @@ static int stm32_adc_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_clk_disable;
>  
> +	adc->exti_trig = devm_iio_trigger_get_by_name(&pdev->dev, "exti");
Can we tighten this in any way? If not I guess we'll have to rely on no
one messing up the devicetree to put the wrong trigger in there with this name.

> +	if (IS_ERR(adc->exti_trig)) {
> +		ret = PTR_ERR(adc->exti_trig);
> +		if (ret == -EPROBE_DEFER)
> +			goto err_dma_disable;
> +		dev_dbg(&pdev->dev, "No exti trigger found (%d)\n", ret);
> +		adc->exti_trig = NULL;
> +	} else {
> +		dev_info(&pdev->dev, "Can use %s\n", adc->exti_trig->name);
> +	}
> +
>  	ret = iio_triggered_buffer_setup(indio_dev,
>  					 &iio_pollfunc_store_time,
>  					 &stm32_adc_trigger_handler,
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
