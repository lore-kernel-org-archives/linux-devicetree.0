Return-Path: <SRS0=slpH=LY=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <72db4d8d-7b3d-7368-02a4-f652a7bc810d@cogentembedded.com>
In-Reply-To: <72db4d8d-7b3d-7368-02a4-f652a7bc810d@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Sep 2018 16:24:03 +0200
Message-ID: <CAMuHMdW3nfPNOPQR9mWN+tdtLRz8LwR797gzORG7RRiiiHYeHQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: renesas: tmu: document R8A779{7|8}0 bindings
Content-Type: text/plain; charset="UTF-8"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Sergei,

On Fri, Sep 7, 2018 at 10:03 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Document the R-Car V3{M|H} (R8A779{7|8}0) SoC in the Renesas TMU bindings;
> the TMU hardware in those is the Renesas standard 3-channel timer unit.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

Not all channels seem to be identical, but the driver just matches against
the "renesas,tmu" fallback?
In addition, the V3H TMU seems to differ from the TMU in other R-Car Gen3
variants?

How is this handled?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
