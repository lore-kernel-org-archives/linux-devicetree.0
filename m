Return-Path: <SRS0=Varz=OT=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1544443624-65471-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1544443624-65471-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Dec 2018 13:19:42 +0100
Message-ID: <CAMuHMdXGmCdHhuQ303Nc4DZ5yPKs+vJN3Zxx2HKGomW4AenvRw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7743: Remove aliases from SoC dtsi
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Dec 10, 2018 at 1:15 PM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch removes aliases from SoC dtsi tree. Device aliases are
> board-specific, if needed define it in board dts rather than SoC
> dtsi.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
