From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v2 03/11] dt-bindings: add device tree binding for X-Powers
 AXP803 PMIC
Date: Tue, 11 Apr 2017 23:00:48 +0800 (CST)
Message-ID: <alpine.LNX.2.20.1704112237290.39759@x220i>
References: <20170407183441.58750-1-icenowy@aosc.io> <20170407183441.58750-4-icenowy@aosc.io> <20170411140427.doq5atxk6ptjrp36@dell>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="0-562223920-1491922892=:39759"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170411140427.doq5atxk6ptjrp36@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-562223920-1491922892=:39759
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT



On Tue, 11 Apr 2017, Lee Jones wrote:

> On Sat, 08 Apr 2017, Icenowy Zheng wrote:
>
>> AXP803 is a PMIC produced by Shenzhen X-Powers, with either I2C or RSB
>> bus.
>> 
>> Add a compatible for it.
>> 
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>> Changes in v2:
>> - Place AXP803 before AXP806/809.
>> - Added Chen-Yu's ACK.
>>
>>  Documentation/devicetree/bindings/mfd/axp20x.txt | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> For my own reference:
>  Acked-for-MFD-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Excuse me... Who will apply this patch?

I think this patch should be applied by you as it's in bindings/mfd 
directory, however, if I'm wrong, please point out ;-)

>
>> diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
>> index b41d2601c6ba..334fb19ce605 100644
>> --- a/Documentation/devicetree/bindings/mfd/axp20x.txt
>> +++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
>> @@ -6,12 +6,13 @@ axp202 (X-Powers)
>>  axp209 (X-Powers)
>>  axp221 (X-Powers)
>>  axp223 (X-Powers)
>> +axp803 (X-Powers)
>>  axp809 (X-Powers)
>>
>>  Required properties:
>>  - compatible: "x-powers,axp152", "x-powers,axp202", "x-powers,axp209",
>> -	      "x-powers,axp221", "x-powers,axp223", "x-powers,axp806",
>> -	      "x-powers,axp809"
>> +	      "x-powers,axp221", "x-powers,axp223", "x-powers,axp803",
>> +	      "x-powers,axp806", "x-powers,axp809"
>>  - reg: The I2C slave address or RSB hardware address for the AXP chip
>>  - interrupt-parent: The parent interrupt controller
>>  - interrupts: SoC NMI / GPIO interrupt connected to the PMIC's IRQ pin
>
> -- 
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org │ Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--0-562223920-1491922892=:39759--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
