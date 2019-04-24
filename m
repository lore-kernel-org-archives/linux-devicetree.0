From: Zhi Li <lznuaa@gmail.com>
Subject: Re: [PATCH V5 2/4] drivers/perf: imx_ddr: Add ddr performance counter
 support
Date: Wed, 24 Apr 2019 14:13:23 -0500
Message-ID: <CAHrpEqSg4xiUUypg1oAf5d4J88F=A_tacU2H9ctAo+T4O=ymLg@mail.gmail.com>
References: <1555447156-28306-1-git-send-email-Frank.Li@nxp.com>
 <1555447156-28306-2-git-send-email-Frank.Li@nxp.com>
 <20190424105822.GA14614@fuggles.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190424105822.GA14614@fuggles.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will.deacon@arm.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, Frank Li <frank.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 24, 2019 at 5:58 AM Will Deacon <will.deacon@arm.com> wrote:
>
> Hi Frank,
>
> On Tue, Apr 16, 2019 at 08:39:33PM +0000, Frank Li wrote:
> > Add ddr performance monitor support for iMX8QXP
> >
> > There are 4 counters for ddr perfomance events.
> > counter 0 is dedicated for cycles.
> > you choose any up to 3 no cycles events.
>
> I was about to pick this up, but I still have a few questions/comments
> on the code:
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
> > +     /* Only cycles counter overflowed can issue irq. all counters will
> > +      * be stopped when cycles counter overflow. but other counter don't stop
> > +      * when overflow happen. Update all of the local counter values,
> > +      * then reset the cycles counter, so the others can continue
> > +      * counting. cycles counter is fastest counter in all events. at last
> > +      * 4 times than other counters.
> > +      */
> > +     for (i = 0; i < NUM_COUNTER; i++) {
> > +
> > +             if (!pmu->active_events[i])
> > +                     continue;
> > +
> > +             event = pmu->active_events[i];
> > +             counter = event->hw.idx;
> > +             reg = counter * 4 + COUNTER_CNTL;
> > +             val = readl(pmu->base + reg);
>
> Does this read have a side-effect, or can it be removed given that you don't
> use val for anything else?

It can be removed.

>
> > +             ddr_perf_event_update(event);
> > +
> > +             if (counter == EVENT_CYCLES_COUNTER) {
> > +                     ddr_perf_event_enable(pmu,
> > +                                           EVENT_CYCLES_ID,
> > +                                           EVENT_CYCLES_COUNTER,
> > +                                           true);
> > +                     ddr_perf_event_update(event);
> > +             }
> > +     }
> > +
> > +     return IRQ_HANDLED;
> > +}
>
> What stops the IRQ handler running concurrently with perf callbacks? I can't
> see any locking here, or is the IRQ supposed to be affine to the same CPU
> that's handling the perf context?

I don't under your means here.
ddr_perf_event_update is lockless design.

I can't found problem if run ddr_perf_event_enable at both perf
context and IRQ concurrently.


>
> > +static int ddr_perf_offline_cpu(unsigned int cpu, struct hlist_node *node)
> > +{
> > +     struct ddr_pmu *pmu = hlist_entry_safe(node, struct ddr_pmu, node);
> > +     int target;
> > +
> > +     if (!cpumask_test_and_clear_cpu(cpu, &pmu->cpu))
> > +             return 0;
> > +
> > +     target = cpumask_any_but(cpu_online_mask, cpu);
> > +     if (target >= nr_cpu_ids)
> > +             return 0;
> > +
> > +     perf_pmu_migrate_context(&pmu->pmu, cpu, target);
> > +     cpumask_set_cpu(target, &pmu->cpu);
> > +
> > +     return 0;
> > +}
> > +
> > +static int ddr_perf_probe(struct platform_device *pdev)
> > +{
> > +     struct ddr_pmu *pmu;
> > +     struct device_node *np;
> > +     void __iomem *base;
> > +     struct resource *iomem;
> > +     char *name;
> > +     char *hpname;
> > +     int num;
> > +     int ret;
> > +     u32 irq;
> > +     const struct of_device_id *of_id =
> > +             of_match_device(imx_ddr_pmu_dt_ids, &pdev->dev);
> > +
> > +     iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     base = devm_ioremap_resource(&pdev->dev, iomem);
> > +     if (IS_ERR(base))
> > +             return PTR_ERR(base);
> > +
> > +     np = pdev->dev.of_node;
> > +
> > +     pmu = devm_kzalloc(&pdev->dev, sizeof(*pmu), GFP_KERNEL);
> > +     if (!pmu)
> > +             return -ENOMEM;
> > +
> > +     num = ddr_perf_init(pmu, base, &pdev->dev);
> > +
> > +     name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "ddr%d", num);
> > +     if (!name)
> > +             return -ENOMEM;
> > +
> > +     hpname = devm_kasprintf(&pdev->dev, GFP_KERNEL,
> > +                             "perf/imx/ddr%d:online", num);
> > +     if (!hpname)
> > +             return -ENOMEM;
> > +
> > +     pmu->flags = (uintptr_t) of_id->data;
> > +
> > +     cpumask_set_cpu(raw_smp_processor_id(), &pmu->cpu);
> > +     ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, hpname, NULL,
> > +                                      ddr_perf_offline_cpu);
> > +
> > +     if (ret < 0) {
> > +             dev_err(&pdev->dev, "cpuhp_setup_state_multi failed\n");
> > +             goto ddr_perf_err;
> > +     }
> > +
> > +     pmu->cpuhp_state = ret;
> > +
> > +     /* Register the pmu instance for cpu hotplug */
> > +     cpuhp_state_add_instance_nocalls(pmu->cpuhp_state, &pmu->node);
> > +
> > +     ret = perf_pmu_register(&(pmu->pmu), name, -1);
> > +     if (ret)
> > +             goto ddr_perf_err;
> > +
> > +     /* Request irq */
> > +     irq = of_irq_get(np, 0);
> > +     if (irq < 0) {
>
> irq is a u32 so this will never execute. You need to make it an int.
>
> > +             dev_err(&pdev->dev, "Failed to get irq: %d", irq);
> > +             ret = irq;
> > +             goto ddr_perf_irq_err;
> > +     }
> > +
> > +     ret = devm_request_irq(&pdev->dev, irq,
> > +                                     ddr_perf_irq_handler,
> > +                                     IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>
> Can you explain why you need to pass these specific IRQ flags, please? I'm
> struggling to see what the ONESHOT is buying you.

I think default should be okay. I will update at next version
>
> Will
