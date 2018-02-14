From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 12/15] ARM64: dts: r8a77965: Add GPIO nodes
Date: Wed, 14 Feb 2018 15:10:27 +0100
Message-ID: <CAMuHMdWptGc4hG4yufgbjnfu-4vyD8Hag-01FhWW_ubojXNHiQ@mail.gmail.com>
References: <1518515162-23663-1-git-send-email-jacopo+renesas@jmondi.org> <1518515162-23663-13-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518515162-23663-13-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 13, 2018 at 10:45 AM, Jacopo Mondi
<jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:
> Add GPIO nodes to r8a77965 SoC device tree file.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -201,38 +201,6 @@
>                         #power-domain-cells = <1>;
>                 };
>
> -               gpio0: gpio@e6050000 {
> -                       /* placeholder */
> -               };
> -
> -               gpio1: gpio@e6051000 {
> -                       /* placeholder */
> -               };
> -
> -               gpio2: gpio@e6052000 {
> -                       /* placeholder */
> -               };
> -
> -               gpio3: gpio@e6053000 {
> -                       /* placeholder */
> -               };
> -
> -               gpio4: gpio@e6054000 {
> -                       /* placeholder */
> -               };
> -
> -               gpio5: gpio@e6055000 {
> -                       /* placeholder */
> -               };
> -
> -               gpio6: gpio@e6055400 {
> -                       /* placeholder */
> -               };
> -
> -               gpio7: gpio@e6055800 {
> -                       /* placeholder */
> -               };
> -
>                 intc_ex: interrupt-controller@e61c0000 {
>                         /* placeholder */
>                 };
> @@ -339,6 +307,126 @@
>                         dma-channels = <16>;
>                 };
>
> +               gpio0: gpio@e6050000 {

Why have you moved them?

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
