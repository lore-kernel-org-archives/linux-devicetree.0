From: raashidmuhammed <raashidmuhammed-1MQmoylvZ5VBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: at91: Modify information in LED nodes.
Date: Fri, 24 Jun 2016 19:26:45 +0530
Message-ID: <576D3C1D.1050107@zilogic.com>
References: <1466775069-606-1-git-send-email-raashidmuhammed@zilogic.com>
 <1466775069-606-2-git-send-email-raashidmuhammed@zilogic.com>
 <20160624134010.GN5809@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160624134010.GN5809-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 06/24/2016 07:10 PM, Alexandre Belloni wrote:
> Hi,
>
> On 24/06/2016 at 19:01:09 +0530, Raashid Muhammed wrote :
>> Add power led node and rename status led node.
>>
> Well, I'm ok with the change but this does more:
>
>> Signed-off-by: Raashid Muhammed <raashidmuhammed-1MQmoylvZ5VBDgjK7y7TUQ@public.gmane.org>
>> Reviewed-by: Vijay Kumar B. <vijaykumar-NDm7FNP0skFg9hUCZPvPmw@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/at91-sam9_l9260.dts | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/at91-sam9_l9260.dts b/arch/arm/boot/dts/at91-sam9_l9260.dts
>> index be409f2..814753a 100644
>> --- a/arch/arm/boot/dts/at91-sam9_l9260.dts
>> +++ b/arch/arm/boot/dts/at91-sam9_l9260.dts
>> @@ -106,11 +106,16 @@
>>   	leds {
>>   		compatible = "gpio-leds";
>>   
>> -		b0 {
>> -			label = "b0";
>> -			gpios = <&pioA 6 GPIO_ACTIVE_HIGH>;
>> -			linux,default-trigger = "heartbeat";
>> +		pwr_led {
>> +			label = "sam9-l9260:yellow:pwr";
>> +			gpios = <&pioA 9 GPIO_ACTIVE_HIGH>;
>> +			linux,default-trigger = "cpu0";
>>   		};
>>   
>> +		status_led {
>> +			label = "sam9-l9260:green:status";
>> +			gpios = <&pioA 6 GPIO_ACTIVE_LOW>;
>> +			linux,default-trigger = "timer";
> This trigger is also switched from heartbeat to timer, is this
> intentional?
>
Yes, that is intentional. I should have included that in the commit message.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
