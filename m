Return-Path: <SRS0=FVg4=KM=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180725143850.32985-1-chris.brandt@renesas.com>
 <CAMuHMdV=GDmte8uqi2hoy6Cu190uX6stdPkipmsDjan8L5oZRA@mail.gmail.com>
 <TYXPR01MB1568B3A6928B55E665AA626F8A2B0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAMuHMdX1piAAJeX+C=xr2ZG6Pe4_W+XH6ugURWny0rcJ3En0ew@mail.gmail.com> <20180728145515.GB19385@kroah.com>
In-Reply-To: <20180728145515.GB19385@kroah.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 28 Jul 2018 21:28:08 +0200
Message-ID: <CAMuHMdVMAxHEm+JYOqn-a9ZZde6uZG1Fo9fhuo5XcM-roFes=Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] serial: sh-sci: Add support for RZ/A2
Content-Type: text/plain; charset="UTF-8"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Chris Brandt <Chris.Brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Greg,

On Sat, Jul 28, 2018 at 4:55 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> On Thu, Jul 26, 2018 at 03:01:11PM +0200, Geert Uytterhoeven wrote:
> > On Thu, Jul 26, 2018 at 2:25 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> > > On Thursday, July 26, 2018, Geert Uytterhoeven wrote:
> > > > Thanks for your series!
> > > >
> > > > Unfortunately Greg has already applied your v1 (and my fix for a
> > > > use-after-free), so either these have to be reverted first, or you have to
> > > > rebase against tty-next.
> > >
> > > I assume you would prefer the newer implementation I did.
> > >
> > > In your opinion, which one would be better (revert or rebase)?
> >
> > [looking at the incremental differences]
> >
> > I think the easiest for Greg is to rebase, and send 3 patches:
>
> Greg does not rebase his public trees.  Nor should anyone else :)

I know ;-)

FTR, the sentence above was addressed to Chris:
"I think the easiest for Greg(,) is (for you) to rebase (your tree), and send 3
 patches".
Which is what Chris did in the mean time.

Apparently I didn't formulate it well. Will try to do better in the future.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
