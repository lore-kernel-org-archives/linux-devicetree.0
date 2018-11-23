Return-Path: <SRS0=32CY=OC=verge.net.au=horms@kernel.org>
Date: Fri, 23 Nov 2018 13:37:03 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
Message-ID: <20181123123703.t6dsjwrdk2oirkar@verge.net.au>
References: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
 <20181121102421.yxndb3dyfxput25f@verge.net.au>
 <OSBPR01MB2103BCCCF78DA986B112C8A8B8DA0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103BCCCF78DA986B112C8A8B8DA0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Nov 21, 2018 at 10:27:41AM +0000, Biju Das wrote:
> Hi Simon,
> 
> Thanks for the feedback.
> 
> > -----Original Message-----
> > From: Simon Horman <horms@verge.net.au>
> > Sent: 21 November 2018 10:24
> > To: Biju Das <biju.das@bp.renesas.com>
> > Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> > <mark.rutland@arm.com>; Magnus Damm <magnus.damm@gmail.com>;
> > linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; Geert
> > Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
> > <Chris.Paterson2@renesas.com>; Daniel Lezcano
> > <daniel.lezcano@linaro.org>; Thomas Gleixner <tglx@linutronix.de>; John
> > Stultz <john.stultz@linaro.org>; Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com>
> > Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
> >
> > On Fri, Oct 26, 2018 at 09:25:07AM +0100, Biju Das wrote:
> > > This patch adds CMT{0|1|2|3} device nodes for r8a7796 SoC.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > ---
> > > This patch is tested against renesas-dev
> > >
> > > I have executed on inconsistency-check, nanosleep and
> > > clocksource_switch selftests on this arm64 SoC. The
> > > inconsistency-check and nanosleep tests are working fine.The
> > > clocksource_switch asynchronous test is failing due to inconsistency-check
> > failure on "arch_sys_counter".
> > >
> > > But if i skip the clocksource_switching of "arch_sys_counter", the
> > > asynchronous test is passing for CMT0/1/2/3 timer.
> > >
> > > Has any one noticed this issue?
> >
> > I am reluctant to apply this patch until there is a better understanding of the
> > issue above.
> 
> If I understand correctly this patch has no issue at all. The problem is related to ARM architecture  timer.
> Please correct me if you think otherwise.

Thanks for the clarification, I have applied this patch for v4.21.
