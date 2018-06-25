From: Michel Pollet <michel.pollet@bp.renesas.com>
Subject: RE: [PATCH v6 2/3] arm: shmobile: Add the R9A06G032 SMP enabler
 driver
Date: Mon, 25 Jun 2018 10:37:15 +0000
Message-ID: <OSBPR01MB20545582133969454236476AD24A0@OSBPR01MB2054.jpnprd01.prod.outlook.com>
References: <1529915110-5867-1-git-send-email-michel.pollet@bp.renesas.com>
 <1529915110-5867-3-git-send-email-michel.pollet@bp.renesas.com>
 <CAMuHMdVarwq26Jr=YN+zBDrHjQf-Q+u3L6oRNiSKh-hxuwOsrA@mail.gmail.com>
 <20180625094249.b6dwnraqruicmo2u@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180625094249.b6dwnraqruicmo2u@verge.net.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Phil Edworthy <phil.edworthy@renesas.com>, Michel Pollet <buserror+upstream@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Rajendra Nayak <rnayak@codeaurora.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Andy Gross <andy.gross@linaro.org>, Carlo Caione <carlo@endlessm.com>, Stefan Wahren <stefan.wahren@i2se.com>, Chen-Yu Tsai <wens@csie.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


On 25 June 2018 10:43, Simon wrote:
>
> On Mon, Jun 25, 2018 at 11:24:48AM +0200, Geert Uytterhoeven wrote:
> > Hi Michel,
> >
> > On Mon, Jun 25, 2018 at 10:31 AM Michel Pollet
> > <michel.pollet@bp.renesas.com> wrote:
> > > The Renesas R9A06G032 second CA7 is parked in a ROM pen at boot
> > > time, it requires a special enable method to get it started.
> > >
> > > Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  arch/arm/mach-shmobile/Makefile        |  1 +
> > >  arch/arm/mach-shmobile/smp-r9a06g032.c | 96
> > > ++++++++++++++++++++++++++++++++++
> > >  2 files changed, 97 insertions(+)
> > >  create mode 100644 arch/arm/mach-shmobile/smp-r9a06g032.c
> >
> > Given this doesn't depend on anything under arch/arm/mach-shmobile/,
> > perhaps this should be moved to drivers/soc/renesas/ (and renamed to
> > r9a06g032-smp.c for consistency) instead?
> >
> > Simon: what do you think?
>
> Yes, I think that would be nice.

So, do you guys want me to try to integrate this with the subsystem there, =
with
The renesas-soc bits, or should I just plonk the driver in and change the m=
akefile?

Secondary question: is it to for me to repost with these changes ASAP?

Cheers
Michel




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
