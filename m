From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 5/5] soc: renesas: rcar-topology: Add support to be aware
 cpu capacity
Date: Mon, 5 Mar 2018 11:46:03 +0100
Message-ID: <CAMuHMdVZzCOqatGA4PH0Gr+noTEhQ8RAW=pK5K1e7KrAM8VS-A@mail.gmail.com>
References: <1519697995-6061-1-git-send-email-gaku.inami.xh@renesas.com>
 <1519697995-6061-6-git-send-email-gaku.inami.xh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519697995-6061-6-git-send-email-gaku.inami.xh@renesas.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gaku Inami <gaku.inami.xh@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Inami-san,

On Tue, Feb 27, 2018 at 3:19 AM, Gaku Inami <gaku.inami.xh@renesas.com> wrote:
> Some R-Car SoCs support big LITTLE architecture produced by ARM, that
> have different power/performance characteristics between each CPUs.
> In order to aware such as difference, this patch changes the sched
> domain flags that the tasks can be scheduled with capacity awareness.
> If you use big LITTLE without this patch, the scheduler may make
> unintended behaviors.
>
> Signed-off-by: Gaku Inami <gaku.inami.xh@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/soc/renesas/rcar-topology.c
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  R-Car CPU topology for ARM big.LITTLE platforms
> + *
> + * Copyright (C) 2018 Renesas Electronics Corporation.
> + *
> + */
> +
> +#include <linux/cpuset.h>
> +#include <linux/init.h>
> +#include <linux/of.h>
> +#include <linux/sched/topology.h>
> +#include <linux/topology.h>
> +
> +static int rcar_cpu_cpu_flags(void)
> +{
> +       return SD_ASYM_CPUCAPACITY;
> +}
> +
> +static struct sched_domain_topology_level rcar_topology[] = {
> +#ifdef CONFIG_SCHED_MC
> +       { cpu_coregroup_mask, cpu_core_flags, SD_INIT_NAME(MC) },
> +#endif
> +       { cpu_cpu_mask, rcar_cpu_cpu_flags, SD_INIT_NAME(DIE) },
> +       { NULL, }
> +};
> +
> +static int __init rcar_topology_init(void)
> +{
> +       if (of_machine_is_compatible("renesas,r8a7795") ||
> +           of_machine_is_compatible("renesas,r8a7796"))
> +               set_sched_topology(rcar_topology);
> +
> +       return 0;
> +}
> +early_initcall(rcar_topology_init);

None of the above seems R-Car specific to me. So please explain why this
can't just be added to arch/arm64/kernel/topology.c instead, and enabled
unconditionally.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
