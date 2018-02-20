Return-Path: <SRS0=1RDa=FO=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <644095ad-42c5-a4fc-728a-76377938d2f1@cogentembedded.com>
References: <644095ad-42c5-a4fc-728a-76377938d2f1@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2018 13:47:51 +0100
Message-ID: <CAMuHMdXR5vrB-qR6uX3KZgKxJyCdUzQ_y_4rDR9n_5pgKZ_PYQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Renesas R8A77980 CPG/MSSR clock support
Content-Type: text/plain; charset="UTF-8"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Feb 15, 2018 at 12:54 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Here's the set of 2 patches against the 'clk-renesas' branch of Geert Uytterhoeven's
> 'renesas-drivers.git' repo. We're adding the CPG/MSSR driver support for R8A77980...
>
> [1/2] dt-bindings: clock: add R8A77980 CPG core clock definitions
> [2/2] clk: renesas: cpg-mssr: add R8A77980 support

Thanks, queued in clk-renesas-for-v4.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
