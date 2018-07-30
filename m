Return-Path: <SRS0=hJ7p=KO=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180727210916.66642-1-chris.brandt@renesas.com> <20180727210916.66642-4-chris.brandt@renesas.com>
In-Reply-To: <20180727210916.66642-4-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jul 2018 11:03:12 +0200
Message-ID: <CAMuHMdVAdAfAYScOuTLLFCCsokE4-gOona7NsMCo+ct4L0R5qA@mail.gmail.com>
Subject: Re: [PATCH 3/4] serial: sh-sci: Remove SCIx_RZ_SCIFA_REGTYPE
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 27, 2018 at 11:09 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> There is no more need for SCIx_RZ_SCIFA_REGTYPE now that
> SCIx_SH4_SCIF_REGTYPE can provide the same register/address definitions.
>
> Also, R7S9210 no longer needs a special compatible since the standard
> "renesas,scif" will work just fine.
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
