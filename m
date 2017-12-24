From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH] ARM: make ARCH_S3C24XX select USE_OF and clean-up boot/dts/Makefile
Date: Mon, 25 Dec 2017 02:19:59 +0900
Message-ID: <CAK7LNASWV7F+rjEq-RN+QGwx1fbnaL1oeWmu178A_a-Q=5f95g@mail.gmail.com>
References: <1511749163-11057-1-git-send-email-yamada.masahiro@socionext.com> <CAJKOXPf0kWKQCf7avT4LLpkanhh-WvFoNUzdvpNDk2Q-KkymJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJKOXPf0kWKQCf7avT4LLpkanhh-WvFoNUzdvpNDk2Q-KkymJQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-12-22 21:41 GMT+09:00 Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> On Mon, Nov 27, 2017 at 3:19 AM, Masahiro Yamada
> <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
>> ARCH_S3C24XX is a very exceptional platform that some DT files in
>> arch/arm/boot/dts/, but does not select USE_OF.
>
> Not entirely. The platform does select USE_OF - when MACH_S3C2416_DT
> is chosen. For other boards USE_OF is not necessary because they do
> not use DT. Why you need to select it for entire arch?
>
> Best regards,
> Krzysztof
>


The reason is simple - to avoid compile error.


If I simply drop ifeq ($(CONFIG_OF),y)
but do not select ARCH_S3C24XX,
s3c2410_defconfig failed to build.


$ make -s ARCH=arm mrproper
$ make -s ARCH=arm s3c2410_defconfig
$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-  dtbs
    ...

  DTC     arch/arm/boot/dts/s3c2416-smdk2416.dtb
/bin/sh: 1: ./scripts/dtc/dtc: not found
scripts/Makefile.lib:310: recipe for target
'arch/arm/boot/dts/s3c2416-smdk2416.dtb' failed
make[1]: *** [arch/arm/boot/dts/s3c2416-smdk2416.dtb] Error 127
arch/arm/Makefile:349: recipe for target 'dtbs' failed
make: *** [dtbs] Error 2


Another solution would be to enable dtb by CONFIG_MACH_S3C2416_DT.


diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d0381e9..950b5dd 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -800,7 +798,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
        rk3288-veyron-pinky.dtb \
        rk3288-veyron-speedy.dtb \
        rk3288-vyasa.dtb
-dtb-$(CONFIG_ARCH_S3C24XX) += \
+dtb-$(CONFIG_MACH_S3C2416_DT) += \
        s3c2416-smdk2416.dtb
 dtb-$(CONFIG_ARCH_S3C64XX) += \
        s3c6410-mini6410.dtb \



If you migrate S3C24XX platform to DT,
per-board CONFIG option will go away.

So, I think dtb-$(CONFIG_ARCH_S3C24XX) is OK.



>> All the other platforms with DT files correctly select USE_OF
>> directly or indirectly (Most of them are either ARCH_MULTIPLATFORM
>> or ARM_SINGLE_ARMV7M).
>>
>> With ARCH_S3C24XX fixed, "ifeq ($(CONFIG_OF),y)" in DT Makefile
>> can be deleted.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
>> ---
>>
>>  arch/arm/Kconfig           | 1 +
>>  arch/arm/boot/dts/Makefile | 3 ---
>>  2 files changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> index 51c8df5..5604497 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -595,6 +595,7 @@ config ARCH_S3C24XX
>>         select MULTI_IRQ_HANDLER
>>         select NEED_MACH_IO_H
>>         select SAMSUNG_ATAGS
>> +       select USE_OF
>>         help
>>           Samsung S3C2410, S3C2412, S3C2413, S3C2416, S3C2440, S3C2442, S3C2443
>>           and S3C2450 SoCs based systems, such as the Simtec Electronics BAST
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index d0381e9..6f7f25d 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -1,6 +1,4 @@
>>  # SPDX-License-Identifier: GPL-2.0
>> -ifeq ($(CONFIG_OF),y)
>> -
>>  dtb-$(CONFIG_ARCH_ALPINE) += \
>>         alpine-db.dtb
>>  dtb-$(CONFIG_MACH_ARTPEC6) += \
>> @@ -1104,4 +1102,3 @@ dtb-$(CONFIG_ARCH_ZX) += zx296702-ad1.dtb
>>  dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
>>         aspeed-bmc-opp-romulus.dtb \
>>         aspeed-ast2500-evb.dtb
>> -endif
>> --
>> 2.7.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
