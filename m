From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: Add the PWM node to Cygnus
Date: Fri, 1 Sep 2017 19:11:01 -0700
Message-ID: <a08ecc76-bb01-be52-013c-01bd76aa5936@gmail.com>
References: <20170831185416.8181-1-eric@anholt.net>
 <20170831185416.8181-2-eric@anholt.net>
 <d0f4b326-9efb-5dd2-d7fb-5ccd84f713ba@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d0f4b326-9efb-5dd2-d7fb-5ccd84f713ba-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 08/31/2017 01:10 PM, Scott Branden wrote:
> pwm node is correct.
> 
> 
> On 17-08-31 11:54 AM, Eric Anholt wrote:
>> This is connected up to the backlight on 911360_entphn, which we'll
>> need for a panel driver.  For now, leave the node disabled in the
>> shared dtsi.
>>
>> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> Acked-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

Applied to devicetree/next:

https://github.com/Broadcom/stblinux/commit/31807d46f85c4d86ef3b6df9c5a4e69d35f75bc0

>> ---
>>   arch/arm/boot/dts/bcm-cygnus.dtsi | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi
>> b/arch/arm/boot/dts/bcm-cygnus.dtsi
>> index 74f73ff24aec..b9a654d733ae 100644
>> --- a/arch/arm/boot/dts/bcm-cygnus.dtsi
>> +++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
>> @@ -585,6 +585,14 @@
>>               status = "disabled";
>>           };
>>   +        pwm: pwm@180aa500 {
>> +            compatible = "brcm,kona-pwm";
>> +            reg = <0x180aa500 0xc4>;
>> +            #pwm-cells = <3>;
>> +            clocks = <&asiu_clks BCM_CYGNUS_ASIU_PWM_CLK>;
>> +            status = "disabled";
>> +        };
>> +
>>           keypad: keypad@180ac000 {
>>               compatible = "brcm,bcm-keypad";
>>               reg = <0x180ac000 0x14c>;
> 

-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
