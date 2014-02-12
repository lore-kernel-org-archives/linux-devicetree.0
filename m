From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] of/gpio: Automatically decode OF_GPIO_OPEN_DRAIN
 and OF_GPIO_OPEN_SOURCE flags in gpiolib.
Date: Wed, 12 Feb 2014 11:21:17 +0900
Message-ID: <CAAVeFu+WekUizRz6G=Rwfbd8Tc1vY6DqV=JDeM_bg4GQ50xZNQ@mail.gmail.com>
References: <1392148200-5393-1-git-send-email-ddaney.cavm@gmail.com> <1392148200-5393-3-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392148200-5393-3-git-send-email-ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 12, 2014 at 4:50 AM, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>
> Just as gpiod_get() automatically interprets the OF_GPIO_ACTIVE_LOW
> flag from the device tree, add handling for OF_GPIO_OPEN_DRAIN and
> OF_GPIO_OPEN_SOURCE.
>
> This keeps the details of handling open-drain GPIOs in the core GPIO
> code, and out of the individual drivers.
>
> Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpio/gpiolib.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 50c4922..7f596d0 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2307,6 +2307,12 @@ static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
>         if (of_flags & OF_GPIO_ACTIVE_LOW)
>                 *flags |= GPIO_ACTIVE_LOW;
>
> +       if (of_flags & OF_GPIO_OPEN_DRAIN)
> +               *flags |= GPIO_OPEN_DRAIN;
> +
> +       if (of_flags & OF_GPIO_OPEN_SOURCE)
> +               *flags |= GPIO_OPEN_SOURCE;
> +
>         return desc;
>  }

Reviewed-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks for taking the time to do this!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
