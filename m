From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND 2/2] gpio: axp209: add pinctrl support
Date: Thu, 24 Nov 2016 15:17:36 +0100
Message-ID: <CACRpkdb8cej=AMs2kO1Vks-WYeae+CtAW2YOCc+Pz3E49mcrDQ@mail.gmail.com>
References: <20161123141151.25315-1-quentin.schulz@free-electrons.com> <20161123141151.25315-3-quentin.schulz@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161123141151.25315-3-quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 23, 2016 at 3:11 PM, Quentin Schulz
<quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> The GPIOs present in the AXP209 PMIC have multiple functions. They
> typically allow a pin to be used as GPIO input or output and can also be
> used as ADC or regulator for example.[1]
>
> This adds the possibility to use all functions of the GPIOs present in
> the AXP209 PMIC thanks to pinctrl subsystem.
>
> [1] see registers 90H, 92H and 93H at
>     http://dl.linux-sunxi.org/AXP/AXP209_Datasheet_v1.0en.pdf
>
> Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

I need Maxime's review on this patch.

>  .../devicetree/bindings/gpio/gpio-axp209.txt       |  28 +-

Also move the bindings to pinctrl/pinctrl-axp209.txt

>  drivers/gpio/gpio-axp209.c                         | 551 ++++++++++++++++++---

Combined drivers should be in drivers/pinctrl/*.

Make a separate patch moving the driver to
drivers/pinctrl/pinctrl-axp209.c (remember -M to git format-patch)
augment Kconfig and Makefile in both subsystems and make
these patches on top of that.

I will deal with cross-merging the result between the GPIO
and pin control trees.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
