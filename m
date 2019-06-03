From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: renesas,r9a06g032-sysctrl:
 Document power Domains
Date: Mon, 3 Jun 2019 10:03:02 +0200
Message-ID: <CAMuHMdXM7j_tCWR-9FZc8DOARmdXqfd88+a=TYHwKZEmMuHCrg@mail.gmail.com>
References: <1559044467-2639-1-git-send-email-gareth.williams.jx@renesas.com> <1559044467-2639-2-git-send-email-gareth.williams.jx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559044467-2639-2-git-send-email-gareth.williams.jx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gareth Williams <gareth.williams.jx@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Phil Edworthy <phil.edworthy@renesas.com>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 28, 2019 at 1:55 PM Gareth Williams
<gareth.williams.jx@renesas.com> wrote:
> The driver is gaining power domain support, so add the new property
> to the DT binding and update the examples.
>
> Signed-off-by: Gareth Williams <gareth.williams.jx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
>  - Added missing HCLK to UART0 example to show the clock added
>    to the driver.
>  - Added Geert's Reviewed-by line.

Thanks for the update, will queue in clock-renesas-for-v5.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
