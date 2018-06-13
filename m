From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v8 2/5] dt-bindings: clock: renesas,r9a06g032-sysctrl: documentation
Date: Wed, 13 Jun 2018 09:17:24 +0200
Message-ID: <CAMuHMdUtdRB_L-WsphJYBd9m-3tth3KHGK1wWdr_UJF18S9Z5A@mail.gmail.com>
References: <1528187462-47093-1-git-send-email-michel.pollet@bp.renesas.com>
 <1528187462-47093-3-git-send-email-michel.pollet@bp.renesas.com>
 <CAMuHMdWoE=+sEUtFdPKk4eBGtOn8f7bUPV-HLAvEETuqgVMeVw@mail.gmail.com> <OSBPR01MB2054D7F35A31A8331B906E05D27E0@OSBPR01MB2054.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <OSBPR01MB2054D7F35A31A8331B906E05D27E0@OSBPR01MB2054.jpnprd01.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michel Pollet <michel.pollet@bp.renesas.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Phil Edworthy <phil.edworthy@renesas.com>, Michel Pollet <buserror+upstream@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Michel,

On Wed, Jun 13, 2018 at 8:38 AM Michel Pollet
<michel.pollet@bp.renesas.com> wrote:
> On 11 June 2018 11:01, Geert wrote:
> > On Tue, Jun 5, 2018 at 10:36 AM Michel Pollet
> > <michel.pollet@bp.renesas.com> wrote:
> > > The Renesas R9A06G032 SYSCTRL node description.
> > >
> > > Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-
> > sysctr
> > > +++ l.txt
> > > @@ -0,0 +1,32 @@
> > > +* Renesas R9A06G032 SYSCTRL
> > > +
> > > +Required Properties:
> > > +
> > > +  - compatible: Must be:
> > > +    - "renesas,r9a06g032-sysctrl"
> > > +  - reg: Base address and length of the SYSCTRL IO block.
> > > +  - #clock-cells: Must be 1
> >
> > (repeating myself) No clocks/clock-names for the external clock inputs?
> >
> > "RZ/N1 has 3 clock sources, 1 reference clock inputs for RGMII, and 2
> > reference clock outputs for RMII/MII."
>
> Well, I'm trying to keep the binding as simple as possible, to dodge any
> further discussion. Adding these will be possible later, I don't need them
> for the moment anyway.

Don't you? The external clock inputs are at the root of the clock tree, so I'd
say you need them. Bolting them on later may become complicated, especially
if you care about DTB backwards compatibility.

The reset controller subsystem is optional anyway, and used only by a small
number of drivers, so support for resets can definitely be postponed.

> Did you have a chance to review the clock driver proper? I'm pondering
> sending a v9 since it's been a week (with very minor changes) -- but I
> don't want to interrupt if you were in the process of reviewing...

I had a quick glance. Looks OK mostly, so it's definitely heading for the right
direction!
One remaining question: do you need CLK_OF_DECLARE()?
Is there any reason your clock driver cannot be a platform driver, which is
the recommended way?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
