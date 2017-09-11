From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: add R8A77970 CPG core clock definitions
Date: Mon, 11 Sep 2017 16:03:16 +0200
Message-ID: <CAMuHMdVgir5ZriM+tcL6cHPCGcDg_oGtGaygdzGa3zLcO1aFvw@mail.gmail.com>
References: <20170908213758.670316956@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170908213758.670316956@cogentembedded.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 8, 2017 at 11:34 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add macros usable by the device tree sources to reference the R8A77970
> CPG core clocks by index. The data come from the table 8.2c of R-Car
> Series, 3rd Generation User's Manual: Hardware (Rev. 0.55, Jun. 30, 2017).
>
> Based on the original (and large) patch by Daisuke Matsushita
> <daisuke.matsushita.ns@hitachi.com>.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you, will queue in clk-renesas-for-v4.15.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
