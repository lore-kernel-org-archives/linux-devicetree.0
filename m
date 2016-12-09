From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] irqchip/renesas-intc-irqpin: List fallback
 compatibility last
Date: Fri, 9 Dec 2016 13:45:26 +0100
Message-ID: <CAMuHMdV=rSE41RaqK2OCWiAbGwZ+3ZNVDy1TfS8qfGR-V-iAUw@mail.gmail.com>
References: <1481280650-9258-1-git-send-email-horms+renesas@verge.net.au> <1481280650-9258-2-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481280650-9258-2-git-send-email-horms+renesas@verge.net.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Fri, Dec 9, 2016 at 11:50 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Improve readability by listing the rmobile fallback compatibility string

s/rmobile/generic/

> after the more-specific compatibility strings they provide a fallback for.
>
> This does not effect run-time behaviour as it is the order in the DTB that
> determines which compatibility string is used.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  drivers/irqchip/irq-renesas-intc-irqpin.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-renesas-intc-irqpin.c b/drivers/irqchip/irq-renesas-intc-irqpin.c
> index 713177d97c7a..5fe1207a079c 100644
> --- a/drivers/irqchip/irq-renesas-intc-irqpin.c
> +++ b/drivers/irqchip/irq-renesas-intc-irqpin.c
> @@ -374,7 +374,6 @@ static const struct intc_irqpin_config intc_irqpin_rmobile = {
>  };
>
>  static const struct of_device_id intc_irqpin_dt_ids[] = {
> -       { .compatible = "renesas,intc-irqpin", },
>         { .compatible = "renesas,intc-irqpin-r8a7778",
>           .data = &intc_irqpin_irlm_r8a777x },
>         { .compatible = "renesas,intc-irqpin-r8a7779",
> @@ -383,6 +382,7 @@ static const struct of_device_id intc_irqpin_dt_ids[] = {
>           .data = &intc_irqpin_rmobile },
>         { .compatible = "renesas,intc-irqpin-sh73a0",
>           .data = &intc_irqpin_rmobile },
> +       { .compatible = "renesas,intc-irqpin", },

BTW, I'm wondering what's the added value of keeping the generic
"renesas,intc-irqpin" fallback. There is no user of the pure generic version
only, and all SoC-specific versions are treated slightly different.

>         {},
>  };
>  MODULE_DEVICE_TABLE(of, intc_irqpin_dt_ids);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
