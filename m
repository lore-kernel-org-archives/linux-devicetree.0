Return-Path: <SRS0=Qj0e=KK=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180725143850.32985-1-chris.brandt@renesas.com>
In-Reply-To: <20180725143850.32985-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jul 2018 13:43:19 +0200
Message-ID: <CAMuHMdV=GDmte8uqi2hoy6Cu190uX6stdPkipmsDjan8L5oZRA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] serial: sh-sci: Add support for RZ/A2
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Jul 25, 2018 at 4:39 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> The RZ/A2 uses a modified SCIF that until recently was only used in
> Renesas MCU devices (not MPU devices).
> So, while it functions mostly the same as a normal SCIF, some things
> needed to be shifted around.
>
> In the end, a standard compatible = "renesas,scif" is all that is really
> needed (not a SoC specific "renesas,scif-r7s9210").

> Chris Brandt (3):
>   serial: sh-sci: Allow for compressed SCIF address space
>   serial: sh-sci: Add support for separate TEI+DRI interrupts
>   serial: sh-sci: Document r7s9210 bindings
>
>  .../bindings/serial/renesas,sci-serial.txt         | 17 +++++-
>  drivers/tty/serial/sh-sci.c                        | 66 ++++++++++++++++++----
>  2 files changed, 70 insertions(+), 13 deletions(-)

Thanks for your series!

Unfortunately Greg has already applied your v1 (and my fix for a
use-after-free), so either these have to be reverted first, or you have to
rebase against tty-next.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
