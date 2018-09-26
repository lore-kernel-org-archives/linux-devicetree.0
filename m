Return-Path: <SRS0=Rhmc=MI=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1537950104-18330-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1537950104-18330-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Sep 2018 13:37:59 +0200
Message-ID: <CAMuHMdUPkbVs3UxqrP63Fx=25XvKCB=U5qy5TETydHT3=zi-tQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: Document iWave RZ/G1N SOM
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 26, 2018 at 10:28 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Document the iW-RainboW-G20M-RZ/G1N Qseven device tree bindings,
> listing it as a supported system on module.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
> iWave uses the same "iW-RainboW-G20M-Qseven" name for both
> iWave-RZ/G1N and iWave-RZ/G1M Q7 SOM. Details can be found
> in the below link
> https://www.iwavesystems.com/rz-g1m-qseven-module.html

Makes perfect sense, as the SoCs are pin-compatible.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
