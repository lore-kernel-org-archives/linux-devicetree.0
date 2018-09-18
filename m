Return-Path: <SRS0=npSy=MA=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1536748914-27416-1-git-send-email-fabrizio.castro@bp.renesas.com> <1536748914-27416-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1536748914-27416-2-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Sep 2018 09:58:39 +0200
Message-ID: <CAMuHMdUEPoEdfrPCRDODgQb4gDfKEXVzg5OTx8_f0xunqsKP7Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: Add r8a774c0 CPG Core Clock Definitions
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Biju Das <biju.das@bp.renesas.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 12, 2018 at 12:42 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add all RZ/G2E (a.k.a. R8A774C0) Clock Pulse Generator Core
> Clock Outputs, as listed in Table 8.2g ("List of Clocks
> [RZ/G2E]") of the RZ/G2 Hardware User's Manual.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
