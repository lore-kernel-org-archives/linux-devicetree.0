From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] gpio: 74x164: add dt support for nxp's 74x594
Date: Tue, 15 Mar 2016 16:27:55 +0100
Message-ID: <CAMuHMdW5Owzv06wnV34W3cYp=ibrONcfBVV6WST5VyvQ1ENjsA@mail.gmail.com>
References: <1457998330-8070-1-git-send-email-nicolassaenzj@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457998330-8070-1-git-send-email-nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Saenz Julienne <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 15, 2016 at 12:32 AM, Nicolas Saenz Julienne
<nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The chip is also an 8 bit shift register which works out of the box as a GPO
> expander with this patch
>
> Signed-off-by: Nicolas Saenz Julienne <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-74x164.txt | 4 +++-
>  drivers/gpio/gpio-74x164.c                             | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-74x164.txt b/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
> index cc26080..ce1b223 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
> @@ -1,7 +1,9 @@
>  * Generic 8-bits shift register GPIO driver
>
>  Required properties:
> -- compatible : Should be "fairchild,74hc595"
> +- compatible: Should contain one of the following:
> +    "fairchild,74hc595"
> +    "nxp,74lvc594"

Why did you choose the "lvc" variant?

Ideally, you want to put the oldest "manuf,74x594" variant here.
I once read it was Motorola who invented the 7459x parts, to interface with
SPI.

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
