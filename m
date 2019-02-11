Return-Path: <SRS0=hDg9=QS=gmail.com=lznuaa@kernel.org>
MIME-Version: 1.0
References: <1549650743-27581-1-git-send-email-Frank.Li@nxp.com> <20190211111937.GB9603@lakrids.cambridge.arm.com>
In-Reply-To: <20190211111937.GB9603@lakrids.cambridge.arm.com>
From: Zhi Li <lznuaa@gmail.com>
Date: Mon, 11 Feb 2019 10:33:04 -0600
Message-ID: <CAHrpEqTO=n2Nw6K8rqgK7=fPSCk51aZYB77nWvfsDJbYRBpspQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] drivers/perf: imx_ddr: Add ddr performance counter support
Content-Type: text/plain; charset="UTF-8"
To: Mark Rutland <mark.rutland@arm.com>
Cc: Frank Li <frank.li@nxp.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 11, 2019 at 5:19 AM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Fri, Feb 08, 2019 at 06:32:39PM +0000, Frank Li wrote:
> > Add ddr performance monitor support for iMX8QXP.
> > Support below events.
> >
> >   ddr0/activate/                                     [Kernel PMU event]
> >   ddr0/axid-read/                                    [Kernel PMU event]
> >   ddr0/axid-write/                                   [Kernel PMU event]
> >   ddr0/cycles/                                       [Kernel PMU event]
> >   ddr0/hp-read-credit-cnt/                           [Kernel PMU event]
> >   ddr0/hp-read/                                      [Kernel PMU event]
> >   ddr0/hp-req-nodcredit/                             [Kernel PMU event]
> >   ddr0/hp-xact-credit/                               [Kernel PMU event]
> >   ddr0/load-mode/                                    [Kernel PMU event]
> >   ddr0/lp-read-credit-cnt/                           [Kernel PMU event]
> >   ddr0/lp-req-nocredit/                              [Kernel PMU event]
> >   ddr0/lp-xact-credit/                               [Kernel PMU event]
> >   ddr0/mwr/                                          [Kernel PMU event]
> >   ddr0/precharge/                                    [Kernel PMU event]
> >   ddr0/raw-hazard/                                   [Kernel PMU event]
> >   ddr0/read-access/                                  [Kernel PMU event]
> >   ddr0/read-activate/                                [Kernel PMU event]
> >   ddr0/read-command/                                 [Kernel PMU event]
> >   ddr0/read-cycles/                                  [Kernel PMU event]
> >   ddr0/read-modify-write-command/                    [Kernel PMU event]
> >   ddr0/read-queue-depth/                             [Kernel PMU event]
> >   ddr0/read-write-transition/                        [Kernel PMU event]
> >   ddr0/read/                                         [Kernel PMU event]
> >   ddr0/refresh/                                      [Kernel PMU event]
> >   ddr0/selfresh/                                     [Kernel PMU event]
> >   ddr0/wr-xact-credit/                               [Kernel PMU event]
> >   ddr0/write-access/                                 [Kernel PMU event]
> >   ddr0/write-command/                                [Kernel PMU event]
> >   ddr0/write-credit-cnt/                             [Kernel PMU event]
> >   ddr0/write-cycles/                                 [Kernel PMU event]
> >   ddr0/write-queue-depth/                            [Kernel PMU event]
> >   ddr0/write/
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/perf/Kconfig             |   7 +
> >  drivers/perf/Makefile            |   1 +
> >  drivers/perf/fsl_imx8_ddr_perf.c | 532 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 540 insertions(+)
> >  create mode 100644 drivers/perf/fsl_imx8_ddr_perf.c
>
> [...]
>
> > +static void ddr_perf_event_start(struct perf_event *event, int flags)
> > +{
> > +     struct ddr_pmu *pmu = to_ddr_pmu(event->pmu);
> > +     struct hw_perf_event *hwc = &event->hw;
> > +     int counter = hwc->idx;
> > +
> > +     if (pmu->devtype->flags & DDR_CAP_AXI_ID) {
> > +             if (event->attr.config == 0x41 ||
> > +                 event->attr.config == 0x42) {
> > +                     int val = event->attr.config1;
> > +                     writel(val, pmu->base + COUNTER_DPCR1);
> > +             }
> > +     }
>
> What exactly is this, and why are 0x41 and 0x42 special?
>
> This should be described in the commit message, and probably in
> Documentation/perf/, given this is unusual.
>
> > +
> > +     local64_set(&hwc->prev_count, 0);
> > +
> > +     ddr_perf_event_enable(pmu, event->attr.config, counter, true);
> > +     /*
> > +      * If the cycles counter wasn't explicitly selected,
> > +      * we will enable it now.
> > +      */
> > +     if (counter > 0 && !pmu->cycles_active)
> > +             ddr_perf_event_enable(pmu, EVENT_CYCLES_ID,
> > +                                   EVENT_CYCLES_COUNTER, true);
> > +}
>
> Why do we need to enable the cycle counter?
>
> If this is a requirement, it should be described in the commit message.
>
> > +static int ddr_perf_event_add(struct perf_event *event, int flags)
> > +{
> > +     struct ddr_pmu *pmu = to_ddr_pmu(event->pmu);
> > +     struct hw_perf_event *hwc = &event->hw;
> > +     int counter;
> > +     int cfg = event->attr.config;
> > +
> > +     counter = ddr_perf_alloc_counter(pmu, cfg);
> > +     if (counter < 0) {
> > +             dev_warn(pmu->dev, "There are not enough counters\n");
> > +             return -EOPNOTSUPP;
> > +     }
>
> This should be dev_dbg(), not dev_warn().
>
> > +static irqreturn_t ddr_perf_irq_handler(int irq, void *p)
> > +{
> > +     int i;
> > +     u8 reg;
> > +     int val;
> > +     int counter;
> > +     struct ddr_pmu *pmu = (struct ddr_pmu *) p;
> > +     struct perf_event *event;
> > +
> > +     /*
> > +      * The cycles counter has overflowed. Update all of the local counter
> > +      * values, then reset the cycles counter, so the others can continue
> > +      * counting.
> > +      */
>
> Does the interrupt only fire when the cycle counter overflows?
>
> i.e. there is no way to detect when other counters overflow?
>
> > +     for (i = 0; i <= pmu->total_events; i++) {
> > +             if (pmu->active_events[i] != NULL) {
> > +                     event = pmu->active_events[i];
> > +                     counter = event->hw.idx;
> > +                     reg = counter * 4 + COUNTER_CNTL;
> > +                     val = readl(pmu->base + reg);
> > +                     ddr_perf_event_update(event);
> > +                     if (val & CNTL_OVER) {
> > +                             /* Clear counter, then re-enable it. */
> > +                             ddr_perf_event_enable(pmu, event->attr.config,
> > +                                                   counter, true);
> > +                             /* Update event again to reset prev_count */
> > +                             ddr_perf_event_update(event);
> > +                     }
> > +             }
> > +     }
>
> Depending on how events are added/removed, they may not be contiguous,
> so it isn't correct to use total_events here. You need to check all
> NUM_COUNTER slots.
>
> Please also avoid nesting by using an early continue, e.g.
>
>         for (i = 0; i < NUM_COUNTER; i++) {
>                 if (!pmu->active_events[i])
>                         continue;
>
>                 event = pmu->active_events[i];
>                 counter = event->hw.idx;
>
>                 ...
>         }
>
> > +
> > +     /*
> > +      * Reset the cycles counter regardless if it was explicitly
> > +      * enabled or not.
> > +      */
> > +     ddr_perf_event_enable(pmu, EVENT_CYCLES_ID,
> > +                           EVENT_CYCLES_COUNTER, true);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static int ddr_perf_probe(struct platform_device *pdev)
> > +{
> > +     struct ddr_pmu *pmu;
> > +     struct device_node *np;
> > +     void __iomem *base;
> > +     struct resource *iomem;
> > +     char *name;
> > +     int num;
> > +     int ret;
> > +     u32 irq;
> > +     const struct of_device_id *of_id =
> > +             of_match_device(imx_ddr_pmu_dt_ids, &pdev->dev);
> > +
> > +     iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     base = devm_ioremap_resource(&pdev->dev, iomem);
> > +     if (IS_ERR(base)) {
> > +             ret = PTR_ERR(base);
> > +             return ret;
> > +     }
> > +
> > +     np = pdev->dev.of_node;
> > +
> > +     pmu = kzalloc(sizeof(*pmu), GFP_KERNEL);
> > +     if (!pmu)
> > +             return -ENOMEM;
> > +
> > +     num = ddr_perf_init(pmu, base, &pdev->dev);
> > +     name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "ddr%d", num);
> > +
> > +     pmu->devtype = (struct fsl_ddr_devtype_data *)of_id->data;
> > +
> > +     cpumask_set_cpu(smp_processor_id(), &pmu->cpu);
>
> This will need a hotplug callback to handle context migration.

Thanks, Other comments I known how to change.
this is global event, why need take care cpu hotplugs.

Do you have sample code how to handle hotplug callback?

best regards
Frank Li

>
> > +     ret = perf_pmu_register(&(pmu->pmu), name, -1);
> > +     if (ret)
> > +             goto ddr_perf_err;
> > +
> > +     /* Request irq */
> > +     irq = of_irq_get(np, 0);
> > +     if (irq < 0) {
> > +             pr_err("Failed to get irq: %d", irq);
> > +             goto ddr_perf_err;
> > +     }
> > +
> > +     ret = devm_request_threaded_irq(&pdev->dev, irq,
> > +                                     ddr_perf_irq_handler, NULL,
> > +                                     IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> > +                                     DDR_PERF_DEV_NAME,
>
> This should not be a threaded IRQ. Your code implicitly relies on mutual
> exclusion between the IRQ handler and other code (e.g. when the perf
> core code disables interrupts).
>
> Thanks,
> Mark.
