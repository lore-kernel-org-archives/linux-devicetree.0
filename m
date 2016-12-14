From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: clk: clk-mstp has never worked for RZ/A1
Date: Wed, 14 Dec 2016 10:25:04 +0100
Message-ID: <CAMuHMdUJFSbX96pqY2Ogxztxz-SWCNfbe=d3eWKn+eWSdHLwfw@mail.gmail.com>
References: <SG2PR06MB1165A4A8A555A3176D0C4ED98A9A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB1165A4A8A555A3176D0C4ED98A9A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

CC devicetree

On Wed, Dec 14, 2016 at 3:14 AM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> Today I realized that the clock control using clk-mstp has never actually worked for RZ/A1 (r7s72100).

Oops... Where did your (offlist) bug report for rspi needing a delay after
clock enable come from?

> The reason is that the MSTP registers are 8-bit instead of the normal 32-bit, and if you do a 32-bit write to them, nothing happens.
> If you look in drivers/clk/renesas/clk-mstp.c, you'll see that clk_readl and clk_writel are used.

I was aware the registers are documented to be 8-bit wide, but I always
assumed 32-bit accesses do work.

> The reason why I have gotten this far is because u-boot has been enabling everything early in boot, so all the clocks were already on.
> Of course if I disable everything again before I booting the kernel....nothing works.

Oops, I only have MSTP early disable debug code for boards I do have
physical access to (cfr. my topic/renesas-debug branch)...

> If I change the accesses in clk-mspt.c to 8-bit, clocks get enabled/disabled as they should.
> #define clk_readl readb
> #define clk_writel writeb
>
>
> So, any suggestions on the best way to fix this???
> Ideally I would like something that can easily be integrated back into 4.9.x
>
>
>
> Maybe add a new DT property named "reg_width":
>
>         mstp3_clks: mstp3_clks@fcfe0420 {
>                 #clock-cells = <1>;
>                 compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
>                 reg = <0xfcfe0420 4>;
>                 reg_width = 8;
>                 clocks = <&p0_clk>;
>                 clock-indices = <R7S72100_CLK_MTU2>;
>                 clock-output-names = "mtu2";
>         };
>
> and then in cpg_mstp_clocks_init(), do:
>
>         if (of_find_property(np, "reg_width", &i))
>                 group->reg_width = i;
>         else
>                 group->reg_width = 32;  /* default */
>
>
> In cpg_mstp_clock_endisable(), do:
>
>         if (group->reg_width == 8)
>                 writeb(value, group->smstpcr);
>         else
>                 clk_writel(value, group->smstpcr);

That's one option. Note that the standard name for such property seems to be
"reg-io-width".

Another option is to let the driver bind against
"renesas,r7s72100-mstp-clocks", and switch to 8-bit access mode.

CLK_OF_DECLARE(cpg_mstp_clks, "renesas,r7s72100-mstp-clocks",
cpg_mstp_clocks_init8);

cpg_mstp_clocks_init8() can set a gloal flag, and call cpg_mstp_clocks_init().

The latter means no DT update is needed, and thus preserves compatibility
with old DTBs.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
