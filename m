From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 1/7] ARM: dts: r8a7743: initial SoC device tree
Date: Fri, 28 Oct 2016 12:51:34 +0200
Message-ID: <CAMuHMdXt0yoHsk_BLpn+e8eqC+sz_VNV1xeOPPM4on=8i_Gb-Q@mail.gmail.com>
References: <1580369.yToZzJza1l@wasted.cogentembedded.com> <13559419.B3v0G6vn24@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <13559419.B3v0G6vn24@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Thu, Oct 27, 2016 at 11:36 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The  initial R8A7743 SoC device tree including CPU0, GIC, timer, SYSC, RST,
> CPG, and the required clock descriptions.
>
> Based on the original (and large) patch by Dmitry Shifrin
> <dmitry.shifrin@cogentembedded.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> ---
> Changes in version 5:
> - added the RST device node, updated the patch description accordingly.

Thanks for the update!

> +++ renesas/arch/arm/boot/dts/r8a7743.dtsi
> @@ -0,0 +1,120 @@

> +               rst: reset-controller@e6160000 {
> +                       compatible = "renesas,r8a7743-rst";
> +                       reg = <0 0xe6160000 0 0x0200>;

I'd use "reg = <0 0xe6160000 0 0x0100>".
Only R-Car Gen3 has registers above offset 0x100.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
