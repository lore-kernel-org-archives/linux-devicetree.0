From: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/8] MIPS: jz4740: dts: Add bindings for the jz4740-wdt driver
Date: Tue, 2 Jan 2018 22:07:46 +0530
Message-ID: <CANc+2y5ZUM_ZzXaGgbx9b7O1GF4GrbaYsv97G+akvhP2d2VVUA@mail.gmail.com>
References: <20171228162939.3928-2-paul@crapouillou.net> <20171230135108.6834-1-paul@crapouillou.net>
 <20171230135108.6834-5-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171230135108.6834-5-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Paul,

On 30 December 2017 at 19:21, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org> wrote:
> Also remove the watchdog platform_device from platform.c, since it
> wasn't used anywhere anyway.
>
> Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
> ---
>  arch/mips/boot/dts/ingenic/jz4740.dtsi |  8 ++++++++
>  arch/mips/jz4740/platform.c            | 16 ----------------
>  2 files changed, 8 insertions(+), 16 deletions(-)
>
>  v2: No change
>
> diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> index cd5185bb90ae..26c6b561d6f7 100644
> --- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
> @@ -45,6 +45,14 @@
>                 #clock-cells = <1>;
>         };
>
> +       watchdog: watchdog@10002000 {
> +               compatible = "ingenic,jz4740-watchdog";
> +               reg = <0x10002000 0x10>;
> +
> +               clocks = <&cgu JZ4740_CLK_RTC>;
> +               clock-names = "rtc";
> +       };
> +

The watchdog driver calls jz4740_timer_enable_watchdog and
jz4740_timer_disable_watchdog which defined in
arch/mips/jz4740/timer.c. It accesses registers iomapped by timer
code. Declaring register size as 0x10 does not show the real picture.
Better use register size as 0x100 and let timer, wdt, pwm drivers to
share them.

Code from one of your branches
(https://github.com/OpenDingux/linux/blob/for-upstream-clocksource/arch/mips/boot/dts/ingenic/jz4740.dtsi)
does it. Can you prepare a patch series and send it?
I have a patch set that moves timer code out of arch/mips/jz4740/ and
does a similar thing for watchdog and pwm. As your new timer driver is
better than the existing one I have not sent my patches yet. I would
like to see it getting mainlined as it paves way for removing most of
code in arch/mips/jz4740.

>         rtc_dev: rtc@10003000 {
>                 compatible = "ingenic,jz4740-rtc";
>                 reg = <0x10003000 0x40>;
> diff --git a/arch/mips/jz4740/platform.c b/arch/mips/jz4740/platform.c
> index 5b7cdd67a9d9..cbc5f8e87230 100644
> --- a/arch/mips/jz4740/platform.c
> +++ b/arch/mips/jz4740/platform.c
> @@ -233,22 +233,6 @@ struct platform_device jz4740_adc_device = {
>         .resource       = jz4740_adc_resources,
>  };
>
> -/* Watchdog */
> -static struct resource jz4740_wdt_resources[] = {
> -       {
> -               .start = JZ4740_WDT_BASE_ADDR,
> -               .end   = JZ4740_WDT_BASE_ADDR + 0x10 - 1,
> -               .flags = IORESOURCE_MEM,
> -       },
> -};
> -
> -struct platform_device jz4740_wdt_device = {
> -       .name          = "jz4740-wdt",
> -       .id            = -1,
> -       .num_resources = ARRAY_SIZE(jz4740_wdt_resources),
> -       .resource      = jz4740_wdt_resources,
> -};
> -
>  /* PWM */
>  struct platform_device jz4740_pwm_device = {
>         .name = "jz4740-pwm",
> --
> 2.11.0
>
>

Regards,
PrasannaKumar
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
