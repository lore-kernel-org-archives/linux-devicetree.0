From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/7] iio: adc: stm32: add trigger polarity extended
 attribute
Date: Sun, 22 Jan 2017 12:58:01 +0000
Message-ID: <17e5b8ba-0ef3-34eb-aa30-a899f87616f7@kernel.org>
References: <1484832854-6314-1-git-send-email-fabrice.gasnier@st.com>
 <1484832854-6314-4-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484832854-6314-4-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 19/01/17 13:34, Fabrice Gasnier wrote:
> Define extended attribute so that user may choose rising, falling or both
> edges for external trigger sources.
> Default to rising edge in case it isn't set.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Creates a custom attibute.  Documentation please!
/Documentation/ABI/testing/sysfs-bus-iio-stm32 or similar.

The approach seems reasonable, but easier to discuss when it's
formally described.

I'd also not care about characters saved and go with 
trigger_polarity rather than the short form (unless this you have
a good reason for it!)

Jonathan
> ---
>  drivers/iio/adc/stm32-adc.c | 51 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 30708bc..9753c39 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -164,6 +164,7 @@ struct stm32_adc_trig_info {
>   * @lock:		spinlock
>   * @bufi:		data buffer index
>   * @num_conv:		expected number of scan conversions
> + * @exten:		external trigger config (enable/polarity)
>   */
>  struct stm32_adc {
>  	struct stm32_adc_common	*common;
> @@ -175,6 +176,7 @@ struct stm32_adc {
>  	spinlock_t		lock;		/* interrupt lock */
>  	int			bufi;
>  	int			num_conv;
> +	enum stm32_adc_exten	exten;
>  };
>  
>  /**
> @@ -449,7 +451,9 @@ static int stm32_adc_set_trig(struct iio_dev *indio_dev,
>  
>  		/* set trigger source, default to rising edge */
>  		extsel = ret;
> -		exten = STM32_EXTEN_HWTRIG_RISING_EDGE;
> +		if (adc->exten == STM32_EXTEN_SWTRIG)
> +			adc->exten = STM32_EXTEN_HWTRIG_RISING_EDGE;
> +		exten = adc->exten;
>  	}
>  
>  	spin_lock_irqsave(&adc->lock, flags);
> @@ -463,6 +467,39 @@ static int stm32_adc_set_trig(struct iio_dev *indio_dev,
>  	return 0;
>  }
>  
> +static int stm32_adc_set_trig_pol(struct iio_dev *indio_dev,
> +				  const struct iio_chan_spec *chan,
> +				  unsigned int type)
> +{
> +	struct stm32_adc *adc = iio_priv(indio_dev);
> +
> +	adc->exten = type;
> +
> +	return 0;
> +}
> +
> +static int stm32_adc_get_trig_pol(struct iio_dev *indio_dev,
> +				  const struct iio_chan_spec *chan)
> +{
> +	struct stm32_adc *adc = iio_priv(indio_dev);
> +
> +	return adc->exten;
> +}
> +
> +static const char * const stm32_trig_pol_items[] = {
> +	[STM32_EXTEN_SWTRIG] = "swtrig",
> +	[STM32_EXTEN_HWTRIG_RISING_EDGE] = "rising-edge",
> +	[STM32_EXTEN_HWTRIG_FALLING_EDGE] = "falling-edge",
> +	[STM32_EXTEN_HWTRIG_BOTH_EDGES] = "both-edges",
> +};
> +
> +const struct iio_enum stm32_adc_trig_pol = {
> +	.items = stm32_trig_pol_items,
> +	.num_items = ARRAY_SIZE(stm32_trig_pol_items),
> +	.get = stm32_adc_get_trig_pol,
> +	.set = stm32_adc_set_trig_pol,
> +};
> +
>  /**
>   * stm32_adc_single_conv() - Performs a single conversion
>   * @indio_dev: IIO device
> @@ -745,6 +782,17 @@ static irqreturn_t stm32_adc_trigger_handler(int irq, void *p)
>  	return IRQ_HANDLED;
>  }
>  
> +static const struct iio_chan_spec_ext_info stm32_adc_ext_info[] = {
> +	IIO_ENUM("trigger_pol", IIO_SHARED_BY_ALL, &stm32_adc_trig_pol),
> +	{
> +		.name = "trigger_pol_available",
> +		.shared = IIO_SHARED_BY_ALL,
> +		.read = iio_enum_available_read,
> +		.private = (uintptr_t)&stm32_adc_trig_pol,
> +	},
> +	{},
> +};
> +
>  static void stm32_adc_chan_init_one(struct iio_dev *indio_dev,
>  				    struct iio_chan_spec *chan,
>  				    const struct stm32_adc_chan_spec *channel,
> @@ -760,6 +808,7 @@ static void stm32_adc_chan_init_one(struct iio_dev *indio_dev,
>  	chan->scan_type.sign = 'u';
>  	chan->scan_type.realbits = 12;
>  	chan->scan_type.storagebits = 16;
> +	chan->ext_info = stm32_adc_ext_info;
>  }
>  
>  static int stm32_adc_chan_of_init(struct iio_dev *indio_dev)
> 
