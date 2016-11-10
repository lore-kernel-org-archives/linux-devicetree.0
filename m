From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v6] clk: renesas: cpg-mssr: add R8A7743 support
Date: Thu, 10 Nov 2016 13:52:28 +0100
Message-ID: <CAMuHMdX5Mhra9N6bsDi7RX8arJNpnJ90NuUpbTPg3McYFHWQpg@mail.gmail.com>
References: <1737840.BeMyoUTlpl@wasted.cogentembedded.com> <2376126.1sNxSm4GUB@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <2376126.1sNxSm4GUB@wasted.cogentembedded.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Tue, Nov 8, 2016 at 10:21 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add RZ/G1M (R8A7743) Clock  Pulse Generator / Module Standby and Software
> Reset support, using the CPG/MSSR driver core and the common R-Car Gen2
> (and RZ/G) code.
>
> Based on the proof-of-concept R8A7791 CPG/MSSR patch by Geert Uytterhoeven
> <geert+renesas@glider.be>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> ---
> This patch is against the 'clk-next' branch of CLK group's 'linux.git' repo.
> It depends on the common R-Car gen2 (and RZ/G) support just posted.
>
> Changes in version 6:
> - passed the PLL0 divisor to rcar_gen2_cpg_init();
> - undid  the version 5 changes.

Thanks!

Will queue with the following trivial changes:
  - pass cpg_mode to rcar_gen2_cpg_init(),
  - sort clock names in DT bindings,
  - reformat tables for easier comparison with other clock drivers.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
