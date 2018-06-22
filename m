From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v9 5/5] clk: renesas: Renesas R9A06G032 clock driver
Date: Fri, 22 Jun 2018 15:29:30 +0200
Message-ID: <CAMuHMdUin=CjcWvR=nCm9vN-8VWaNXbFt+3k_MUEOmqpKoe2mA@mail.gmail.com>
References: <1528973829-25493-1-git-send-email-michel.pollet@bp.renesas.com> <1528973829-25493-6-git-send-email-michel.pollet@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528973829-25493-6-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michel Pollet <michel.pollet@bp.renesas.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Phil Edworthy <phil.edworthy@renesas.com>, Michel Pollet <buserror+upstream@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Michel,

On Thu, Jun 14, 2018 at 1:03 PM Michel Pollet
<michel.pollet@bp.renesas.com> wrote:
> This provides a clock driver for the Renesas R09A06G032.
> This uses a structure derived from both the RCAR gen2 driver as well as
> the renesas-cpg-mssr driver.
>
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c

> +static int __init r9a06g032_clocks_probe(struct platform_device *pdev)
> +{

[...]

> +       error = of_clk_add_provider(np, of_clk_src_onecell_get, &clocks->data);
> +       if (error)
> +               return error;
> +
> +       error = devm_add_action_or_reset(
> +                       dev, r9a06g032_clocks_del_clk_provider, np);
> +
> +       return error;

This could just be "return devm_add_action_or_reset(...);".

Queuing in clk-renesas-for-v4.19 with the above small change.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
