From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 1/4] clk: renesas: rcar-gen3-cpg: Add Z clock
Date: Fri, 23 Sep 2016 10:32:56 +0200
Message-ID: <CAMuHMdVsPCBqx9aykJCMmedbHJJsg+te=HG=FwTwow4UPXXuLQ@mail.gmail.com>
References: <1462372543-31835-1-git-send-email-geert+renesas@glider.be> <573166A8.1030101@rvc.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <573166A8.1030101@rvc.renesas.com>
Sender: linux-clk-owner@vger.kernel.org
To: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Toru Oishi <toru.oishi.zj@rvc.renesas.com>
List-Id: devicetree@vger.kernel.org

Hi Khiem,

On Tue, May 10, 2016 at 6:42 AM, Khiem Nguyen
<khiem.nguyen.xt@rvc.renesas.com> wrote:
> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -28,6 +28,146 @@

> +       val = (clk_readl(zclk->reg) & CPG_FRQCRC_ZFC_MASK)

Please use readl()/writel() instead of clk_readl/()/clk_writel().

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
