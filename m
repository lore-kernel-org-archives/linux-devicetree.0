From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 5/5] arm: mvebu: Added SMP support for Armada XP
Date: Mon, 22 Oct 2012 20:45:37 +0200
Message-ID: <20121022184537.GN21046@lunn.ch>
References: <1350925368-24243-1-git-send-email-gregory.clement@free-electrons.com>
 <1350925368-24243-6-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1350925368-24243-6-git-send-email-gregory.clement@free-electrons.com>
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
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Will Deacon <will.deacon@arm.com>, Nadav Haklai <nadavh@marvell.com>, Ian Molton <ian.molton@codethink.co.uk>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Russell King <linux@arm.linux.org.uk>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Li Li <li.li@canonical.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Ben Dooks <ben-linux@fluff.org>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.or
List-Id: devicetree@vger.kernel.org

Hi Gregory

> +void __init set_secondary_cpus_clock(void)
> +{
> +	int cpu;
> +	unsigned long rate;
> +	struct clk *cpu_clk = NULL;
> +	struct device_node *np = NULL;
> +
> +	cpu = smp_processor_id();
> +	np = of_find_node_by_type(np, "cpu");
> +	np = NULL;
> +	while ((np = of_find_node_by_type(np, "cpu"))) {
> +		const u32 *reg;
> +		int len;
> +		reg = of_get_property(np, "reg", &len);
> +		if (!reg || len != 4) {
> +			pr_err("%s missing reg property\n", np->full_name);
> +			continue;
> +		}
> +		if (be32_to_cpup(reg) == cpu) {
> +			cpu_clk = of_clk_get(np, 0);
> +			break;
> +		}
> +	}
> +	WARN_ON(IS_ERR(cpu_clk));
> +	rate = clk_get_rate(cpu_clk);
> +
> +	/* set all the other CPU clk to the same rate than the boot CPU */
> +	np = NULL;
> +	while ((np = of_find_node_by_type(np, "cpu"))) {
> +		const u32 *reg;
> +		int len;
> +		reg = of_get_property(np, "reg", &len);
> +		if (!reg || len != 4) {
> +			pr_err("%s missing reg property\n", np->full_name);
> +			continue;
> +		}
> +		if (be32_to_cpup(reg) != cpu) {
> +			cpu_clk = of_clk_get(np, 0);
> +			clk_set_rate(cpu_clk, rate);
> +		}

Maybe its hiding somewhere, but where is the clk_prepare_enable() for
this cpu_clk clock?

     Andrew
