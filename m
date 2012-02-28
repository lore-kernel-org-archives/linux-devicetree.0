From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH WIP] ARM: kirkwood: covert orion-spi to fdt.
Date: Tue, 28 Feb 2012 07:39:24 +0000
Message-ID: <201202280739.24399.arnd@arndb.de>
References: <4a9b37f69d6cec5049627b8afa777bb010af05f6.1330381705.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4a9b37f69d6cec5049627b8afa777bb010af05f6.1330381705.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 27 February 2012, Jason Cooper wrote:
> On the Globalscale Dreamplug (Marvell Kirkwood Development Platform),
> 2MB of NOR flash are used to hold the bootloader, bootloader
> environment, and devicetree blob.  It is connected via spi.
> 
> Signed-off-by: Jason Cooper <jason@lakedaemon.net>
> ---
> Notes:
>     - checkpatch clean.
>     - compiles, boots, registers partitions correctly.

Nice, it seem that it was simpler than I first thought. I think you should
lose some of the #ifdef statements, especially those where no extra
object code gets added because the of_* function calls compile to
empty inline functions.

More importantly, you should not treat CONFIG_OF as an exclusive option:
It should be possible to build a kernel that has CONFIG_OF enabled but
still comes with legacy board files that work like before.

> @@ -524,6 +528,13 @@ static int __init kirkwood_clock_gate(void)
>  	} else  /* keep this bit set for devices that don't have PCIe1 */
>  		kirkwood_clk_ctrl |= CGC_PEX1;
>  
> +#ifdef CONFIG_OF
> +	dp = of_find_node_by_path("/");
> +	if (of_device_is_available(of_find_compatible_node(dp, NULL,
> +							  "marvell,orion-spi")))
> +		kirkwood_clk_ctrl |= CGC_RUNIT;
> +#endif
> +
>  	/* Now gate clock the required units */
>  	writel(kirkwood_clk_ctrl, CLOCK_GATING_CTRL);
>  	printk(KERN_DEBUG " after: 0x%08x\n", readl(CLOCK_GATING_CTRL));

This looks like it could be improved by only enabling the clock
if we actually start using the device from the spi driver, in its
probe function. Not sure if that's worth it.

> @@ -101,10 +102,24 @@ static int orion_spi_baudrate_set(struct spi_device *spi, unsigned int speed)
>  	u32 prescale;
>  	u32 reg;
>  	struct orion_spi *orion_spi;
> +#ifdef CONFIG_OF
> +	const __be32 *prop;
> +	int len;
> +#endif
>  
>  	orion_spi = spi_master_get_devdata(spi->master);
>  
> +#ifdef CONFIG_OF
> +	prop = of_get_property(spi->master->dev.of_node, "clock-frequency",
> +				&len);
> +	if (!prop || len < sizeof(*prop)) {
> +		pr_debug("fdt missing 'clock-frequency' property.\n");
> +		return -EINVAL;
> +	}
> +	tclk_hz = be32_to_cpup(prop);
> +#else
>  	tclk_hz = orion_spi->spi_info->tclk;
> +#endif

of_get_property returns NULL when CONFIG_OF is disabled, so you can turn
this all into a run-time logic:

	if (orion_spi->spi_info)
		tclk_hz = orion_spi->spi_info->tclk;

	of_property_read_u32(spi->master->dev.of_node, 
					"clock-frequency", &tclk_hz);

	if (!tclk_hz) {
		dev_error(&spi->dev, "cannot set clock rate\n");
		return -EINVAL;
	}

>  	/*
>  	 * the supported rates are: 4,6,8...30
> @@ -360,7 +375,11 @@ static int orion_spi_setup(struct spi_device *spi)
>  	orion_spi = spi_master_get_devdata(spi->master);
>  
>  	/* Fix ac timing if required.   */
> +#ifdef CONFIG_OF
> +	if (of_find_property(spi->master->dev.of_node, "spi-clock-fix", NULL))
> +#else
>  	if (orion_spi->spi_info->enable_clock_fix)
> +#endif
>  		orion_spi_setbits(orion_spi, ORION_SPI_IF_CONFIG_REG,
>  				  (1 << 14));

Same thing here:

	if (of_find_property(spi->master->dev.of_node, "spi-clock-fix", NULL) ||
		(orion_spi->spi_info && orion_spi->spi_info->enable_clock_fix))

> +#ifdef CONFIG_OF
> +	orion_spi_wq = create_singlethread_workqueue(
> +				orion_spi_driver.driver.name);
> +	if (orion_spi_wq == NULL)
> +		return -ENOMEM;
> +#endif

This seems wrong: why do you have to create the workqueue again here?

> +#ifdef CONFIG_OF
> +	prop = of_get_property(master->dev.of_node, "clock-frequency", &len);
> +	if (!prop || len < sizeof(*prop)) {
> +		pr_debug("fdt missing 'clock-frequency' property.\n");
> +		status = -EINVAL;
> +		goto out;
> +	}
> +	tclk = be32_to_cpup(prop);
> +
> +	spi->max_speed = DIV_ROUND_UP(tclk, 4);
> +	spi->min_speed = DIV_ROUND_UP(tclk, 30);
> +#else
>  	spi->spi_info = spi_info;
>  
>  	spi->max_speed = DIV_ROUND_UP(spi_info->tclk, 4);
>  	spi->min_speed = DIV_ROUND_UP(spi_info->tclk, 30);
> +#endif

Same code as above? Just find the clock frequency once and store it in  
spi->tclk.

	Arnd
