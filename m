From: Wan Zongshun <vw@iommu.org>
Subject: Re: [PATCH v2 03/10] Clocksource: add nuc970 clocksource driver
Date: Tue, 12 Jul 2016 15:32:59 +0800
Message-ID: <57849D2B.60305@iommu.org>
References: <1468135649-19980-1-git-send-email-vw@iommu.org>
 <1468135649-19980-4-git-send-email-vw@iommu.org> <3277576.eNgdG7zPqq@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <3277576.eNgdG7zPqq@wuerfel>
Sender: linux-clk-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, jason@lakedaemon.net, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, Thomas Gleixner <tglx@linutronix.de>, Wan Zongshun <mcuos.com@gmail.com>
List-Id: devicetree@vger.kernel.org



On 2016=E5=B9=B407=E6=9C=8811=E6=97=A5 23:36, Arnd Bergmann wrote:
> On Sunday, July 10, 2016 3:27:23 PM CEST Wan Zongshun wrote:
>>
>> +config NUC900_TIMER
>> +        bool "Clocksource timer for nuc900 platform" if COMPILE_TES=
T
>> +        depends on ARM
>> +        select CLKSRC_OF if OF
>> +        select CLKSRC_MMIO
>> +        help
>> +          Enables the clocksource for the NUC900 platform.
>>
>
> I have put this patch into my randconfig build system and found that
> it lacks a dependency:
>
>
>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfi=
g
> index e18ef32776a3..59b9251eef37 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -523,7 +523,7 @@ config CLKSRC_ST_LPC
>
>   config NUC900_TIMER
>           bool "Clocksource timer for nuc900 platform" if COMPILE_TES=
T
> -        depends on ARM
> +        depends on ARM && GENERIC_CLOCKEVENTS
>           select CLKSRC_OF if OF
>           select CLKSRC_MMIO
>           help
> =09

So this patch, I still need submit or you have merged it?

>
> Also the init function has changed its return type in linux-next:
>
>> +static void __init nuc970_timer_of_init(struct device_node *node)
>
> This now needs to return an error code or we get:
>
> ../include/linux/of.h:1004:20: error: comparison of distinct pointer =
types lacks a cast [-Werror]
>          .data =3D (fn =3D=3D (fn_type)NULL) ? fn : fn  }
>
> Daniel Lezcano seems to have implemented a migration strategy, but I
> can't see what you are supposed to do here, since the
> CLOCKSOURCE_OF_DECLARE_RET macro is no longer part of linux-next.

Wait for Daniel's comments? or what should I do now?

>
> 	Arnd
>
>
