Return-Path: <SRS0=Rhmc=MI=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1537894864-61987-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1537894864-61987-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Sep 2018 13:31:50 +0200
Message-ID: <CAMuHMdUFkAm15XCUqx8XtcfODGNPk9DfoUF5QkjgKnSV4gYnFg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: thermal: rcar: Add device tree support for r8a7744
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Linux PM list <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Sep 25, 2018 at 7:08 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Add thermal sensor support for r8a7744 SoC. The Renesas RZ/G1N
> (r8a7744) thermal sensor module is identical to the R-Car Gen2 family.
>
> No driver change is needed due to the fallback compatible value
> "renesas,rcar-gen2-thermal".
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
