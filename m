From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 1/3] usb: renesas_usbhs: Add support for RZ/A1
Date: Fri, 5 Jan 2018 21:18:03 +0100
Message-ID: <CAMuHMdV5KcRAJDw2eTMET2rpJoGD47YTfSXq-CEH_j+44Z+Byw@mail.gmail.com>
References: <20180105184609.24106-1-chris.brandt@renesas.com> <20180105184609.24106-2-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180105184609.24106-2-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Fri, Jan 5, 2018 at 7:46 PM, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> This patch adds the capability to support RZ/A1 SoCs.
>
> Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>

Thanks for your patch!

> index c5289b3ecf8d..2abefd3d6050 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c

> @@ -480,6 +481,10 @@ static const struct of_device_id usbhs_of_match[] = {
>                 .compatible = "renesas,usbhs-r8a77995",
>                 .data = (void *)USBHS_TYPE_RCAR_GEN3_WITH_PLL,
>         },
> +       {
> +               .compatible = "renesas,usbhs-r7s72100",
> +               .data = (void *)USBHS_TYPE_RZA1,
> +       },

I think it suffices to drop the part above...

>         {
>                 .compatible = "renesas,rcar-gen2-usbhs",
>                 .data = (void *)USBHS_TYPE_RCAR_GEN2,
> @@ -488,6 +493,10 @@ static const struct of_device_id usbhs_of_match[] = {
>                 .compatible = "renesas,rcar-gen3-usbhs",
>                 .data = (void *)USBHS_TYPE_RCAR_GEN3,
>         },
> +       {
> +               .compatible = "renesas,rza1-usbhs",
> +               .data = (void *)USBHS_TYPE_RZA1,
> +       },

... and just let the driver match against the generic compatible value.
But then you have to add "renesas,rza1-usbhs" to the DTS, too.

> --- /dev/null
> +++ b/drivers/usb/renesas_usbhs/rza.c
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: GPL-1.0+

Not GPL-2.0?

> +++ b/drivers/usb/renesas_usbhs/rza.h
> @@ -0,0 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0

like here?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
