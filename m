From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] mfd: arizona: Update GPIO binding for newly supported flag
Date: Tue, 23 May 2017 10:49:23 +0200
Message-ID: <CACRpkdaLR9pH4HX4h3wuGAVbcETGn-k6VkXYsMAq_YPAsnOUvg@mail.gmail.com>
References: <1494948714-15203-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1494948714-15203-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494948714-15203-3-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 16, 2017 at 5:31 PM, Charles Keepax
<ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:

> Update the device tree binding to show that the new GPIO_SLEEP flags are
> now supported in the flags field of the GPIO binding for Arizona
> devices.
>
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
(...)
>    - gpio-controller : Indicates this device is a GPIO controller.
>    - #gpio-cells : Must be 2. The first cell is the pin number and the
> -    second cell is used to specify optional parameters (currently unused).
> +    second cell is used to specify optional parameters, the following flags
> +    are supported:
> +      "GPIO_SLEEP_MAY_LOOSE_OUTPUT" the output of this GPIO does not need to
> +      be maintained whilst the CODEC is in low power mode.

Your gpio controller most definately support more options than that,
for example open drain.

But it is supposed to be a generic property so instead patch gpio.txt
and reference that file from here.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
