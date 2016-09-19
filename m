From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH RFC 5/8] ARM: dts: r8a7743: initial SoC device tree
Date: Mon, 19 Sep 2016 10:14:20 +0200
Message-ID: <CAMuHMdUrPvboqZwNWahGbp3xV3YtzESpiBqYzh5Xtuw5kKQ=4Q@mail.gmail.com>
References: <3533019.Wim1Kuh1ic@wasted.cogentembedded.com> <1679762.ECpvSkQAyM@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1679762.ECpvSkQAyM@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Fri, Sep 16, 2016 at 3:35 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The initial R8A7743 SoC device tree including CPU cores, GIC, timer, SYSC,
> and the required  clock descriptions.
>
> Based on the original (and large) patch by Dmitry Shifrin
> <dmitry.shifrin@cogentembedded.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> --- /dev/null/
> +++ renesas/arch/arm/boot/dts/r8a7743.dtsi
> @@ -0,0 +1,210 @@

> +/ {

> +       soc {
=
> +               /* Special CPG clocks */
> +               cpg_clocks: cpg_clocks@e6150000 {
> +                       compatible = "renesas,r8a7743-cpg-clocks",
> +                                    "renesas,rcar-gen2-cpg-clocks";

For a new SoC family, I would strongly suggest using a renesas,cpg-mssr
based binding instead:
  - No more mstp*_clocks nodes with array triplets to keep in sync,
  - Support for MSSR reset can be added later,
  - No need to add all those fixed-factor clocks to DT,
  - Less DT churn when adding support for new devices.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
