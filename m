From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH V2 2/5] arm: mvebu: Added initial support for power
 managmement service unit
Date: Mon, 5 Nov 2012 14:05:58 +0000
Message-ID: <20121105140558.GP3351@mudshark.cambridge.arm.com>
References: <1351545108-18954-1-git-send-email-gregory.clement@free-electrons.com>
 <1351545108-18954-3-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1351545108-18954-3-git-send-email-gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Nadav Haklai <nadavh@marvell.com>, Ian Molton <ian.molton@codethink.co.uk>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Russell King <linux@arm.linux.org.uk>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Leif Lindholm <Leif.Lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, "jcm@redhat.com" <jcm@redhat.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Ben Dooks <ben-linux@fluff.org>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 29, 2012 at 09:11:45PM +0000, Gregory CLEMENT wrote:
> diff --git a/arch/arm/mach-mvebu/pmsu.c b/arch/arm/mach-mvebu/pmsu.c
> new file mode 100644
> index 0000000..cee020b
> --- /dev/null
> +++ b/arch/arm/mach-mvebu/pmsu.c
> @@ -0,0 +1,78 @@
> +/*
> + * Power Management Service Unit(PMSU) support for Armada 370/XP platforms.
> + *
> + * Copyright (C) 2012 Marvell
> + *
> + * Yehuda Yitschak <yehuday@marvell.com>
> + * Gregory Clement <gregory.clement@free-electrons.com>
> + * Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2.  This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + *
> + * The Armada 370 and Armada XP SOCs have a power management service
> + * unit which is responsible for powering down and waking up CPUs and
> + * other SOC units
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/of_address.h>
> +#include <linux/io.h>
> +#include <linux/smp.h>
> +#include <asm/smp_plat.h>
> +
> +static void __iomem *pmsu_mp_base;
> +static void __iomem *pmsu_reset_base;
> +
> +#define PMSU_BOOT_ADDR_REDIRECT_OFFSET(cpu)	((cpu * 0x100) + 0x24)
> +#define PMSU_RESET_CTL_OFFSET(cpu)		(cpu * 0x8)
> +
> +static struct of_device_id of_pmsu_table[] = {
> +	{.compatible = "marvell,armada-370-xp-pmsu"},
> +	{ /* end of list */ },
> +};
> +
> +#ifdef CONFIG_SMP
> +int armada_xp_boot_cpu(unsigned int cpu_id, void __iomem *boot_addr)
> +{
> +	int reg, hw_cpu;
> +
> +	if (!pmsu_mp_base || !pmsu_reset_base) {
> +		pr_warn("Can't boot CPU. PMSU is uninitialized\n");
> +		return 1;
> +	}
> +
> +	hw_cpu = cpu_logical_map(cpu_id);
> +
> +	writel(virt_to_phys(boot_addr), pmsu_mp_base +
> +			PMSU_BOOT_ADDR_REDIRECT_OFFSET(hw_cpu));

virt_to_phys on an __iomem * doesn't feel right to me...

> +	/* Make sure value hits memory before reset */
> +	dsb();

writel has barrier semantics -- you shouldn't need this dsb.

Will
