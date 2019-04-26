From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V7 2/4] drivers/perf: imx_ddr: Add ddr performance
 counter support
Date: Fri, 26 Apr 2019 18:14:36 +0100
Message-ID: <20190426171435.GD4884@lakrids.cambridge.arm.com>
References: <1556219971-27322-1-git-send-email-Frank.Li@nxp.com>
 <1556219971-27322-2-git-send-email-Frank.Li@nxp.com>
 <20190426135132.GA4884@lakrids.cambridge.arm.com>
 <CAHrpEqQ9htVMYkOfLcxN3wFDjAopkgG6C9oB73dVbeAPm6k68w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAHrpEqQ9htVMYkOfLcxN3wFDjAopkgG6C9oB73dVbeAPm6k68w@mail.gmail.com>
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
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "will.deacon@arm.com" <will.deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 26, 2019 at 11:46:54AM -0500, Zhi Li wrote:
> On Fri, Apr 26, 2019 at 8:51 AM Mark Rutland <mark.rutland@arm.com> wrote:
> > On Thu, Apr 25, 2019 at 07:19:46PM +0000, Frank Li wrote:
> > > +static irqreturn_t ddr_perf_irq_handler(int irq, void *p)
> > > +{
> > > +     int i;
> > > +     struct ddr_pmu *pmu = (struct ddr_pmu *) p;
> > > +     struct perf_event *event;
> > > +
> > > +     /* Only cycles counter overflowed can issue irq. all counters will
> > > +      * be stopped when cycles counter overflow. but other counter don't stop
> > > +      * when overflow happen. Update all of the local counter values,
> > > +      * then reset the cycles counter, so the others can continue
> > > +      * counting. cycles counter is fastest counter in all events. at last
> > > +      * 4 times than other counters.
> > > +      */
> >
> > Let's make this:
> >
> >         /*
> >          * When the cycle counter overflows, all counters are stopped,
> >          * and an IRQ is raised. If any other counter overflows, it
> >          * continues counting, and no IRQ is raised.
> >          *
> >          * Cycles occur at least 4 times as often as other events, so we
> >          * can update all events on a cycle counter overflow and not
> >          * lose events.
> >          */
> >
> > > +     for (i = 0; i < NUM_COUNTER; i++) {
> > > +
> > > +             if (!pmu->active_events[i])
> > > +                     continue;
> > > +
> > > +             event = pmu->active_events[i];
> > > +
> > > +             ddr_perf_event_update(event);
> > > +
> > > +             if (event->hw.idx == EVENT_CYCLES_COUNTER) {
> > > +                     ddr_perf_event_enable(pmu,
> > > +                                           EVENT_CYCLES_ID,
> > > +                                           EVENT_CYCLES_COUNTER,
> > > +                                           true);
> > > +                     ddr_perf_event_update(event);
> > > +             }
> > > +     }
> >
> > This allows events to be counting during the IRQ handler, and will lead
> > to skid within event groups. I think that we should disable the cycle
> > counter before the loop, and enable it afterwards in order to avoid
> > that.
> >
> > If you implement pmu_{enable,disable}() as suggested above, you can use
> > those here.
> 
> All counter will stop automatically by hardware when overflow happen.

That's true (and I had forgotten this), but there's still a potential
problem depending on IRQ latency.

For example, an overflow might occur just before we do some other
programming of the PMU (while the CPU has IRQs disabled) where we
restart the cycle counter (and the IRQ is de-asserted).

Depending on when the interrupt controller samples the state of that
IRQ, and when the CPU takes a resulting interrupt, we may be able to end
up in the IRQ handler with the cycle counter enabled. Explicitly
disabling the cycle counter avoids that possibility.

Regardless, we'll want to move the enable of the cycle counter last to
ensure that groups aren't skewed.

Thanks,
Mark.
