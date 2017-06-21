From: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH v5 1/4] ARM: dts: at91: sama5d2_xplained: enable ADTRG pin
Date: Wed, 21 Jun 2017 09:50:56 +0200
Message-ID: <09e9462b-f375-2259-179f-0a723b2cb5aa@microchip.com>
References: <1497533097-12052-1-git-send-email-eugen.hristev@microchip.com>
 <1497533097-12052-2-git-send-email-eugen.hristev@microchip.com>
 <20170620175552.2ec49c56@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170620175552.2ec49c56-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 20/06/2017 at 18:55, Jonathan Cameron wrote:
> On Thu, 15 Jun 2017 16:24:54 +0300
> Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org> wrote:
> 
>> Enable pinctrl for ADTRG pin (PD31) for ADC hardware trigger support.
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>> Acked-by: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> The driver changes are on their way upstream.
> 
> Acked-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thanks Jonathan,

Acked-by: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>

Eugen, note that we may need to wait for 4.14 as our changes for 4.13
are already queued in arm-soc...

Best regards,

>> ---
>>  arch/arm/boot/dts/at91-sama5d2_xplained.dts | 16 +++++++++++++++-
>>  1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained.dts b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
>> index 0bef9e0..04754b1 100644
>> --- a/arch/arm/boot/dts/at91-sama5d2_xplained.dts
>> +++ b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
>> @@ -303,7 +303,7 @@
>>  				vddana-supply = <&vdd_3v3_lp_reg>;
>>  				vref-supply = <&vdd_3v3_lp_reg>;
>>  				pinctrl-names = "default";
>> -				pinctrl-0 = <&pinctrl_adc_default>;
>> +				pinctrl-0 = <&pinctrl_adc_default &pinctrl_adtrg_default>;
>>  				status = "okay";
>>  			};
>>  
>> @@ -322,6 +322,20 @@
>>  					bias-disable;
>>  				};
>>  
>> +				/*
>> +				 * The ADTRG pin can work on any edge type.
>> +				 * In here it's being pulled up, so need to
>> +				 * connect it to ground to get an edge e.g.
>> +				 * Trigger can be configured on falling, rise
>> +				 * or any edge, and the pull-up can be changed
>> +				 * to pull-down or left floating according to
>> +				 * needs.
>> +				 */
>> +				pinctrl_adtrg_default: adtrg_default {
>> +					pinmux = <PIN_PD31__ADTRG>;
>> +					bias-pull-up;
>> +				};
>> +
>>  				pinctrl_charger_chglev: charger_chglev {
>>  					pinmux = <PIN_PA12__GPIO>;
>>  					bias-disable;
> 
> 


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
