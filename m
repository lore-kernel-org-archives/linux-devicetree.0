From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] dmaengine: rcar-dmac: don't use DMAC error interrupt
Date: Tue, 12 Jun 2018 09:59:23 +0200
Message-ID: <CAMuHMdVjVgb+1HrUdOuKpDW8NiXBwPJPAucZhDbN64xb5FtN=A@mail.gmail.com>
References: <87o9ggqwwh.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87o9ggqwwh.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: vkoul@kernel.org, Dan Williams <dan.j.williams@intel.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran@ksquared.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Morimoto-san,

CC devicetree

Thanks for your patch!

On Tue, Jun 12, 2018 at 9:40 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current rcar-dmac is using DMAC error interrupt which will handle all
> channel's error. But in this design, error handling itself will be
> issue if user want to use virtualization, multi OS, etc.
> This patch removes current DMAC error interrupt handling, and handle it
> on each channel interrupt handler.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Who wrote this patch, you or Magnus? Or is this a joint effort?

> --- a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> +++ b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> @@ -35,9 +35,8 @@ Required Properties:
>
>  - interrupts: interrupt specifiers for the DMAC, one for each entry in
>    interrupt-names.
> -- interrupt-names: one entry for the error interrupt, named "error", plus one
> -  entry per channel, named "ch%u", where %u is the channel number ranging from
> -  zero to the number of channels minus one.
> +- interrupt-names: one entry per channel, named "ch%u", where %u is the
> +  channel number ranging from zero to the number of channels minus one.

DT bindings describe hardware, not software policy.
So IMHO the error interrupt must not be removed from the bindings (and
from the DTS and example).

> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1522,25 +1518,37 @@ static irqreturn_t rcar_dmac_isr_channel(int irq, void *dev)

[...]

>
> +       if (reinit) {
> +               dev_err(chan->chan.device->dev, "Channel Address Error happen\n");

s/happen/happened/, or just drop the word (reducing kernel size ;-)

The rest looks good to me (but I haven't tested it), so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
