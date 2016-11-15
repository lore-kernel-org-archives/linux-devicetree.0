From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: Re: [PATCH v2 3/6] iio: adc: Add support for STM32 ADC
Date: Tue, 15 Nov 2016 14:26:03 +0100
Message-ID: <954472c6-2ec8-48af-de7f-b5171eee692f@st.com>
References: <1478794738-28933-1-git-send-email-fabrice.gasnier@st.com>
 <1478794738-28933-4-git-send-email-fabrice.gasnier@st.com>
 <535ffb14-a92f-1556-a4cb-f2be0508289a@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <535ffb14-a92f-1556-a4cb-f2be0508289a@metafoo.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, lee.jones@linaro.org, linux@armlinux.org.uk, robh+dt@kernel.org, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, knaack.h@gmx.de, pmeerw@pmeerw.net
List-Id: devicetree@vger.kernel.org

On 11/14/2016 01:11 PM, Lars-Peter Clausen wrote:
> On 11/10/2016 05:18 PM, Fabrice Gasnier wrote:
> [...]
>> + static int stm32_adc_single_conv(struct iio_dev *indio_dev,
>> +				 const struct iio_chan_spec *chan,
>> +				 int *res)
>> +{
>> +	struct stm32_adc *adc = iio_priv(indio_dev);
>> +	long timeout;
>> +	u32 val;
>> +	u16 result;
>> +	int ret;
>> +
>> +	reinit_completion(&adc->completion);
>> +
>> +	adc->buffer = &result;
>> +
>> +	/* Program chan number in regular sequence */
>> +	val = stm32_adc_readl(adc, STM32F4_ADCX_SQR3);
>> +	val &= ~STM32F4_SQ1_MASK;
>> +	val |= chan->channel << STM32F4_SQ1_SHIFT;
>> +	stm32_adc_writel(adc, STM32F4_ADCX_SQR3, val);
>> +
>> +	/* Set regular sequence len (0 for 1 conversion) */
>> +	stm32_adc_clr_bits(adc, STM32F4_ADCX_SQR1, STM32F4_L_MASK);
>> +
>> +	/* Trigger detection disabled (conversion can be launched in SW) */
>> +	stm32_adc_clr_bits(adc, STM32F4_ADCX_CR2, STM32F4_EXTEN_MASK);
>> +
>> +	stm32_adc_conv_irq_enable(adc);
>> +
>> +	stm32_adc_start_conv(adc);
>> +
>> +	timeout = wait_for_completion_interruptible_timeout(
>> +					&adc->completion, STM32_ADC_TIMEOUT);
>> +	if (timeout == 0) {
>> +		dev_warn(&indio_dev->dev, "Conversion timed out!\n");
> This should be dev_dbg() at most. This out of band reporting is not
> particular useful for applications as it is impossible to match the error to
> the action that triggered it. And you also report the error through the
> error code, so the applications knows what is going on.
>
>> +		ret = -ETIMEDOUT;
>> +	} else if (timeout < 0) {
>> +		dev_warn(&indio_dev->dev, "Interrupted conversion!\n");
>> +		ret = -EINTR;
> This should just propagate the error returned by wait_for_completion...().
> This will make sure that the right behavior occurs based on the SA_RESTART
> policy.
Hi Lars,

Thanks for reviewing.
I'll update this in next revision.

Regards,
Fabrice

>
>> +	} else {
>> +		*res = result;
>> +		ret = IIO_VAL_INT;
>> +	}
>> +
>> +	stm32_adc_stop_conv(adc);
>> +
>> +	stm32_adc_conv_irq_disable(adc);
>> +
>> +	return ret;
