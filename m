From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2] drivers/perf: arm-pmu: Handle per-interrupt affinity mask
Date: Tue, 19 Jul 2016 15:25:30 +0200
Message-ID: <CAMuHMdXU6C=jFD16Jj3NFNawiY0YEpQDZSbL+T4bLgUOG3nTUQ@mail.gmail.com>
References: <1467815627-4061-1-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467815627-4061-1-git-send-email-marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Xu Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Marc, Catalin, Will,

On Wed, Jul 6, 2016 at 4:33 PM, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote:
> On a big-little system, PMUs can be wired to CPUs using per CPU
> interrups (PPI). In this case, it is important to make sure that
> the enable/disable do happen on the right set of CPUs.
>
> So instead of relying on the interrupt-affinity property, we can
> use the actual percpu affinity that DT exposes as part of the
> interrupt specifier. The DT binding is also updated to reflect
> the fact that the interrupt-affinity property shouldn't be used
> in that case.
>
> Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> ---
> * From v1:
>   - propagate the error if irq_get_percpu_devid_partition fails

This patch, which is commit 19a469a58720ea96 in arm64/for-next/core, broke
the PMU on r8a7740/armadillo800eva:

    -hw perfevents: enabled with armv7_cortex_a9 PMU driver, 7
counters available
    +hw perfevents: /pmu: failed to probe PMU!
    +hw perfevents: /pmu: failed to register PMU devices!
    +armv7-pmu: probe of pmu failed with error -22

This is a single-core Cortex A9.

>  Documentation/devicetree/bindings/arm/pmu.txt |  4 +++-
>  drivers/perf/arm_pmu.c                        | 27 ++++++++++++++++++++++-----
>  2 files changed, 25 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/pmu.txt b/Documentation/devicetree/bindings/arm/pmu.txt
> index 74d5417..61c8b46 100644
> --- a/Documentation/devicetree/bindings/arm/pmu.txt
> +++ b/Documentation/devicetree/bindings/arm/pmu.txt
> @@ -39,7 +39,9 @@ Optional properties:
>                         When using a PPI, specifies a list of phandles to CPU
>                        nodes corresponding to the set of CPUs which have
>                        a PMU of this type signalling the PPI listed in the
> -                      interrupts property.
> +                      interrupts property, unless this is already specified
> +                      by the PPI interrupt specifier itself (in which case
> +                      the interrupt-affinity property shouldn't be present).
>
>                         This property should be present when there is more than
>                        a single SPI.

On a single core, there's only a single SPI, hence there's no need for an
"interrupt-affinity" property.

> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index 140436a..8e4d7f5 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -961,9 +964,23 @@ static int of_pmu_irq_cfg(struct arm_pmu *pmu)
>                 i++;
>         } while (1);
>
> -       /* If we didn't manage to parse anything, claim to support all CPUs */
> -       if (cpumask_weight(&pmu->supported_cpus) == 0)
> -               cpumask_setall(&pmu->supported_cpus);
> +       /* If we didn't manage to parse anything, try the interrupt affinity */
> +       if (cpumask_weight(&pmu->supported_cpus) == 0) {
> +               if (!using_spi) {

However, using_spi is never set to true in the absence of that property,
causing the wrong branch to be taken...

> +                       /* If using PPIs, check the affinity of the partition */
> +                       int ret, irq;
> +
> +                       irq = platform_get_irq(pdev, 0);
> +                       ret = irq_get_percpu_devid_partition(irq, &pmu->supported_cpus);

... and ret to become -22 here.

> +                       if (ret) {
> +                               kfree(irqs);
> +                               return ret;
> +                       }
> +               } else {
> +                       /* Otherwise default to all CPUs */
> +                       cpumask_setall(&pmu->supported_cpus);
> +               }
> +       }
>
>         /* If we matched up the IRQ affinities, use them to route the SPIs */
>         if (using_spi && i == pdev->num_resources)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
