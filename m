From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/7] dmaengine: use proper name for the R-Car SoC
Date: Mon, 29 May 2017 11:12:43 +0200
Message-ID: <CAMuHMdV9iU2vK+ae1vPET83Ck5UVzs-kVQJVgFeEA8aUi8vZ5Q@mail.gmail.com>
References: <20170528093051.11816-1-wsa+renesas@sang-engineering.com> <20170528093051.11816-2-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170528093051.11816-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dmaengine@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, May 28, 2017 at 11:30 AM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> It is 'R-Car', not 'r-car'. No code or binding changes, only descriptive text.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/dma/shdma.txt
> +++ b/Documentation/devicetree/bindings/dma/shdma.txt
> @@ -1,6 +1,6 @@
>  * SHDMA Device Tree bindings
>
> -Sh-/r-mobile and r-car systems often have multiple identical DMA controller
> +Sh-/r-mobile and R-Car systems often have multiple identical DMA controller

I'd fix "SH/R-Mobile" too, while at it.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
