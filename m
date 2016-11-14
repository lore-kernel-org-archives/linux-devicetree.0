From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2 3/6] iio: adc: Add support for STM32 ADC
Date: Mon, 14 Nov 2016 13:11:54 +0100
Message-ID: <535ffb14-a92f-1556-a4cb-f2be0508289a@metafoo.de>
References: <1478794738-28933-1-git-send-email-fabrice.gasnier@st.com>
 <1478794738-28933-4-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478794738-28933-4-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/10/2016 05:18 PM, Fabrice Gasnier wrote:
[...]
> + static int stm32_adc_single_conv(struct iio_dev *indio_dev,
> +				 const struct iio_chan_spec *chan,
> +				 int *res)
> +{
> +	struct stm32_adc *adc = iio_priv(indio_dev);
> +	long timeout;
> +	u32 val;
> +	u16 result;
> +	int ret;
> +
> +	reinit_completion(&adc->completion);
> +
> +	adc->buffer = &result;
> +
> +	/* Program chan number in regular sequence */
> +	val = stm32_adc_readl(adc, STM32F4_ADCX_SQR3);
> +	val &= ~STM32F4_SQ1_MASK;
> +	val |= chan->channel << STM32F4_SQ1_SHIFT;
> +	stm32_adc_writel(adc, STM32F4_ADCX_SQR3, val);
> +
> +	/* Set regular sequence len (0 for 1 conversion) */
> +	stm32_adc_clr_bits(adc, STM32F4_ADCX_SQR1, STM32F4_L_MASK);
> +
> +	/* Trigger detection disabled (conversion can be launched in SW) */
> +	stm32_adc_clr_bits(adc, STM32F4_ADCX_CR2, STM32F4_EXTEN_MASK);
> +
> +	stm32_adc_conv_irq_enable(adc);
> +
> +	stm32_adc_start_conv(adc);
> +
> +	timeout = wait_for_completion_interruptible_timeout(
> +					&adc->completion, STM32_ADC_TIMEOUT);
> +	if (timeout == 0) {
> +		dev_warn(&indio_dev->dev, "Conversion timed out!\n");

This should be dev_dbg() at most. This out of band reporting is not
particular useful for applications as it is impossible to match the error to
the action that triggered it. And you also report the error through the
error code, so the applications knows what is going on.

> +		ret = -ETIMEDOUT;
> +	} else if (timeout < 0) {
> +		dev_warn(&indio_dev->dev, "Interrupted conversion!\n");
> +		ret = -EINTR;

This should just propagate the error returned by wait_for_completion...().
This will make sure that the right behavior occurs based on the SA_RESTART
policy.

> +	} else {
> +		*res = result;
> +		ret = IIO_VAL_INT;
> +	}
> +
> +	stm32_adc_stop_conv(adc);
> +
> +	stm32_adc_conv_irq_disable(adc);
> +
> +	return ret;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
