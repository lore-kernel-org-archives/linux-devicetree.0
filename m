From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/5] nds32: Perf porting
Date: Thu, 18 Oct 2018 15:23:59 +0100
Message-ID: <20181018142359.xzsxwghjgb7lmzwk@lakrids.cambridge.arm.com>
References: <cover.1539745993.git.nickhu@andestech.com>
 <ab5f07d5b518ef2374f2c1ebd15d81dfa17b2c9a.1539745993.git.nickhu@andestech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ab5f07d5b518ef2374f2c1ebd15d81dfa17b2c9a.1539745993.git.nickhu@andestech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nickhu <nickhu@andestech.com>
Cc: greentime@andestech.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, deanbo422@gmail.com, peterz@infradead.org, mingo@redhat.com, acme@kernel.org, alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org, arnd@arndb.de, sboyd@codeaurora.org, geert@linux-m68k.org, zong@andestech.com, ebiederm@xmission.com, akpm@linux-foundation.org, gregkh@linuxfoundation.org, pombredanne@nexb.com, tglx@linutronix.de, kstewart@linuxfoundation.org, devicetree@vger.kernel.org, green.hu@gmail.com
List-Id: devicetree@vger.kernel.org

HI,

On Thu, Oct 18, 2018 at 04:43:13PM +0800, Nickhu wrote:
> +#define PFM_CTL_OVF(idx)             PFM_CTL_mskOVF ## idx
> +#define PFM_CTL_EN(idx)                      PFM_CTL_mskEN ## idx
> +#define PFM_CTL_OFFSEL(idx)          PFM_CTL_offSEL ## idx
> +#define PFM_CTL_IE(idx)                      PFM_CTL_mskIE ## idx
> +#define PFM_CTL_KS(idx)                      PFM_CTL_mskKS ## idx
> +#define PFM_CTL_KU(idx)                      PFM_CTL_mskKU ## idx
> +#define PFM_CTL_SEL(idx)             PFM_CTL_mskSEL ## idx
> +
> +#define macro_expansion(macro_name, var, idx) do { \
> +     switch (idx) { \
> +     case 0:\
> +             var =3D macro_name ## 0; \
> +             break; \
> +     case 1:\
> +             var =3D macro_name ## 1; \
> +             break; \
> +     case 2:\
> +             var =3D macro_name ## 2; \
> +             break; \
> +     default:\
> +             pr_err("mask index=3D%d not in the range at %s,line %d\n", =
\
> +                     idx, __FILE__, __LINE__); \
> +             break; \
> +     } \
> +} while (0)

This macro makes things very difficult to understand, especially since
in-context it's not clear what's happening to var.

Can you restructure your defintions so you can have things like:

/* valid for 0,1,2 */
#define
#define PFM_CTL_OVF(idx)        BIT(6 + (idx))

... and avoid this macro entirely?

> +
> +enum { PFMC0, PFMC1, PFMC2, MAX_COUNTERS };
> +
> +/*
> + * Perf Events' indices
> + */
> +#define NDS32_IDX_CYCLE_COUNTER                      0
> +#define NDS32_IDX_COUNTER0                   1
> +#define NDS32_IDX_COUNTER_LAST(cpu_pmu) \
> +     (NDS32_IDX_CYCLE_COUNTER + (cpu_pmu)->num_events - 1)
> +
> +#define NDS32_MAX_COUNTERS                   32
> +#define NDS32_COUNTER_MASK                   (NDS32_MAX_COUNTERS - 1)

Huh? You only seem to have three above (ignoring the fixed-purpose cycle
counter).

These definitions aren't used anywhere, regadless.

> +
> +/*
> + * struct nds32_pmu_platdata - NDS32 PMU platform data
> + *
> + * @handle_irq: an optional handler which will be called from the
> + *   interrupt and passed the address of the low level handler,
> + *   and can be used to implement any platform specific handling
> + *   before or after calling it.

Will you actually need this? We got rid of it in the arm_pmu framework.

> + * @runtime_resume: an optional handler which will be called by the
> + *   runtime PM framework following a call to pm_runtime_get().
> + *   Note that if pm_runtime_get() is called more than once in
> + *   succession this handler will only be called once.
> + * @runtime_suspend: an optional handler which will be called by the
> + *   runtime PM framework following a call to pm_runtime_put().
> + *   Note that if pm_runtime_get() is called more than once in
> + *   succession this handler will only be called following the
> + *   final call to pm_runtime_put() that actually disables the
> + *   hardware.
> + */
> +struct nds32_pmu_platdata {
> +     irqreturn_t (*handle_irq)(int irq, void *dev,
> +                               irq_handler_t pmu_handler);
> +     int (*runtime_resume)(struct device *dev);
> +     int (*runtime_suspend)(struct device *dev);
> +};
> +
> +/* The events for a given PMU register set. */
> +struct pmu_hw_events {
> +     /*
> +      * The events that are active on the PMU for the given index.
> +      */
> +     struct perf_event **events;
> +
> +     /*
> +      * A 1 bit for an index indicates that the counter is being used fo=
r
> +      * an event. A 0 means that the counter can be used.
> +      */
> +     unsigned long *used_mask;
> +
> +     /*
> +      * Hardware lock to serialize accesses to PMU registers. Needed for=
 the
> +      * read/modify/write sequences.
> +      */
> +     raw_spinlock_t pmu_lock;
> +};

