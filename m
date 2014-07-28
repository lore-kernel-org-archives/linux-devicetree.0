From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH ] ARM: pxa: fix section mismatch warning for pxa_timer_nodt_init
Date: Mon, 28 Jul 2014 07:39:51 +0200
Message-ID: <53D5E227.6090900@linaro.org>
References: <1405356724-32207-1-git-send-email-robert.jarzmik@free.fr> <53CD25A4.7030606@linaro.org> <87oawivarv.fsf@free.fr> <12220413.BdRleC0Xf5@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <12220413.BdRleC0Xf5@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/26/2014 08:50 PM, Arnd Bergmann wrote:
> commit a38b1f60b5245a3 ("ARM: pxa: Add non device-tree timer link to
> clocksource") introduced a harmless section mismatch warning for
> all pxa platforms, by introducing a new pxa_timer_init() function
> that is not marked __init but that calls pxa_timer_nodt_init(),
> which is. The function is only called at init time, so it is safe
> to also annotate it this way.
>
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
> Daniel, please apply on top of Robert's patch series.

Applied thanks!

   -- Daniel

>
> diff --git a/arch/arm/mach-pxa/generic.c b/arch/arm/mach-pxa/generic.=
c
> index 630fa916bbc6..04b013fbc98f 100644
> --- a/arch/arm/mach-pxa/generic.c
> +++ b/arch/arm/mach-pxa/generic.c
> @@ -61,7 +61,7 @@ EXPORT_SYMBOL(get_clock_tick_rate);
>   /*
>    * For non device-tree builds, keep legacy timer init
>    */
> -void pxa_timer_init(void)
> +void __init pxa_timer_init(void)
>   {
>   	pxa_timer_nodt_init(IRQ_OST0, io_p2v(0x40a00000),
>   			    get_clock_tick_rate());
>


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
