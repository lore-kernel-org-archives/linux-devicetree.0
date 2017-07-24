From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: Re: [PATCH 1/3] iio: adc: stm32: fix common clock rate
Date: Mon, 24 Jul 2017 09:43:18 +0200
Message-ID: <0385445a-8be9-6e67-b19d-b72466c23e34@st.com>
References: <1500381332-17086-1-git-send-email-fabrice.gasnier@st.com>
 <1500381332-17086-2-git-send-email-fabrice.gasnier@st.com>
 <20170723115148.07db4374@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170723115148.07db4374@kernel.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benjamin.gaignard@linaro.org, lars@metafoo.de, alexandre.torgue@st.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, linux-arm-kernel@lists.infradead.org, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

On 07/23/2017 12:51 PM, Jonathan Cameron wrote:
> On Tue, 18 Jul 2017 14:35:30 +0200
> Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
> 
>> Fixes commit 95e339b6e85d ("iio: adc: stm32: add support for STM32H7")
>>
>> Fix common clock rate used then by stm32-adc sub-devices: take common
>> prescaler into account.
>> Fix ADC max clock rate on STM32H7 (fADC from datasheet)
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> Patch itself is fine, but the description could do with
> information on what the result of this being wrong is.

Hi Jonathan,

I agree with you and will improve description in v2. I'm thinking of:

Fixes: 95e339b6e85d ("iio: adc: stm32: add support for STM32H7")

ADC clock input is provided to internal prescaler (that decreases its
frequency). It's then used as reference clock for conversions.

- Fix common clock rate used then by stm32-adc sub-devices. Take common
prescaler into account. Currently, rate is used to set "boost" mode. It
may unnecessarily be set. This impacts power consumption.
- Fix ADC max clock rate on STM32H7 (fADC from datasheet). Currently,
prescaler may be set too low. This can result in ADC reference clock
used for conversion to exceed max allowed clock frequency.

> 
> I have no idea if this is a patch I should be sending upstream
> asap or should hold for the next merge window.

Probably yes... I hope the description is better above? Just to mention
this impacts stm32h7 adc, device tree node to use it is not yet integrated.

Thanks for your review,
Best Regards,
Fabrice
> 
> Thanks,
> 
> Jonathan
>> ---
>>  drivers/iio/adc/stm32-adc-core.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
>> index e09233b..6096763 100644
>> --- a/drivers/iio/adc/stm32-adc-core.c
>> +++ b/drivers/iio/adc/stm32-adc-core.c
>> @@ -64,7 +64,7 @@
>>  #define STM32H7_CKMODE_MASK		GENMASK(17, 16)
>>  
>>  /* STM32 H7 maximum analog clock rate (from datasheet) */
>> -#define STM32H7_ADC_MAX_CLK_RATE	72000000
>> +#define STM32H7_ADC_MAX_CLK_RATE	36000000
>>  
>>  /**
>>   * stm32_adc_common_regs - stm32 common registers, compatible dependent data
>> @@ -148,14 +148,14 @@ static int stm32f4_adc_clk_sel(struct platform_device *pdev,
>>  		return -EINVAL;
>>  	}
>>  
>> -	priv->common.rate = rate;
>> +	priv->common.rate = rate / stm32f4_pclk_div[i];
>>  	val = readl_relaxed(priv->common.base + STM32F4_ADC_CCR);
>>  	val &= ~STM32F4_ADC_ADCPRE_MASK;
>>  	val |= i << STM32F4_ADC_ADCPRE_SHIFT;
>>  	writel_relaxed(val, priv->common.base + STM32F4_ADC_CCR);
>>  
>>  	dev_dbg(&pdev->dev, "Using analog clock source at %ld kHz\n",
>> -		rate / (stm32f4_pclk_div[i] * 1000));
>> +		priv->common.rate / 1000);
>>  
>>  	return 0;
>>  }
>> @@ -250,7 +250,7 @@ static int stm32h7_adc_clk_sel(struct platform_device *pdev,
>>  
>>  out:
>>  	/* rate used later by each ADC instance to control BOOST mode */
>> -	priv->common.rate = rate;
>> +	priv->common.rate = rate / div;
>>  
>>  	/* Set common clock mode and prescaler */
>>  	val = readl_relaxed(priv->common.base + STM32H7_ADC_CCR);
>> @@ -260,7 +260,7 @@ static int stm32h7_adc_clk_sel(struct platform_device *pdev,
>>  	writel_relaxed(val, priv->common.base + STM32H7_ADC_CCR);
>>  
>>  	dev_dbg(&pdev->dev, "Using %s clock/%d source at %ld kHz\n",
>> -		ckmode ? "bus" : "adc", div, rate / (div * 1000));
>> +		ckmode ? "bus" : "adc", div, priv->common.rate / 1000);
>>  
>>  	return 0;
>>  }
> 
