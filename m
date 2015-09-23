From: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/3] Documentation: dt: keystone: provide SoC specific
 compatible flags
Date: Wed, 23 Sep 2015 14:15:09 -0500
Message-ID: <5602FA3D.9050702@ti.com>
References: <1442938118-4718-1-git-send-email-nm@ti.com> <1442938118-4718-2-git-send-email-nm@ti.com> <5602E9F3.7020102@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5602E9F3.7020102-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/23/2015 01:05 PM, Murali Karicheri wrote:
> On 09/22/2015 12:08 PM, Nishanth Menon wrote:
[...]

>> diff --git
>> a/Documentation/devicetree/bindings/arm/keystone/keystone.txt
>> b/Documentation/devicetree/bindings/arm/keystone/keystone.txt
>> index 59d7a46f85eb..800d2d02e27b 100644
>> --- a/Documentation/devicetree/bindings/arm/keystone/keystone.txt
>> +++ b/Documentation/devicetree/bindings/arm/keystone/keystone.txt
>> @@ -9,12 +9,26 @@ Required properties:
>>      the form "ti,keystone-*". Generic devices like gic, arch_timers,
>> ns16550
>>      type UART should use the specified compatible for those devices.
>>
>> +SoC families:
>> +
>> +- Keystone 2 generic SoC:
>> +   compatible = "ti,keystone"
>> +
>> +SoCs:
>> +
>> +- Keystone 2 Hawking/Kepler
>> +   compatible = ti,k2hk", "ti,keystone"
>> +- Keystone 2 Lamarr
>> +   compatible = ti,k2l", "ti,keystone"
>> +- Keystone 2 Edison
>> +   compatible = ti,k2e", "ti,keystone"
>> +
>>   Boards:
>>   -  Keystone 2 Hawking/Kepler EVM
>> -   compatible = "ti,k2hk-evm","ti,keystone"
>> +   compatible = "ti,k2hk-evm", "ti,k2hk", "ti,keystone"
>>
>>   -  Keystone 2 Lamarr EVM
>> -   compatible = "ti,k2l-evm","ti,keystone"
>> +   compatible = "ti,k2l-evm", "ti, k2l", "ti,keystone"
>>
>>   -  Keystone 2 Edison EVM
>> -   compatible = "ti,k2e-evm","ti,keystone"
>> +   compatible = "ti,k2e-evm", "ti,k2e", "ti,keystone"
>>
> DTS takes care of the difference in the hardware and If there SoC
> specific customization required outside this, then it is best to include
> this as part of that change. In the past, I believe we didn't do it due
> to the same reason as above.

Right now, they all claim to be the same keystone SoC -> which is
inaccurate at the very least, and downright wrong IMHO since k2e/hk and
l are different SoCs - even though they belong to keystone family, they
are as similar as OMAP4 is to OMAP5 is to DRA7. This is similar to how
various other SoCs distinguish between SoCs as well.

-- 
Regards,
Nishanth Menon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
