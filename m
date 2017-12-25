From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: make ARCH_S3C24XX select USE_OF and clean-up boot/dts/Makefile
Date: Mon, 25 Dec 2017 18:39:05 +0100
Message-ID: <CAJKOXPfd+R0z-RcNLWn=rS6U0uBhDsZS8d-f-b4+jUeQBruc5Q@mail.gmail.com>
References: <1511749163-11057-1-git-send-email-yamada.masahiro@socionext.com>
 <CAJKOXPf0kWKQCf7avT4LLpkanhh-WvFoNUzdvpNDk2Q-KkymJQ@mail.gmail.com> <CAK7LNASWV7F+rjEq-RN+QGwx1fbnaL1oeWmu178A_a-Q=5f95g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNASWV7F+rjEq-RN+QGwx1fbnaL1oeWmu178A_a-Q=5f95g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 24, 2017 at 6:19 PM, Masahiro Yamada
<yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
> 2017-12-22 21:41 GMT+09:00 Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
>> On Mon, Nov 27, 2017 at 3:19 AM, Masahiro Yamada
>> <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
>>> ARCH_S3C24XX is a very exceptional platform that some DT files in
>>> arch/arm/boot/dts/, but does not select USE_OF.
>>
>> Not entirely. The platform does select USE_OF - when MACH_S3C2416_DT
>> is chosen. For other boards USE_OF is not necessary because they do
>> not use DT. Why you need to select it for entire arch?
>>
>> Best regards,
>> Krzysztof
>>
>
>
> The reason is simple - to avoid compile error.
>
>
> If I simply drop ifeq ($(CONFIG_OF),y)
> but do not select ARCH_S3C24XX,
> s3c2410_defconfig failed to build.
>
>
> $ make -s ARCH=arm mrproper
> $ make -s ARCH=arm s3c2410_defconfig
> $ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-  dtbs
>     ...
>
>   DTC     arch/arm/boot/dts/s3c2416-smdk2416.dtb
> /bin/sh: 1: ./scripts/dtc/dtc: not found
> scripts/Makefile.lib:310: recipe for target
> 'arch/arm/boot/dts/s3c2416-smdk2416.dtb' failed
> make[1]: *** [arch/arm/boot/dts/s3c2416-smdk2416.dtb] Error 127
> arch/arm/Makefile:349: recipe for target 'dtbs' failed
> make: *** [dtbs] Error 2
>
>
> Another solution would be to enable dtb by CONFIG_MACH_S3C2416_DT.
>
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index d0381e9..950b5dd 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -800,7 +798,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
>         rk3288-veyron-pinky.dtb \
>         rk3288-veyron-speedy.dtb \
>         rk3288-vyasa.dtb
> -dtb-$(CONFIG_ARCH_S3C24XX) += \
> +dtb-$(CONFIG_MACH_S3C2416_DT) += \
>         s3c2416-smdk2416.dtb
>  dtb-$(CONFIG_ARCH_S3C64XX) += \
>         s3c6410-mini6410.dtb \
>
>
>
> If you migrate S3C24XX platform to DT,
> per-board CONFIG option will go away.
>
> So, I think dtb-$(CONFIG_ARCH_S3C24XX) is OK.

I think this second solution - using CONFIG_MACH_S3C2416_DT - makes
more sense because:
1, S3C24xx will not be converted to DT. This is a legacy platform.
2. DT version supports only part of boards and peripherals so most of
existing platforms will use non-DT boardfiles. Enabling OF on all of
them is not useful for them.
3. The same error and solution probably applies to MACH_S3C64XX.

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
