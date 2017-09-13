From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 04/11] soc: renesas: rcar-sysc: add R8A77970 support
Date: Wed, 13 Sep 2017 10:36:23 +0200
Message-ID: <CAMuHMdXLbg2WwtWvG+zBa5MOT3qXr2Fv-U4AJ0=eLfE2VG1LKg@mail.gmail.com>
References: <20170912210518.203740259@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170912210518.203740259@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Tue, Sep 12, 2017 at 10:37 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add support for R-Car V3M (R8A77970) SoC power areas to the R-Car SYSC
> driver.
>
> Based on the original (and large) patch by Daisuke Matsushita
> <daisuke.matsushita.ns@hitachi.com>.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> --- /dev/null
> +++ renesas/drivers/soc/renesas/r8a77970-sysc.c
> @@ -0,0 +1,39 @@

> +#include <linux/bug.h>

I think this include is no longer needed since commit c7acec713d14c6ce
("kernel.h: handle pointers to arrays better in container_of()").

> +static const struct rcar_sysc_area r8a77970_areas[] __initconst = {

> +       { "a3ir",       0x180, 0, R8A77970_PD_A3IR,     R8A77970_PD_ALWAYS_ON },
> +       { "a2ir0",      0x400, 0, R8A77970_PD_A2IR0,    R8A77970_PD_ALWAYS_ON },
> +       { "a2ir1",      0x400, 1, R8A77970_PD_A2IR1,    R8A77970_PD_A2IR0 },
> +       { "a2ir2",      0x400, 2, R8A77970_PD_A2IR2,    R8A77970_PD_A2IR0 },
> +       { "a2ir3",      0x400, 3, R8A77970_PD_A2IR3,    R8A77970_PD_A2IR0 },
> +       { "a2sc0",      0x400, 4, R8A77970_PD_A2SC0,    R8A77970_PD_ALWAYS_ON },
> +       { "a2sc1",      0x400, 5, R8A77970_PD_A2SC1,    R8A77970_PD_A2SC0 },

According to Figure 9.2(b) "Power domain structure (R-Car V3M)" and Table 9.4
"Power domains", all of A2IR[0-3] and A2SC[01] are direct children of A3IR.

BTW, the bit indices "4" resp. "5" for A2SC[01] don't match Section 9.2.5
"Power Control Registers for A2IR" (which uses "0" resp. "1"), but I assume
that's just a typo in the datasheet, as those would conflict with A2IR[01], and
the would conflict with the documentation for other R-Car Gen3 SoCs.

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
