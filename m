From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] dmaengine: rcar-dmac: don't use DMAC error interrupt
Date: Wed, 13 Jun 2018 13:36:39 +0200
Message-ID: <CAMuHMdV-MoVnfJarHc9xZX_ZN7sHmKjGKxnhHyYUBof_P6R9ew@mail.gmail.com>
References: <8736xrkrci.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8736xrkrci.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: vkoul@kernel.org, Dan Williams <dan.j.williams@intel.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran@ksquared.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Morimoto-san,

Thanks for your patch!

On Wed, Jun 13, 2018 at 10:49 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current rcar-dmac is using DMAC error interrupt which will handle all
> channel's error. But in this design, error handling itself will be
> issue if user want to use virtualization, multi OS, etc.
> This patch removes current DMAC error interrupt handling, and handle it
> on each channel interrupt handler.

Just wondering, what's the usage pattern where this causes a problem?
Do you plan to export part of a SYS-DMAC instance to a guest?
How to maintain host/guest isolation?

> --- a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> +++ b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> @@ -38,6 +38,7 @@ Required Properties:
>  - interrupt-names: one entry for the error interrupt, named "error", plus one
>    entry per channel, named "ch%u", where %u is the channel number ranging from
>    zero to the number of channels minus one.
> +  # "error" interrupt will be ignored, so far

Again, DT describes hardware, not software policy.
So please drop all changes to the bindings.

With that fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
