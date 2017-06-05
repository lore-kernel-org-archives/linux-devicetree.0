From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH RFC 5/5] ARM: dts: vf-colibri-eval: use IRQ_TYPE_* to
 specify irq flags
Date: Sun, 04 Jun 2017 19:17:40 -0700
Message-ID: <72c4505c4f11f97fbb9837b9ec47a6df@agner.ch>
References: <20170526180609.2699-1-uwe@kleine-koenig.org>
 <20170526180609.2699-5-uwe@kleine-koenig.org> <20170604034902.GC4094@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170604034902.GC4094@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-06-03 20:49, Shawn Guo wrote:
> On Fri, May 26, 2017 at 08:06:09PM +0200, Uwe Kleine-König wrote:
>> According to the binding documentation and the source code the
>> vf610-gpio controller takes IRQ_TYPE_* as its flags values, not
>> GPIO_ACTIVE_*.
>>
>> This patch uses the right variable type which yields the same result
>> when compiled. Note that this might be wrong and actually
>> IRQ_TYPE_LEVEL_LOW is intended by the dt author.
>>
>> Signed-off-by: Uwe Kleine-König <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
>> ---
>> Hello,
>>
>> can somebody with the hardware or it's documentation please check which
>> flag is the right one?
> 
> @Stefan, can you help to confirm?
> 

Thanks for spotting! According to the data sheet it is a low active
signal, so I guess IRQ_TYPE_LEVEL_LOW is correct. But the driver
actually explicitly requests IRQF_TRIGGER_FALLING, that has been the
case since its inception. IMHO LEVEL_LOW should be more rigid since it
helps for missed interrupt edges...

--
Stefan

>>
>> Best regards
>> Uwe
>>
>>  arch/arm/boot/dts/vf-colibri-eval-v3.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
>> index 091b738041a0..3e0c84d79c43 100644
>> --- a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
>> +++ b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
>> @@ -117,7 +117,7 @@
>>  		clocks = <&clk16m>;
>>  		spi-max-frequency = <10000000>;
>>  		interrupt-parent = <&gpio1>;
>> -		interrupts = <11 GPIO_ACTIVE_LOW>;
>> +		interrupts = <11 IRQ_TYPE_EDGE_RISING>;
>>  	};
>>  };
>>
>> --
>> 2.11.0
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
