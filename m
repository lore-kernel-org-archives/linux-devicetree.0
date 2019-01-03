Return-Path: <SRS0=4w2F=PL=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com> <1544000815-28069-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1544000815-28069-4-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Jan 2019 14:47:45 +0100
Message-ID: <CAMuHMdX-haM7YwUXRo7JtEZ4dt6MxbHv5VeTGTAgP-2+4iN8mA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] ARM: dts: r8a7744: Add DU support
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Wed, Dec 5, 2018 at 10:15 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add du node to r8a7744 SoC DT. Boards that want to enable the DU
> need to specify the output topology.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks for your patch!

> ---
> V1-->V2
>         * Removed LVDS encoder definition from DU node.

Shouldn't you add a new node for the LVDS encoder?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
