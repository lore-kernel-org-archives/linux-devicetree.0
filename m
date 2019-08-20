From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 6/7] clocksource/drivers/sh_cmt: r8a7740 and sh73a0
 SoC-specific match
Date: Tue, 20 Aug 2019 17:22:50 +0200
Message-ID: <20190820152249.kg3udh2aonjusbqk@verge.net.au>
References: <156345023791.5307.6113391102648394591.sendpatchset@octo>
 <156345032407.5307.16702422867507502597.sendpatchset@octo>
 <20190724111227.qaeq3d5mkeyvlkq3@verge.net.au>
 <CANqRtoTN3Ea6LK2BwdUevWOPRiquBWmw=foEDPMzsRut08QcPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANqRtoTN3Ea6LK2BwdUevWOPRiquBWmw=foEDPMzsRut08QcPA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Daniel Lezcano <daniel.lezcano@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 09:34:13PM +0900, Magnus Damm wrote:
> Hi Simon,
> 
> On Wed, Jul 24, 2019 at 8:12 PM Simon Horman <horms@verge.net.au> wrote:
> >
> > On Thu, Jul 18, 2019 at 08:45:24PM +0900, Magnus Damm wrote:
> > > From: Magnus Damm <damm+renesas@opensource.se>
> > >
> > > Add SoC-specific matching for CMT1 on r8a7740 and sh73a0.
> > >
> > > This allows us to move away from the old DT bindings such as
> > >  - "renesas,cmt-48-sh73a0"
> > >  - "renesas,cmt-48-r8a7740"
> > >  - "renesas,cmt-48"
> > > in favour for the now commonly used format "renesas,<soc>-<device>"
> > >
> > > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> >
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Thanks!
> 
> > > ---
> > >
> > >  drivers/clocksource/sh_cmt.c |    8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > --- 0001/drivers/clocksource/sh_cmt.c
> > > +++ work/drivers/clocksource/sh_cmt.c 2019-07-18 19:29:06.005414716 +0900
> > > @@ -928,6 +928,14 @@ static const struct of_device_id sh_cmt_
> > >               .data = &sh_cmt_info[SH_CMT0_RCAR_GEN2]
> > >       },
> > >       {
> > > +             .compatible = "renesas,r8a7740-cmt1",
> > > +             .data = &sh_cmt_info[SH_CMT_48BIT]
> >
> > Perhaps as a follow-up SH_CMT_48BIT could be renamed.
> 
> I was actually considering implementing proper 48-bit support, and
> reworking those names might be a good idea at that point.

Sure, I don't think there is any urgency on updating the name :)