It looks like this is derived from the really early arm_pmu code, when
we were trying to be far more flexible than was necessary. This can be
simplified significantly.

e.g. since you know up-front the max number of counters, this can be:

struct pmu_hw_events {
        struct perf_event *events[MAX_COUNTERS];
        unsigned long mask[BITS_TO_LONGS(MAX_COUNTERS)];
        raw_spinlock_t pmu_lock;
};

... and you can avoid having to dynamically allocate each field
separately.

I'm not sure the pmu_lock is even necessary in the asbence of NMI.

> +
> +struct nds32_pmu {
> +     struct pmu pmu;
> +     cpumask_t active_irqs;
> +     cpumask_t supported_cpus;

Do you intend to support heterogeneous systems (e.g big.LITTLE)?

If not, you don't need the supported_cpus mask.

> +     char *name;
> +      irqreturn_t (*handle_irq)(int irq_num, void *dev);
> +     void (*enable)(struct perf_event *event);
> +     void (*disable)(struct perf_event *event);
> +     int (*get_event_idx)(struct pmu_hw_events *hw_events,
> +                          struct perf_event *event);
> +     int (*set_event_filter)(struct hw_perf_event *evt,
> +                             struct perf_event_attr *attr);
> +     u32 (*read_counter)(struct perf_event *event);
> +     void (*write_counter)(struct perf_event *event, u32 val);
> +     void (*start)(struct nds32_pmu *nds32_pmu);
> +     void (*stop)(struct nds32_pmu *nds32_pmu);
> +     void (*reset)(void *data);
> +     int (*request_irq)(struct nds32_pmu *nds32_pmu, irq_handler_t handl=
er);
> +     void (*free_irq)(struct nds32_pmu *nds32_pmu);
> +     int (*map_event)(struct perf_event *event);
> +     int num_events;
> +     atomic_t active_events;
> +     struct mutex reserve_mutex;     /* mutex */

I don't think you need the reserve_mutex; for arm_pmu that was a
holdover form when there were multiple frameworks competing to mange the
PMU, and now there's only perf.

> +     u64 max_period;

It looks like this is always 0xffffffff, so you don't need a variable
for that.

[...]

> +/* Get converted event counter index */
> +#define GET_CONVERTED_EVENT_IDX(event, idx) do { \
> +     if ((event) > SPAV3_0_SEL_BASE && event < SPAV3_0_SEL_LAST) { \
> +             idx =3D 0; \
> +     } else if ((event) > SPAV3_1_SEL_BASE && event < SPAV3_1_SEL_LAST) =
{ \
> +             idx =3D 1; \
> +     } else if ((event) > SPAV3_2_SEL_BASE && event < SPAV3_2_SEL_LAST) =
{ \
> +             idx =3D 2; \
> +     } else { \
> +             pr_err("GET_CONVERTED_EVENT_IDX PFM counter range error\n")=
; \
> +             return -EPERM; \
> +     } \
> +} while (0)

This would be cleaner as a static inline.

> +
> +/* Get converted hardware event number */
> +#define GET_CONVERTED_EVENT_HW_NUM(event) do { \
> +     if ((event) =3D=3D 0) { \
> +             /*do nothing*/    \
> +     } else if ((event) > SPAV3_0_SEL_BASE && event < SPAV3_0_SEL_LAST) =
{ \
> +             (event) -=3D PFM_OFFSET_MAGIC_0; \
> +     } else if ((event) > SPAV3_1_SEL_BASE && event < SPAV3_1_SEL_LAST) =
{ \
> +             (event) -=3D PFM_OFFSET_MAGIC_1; \
> +     } else if ((event) > SPAV3_2_SEL_BASE && event < SPAV3_2_SEL_LAST) =
{ \
> +             (event) -=3D PFM_OFFSET_MAGIC_2; \
> +     } else { \
> +             pr_err(\
> +             "GET_CONVERTED_EVENT_HW_NUM PFM counter range error\n"); \
> +     } \
> +} while (0)

Likewise, a static inline would be cleaner.

[...]

> +/* Set at runtime when we know what CPU type we are. */
> +static struct nds32_pmu *cpu_pmu;
> +
> +static DEFINE_PER_CPU(struct perf_event * [MAX_COUNTERS], hw_events);
> +static DEFINE_PER_CPU(unsigned long[BITS_TO_LONGS(MAX_COUNTERS)], used_m=
ask);
> +static DEFINE_PER_CPU(struct pmu_hw_events, cpu_hw_events);

