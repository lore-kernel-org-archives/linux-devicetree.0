From: Wan Zongshun <vw-6ukY98dZOFrYtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH 3/6] Clocksource: add nuc970 clocksource driver
Date: Tue, 5 Jul 2016 15:43:03 +0800
Message-ID: <577B6507.2040803@iommu.org>
References: <1466851042-22239-1-git-send-email-vw@iommu.org>
 <1466851042-22239-4-git-send-email-vw@iommu.org> <4184925.Jh1dkPbmzX@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4184925.Jh1dkPbmzX@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wan Zongshun <mcuos.com-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2016=E5=B9=B406=E6=9C=8829=E6=97=A5 23:25, Arnd Bergmann wrote:
> On Saturday, June 25, 2016 6:37:19 PM CEST Wan Zongshun wrote:
>> This patch is to add nuc970 clocksource driver support.
>>
>> Signed-off-by: Wan Zongshun <mcuos.com-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   .../mach-w90x900/include/mach/nuc970-regs-timer.h  |  44 +++++
>>   drivers/clocksource/Kconfig                        |   8 +
>>   drivers/clocksource/Makefile                       |   1 +
>>   drivers/clocksource/timer-nuc900.c                 | 207 +++++++++=
++++++++++++
>>   4 files changed, 260 insertions(+)
>>   create mode 100644 arch/arm/mach-w90x900/include/mach/nuc970-regs-=
timer.h
>>   create mode 100644 drivers/clocksource/timer-nuc900.c
>>
>> diff --git a/arch/arm/mach-w90x900/include/mach/nuc970-regs-timer.h =
b/arch/arm/mach-w90x900/include/mach/nuc970-regs-timer.h
>> new file mode 100644
>> index 0000000..43d7e8b
>> --- /dev/null
>> +++ b/arch/arm/mach-w90x900/include/mach/nuc970-regs-timer.h
>
> Please move the contents of the header file into the driver. We try t=
o not
> have any new mach/*.h headers.

Ok, done.

>
>> +
>> +static unsigned int timer0_load;
>> +static void __iomem *tmr_base;
>> +
>> +static int nuc970_clockevent_set_oneshot(struct clock_event_device =
*evt)
>> +{
>> +	unsigned int val;
>> +
>> +	val =3D __raw_readl(tmr_base + REG_TMR_TCSR0);
>> +	val &=3D ~(0x03 << 27);
>> +
>> +	val |=3D (ONESHOT | COUNTEN | INTEN | PRESCALE);
>> +
>> +	__raw_writel(val, tmr_base + REG_TMR_TCSR0);
>> +	return 0;
>> +}
>> +
>
> writel() instead of __raw_writel()

Ok, so this change will apply to all drivers.

>
> 	Arnd
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
