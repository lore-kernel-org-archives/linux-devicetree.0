From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v3 1/1] ARM: imx28: add basic dt support
Date: Fri, 30 Mar 2012 16:51:06 +0800
Message-ID: <20120330085103.GF3254@S2101-09.ap.freescale.net>
References: <1333089130-24832-1-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1333089130-24832-1-git-send-email-b29396@freescale.com>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dong Aisheng <b29396@freescale.com>
Cc: devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, marek.vasut@gmail.com, kernel@pengutronix.de, s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

I tried to apply the patch, but ...

On Fri, Mar 30, 2012 at 02:32:10PM +0800, Dong Aisheng wrote:
...
> +static int __init mxs_icoll_add_irq_domain(struct device_node *np,
> +				struct device_node *interrupt_parent)
> +{
> +	irq_domain_add_simple(np, 0);

The irq_domain_add_simple() has been removed from mainline.  You need
a rebase against Linus' tree.

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mxs_irq_match[] __initconst = {
> +	{ .compatible = "fsl,mxs-icoll", .data = mxs_icoll_add_irq_domain, },
> +	{ /* sentinel */ }
> +};
> +
> +static void __init mxs_dt_init_irq(void)
> +{
> +	icoll_init_irq();
> +	of_irq_init(mxs_irq_match);
> +}
> +
> +static void __init imx28_timer_init(void)
> +{
> +	mx28_clocks_init();
> +}
> +
> +static struct sys_timer imx28_timer = {
> +	.init = imx28_timer_init,
> +};
> +
> +static void __init mxs_machine_init(void)
> +{
> +       of_platform_populate(NULL, of_default_bus_match_table,

Given by checkpatch:

WARNING: please, no spaces at the start of a line
#565: FILE: arch/arm/mach-mxs/mach-mxs.c:51:
+       of_platform_populate(NULL, of_default_bus_match_table,$

> +				NULL, NULL);
> +}

-- 
Regards,
Shawn
