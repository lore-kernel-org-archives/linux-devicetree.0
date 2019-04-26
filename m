From: Zhi Li <lznuaa@gmail.com>
Subject: Re: [PATCH V7 2/4] drivers/perf: imx_ddr: Add ddr performance counter
 support
Date: Fri, 26 Apr 2019 11:46:54 -0500
Message-ID: <CAHrpEqQ9htVMYkOfLcxN3wFDjAopkgG6C9oB73dVbeAPm6k68w@mail.gmail.com>
References: <1556219971-27322-1-git-send-email-Frank.Li@nxp.com>
 <1556219971-27322-2-git-send-email-Frank.Li@nxp.com>
 <20190426135132.GA4884@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190426135132.GA4884@lakrids.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "will.deacon@arm.com" <will.deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 26, 2019 at 8:51 AM Mark Rutland <mark.rutland@arm.com> wrote:
>
> Hi Frank,
>
> On Thu, Apr 25, 2019 at 07:19:46PM +0000, Frank Li wrote:
> > Add ddr performance monitor support for iMX8QXP
> >
> > There are 4 counters for ddr perfomance events.
> > counter 0 is dedicated for cycles.
> > you choose any up to 3 no cycles events.
>
> This is looking better, but there are a few issues I've spotted (e.g.
> with over-allocation) that make me somewhat dubious.
>
> >
> > for example:
> >
> > perf stat -a -e ddr0/read-cycles/,ddr0/write-cycles/,ddr0/precharge/ ls
> > perf stat -a -e ddr0/cycles/,ddr0/read-access/,ddr0/write-access/ ls
> >
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
> > Change from v6 to v7
> >  * added irq affinity handle, ref arm-ccn.c
> >  * added IRQF_NOBALANCING | IRQF_NO_THREAD
> >  * added ida_simple_remove at failure path
> >
> > Change from v5 to v6
> >  * fix insmod\rmmod problem
> >  * remove randunt register read at irq handle
> >  * change u32 irq to int
> >  * devm_request_irq use default flags.
> >
> > Change from v4 to v5
> >  * Remove AXI ID filter function
> >
> > Change from v3 to v4
> >  * Change FSL_IMX8_DDR_PERF to FSL_IMX8_DDR_PMU
> >  * sort include
> >  * remove struct fsl_ddr_devtype_data
> >  * Added comment need disable control first
> >  * Added comment about must enable cycle counter
> >  * Added macro for EVENT_AXI_READ, remove hardcode 0x41 and 0x42
> >  * Added comment about cycle counter is fastest one
> >
> > Change from v2 to v3
> >  * remove kfree
> >
> > Change from V1 to V2
> >  * update Kconfig by use i.MX8 instead of i.MX8 QXP
> >  * remove gpl statememnt since SPDX tag
> >  * use dev_kzalloc
> >  * use dev_err
> >  * commit message show axi_read 0x41\axi_write 0x42
> >  * commit message show cycles must be enabled
> >  * Irq only issue at cycles overflow
> >  * use NUM_COUNTER
> >  * use devm_request_irq
> >  * add hotplug callback to handle context migration
> >
> >  drivers/perf/Kconfig             |   7 +
> >  drivers/perf/Makefile            |   1 +
> >  drivers/perf/fsl_imx8_ddr_perf.c | 562 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 570 insertions(+)
> >  create mode 100644 drivers/perf/fsl_imx8_ddr_perf.c
> >
> > diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> > index a94e586..9bc3785 100644
> > --- a/drivers/perf/Kconfig
> > +++ b/drivers/perf/Kconfig
> > @@ -70,6 +70,13 @@ config ARM_DSU_PMU
> >         system, control logic. The PMU allows counting various events related
> >         to DSU.
> >
> > +config FSL_IMX8_DDR_PMU
> > +     tristate "Freescale i.MX8 DDR perf monitor"
> > +     depends on ARCH_MXC
> > +       help
> > +       Provides support for ddr perfomance monitor in i.MX8. Provide memory
> > +       througput information.
> > +
> >  config HISI_PMU
> >         bool "HiSilicon SoC PMU"
> >         depends on ARM64 && ACPI
> > diff --git a/drivers/perf/Makefile b/drivers/perf/Makefile
> > index 3048994..2ebb4de 100644
> > --- a/drivers/perf/Makefile
> > +++ b/drivers/perf/Makefile
> > @@ -5,6 +5,7 @@ obj-$(CONFIG_ARM_DSU_PMU) += arm_dsu_pmu.o
> >  obj-$(CONFIG_ARM_PMU) += arm_pmu.o arm_pmu_platform.o
> >  obj-$(CONFIG_ARM_PMU_ACPI) += arm_pmu_acpi.o
> >  obj-$(CONFIG_ARM_SMMU_V3_PMU) += arm_smmuv3_pmu.o
> > +obj-$(CONFIG_FSL_IMX8_DDR_PMU) += fsl_imx8_ddr_perf.o
> >  obj-$(CONFIG_HISI_PMU) += hisilicon/
> >  obj-$(CONFIG_QCOM_L2_PMU)    += qcom_l2_pmu.o
> >  obj-$(CONFIG_QCOM_L3_PMU) += qcom_l3_pmu.o
> > diff --git a/drivers/perf/fsl_imx8_ddr_perf.c b/drivers/perf/fsl_imx8_ddr_perf.c
> > new file mode 100644
> > index 0000000..7286182
> > --- /dev/null
> > +++ b/drivers/perf/fsl_imx8_ddr_perf.c
> > @@ -0,0 +1,562 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright 2017 NXP
> > + * Copyright 2016 Freescale Semiconductor, Inc.
> > + */
> > +
> > +#include <linux/init.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/perf_event.h>
> > +#include <linux/slab.h>
> > +
> > +#define COUNTER_CNTL         0x0
> > +#define COUNTER_READ         0x20
> > +
> > +#define COUNTER_DPCR1                0x30
> > +
> > +#define CNTL_OVER            0x1
> > +#define CNTL_CLEAR           0x2
> > +#define CNTL_EN                      0x4
> > +#define CNTL_EN_MASK         0xFFFFFFFB
> > +#define CNTL_CLEAR_MASK              0xFFFFFFFD
> > +#define CNTL_OVER_MASK               0xFFFFFFFE
> > +
> > +#define CNTL_CSV_SHIFT               24
> > +#define CNTL_CSV_MASK                (0xFF << CNTL_CSV_SHIFT)
> > +
> > +#define EVENT_CYCLES_ID              0
> > +#define EVENT_CYCLES_COUNTER 0
> > +#define NUM_COUNTER          4
>
> Nit: this should be NUM_COUNTERS
>
> > +#define MAX_EVENT            3
> > +#define EVENT_AXI_READ               0x41
> > +#define EVENT_AXI_WRITE              0x42
>
> These three definitions aren't used, so we can drop them for now.
>
> > +
> > +#define to_ddr_pmu(p)                container_of(p, struct ddr_pmu, pmu)
> > +
> > +#define DDR_PERF_DEV_NAME    "ddr_perf"
> > +
> > +static DEFINE_IDA(ddr_ida);
> > +
> > +PMU_EVENT_ATTR_STRING(cycles, ddr_perf_cycles, "event=0x00");
> > +PMU_EVENT_ATTR_STRING(selfresh, ddr_perf_selfresh, "event=0x01");
> > +PMU_EVENT_ATTR_STRING(read-access, ddr_perf_read_accesses, "event=0x04");
> > +PMU_EVENT_ATTR_STRING(write-access, ddr_perf_write_accesses, "event=0x05");
> > +PMU_EVENT_ATTR_STRING(read-queue-depth, ddr_perf_read_queue_depth,
> > +                     "event=0x08");
> > +PMU_EVENT_ATTR_STRING(write-queue-depth, ddr_perf_write_queue_depth,
> > +                     "event=0x09");
> > +PMU_EVENT_ATTR_STRING(lp-read-credit-cnt, ddr_perf_lp_read_credit_cnt,
> > +                     "event=0x10");
> > +PMU_EVENT_ATTR_STRING(hp-read-credit-cnt, ddr_perf_hp_read_credit_cnt,
> > +                     "event=0x11");
> > +PMU_EVENT_ATTR_STRING(write-credit-cnt, ddr_perf_write_credit_cnt,
> > +                     "event=0x12");
> > +PMU_EVENT_ATTR_STRING(read-command, ddr_perf_read_command, "event=0x20");
> > +PMU_EVENT_ATTR_STRING(write-command, ddr_perf_write_command, "event=0x21");
> > +PMU_EVENT_ATTR_STRING(read-modify-write-command,
> > +             ddr_perf_read_modify_write_command, "event=0x22");
> > +PMU_EVENT_ATTR_STRING(hp-read, ddr_perf_hp_read, "event=0x23");
> > +PMU_EVENT_ATTR_STRING(hp-req-nodcredit, ddr_perf_hp_req_nocredit, "event=0x24");
> > +PMU_EVENT_ATTR_STRING(hp-xact-credit, ddr_perf_hp_xact_credit, "event=0x25");
> > +PMU_EVENT_ATTR_STRING(lp-req-nocredit, ddr_perf_lp_req_nocredit, "event=0x26");
> > +PMU_EVENT_ATTR_STRING(lp-xact-credit, ddr_perf_lp_xact_credit, "event=0x27");
> > +PMU_EVENT_ATTR_STRING(wr-xact-credit, ddr_perf_wr_xact_credit, "event=0x29");
> > +PMU_EVENT_ATTR_STRING(read-cycles, ddr_perf_read_cycles, "event=0x2a");
> > +PMU_EVENT_ATTR_STRING(write-cycles, ddr_perf_write_cycles, "event=0x2b");
> > +PMU_EVENT_ATTR_STRING(read-write-transition, ddr_perf_read_write_transition,
> > +                     "event=0x30");
> > +PMU_EVENT_ATTR_STRING(precharge, ddr_perf_precharge, "event=0x31");
> > +PMU_EVENT_ATTR_STRING(activate, ddr_perf_activate, "event=0x32");
> > +PMU_EVENT_ATTR_STRING(load-mode, ddr_perf_load_mode, "event=0x33");
> > +PMU_EVENT_ATTR_STRING(mwr, ddr_perf_mwr, "event=0x34");
> > +PMU_EVENT_ATTR_STRING(read, ddr_perf_read, "event=0x35");
> > +PMU_EVENT_ATTR_STRING(read-activate, ddr_perf_read_activate, "event=0x36");
> > +PMU_EVENT_ATTR_STRING(refresh, ddr_perf_refresh, "event=0x37");
> > +PMU_EVENT_ATTR_STRING(write, ddr_perf_write, "event=0x38");
> > +PMU_EVENT_ATTR_STRING(raw-hazard, ddr_perf_raw_hazard, "event=0x39");
> > +
> > +static const struct of_device_id imx_ddr_pmu_dt_ids[] = {
> > +     { .compatible = "fsl,imx8-ddr-pmu",},
> > +     { .compatible = "fsl,imx8m-ddr-pmu",},
> > +     { /* sentinel */ }
> > +};
> > +
> > +struct ddr_pmu {
> > +     struct pmu pmu;
> > +     void __iomem *base;
> > +     unsigned int cpu;
> > +     struct  hlist_node node;
> > +     struct  device *dev;
> > +     struct perf_event *active_events[NUM_COUNTER];
> > +     int total_events;
>
> Can we please make these two:
>
>         struct perf_event *events[NUM_COUNTERS];
>         int active_events;
>
> ... which would be more consistent with other drivers.
>
> > +     enum cpuhp_state cpuhp_state;
> > +     bool cycles_active;
> > +     uintptr_t flags;
>
> AFAICT this flags field isn't used at runtime, and can be dropped for
> now.
>
> > +     int irq;
> > +     int id;
> > +};
>
> [...]
>
> > +static u32 ddr_perf_alloc_counter(struct ddr_pmu *pmu, int event)
> > +{
> > +     int i;
> > +
> > +     /* Always map cycle event to counter 0
> > +        Cycles counter is dedicated for cycle event
> > +        can't used for the other events
> > +      */
>
> Please follow the coding style, as documented in
> Documentation/process/coding-style.rst.
>
> Multi line comments look like:
>
>         /*
>          * Nothing on the first line, with an asterisk on each
>          * successive line.
>          */
>
> > +     if (event == EVENT_CYCLES_ID)
> > +             return EVENT_CYCLES_COUNTER;
>
> I don't think this is safe as-is. If a user tries to open multiple
> cycles events, ddr_perf_event_add() will overwrite the existing event
> pointer, and the IRQ handler won't update the event.
>
> You'll at least need to check whether you already have a cycles event
> here.
>
> > +
> > +     for (i = 1; i < NUM_COUNTER; i++)
> > +             if (pmu->active_events[i] == NULL)
> > +                     return i;
>
> Nit: this should have braces around the body of the for-loop.
>
> > +
> > +     return -ENOENT;
> > +}
> > +
> > +static u32 ddr_perf_free_counter(struct ddr_pmu *pmu, int counter)
> > +{
> > +     if (counter < 0 || counter >= NUM_COUNTER)
> > +             return -ENOENT;
>
> AFAICT, this should never happen, and the return value is never used, so
> this can go.
>
> > +
> > +     pmu->active_events[counter] = NULL;
> > +
> > +     return 0;
> > +}
> > +
> > +static u32 ddr_perf_read_counter(struct ddr_pmu *pmu, int counter)
> > +{
> > +     return readl(pmu->base + COUNTER_READ + counter * 4);
> > +}
> > +
> > +static int ddr_perf_event_init(struct perf_event *event)
> > +{
> > +     struct ddr_pmu *pmu = to_ddr_pmu(event->pmu);
> > +     struct hw_perf_event *hwc = &event->hw;
> > +
> > +     if (event->attr.type != event->pmu->type)
> > +             return -ENOENT;
> > +
> > +     if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
> > +             return -EOPNOTSUPP;
> > +
> > +     if (event->cpu < 0) {
> > +             dev_warn(pmu->dev, "Can't provide per-task data!\n");
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     if (event->attr.exclude_user        ||
> > +         event->attr.exclude_kernel      ||
> > +         event->attr.exclude_hv          ||
> > +         event->attr.exclude_idle        ||
> > +         event->attr.exclude_host        ||
> > +         event->attr.exclude_guest       ||
> > +         event->attr.sample_period)
> > +             return -EINVAL;
> > +
> > +     event->cpu = pmu->cpu;
> > +     hwc->idx = -1;
> > +
> > +     return 0;
> > +}
>
> This should have a check for event grouping, e.g. like that in
> arm_ccn_pmu_event_init.
>
> > +
> > +
> > +static void ddr_perf_event_update(struct perf_event *event)
> > +{
> > +     struct ddr_pmu *pmu = to_ddr_pmu(event->pmu);
> > +     struct hw_perf_event *hwc = &event->hw;
> > +     u64 delta, prev_raw_count, new_raw_count;
> > +     int counter = hwc->idx;
> > +
> > +     do {
> > +             prev_raw_count = local64_read(&hwc->prev_count);
> > +             new_raw_count = ddr_perf_read_counter(pmu, counter);
> > +     } while (local64_cmpxchg(&hwc->prev_count, prev_raw_count,
> > +                     new_raw_count) != prev_raw_count);
> > +
> > +     delta = (new_raw_count - prev_raw_count) & 0xFFFFFFFF;
> > +
> > +     local64_add(delta, &event->count);
> > +}
> > +
> > +static void ddr_perf_event_enable(struct ddr_pmu *pmu, int config,
> > +                               int counter, bool enable)
> > +{
> > +     u8 reg = counter * 4 + COUNTER_CNTL;
> > +     int val;
> > +
> > +     if (enable) {
> > +             /* must disable first, then enable again
> > +              * otherwise, cycle counter will not work
> > +              * if previous state is enabled.
> > +              */
>
> Nit: comment style violation.
>
> > +             writel(0, pmu->base + reg);
> > +             val = CNTL_EN | CNTL_CLEAR;
> > +             val |= (config << CNTL_CSV_SHIFT) & CNTL_CSV_MASK;
>
> Do you need to do this for all counters, or is this only necessary when
> programming the cycle counter itself?
>
> > +     } else {
> > +             /* Disable counter */
> > +             val = readl(pmu->base + reg) & CNTL_EN_MASK;
> > +     }
> > +
> > +     writel(val, pmu->base + reg);
> > +
> > +     if (config == EVENT_CYCLES_ID)
> > +             pmu->cycles_active = enable;
> > +}
>
> Rather than keeping track of whether you have a cycles event, I think it
> would be better to use the cycles enable/disable to implement
> pmu::pmu_{enable,disable}(), and in the pmu::start() callback, bail out
> for a cycles event.
>
> In the pmu::pmu_enable() callback, you can look at how many events you
> have in order to decide whether to enable the cycle counter or leave it
> disabled.
>
> That way, you'll always program it when you need to, you don't need to
> special-case the programming of a cycles event as much, and you don't
> need to check the number of active events as much.
>
> > +static void ddr_perf_event_start(struct perf_event *event, int flags)
> > +{
> > +     struct ddr_pmu *pmu = to_ddr_pmu(event->pmu);
> > +     struct hw_perf_event *hwc = &event->hw;
> > +     int counter = hwc->idx;
> > +
> > +     local64_set(&hwc->prev_count, 0);
> > +
> > +     ddr_perf_event_enable(pmu, event->attr.config, counter, true);
> > +     /*
> > +      * If the cycles counter wasn't explicitly selected,
> > +      * we will enable it now.
> > +      * cycles counter must be enabled otherwise other counters will
> > +      * stopped.
> > +      */
> > +     if (counter > 0 && !pmu->cycles_active)
> > +             ddr_perf_event_enable(pmu, EVENT_CYCLES_ID,
> > +                                   EVENT_CYCLES_COUNTER, true);
> > +}
> > +
> > +static int ddr_perf_event_add(struct perf_event *event, int flags)
> > +{
> > +     struct ddr_pmu *pmu = to_ddr_pmu(event->pmu);
> > +     struct hw_perf_event *hwc = &event->hw;
> > +     int counter;
> > +     int cfg = event->attr.config;
> > +
> > +     counter = ddr_perf_alloc_counter(pmu, cfg);
> > +     if (counter < 0) {
> > +             dev_dbg(pmu->dev, "There are not enough counters\n");
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     pmu->active_events[counter] = event;
> > +     pmu->total_events++;
> > +     hwc->idx = counter;
> > +
> > +     if (flags & PERF_EF_START)
> > +             ddr_perf_event_start(event, flags);
> > +
> > +     local64_set(&hwc->prev_count, ddr_perf_read_counter(pmu, counter));
> > +
> > +     return 0;
> > +}
> > +
> > +static void ddr_perf_event_stop(struct perf_event *event, int flags)
> > +{
> > +     struct ddr_pmu *pmu = to_ddr_pmu(event->pmu);
> > +     struct hw_perf_event *hwc = &event->hw;
> > +     int counter = hwc->idx;
> > +
> > +     ddr_perf_event_enable(pmu, event->attr.config, counter, false);
> > +     ddr_perf_event_update(event);
> > +}
> > +
> > +static void ddr_perf_event_del(struct perf_event *event, int flags)
> > +{
> > +     struct ddr_pmu *pmu = to_ddr_pmu(event->pmu);
> > +     struct hw_perf_event *hwc = &event->hw;
> > +     int counter = hwc->idx;
> > +
> > +     ddr_perf_event_stop(event, PERF_EF_UPDATE);
> > +
> > +     ddr_perf_free_counter(pmu, counter);
> > +     pmu->total_events--;
> > +     hwc->idx = -1;
> > +
> > +     /* If all events have stopped, stop the cycles counter as well */
> > +     if ((pmu->total_events == 0) && pmu->cycles_active)
> > +             ddr_perf_event_enable(pmu, EVENT_CYCLES_ID,
> > +                                   EVENT_CYCLES_COUNTER, false);
> > +}
> > +
> > +static int ddr_perf_init(struct ddr_pmu *pmu, void __iomem *base,
> > +                      struct device *dev)
> > +{
> > +     *pmu = (struct ddr_pmu) {
> > +             .pmu = (struct pmu) {
> > +                     .task_ctx_nr = perf_invalid_context,
> > +                     .attr_groups = attr_groups,
> > +                     .event_init  = ddr_perf_event_init,
> > +                     .add         = ddr_perf_event_add,
> > +                     .del         = ddr_perf_event_del,
> > +                     .start       = ddr_perf_event_start,
> > +                     .stop        = ddr_perf_event_stop,
> > +                     .read        = ddr_perf_event_update,
> > +             },
> > +             .base = base,
> > +             .dev = dev,
> > +     };
> > +
> > +     pmu->id = ida_simple_get(&ddr_ida, 0, 0, GFP_KERNEL);
> > +     return pmu->id;
> > +}
> > +
> > +static irqreturn_t ddr_perf_irq_handler(int irq, void *p)
> > +{
> > +     int i;
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
>
> Let's make this:
>
>         /*
>          * When the cycle counter overflows, all counters are stopped,
>          * and an IRQ is raised. If any other counter overflows, it
>          * continues counting, and no IRQ is raised.
>          *
>          * Cycles occur at least 4 times as often as other events, so we
>          * can update all events on a cycle counter overflow and not
>          * lose events.
>          */
>
> > +     for (i = 0; i < NUM_COUNTER; i++) {
> > +
> > +             if (!pmu->active_events[i])
> > +                     continue;
> > +
> > +             event = pmu->active_events[i];
> > +
> > +             ddr_perf_event_update(event);
> > +
> > +             if (event->hw.idx == EVENT_CYCLES_COUNTER) {
> > +                     ddr_perf_event_enable(pmu,
> > +                                           EVENT_CYCLES_ID,
> > +                                           EVENT_CYCLES_COUNTER,
> > +                                           true);
> > +                     ddr_perf_event_update(event);
> > +             }
> > +     }
>
> This allows events to be counting during the IRQ handler, and will lead
> to skid within event groups. I think that we should disable the cycle
> counter before the loop, and enable it afterwards in order to avoid
> that.
>
> If you implement pmu_{enable,disable}() as suggested above, you can use
> those here.

All counter will stop automatically by hardware when overflow happen.
why need disable cycle counter?


>
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static int ddr_perf_offline_cpu(unsigned int cpu, struct hlist_node *node)
> > +{
> > +     struct ddr_pmu *pmu = hlist_entry_safe(node, struct ddr_pmu, node);
> > +     int target;
> > +
> > +     if (cpu != pmu->cpu)
> > +             return 0;
> > +
> > +     target = cpumask_any_but(cpu_online_mask, cpu);
> > +     if (target >= nr_cpu_ids)
> > +             return 0;
> > +
> > +     perf_pmu_migrate_context(&pmu->pmu, cpu, target);
> > +     pmu->cpu = target;
> > +
> > +     if (pmu->irq)
>
> In ddr_perf_probe() we'll bail out if we didn't have an IRQ, so you
> don't need to check that pmu->irq has been set here.
>
> > +             WARN_ON(irq_set_affinity_hint(pmu->irq, cpumask_of(pmu->cpu)));
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
> > +     int irq;
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
> > +     platform_set_drvdata(pdev, pmu);
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
>
> As above, I think this can go for now.
>
> > +
> > +     pmu->cpu = raw_smp_processor_id();
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
>
> Here, "&(pmu->pmu)" can be "&pmu->pmu", no backets required.
>
> Thanks,
> Mark.
