From: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] ARM: dts: rockchip: Update LEDs to work with the last
 leds-gpio driver on radxarock
Date: Sun, 30 Nov 2014 15:10:13 +0100
Message-ID: <CABgxDoLx+5Bc_7TfRLOTrhP26=xQF8dawmEENqmXTUpBep_b4w@mail.gmail.com>
References: <1416759575-774-1-git-send-email-romain.perier@gmail.com>
	<CABgxDoLwqYttcPYc+Wth3B17P=e2cbV8G=hqbRfWx+PVTiAPig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABgxDoLwqYttcPYc+Wth3B17P=e2cbV8G=hqbRfWx+PVTiAPig-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

ping :)

2014-11-23 17:20 GMT+01:00 Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> See https://www.kernel.org/doc/Documentation/leds/leds-class.txt for
> LEDs device naming
>
> 2014-11-23 17:19 GMT+01:00 Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> The leds-gpio driver recently switched to the device property API. The device_node
>> name is no longer retrieved if the "label" devicetree property is not found.
>> In this case the driver tries to create entries with (null) name in
>> /sys/class/leds, which is wrong and generates backtrace as several gpio_leds have
>> the same name. Also renamed subnode "yellow" to "blue" to match the last
>> schematics updates.
>>
>> Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/rk3188-radxarock.dts | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/rk3188-radxarock.dts b/arch/arm/boot/dts/rk3188-radxarock.dts
>> index 6eb62c0..9a09579 100644
>> --- a/arch/arm/boot/dts/rk3188-radxarock.dts
>> +++ b/arch/arm/boot/dts/rk3188-radxarock.dts
>> @@ -43,16 +43,19 @@
>>                 compatible = "gpio-leds";
>>
>>                 green {
>> +                       label = "rock:green:user1";
>>                         gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
>>                         default-state = "off";
>>                 };
>>
>> -               yellow {
>> +               blue {
>> +                       label = "rock:blue:user2";
>>                         gpios = <&gpio0 14 GPIO_ACTIVE_LOW>;
>>                         default-state = "off";
>>                 };
>>
>>                 sleep {
>> +                       label = "rock:red:power";
>>                         gpios = <&gpio0 15 0>;
>>                         default-state = "off";
>>                 };
>> --
>> 1.9.1
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
