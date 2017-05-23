From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] gpio: Add new flags to control sleep status of GPIOs
Date: Tue, 23 May 2017 10:39:26 +0200
Message-ID: <CACRpkdbiyZ9jPnuaX9OuYjVbrUYxtpqO-XMqb75ScCEH-=kOEg@mail.gmail.com>
References: <1494948714-15203-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494948714-15203-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 16, 2017 at 5:31 PM, Charles Keepax
<ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:

> Add new flags to allow users to specify that they are not concerned with
> the status of GPIOs whilst in a sleep/low power state.
>
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>

Would be nice to have some opinion from the DT maintainers about
this but seems all right to me.

> +++ b/include/dt-bindings/gpio/gpio.h
> @@ -21,6 +21,10 @@
>  #define GPIO_LINE_OPEN_SOURCE 0
>  #define GPIO_LINE_OPEN_DRAIN 4
>
> +/* Bit 3 express GPIO suspend/resume persistence */
> +#define GPIO_SLEEP_MAINTAIN_VALUE 0
> +#define GPIO_SLEEP_MAY_LOOSE_VALUE 8
> +
>  /*
>   * Open Drain/Collector is the combination of single-ended open drain interface.
>   * Open Source/Emitter is the combination of single-ended open source interface.

Please move the define below the comment and macros below it,
that is using the defines right above...

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