As before, I think you can fold the first wo fields into pmu_hw_events,
then you only need one DEFINE_PER_CPU() here.

[...]

> +static irqreturn_t nds32_pmu_handle_irq(int irq_num, void *dev)
> +{
> +     u32 pfm;
> +     struct perf_sample_data data;
> +     struct nds32_pmu *cpu_pmu =3D (struct nds32_pmu *)dev;
> +     struct pmu_hw_events *cpuc =3D cpu_pmu->get_hw_events();
> +     struct pt_regs *regs;
> +     int idx;
> +     /*
> +      * Get and reset the IRQ flags
> +      */
> +     pfm =3D nds32_pfm_getreset_flags();
> +
> +     /*
> +      * Did an overflow occur?
> +      */
> +     if (!nds32_pfm_has_overflowed(pfm))
> +             return IRQ_NONE;
> +
> +     /*
> +      * Handle the counter(s) overflow(s)
> +      */
> +     regs =3D get_irq_regs();
> +
> +     for (idx =3D 0; idx < cpu_pmu->num_events; ++idx) {
> +             struct perf_event *event =3D cpuc->events[idx];
> +             struct hw_perf_event *hwc;
> +
> +             /* Ignore if we don't have an event. */
> +             if (!event)
> +                     continue;
> +
> +             /*
> +              * We have a single interrupt for all counters. Check that
> +              * each counter has overflowed before we process it.
> +              */
> +             if (!nds32_pfm_counter_has_overflowed(pfm, idx))
> +                     continue;
> +
> +             hwc =3D &event->hw;
> +             nds32_pmu_event_update(event);
> +             perf_sample_data_init(&data, 0, hwc->last_period);
> +             if (!nds32_pmu_event_set_period(event))
> +                     continue;
> +
> +             if (perf_event_overflow(event, &data, regs))
> +                     cpu_pmu->disable(event);
> +     }
> +
> +     /*
> +      * Handle the pending perf events.
> +      *
> +      * Note: this call *must* be run with interrupts disabled. For
> +      * platforms that can have the PMU interrupts raised as an NMI, thi=
s
> +      * will not work.
> +      */
> +     irq_work_run();
> +
> +     return IRQ_HANDLED;
> +}

You'll want to stop all counters over the IRQ handler to ensure that
groups are consistent.

[...]

> +static int device_pmu_init(struct nds32_pmu *cpu_pmu)
> +{
> +     nds32_pmu_init(cpu_pmu);
> +     /*
> +      * This name should be devive-specific name, whatever you like :)
> +      * I think "PMU" will be a good generic name.
> +      */
> +     cpu_pmu->name =3D "atcpmu";

This looks like it should have a more complete version string, e.g. with
"spav3" in it.

[...]

> +static int
> +validate_event(struct pmu *pmu, struct pmu_hw_events *hw_events,
> +            struct perf_event *event)
> +{
> +     struct nds32_pmu *nds32_pmu =3D to_nds32_pmu(event->pmu);
> +     //struct pmu *leader_pmu =3D event->group_leader->pmu;

Code which is commented out should be deleted.

[...]

> +static int cpu_pmu_request_irq(struct nds32_pmu *cpu_pmu, irq_handler_t =
handler)
> +{
> +     int i, err, irq, irqs;
> +     struct platform_device *pmu_device =3D cpu_pmu->plat_device;
> +
> +     if (!pmu_device)
> +             return -ENODEV;
> +
> +     irqs =3D min(pmu_device->num_resources, num_possible_cpus());
> +     if (irqs < 1) {
> +             pr_err("no irqs for PMUs defined\n");
> +             return -ENODEV;
> +     }
> +
> +     for (i =3D 0; i < irqs; ++i) {
> +             err =3D 0;
> +             irq =3D platform_get_irq(pmu_device, i);
> +             if (irq < 0)
> +                     continue;
> +
> +             /*
> +              * If we have a single PMU interrupt that we can't shift,
> +              * assume that we're running on a uniprocessor machine and
> +              * continue. Otherwise, continue without this interrupt.
> +              */
> +             if (irq_set_affinity(irq, cpumask_of(i)) && irqs > 1) {
> +                     pr_warning
> +                         ("unable to set irq affinity (irq=3D%d, cpu=3D%=
u)\n",
> +                          irq, i);
> +                     continue;
> +             }
> +
> +             err =3D request_irq(irq, handler, IRQF_NOBALANCING, "nds32-=
pfm",
> +                               cpu_pmu);
> +             if (err) {
> +                     pr_err("unable to request IRQ%d for NDS PMU counter=
s\n",
> +                            irq);
> +                     return err;
> +             }
> +
> +             cpumask_set_cpu(i, &cpu_pmu->active_irqs);
> +     }
> +
> +     return 0;
> +}

Is nds32 SMP?

If not, this should be simplifed to expect one CPU alone.

If so, this needs to clarify which IRQ maps to which CPU with an
explicit property in the DT, as we do for arm with interrupt-affinity.

Thanks,
Mark.
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
