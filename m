From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] clk: renesas: r8a7795: Move MODEMR to DT
Date: Thu, 28 Apr 2016 08:52:18 +0200
Message-ID: <CAMuHMdVYtdr8wzm91CH-TAhpbS3E=Jzy67TcjOBC1Q4G9f2bAA@mail.gmail.com>
References: <1461823717-22517-1-git-send-email-dirk.behme@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1461823717-22517-1-git-send-email-dirk.behme@de.bosch.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, linux-renesas-soc@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Oleksij Rempel <linux@rempel-privat.de>, Pooya Keshavarzi <Pooya.Keshavarzi@de.bosch.com>, Oleksij Rempel <fixed-term.Oleksij.Rempel@de.bosch.com>
List-Id: devicetree@vger.kernel.org

Hi Dirk,

On Thu, Apr 28, 2016 at 8:08 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> From: Oleksij Rempel <linux@rempel-privat.de>
>
> Map the Mode Monitor Register via the device tree instead of
> hard coding it in the code. This makes the mapping known to the
> device tree.
>
> Signed-off-by: Pooya Keshavarzi <Pooya.Keshavarzi@de.bosch.com>
> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
> Signed-off-by: Oleksij Rempel <fixed-term.Oleksij.Rempel@de.bosch.com>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>  .../devicetree/bindings/clock/renesas,cpg-mssr.txt |  9 ++++++---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  4 +++-
>  drivers/clk/renesas/r8a7795-cpg-mssr.c             | 22 +++-------------------
>  drivers/clk/renesas/renesas-cpg-mssr.c             | 19 ++++++++++++++-----
>  drivers/clk/renesas/renesas-cpg-mssr.h             |  2 +-
>  5 files changed, 27 insertions(+), 29 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> index fefb802..7984485 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> @@ -15,8 +15,10 @@ Required Properties:
>    - compatible: Must be one of:
>        - "renesas,r8a7795-cpg-mssr" for the r8a7795 SoC
>
> -  - reg: Base address and length of the memory resource used by the CPG/MSSR
> -    block
> +  - reg:
> +    - 0: Base address and length of the memory resource used by the CPG/MSSR
> +         block.
> +    - 1: Mode Monitor Register.
>
>    - clocks: References to external parent clocks, one entry for each entry in
>      clock-names
> @@ -46,7 +48,8 @@ Examples
>
>         cpg: clock-controller@e6150000 {
>                 compatible = "renesas,r8a7795-cpg-mssr";
> -               reg = <0 0xe6150000 0 0x1000>;
> +               reg = <0 0xe6150000 0 0x1000>,
> +                     <0 0xe6160060 0 0x4>;

The MODEMR register is not part of the CPG block, but of the RST block.
So IMHO it doesn't belong in the clock-controller node.

BTW, I still prefer something like
"[PATCH 0/6] arm64: renesas: Obtain MD pin values using syscon/regmap"
(http://www.spinics.net/lists/linux-sh/msg44757.html).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
