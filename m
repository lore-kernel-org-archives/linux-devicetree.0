From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 3/3] clk: vc5: Add support for IDT VersaClock 5P49V5935
Date: Wed, 5 Apr 2017 14:20:31 +0200
Message-ID: <CAMuHMdXsJq+8jg=hxTsMexjtKTVpOLTRx+HzxoZTWyC_3+z1Zw@mail.gmail.com>
References: <1491392819-698-1-git-send-email-alexey_firago@mentor.com> <1491392819-698-4-git-send-email-alexey_firago@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1491392819-698-4-git-send-email-alexey_firago@mentor.com>
Sender: linux-clk-owner@vger.kernel.org
To: Alexey Firago <alexey_firago@mentor.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, linux-clk <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 5, 2017 at 1:46 PM, Alexey Firago <alexey_firago@mentor.com> wrote:
> Update IDT VersaClock 5 driver to support 5P49V5935. This chip has
> two clock inputs (internal XTAL or external CLKIN), four fractional
> dividers (FODs) and five clock outputs (four universal clock outputs
> and one reference clock output at OUT0_SELB_I2C).
>
> Current driver supports up to 2 FODs and up to 3 clock outputs. This
> patch sets max number of supported FODs to 4 and max number of supported
> clock outputs to 5.
>
> Signed-off-by: Alexey Firago <alexey_firago@mentor.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
