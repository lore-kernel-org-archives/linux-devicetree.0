Return-Path: <SRS0=ZLLA=V4=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190731133936.18228-1-geert+renesas@glider.be> <TY1PR01MB156262DA5C9260BEE51472268ADF0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB156262DA5C9260BEE51472268ADF0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 31 Jul 2019 17:02:57 +0200
Message-ID: <CAMuHMdV0xc=Ygmjk74-wsfNrODFMwDuzKmrskDx8FUAzzqOFPQ@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: dts: rza2mevb: Fix numbering of Ethernet aliases
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Jul 31, 2019 at 4:28 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wed, Jul 31, 2019, Geert Uytterhoeven wrote:
> > The two Ethernet ports on the RZA2MEVB development board are labeled
> > "Ether1" and "Ether2".  Reflect this numbering in the ethernet aliases.
>
> However, the channels are labeled as ETHERC0 and ETHERC1 in the hardware
> manual.
>
> So I guess my question is, in general, is the board specific Device Tree
> supposed to describe what is on the SoC? Or on the board silk screen?

AFAIK the aliases numbering is supposed to match the board or case labels.

> Maybe this is like "COM1" is labeled on PC motherboard and we expect it
> to show up as /dev/ttyS0 regardless of what physical serial port it is
> connected to.

Those pesky FORTRAN programmers, counting from 1 ;-)

On Koelsch (and Salvator-X(S)), they are called "debug0" and "debug1".

These used to be /dev/ttySC6 and /dev/ttySC7, but got renamed in
commit 1f75cdac773bc9c9 ("ARM: shmobile: koelsch: Rename SCIF[01] serial
ports to ttySC[01]").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
