From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 1/2] ARM: shmobile: r8a7743: add CPG clock index macros
Date: Mon, 7 Nov 2016 19:40:30 +0100
Message-ID: <CAMuHMdXqPx+kpmZjyfez-wrzXSoutw4=Lu2BCYVF9YCpNWiiPQ@mail.gmail.com>
References: <1737840.BeMyoUTlpl@wasted.cogentembedded.com> <2213928.GM4AGq02MQ@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <2213928.GM4AGq02MQ@wasted.cogentembedded.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 2, 2016 at 10:57 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add macros usable by  the device tree sources to reference the R8A7743 CPG
> clocks  by index. The data comes from the  table 7.2b in the revision 0.50
> of the RZ/G Series User's Manual.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied and included in second clk-renesas-for-v4.10 pull request.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
