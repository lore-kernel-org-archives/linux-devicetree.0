From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v9 3/5] ARM: dts: Renesas R9A06G032 base device tree file
Date: Fri, 29 Jun 2018 16:45:06 +0200
Message-ID: <20180629144505.xcencoba4ru6tiee@verge.net.au>
References: <1528973829-25493-1-git-send-email-michel.pollet@bp.renesas.com>
 <1528973829-25493-4-git-send-email-michel.pollet@bp.renesas.com>
 <20180628120031.eq2yuysz4re2olwn@verge.net.au>
 <20180628121609.jf4dp4azeowte7pb@verge.net.au>
 <CAMuHMdWqowQjZ8Wsdj6ne-+UG8-OY_j6pi3R9JPP6L7ZgRhvBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWqowQjZ8Wsdj6ne-+UG8-OY_j6pi3R9JPP6L7ZgRhvBQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michel Pollet <michel.pollet@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Phil Edworthy <phil.edworthy@renesas.com>, Michel Pollet <buserror+upstream@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 28, 2018 at 02:45:41PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Thu, Jun 28, 2018 at 2:16 PM Simon Horman <horms@verge.net.au> wrote:
> > On Thu, Jun 28, 2018 at 02:00:32PM +0200, Simon Horman wrote:
> > > On Thu, Jun 14, 2018 at 11:56:32AM +0100, Michel Pollet wrote:
> > > > This adds the Renesas R9A06G032 bare bone support.
> > > >
> > > > This currently only handles the SYSCTRL block note,
> > > > generic parts (gic, architected timer) and a UART.
> > > >
> > > > Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> > >
> > > Thanks, applied with the following appended:
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 9d5eeff51b5f..4c85ac04872d 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -1969,6 +1969,7 @@ S:      Supported
> > >  F:   arch/arm/boot/dts/emev2*
> > >  F:   arch/arm/boot/dts/r7s*
> > >  F:   arch/arm/boot/dts/r8a*
> > > +F:   arch/arm/boot/dts/r9a*
> > >  F:   arch/arm/boot/dts/sh*
> > >  F:   arch/arm/configs/shmobile_defconfig
> > >  F:   arch/arm/include/debug/renesas-scif.S
> >
> > One more update.
> >
> > dt-bindings/clock/r9a06g032-sysctrl.h is not present in v4.18-rc1,
> > current base of the renesas tree and likely base for the rest of the v4.19
> > development cycle.
> >
> > Accordingly I have removed the include of that header and replaced
> > the use of symbols it defines with numeric constants. The result is below.
> 
> Oh right. Thanks!
> 
> > Please:
> > 1) Check that this is correct and
> 
> Looks good to me, except for the bogus "fixes" and "SoB" below
> (bad squash?)
> 
> > From: Michel Pollet <michel.pollet@bp.renesas.com>
> > Subject: [PATCH] ARM: dts: Renesas R9A06G032 base device tree file
> >
> > This adds the Renesas R9A06G032 bare bone support.
> >
> > This currently only handles the SYSCTRL block note,
> > generic parts (gic, architected timer) and a UART.
> >
> > Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > [simon: updated MAINTAINERS file
> > [simon: do not use r9a06g032-sysctrl.h as it is not in the renesas tree yet]
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> >
> > fixes
>   ^^^^^
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>   ^^^^
> 
> Gr{oetje,eeting}s,

Thanks, I'll remove that trailing garbage.
