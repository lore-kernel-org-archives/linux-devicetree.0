Return-Path: <SRS0=/GZV=QW=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1550233589-13891-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1550233589-13891-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Feb 2019 14:02:27 +0100
Message-ID: <CAMuHMdXXovDP-Ss2UvnXPVNGx5Tp=z9pwuWLJedfhN1GjaoS_Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Fix cpu nodes style
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Feb 15, 2019 at 1:26 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> We usually leave a space between "=" and the value of device
> tree properties, but unfortunately that was overlooked for the
> "clocks" property of cpu@0 and cpu@1.
> This patch fixes the spacing with the "clocks" property of
> cpu@0 and cpu@1.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
