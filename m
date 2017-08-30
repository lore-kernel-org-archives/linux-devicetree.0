From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: Re: [RESEND PATCH 2/3] regulator: Add support for stm32-vrefbuf
Date: Wed, 30 Aug 2017 11:11:24 +0200
Message-ID: <fd883990-cc87-f8cb-ebe7-5c4c4e51d6f6@st.com>
References: <1503925133-30722-1-git-send-email-fabrice.gasnier@st.com>
 <1503925133-30722-3-git-send-email-fabrice.gasnier@st.com>
 <20170829185719.h5fxvzmxbysyxwml@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170829185719.h5fxvzmxbysyxwml-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/29/2017 08:57 PM, Mark Brown wrote:
> On Mon, Aug 28, 2017 at 02:58:52PM +0200, Fabrice Gasnier wrote:
> 
>> +	ret = clk_prepare_enable(priv->clk);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "clk prepare failed\n");
> 
> If you're printing an error include the error code, it'll help users
> figure out what went wrong.
Hi Mark,

Thanks for reviewing,
I'll add it in v2.
> 
>> +	dev_info(&pdev->dev, "STM32 VREFBUF initialized\n");
> 
> This is just noise, remove it.

I'll remove it in v2.
> 
>> +static int __init stm32_vrefbuf_init(void)
>> +{
>> +	return platform_driver_register(&stm32_vrefbuf_driver);
>> +}
>> +subsys_initcall(stm32_vrefbuf_init);
> 
> Why is this at subsys_initcall()?
> 
Several consumers depend on it when it's being used, among which: STM32
internal ADC and DAC, but also external components. Purpose is to ensure
it's ready before these drivers gets probed, instead of being deferred.
Is it ok to keep it ?

Please let me know,
Best Regards,
Fabrice
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
