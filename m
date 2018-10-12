From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 00/16] clk: at91: Rework DT bindings
Date: Fri, 12 Oct 2018 12:50:43 -0700
Message-ID: <153937384305.5275.9319960324791639711@swboyd.mtv.corp.google.com>
References: <20180717222757.10253-1-alexandre.belloni@bootlin.com>
 <153271100280.48062.2538655794734424353@swboyd.mtv.corp.google.com>
 <20180816114755.GH21707@piout.net>
 <153573753043.93865.2420370848457480370@swboyd.mtv.corp.google.com>
 <153936888640.5275.18223880548754104359@swboyd.mtv.corp.google.com>
 <20181012184017.GH2843@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181012184017.GH2843@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Alexandre Belloni (2018-10-12 11:40:17)
> On 12/10/2018 11:28:06-0700, Stephen Boyd wrote:
> > Quoting Stephen Boyd (2018-08-31 10:45:30)
> > > Quoting Alexandre Belloni (2018-08-16 04:47:55)
> > > > On 27/07/2018 10:03:22-0700, Stephen Boyd wrote:
> > > > > Quoting Alexandre Belloni (2018-07-17 15:27:41)
> > > > > > This is the promised rework of the at91 PMC clocks driver. It i=
s mainly
> > > > > > necessary to remove the DTC warnings but it also complies with =
the CCF
> > > > > > rule that there should be one node per controller instead of on=
e node
> > > > > > per clock.
> > > > > > =

> > > > > > This only handles the PMC, I'm planning to also rework the SCKC=
 bindings
> > > > > > later (without breaking the DT ABI).
> > > > > > =

> > > > > > The series is based on top of clk-next plus at91-dt so I don't =
think it
> > > > > > is convenient to have it this cycle. However, I would really li=
ke to
> > > > > > ensure we agree on the new bindings this cycle before convertin=
g all the
> > > > > > other platforms as this is a bit tedious.
> > > > > > =

> > > > > > The first two patches are actually fixes and may be considered =
for this
> > > > > > cycle.
> > > > > > =

> > > > > > One nice note:
> > > > > > at91-sama5d2_xplained.dtb goes from 29351 bytes to 22082 bytes
> > > > > =

> > > > > Patches look mostly good. Rob is happy with the bindings and so a=
m I.
> > > > > =

> > > > > One general question is why the drivers can't be moved to real pl=
atform
> > > > > drivers instead of using OF_CLK_DECLARE?
> > > > > =

> > > > =

> > > > I tried, this makes the clocksource drivers fail with -EPROBE_DEFER=
 and
> > > > so the kernel just stops there.
> > > > =

> > > =

> > > Ok. We have CLK_OF_DECLARE_DRIVER for that. Can you use that?
> > > =

> > =

> > I assume this will be resent. I haven't seen anything yet though.
> > =

> =

> It will, would you be willing to take it for this cycle if I manage to
> send it on Monday? (it seems that we will have an -rc8).
> =


Well there are fixes to be made, so go at your own pace and don't stress
yourself to deliver it on Monday. I plan to stop picking most things
early next week.
