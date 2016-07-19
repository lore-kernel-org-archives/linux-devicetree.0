From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] drivers/perf: arm-pmu: Handle per-interrupt affinity mask
Date: Tue, 19 Jul 2016 16:24:07 +0200
Message-ID: <CAMuHMdV6tUvegGebYkdL0Z+h0a7qf=hFDW2xUJESt_68-SV2Yg@mail.gmail.com>
References: <1467815627-4061-1-git-send-email-marc.zyngier@arm.com>
 <CAMuHMdXU6C=jFD16Jj3NFNawiY0YEpQDZSbL+T4bLgUOG3nTUQ@mail.gmail.com> <578E2F40.1000309@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <578E2F40.1000309@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Heiko Stuebner <heiko@sntech.de>, cf@rock-chips.com, huangtao@rock-chips.com, Xu Jianqun <jay.xu@rock-chips.com>, Caesar Wang <wxt@rock-chips.com>, David Wu <david.wu@rock-chips.com>, Brian Norris <briannorris@chromium.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Marc,

On Tue, Jul 19, 2016 at 3:46 PM, Marc Zyngier <marc.zyngier@arm.com> wrote:
> On 19/07/16 14:25, Geert Uytterhoeven wrote:
>> On Wed, Jul 6, 2016 at 4:33 PM, Marc Zyngier <marc.zyngier@arm.com> wrote:
>>> On a big-little system, PMUs can be wired to CPUs using per CPU
>>> interrups (PPI). In this case, it is important to make sure that
>>> the enable/disable do happen on the right set of CPUs.
>>>
>>> So instead of relying on the interrupt-affinity property, we can
>>> use the actual percpu affinity that DT exposes as part of the
>>> interrupt specifier. The DT binding is also updated to reflect
>>> the fact that the interrupt-affinity property shouldn't be used
>>> in that case.
>>>
>>> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
>>> ---
>>> * From v1:
>>>   - propagate the error if irq_get_percpu_devid_partition fails
>>
>> This patch, which is commit 19a469a58720ea96 in arm64/for-next/core, broke
>> the PMU on r8a7740/armadillo800eva:
>>
>>     -hw perfevents: enabled with armv7_cortex_a9 PMU driver, 7
>> counters available
>>     +hw perfevents: /pmu: failed to probe PMU!
>>     +hw perfevents: /pmu: failed to register PMU devices!
>>     +armv7-pmu: probe of pmu failed with error -22

> Thanks for the thorough analysis. Could you please give the following
> patchlet a go:
>
> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index 2513365..9275e08 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -958,11 +958,12 @@ static int of_pmu_irq_cfg(struct arm_pmu *pmu)
>
>         /* If we didn't manage to parse anything, try the interrupt affinity */
>         if (cpumask_weight(&pmu->supported_cpus) == 0) {
> -               if (!using_spi) {
> +               int irq = platform_get_irq(pdev, 0);
> +
> +               if (irq_is_percpu(irq)) {
>                         /* If using PPIs, check the affinity of the partition */
> -                       int ret, irq;
> +                       int ret;
>
> -                       irq = platform_get_irq(pdev, 0);
>                         ret = irq_get_percpu_devid_partition(irq, &pmu->supported_cpus);
>                         if (ret) {
>                                 kfree(irqs);
>
>
> and let me know if that helps?

Thanks, that fixes it, as expected.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
