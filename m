From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clockevents: rockchip: Add rockchip timer for rk3288
Date: Wed, 14 Jan 2015 17:10:24 +0100
Message-ID: <54B694F0.1000405@linaro.org>
References: <1420542233-16897-1-git-send-email-daniel.lezcano@linaro.org> <3085252.tjZK7l7tBp@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3085252.tjZK7l7tBp@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/13/2015 12:20 AM, Heiko St=C3=BCbner wrote:
> Hi Daniel,
>
> sorry it took a bit longer to reply.

No problem :)

> Generally it looks good to me, just some minor issues inline below.

Thanks for the review.

> It would also be nice to include the rockchip list (linux-
> rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org) for future patches.

Yes, sure. I will do that in the future.

[...]

>> +- clock-frequency: the frequency the timer is running
>> +
>> +Example:
>> +	timer: timer@ff810000 {
>> +		compatible =3D "rockchip,rk3288-timer";
>> +		reg =3D <0xff810000 0x20>;
>> +		interrupts =3D <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
>> +		clock-frequency =3D <24000000>;
>
> wouldn't it make sense to use the actual supplying clock?
>
> For the timer you want to use it is just the non-gateable &xin24m, bu=
t the
> timers in the other block (timer0-5) actually do have gateable clocks=
=2E
>
> Similarly there is a pclk_timer supplying at least one of the two act=
ual
> blocks. I'll try to inquire how the blocks are actually supplied.

Ok, are you suggesting I should use another timer so we can gate it for=
=20
power efficiency ?

>> +	};
>> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk328=
8.dtsi
>> index 2a878a3..7a7db48 100644
>> --- a/arch/arm/boot/dts/rk3288.dtsi
>> +++ b/arch/arm/boot/dts/rk3288.dtsi
>> @@ -149,6 +149,13 @@
>>   		clock-frequency =3D <24000000>;
>>   	};
>>
>> +	timer: timer@ff810000 {
>> +		compatible =3D "rockchip,rk3288-timer";
>> +		reg =3D <0xff810000 0x20>;
>> +		interrupts =3D <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
>> +		clock-frequency =3D <24000000>;
>> +	};
>> +
>>   	sdmmc: dwmmc@ff0c0000 {
>>   		compatible =3D "rockchip,rk3288-dw-mshc";
>>   		clock-freq-min-max =3D <400000 150000000>;
>> diff --git a/arch/arm/mach-rockchip/Kconfig b/arch/arm/mach-rockchip=
/Kconfig
>> index ac5803c..4c3fa7e 100644
>> --- a/arch/arm/mach-rockchip/Kconfig
>> +++ b/arch/arm/mach-rockchip/Kconfig
>> @@ -11,6 +11,7 @@ config ARCH_ROCKCHIP
>>   	select HAVE_ARM_SCU if SMP
>>   	select HAVE_ARM_TWD if SMP
>>   	select DW_APB_TIMER_OF
>> +	select RK3288_TIMER
>>   	select ARM_GLOBAL_TIMER
>>   	select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
>>   	help
>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconf=
ig
>> index fc01ec2..6ed97a6 100644
>> --- a/drivers/clocksource/Kconfig
>> +++ b/drivers/clocksource/Kconfig
>> @@ -26,6 +26,10 @@ config DW_APB_TIMER_OF
>>   	select DW_APB_TIMER
>>   	select CLKSRC_OF
>>
>> +config RK3288_TIMER
>> +	bool
>> +	select CLKSRC_OF
>> +
>
> the config symbol to compile rockchip_timer.c is RK3288_TIMER?
> I'd think it could match a bit more ...
> ROCKCHIP_TIMER -> rockchip_timer.c
> 	or
> RK3288_TIMER -> rk3288_timer.c
 >
> This timer-block is actually also present on the rk3188, but not on t=
he rk3066
> which uses an unmodified dw_apb_timer.

Ok, then rockchip_timer.c fits better. I will do the change.

>>   config ARMADA_370_XP_TIMER
>>   	bool
>>   	select CLKSRC_OF
>> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Make=
file
>> +
>> +        if (of_property_read_u32(np, "clock-frequency", &bc_timer.f=
req)) {
>
> formatting issue with spaces instead of tabs in the 5 lines above

Copy that.

>> +		pr_err("Failed to read the frequency for '%s'\n", TIMER_NAME);
>> +		return;
>> +	}

Thanks!
   -- Daniel

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
