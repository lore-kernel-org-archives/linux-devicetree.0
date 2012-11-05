From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH V2 1/5] arm: mvebu: Added support for coherency fabric in
 mach-mvebu
Date: Mon, 5 Nov 2012 14:02:58 +0000
Message-ID: <20121105140258.GO3351@mudshark.cambridge.arm.com>
References: <1351545108-18954-1-git-send-email-gregory.clement@free-electrons.com>
 <1351545108-18954-2-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1351545108-18954-2-git-send-email-gregory.clement@free-electrons.com>
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

Hi Gregory,

On Mon, Oct 29, 2012 at 09:11:44PM +0000, Gregory CLEMENT wrote:
> diff --git a/arch/arm/mach-mvebu/coherency.c b/arch/arm/mach-mvebu/coherency.c
> new file mode 100644
> index 0000000..69e130d
> --- /dev/null
> +++ b/arch/arm/mach-mvebu/coherency.c
> @@ -0,0 +1,89 @@
> +/*
> + * Coherency fabric (Aurora) support for Armada 370 and XP platforms.
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
> + * The Armada 370 and Armada XP SOCs have a coherency fabric which is
> + * responsible for ensuring hardware coherency between all CPUs and between
> + * CPUs and I/O masters. This file initializes the coherency fabric and
> + * supplies basic routines for configuring and controlling hardware coherency
> + */

[...]

> +int set_cpu_coherent(unsigned int hw_cpu_id, int smp_group_id)
> +{
> +	int reg;
> +
> +	if (!coherency_base) {
> +		pr_warn("Can't make CPU %d cache coherent.\n", hw_cpu_id);
> +		pr_warn("Coherency fabric is not initialized\n");
> +		return 1;
> +	}
> +
> +	/* Enable the CPU in coherency fabric */
> +	reg = readl(coherency_base + COHERENCY_FABRIC_CTL_OFFSET);
> +	reg |= 1 << (24 + hw_cpu_id);
> +	writel(reg, coherency_base + COHERENCY_FABRIC_CTL_OFFSET);
> +
> +	/* Add CPU to SMP group */
> +	reg = readl(coherency_base + COHERENCY_FABRIC_CFG_OFFSET);
> +	reg |= 1 << (16 + hw_cpu_id + (smp_group_id == 0 ? 8 : 0));
> +	writel(reg, coherency_base + COHERENCY_FABRIC_CFG_OFFSET);
> +
> +	return 0;
> +}

These writels may expand to code containing calls to outer_sync(), which
will attempt to take a spinlock for the aurora l2. Given that the CPU isn't
coherent, how does this play out with the exclusive store instruction in the
lock?

Will
