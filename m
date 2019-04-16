From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH V4 2/4] drivers/perf: imx_ddr: Add ddr performance
 counter support
Date: Tue, 16 Apr 2019 14:51:16 +0100
Message-ID: <20190416135116.GC3313@fuggles.cambridge.arm.com>
References: <1550253761-26841-1-git-send-email-Frank.Li@nxp.com>
 <1550253761-26841-2-git-send-email-Frank.Li@nxp.com>
 <20190404111714.GA26392@fuggles.cambridge.arm.com>
 <CAHrpEqT67OpeGXB7wgYSsTD9ibG_jk7xO5zMFyxcG5PHFP-bJg@mail.gmail.com>
 <20190405143846.GB7313@fuggles.cambridge.arm.com>
 <CAHrpEqSerorArZwSgj5qkFQQgwit5mqPWp5DD6PmYJiLejPJfw@mail.gmail.com>
 <20190405150319.GA7704@fuggles.cambridge.arm.com>
 <CAHrpEqQnJAdUeKLUFE0r6DxnCtitEumvgd5xOzKmJmYXy3mQ4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAHrpEqQnJAdUeKLUFE0r6DxnCtitEumvgd5xOzKmJmYXy3mQ4w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Zhi Li <lznuaa@gmail.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, Frank Li <frank.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 08, 2019 at 02:10:28PM -0500, Zhi Li wrote:
> On Fri, Apr 5, 2019 at 10:03 AM Will Deacon <will.deacon@arm.com> wrote:
> >
> > On Fri, Apr 05, 2019 at 09:58:38AM -0500, Zhi Li wrote:
> > > On Fri, Apr 5, 2019 at 9:38 AM Will Deacon <will.deacon@arm.com> wrote:
> > > > On Fri, Apr 05, 2019 at 09:34:38AM -0500, Zhi Li wrote:
> > > > > On Thu, Apr 4, 2019 at 6:17 AM Will Deacon <will.deacon@arm.com> wrote:
> > > > > > On Fri, Feb 15, 2019 at 06:03:11PM +0000, Frank Li wrote:
> > > > > > > Add ddr performance monitor support for iMX8QXP
> > > > > > >
> > > > > > > There are 4 counters for ddr perfomance events.
> > > > > > > counter 0 is dedicated for cycles.
> > > > > > > you choose any up to 3 no cycles events.
> > > > > > >
> > > > > > > for example:
> > > > > > >
> > > > > > > perf stat -a -e ddr0/read-access/,ddr0/write-access/,ddr0/precharge/ ls
> > > > > > > perf stat -a -e ddr0/cycles/,ddr0/read-access/,ddr0/write-access/ ls
> > > > > >
> > > > > > Could you elaborate a bit on DDR_CAP_AXI_ID, please? Specifically, how
> > >
> > > Only imx845 have AXID filter capability now.
> > >
> > > > > > does the COUNTER_DPCR1 register work and what happens if I specify two
> > > > > > simultaneous events with different values in config1? I'm a little wary
> > >
> > > There are difference match register for each event.
> > > 1. Read event with config 1 A
> > > 2. Read event with config 1 B
> > >
> > > 1 will show read count with filter A
> > > 2 will show read count with filter B.
> >
> > Thanks, that makes sense, but I can't see how that corresponds to the code
> > in the patch:
> >
> > +static void ddr_perf_event_start(struct perf_event *event, int flags)
> > +{
> > +       struct ddr_pmu *pmu = to_ddr_pmu(event->pmu);
> > +       struct hw_perf_event *hwc = &event->hw;
> > +       int counter = hwc->idx;
> > +
> > +       if (pmu->flags & DDR_CAP_AXI_ID) {
> > +               if (event->attr.config == EVENT_AXI_READ ||
> > +                   event->attr.config == EVENT_AXI_WRITE) {
> > +                       int val = event->attr.config1;
> > +
> > +                       writel(val, pmu->base + COUNTER_DPCR1);
> > +               }
> > +       }
> > +
> > +       local64_set(&hwc->prev_count, 0);
> > +
> > +       ddr_perf_event_enable(pmu, event->attr.config, counter, true);
> >
> > ddr_perf_event_enable() does what you'd expect, and uses hwc->idx to
> > allocate a counter, but the code before it just always writes to DPCR1.
> >
> > What am I missing?
> 
> I double check with our IC design team. My previous answer is wrong.
> Only one DPCR1. It will impact all event EVENT_AXI_READ and  EVENT_AXI_WRITE.
> 
> Thank means just choose one config1 for event EVENT_AXI_READ or EVENT_AXI_WRITE

I think you need either to enforce that in the driver, or drop this
filtering capability for now. We shouldn't just tell userspace "oh yeah,
don't do that."

Given that your patch 3 (which updates a .dts file) doesn't appear to
support the filtering, I suggest just dropping that support initially so
that we can queue the rest of this driver for 5.2.

Will
