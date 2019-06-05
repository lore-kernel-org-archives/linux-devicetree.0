Return-Path: <SRS0=qvV9=UE=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190604200914.64896-1-chris.brandt@renesas.com> <20190604200914.64896-2-chris.brandt@renesas.com>
In-Reply-To: <20190604200914.64896-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2019 15:14:17 +0200
Message-ID: <CAMuHMdXocLb+d7Qv9=qe+bYG27pJO5sMUDkdWmj1WFqZ9JiQTw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: r7s9210: Add IRQC device node
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jun 4, 2019 at 10:09 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Enable support for the IRQC on RZ/A2M, which is a small front-end to the
> GIC.  This allows to use up to 8 external interrupts with configurable
> sense select.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
