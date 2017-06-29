From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 7/8] clk: vc5: Add bindings for IDT VersaClock 5P49V6901
Date: Thu, 29 Jun 2017 13:38:56 +0200
Message-ID: <CAMuHMdXaEDtKwZYDaZ0qUvUk_0WuZwf6ky+nfeahQuU7q4qiyQ@mail.gmail.com>
References: <20170629101851.23972-1-marek.vasut@gmail.com> <20170629101851.23972-7-marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170629101851.23972-7-marek.vasut@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, Alexey Firago <alexey_firago@mentor.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Marek,

On Thu, Jun 29, 2017 at 12:18 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> IDT VersaClock 6 5P49V6901 has 4 clock outputs, 4 fractional dividers.
> Input clock source can be taken from either external crystal or from
> external reference clock.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Alexey Firago <alexey_firago@mentor.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/clock/idt,versaclock5.txt         | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> index 53d7e50ed875..a3d4260039a8 100644
> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt

Probably you want to sprinkle the first few lines of the document with
a few "VersaClock 6" references?

> @@ -7,18 +7,20 @@ from 3 to 12 output clocks.

The rest looks OK to me, so
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
