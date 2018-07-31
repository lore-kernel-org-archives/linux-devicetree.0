Return-Path: <SRS0=7BaO=KP=verge.net.au=horms@kernel.org>
Date: Tue, 31 Jul 2018 12:27:59 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/3] serial: sh-sci: Add support for RZ/A2
Message-ID: <20180731102758.a2nika7uqyrdvknk@verge.net.au>
References: <20180725143850.32985-1-chris.brandt@renesas.com>
 <CAMuHMdV=GDmte8uqi2hoy6Cu190uX6stdPkipmsDjan8L5oZRA@mail.gmail.com>
 <TYXPR01MB1568B3A6928B55E665AA626F8A2B0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAMuHMdX1piAAJeX+C=xr2ZG6Pe4_W+XH6ugURWny0rcJ3En0ew@mail.gmail.com>
 <20180728145515.GB19385@kroah.com>
 <TY1PR01MB1562F9D26B585AEF757E31518A290@TY1PR01MB1562.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1562F9D26B585AEF757E31518A290@TY1PR01MB1562.jpnprd01.prod.outlook.com>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Sat, Jul 28, 2018 at 03:55:14PM +0000, Chris Brandt wrote:
> On Saturday, July 28, 2018 1, Greg KH wrote:
> > > > In your opinion, which one would be better (revert or rebase)?
> > >
> > > [looking at the incremental differences]
> > >
> > > I think the easiest for Greg is to rebase, and send 3 patches:
> > 
> > Greg does not rebase his public trees.  Nor should anyone else :)
> > 
> > I can revert patches if you want me to, just let me know what ones.  Or
> > send incremental patches on top of my tree please.  But no reverts are
> > going to be happening.

s/no reverts/no rebases/ ?

> 
> Yesterday I sent a new patch series that will apply on top of the 
> current tty-next and basically reverts what I did and replaces it with a 
> new version that incorporates Geert's suggestions. So no reverts are
> needed.
> 
> I assume now I'm just waiting to see if Geert has any feedback on the 
> new series.
> 
> Chris
> 
