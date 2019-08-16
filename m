From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 15/19] ARM: mmp: add SMP support
Date: Fri, 16 Aug 2019 11:11:00 -0700
Message-ID: <a433ba97-d317-2876-931b-8e4930681711@gmail.com>
References: <20190809093158.7969-1-lkundrak@v3.sk>
 <20190809093158.7969-16-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809093158.7969-16-lkundrak@v3.sk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>, Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 8/9/19 2:31 AM, Lubomir Rintel wrote:
> Used to bring up the second core on MMP3.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  arch/arm/mach-mmp/Makefile  |  3 +++
>  arch/arm/mach-mmp/platsmp.c | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 arch/arm/mach-mmp/platsmp.c
> 
> diff --git a/arch/arm/mach-mmp/Makefile b/arch/arm/mach-mmp/Makefile
> index 322c1c97dc900..7b3a7f979eece 100644
> --- a/arch/arm/mach-mmp/Makefile
> +++ b/arch/arm/mach-mmp/Makefile
> @@ -22,6 +22,9 @@ ifeq ($(CONFIG_PM),y)
>  obj-$(CONFIG_CPU_PXA910)	+= pm-pxa910.o
>  obj-$(CONFIG_CPU_MMP2)		+= pm-mmp2.o
>  endif
> +ifeq ($(CONFIG_SMP),y)
> +obj-$(CONFIG_MACH_MMP3_DT)	+= platsmp.o
> +endif
>  
>  # board support
>  obj-$(CONFIG_MACH_ASPENITE)	+= aspenite.o
> diff --git a/arch/arm/mach-mmp/platsmp.c b/arch/arm/mach-mmp/platsmp.c
> new file mode 100644
> index 0000000000000..255df640b5bc1
> --- /dev/null
> +++ b/arch/arm/mach-mmp/platsmp.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2019 Lubomir Rintel <lkundrak@v3.sk>
> + */
> +#include <linux/io.h>
> +#include <asm/smp_scu.h>
> +#include <asm/smp.h>
> +#include "addr-map.h"
> +
> +#define SW_BRANCH_VIRT_ADDR	CIU_REG(0x24)
> +
> +static int mmp3_boot_secondary(unsigned int cpu, struct task_struct *idle)
> +{
> +	/*
> +	 * Apparently, the boot ROM on the second core spins on this
> +	 * register becoming non-zero and then jumps to the address written
> +	 * there. No IPIs involved.
> +	 */
> +	__raw_writel(virt_to_phys(secondary_startup), SW_BRANCH_VIRT_ADDR);

You would want to use __pa_symbol() here (which is equivalent, but will
avoid barfing on you with CONFIG_DEBUG_VIRTUAL).
-- 
Florian
