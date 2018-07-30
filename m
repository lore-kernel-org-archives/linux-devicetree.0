Return-Path: <SRS0=hJ7p=KO=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180730131716.75484-1-chris.brandt@renesas.com> <20180730131716.75484-3-chris.brandt@renesas.com>
In-Reply-To: <20180730131716.75484-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jul 2018 16:19:06 +0200
Message-ID: <CAMuHMdXHACOE-DU5CRVpn8jgpyCD_74PdttWY2Y_JTT-z8K8iQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] serial: sh-sci: Allow for compressed SCIF address
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jul 30, 2018 at 3:17 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Some devices with SCIx_SH4_SCIF_REGTYPE have no space between registers.
> Use the register area size to determine the spacing between register.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
> * adjust for case of SCIx_PROBE_REGTYPE

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
