From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RFC v3 2/2] memory: pl353: Add driver for arm pl353 static memory controller
Date: Thu, 03 Jul 2014 12:39:29 +0200
Message-ID: <4355153.EcMz3bZZ97@wuerfel>
References: <1403838162-18756-1-git-send-email-punnaia@xilinx.com> <4e814a4c-64f9-4dc0-abbb-0f8e87d94a94@BY2FFO11FD003.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <4e814a4c-64f9-4dc0-abbb-0f8e87d94a94@BY2FFO11FD003.protection.gbl>
Sender: linux-doc-owner@vger.kernel.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, michal.simek@xilinx.com, grant.likely@linaro.org, gregkh@linuxfoundation.org, jason@lakedaemon.net, ezequiel.garcia@free-electrons.com, dwmw2@infradead.org, computersforpeace@gmail.com, artem.bityutskiy@linux.intel.com, pekon@ti.com, jussi.kivilinna@iki.fi, acourbot@nvidia.com, ivan.khoronzhuk@ti.com, joern@logfs.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, kpc528@gmail.com, kalluripunnaiahchoudary@gmail.com, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Friday 27 June 2014 08:32:42 Punnaiah Choudary Kalluri wrote:

> +/**
> + * struct pl353_smc_data - Private smc driver structure
> + * @devclk:		Pointer to the peripheral clock
> + * @aperclk:		Pointer to the APER clock
> + */
> +struct pl353_smc_data {
> +	struct clk		*memclk;
> +	struct clk		*aclk;
> +};
> +
> +/* SMC virtual register base */
> +static void __iomem *pl353_smc_base;

Drivers should not assume that there is only a single instance of the
hardware in the system. Please remove this global variable and
change the code to pass around a pointer to a structure containing
it.

> +/**
> + * pl353_smc_set_buswidth - Set memory buswidth
> + * @bw:	Memory buswidth (8 | 16)
> + * Return: 0 on success or negative errno.
> + */
> +int pl353_smc_set_buswidth(unsigned int bw)
> +{
> +
> +	if (bw != PL353_SMC_MEM_WIDTH_8  && bw != PL353_SMC_MEM_WIDTH_16)
> +		return -EINVAL;
> +
> +	writel(bw, pl353_smc_base + PL353_SMC_SET_OPMODE_OFFS);
> +	writel(PL353_SMC_DC_UPT_NAND_REGS, pl353_smc_base +
> +	       PL353_SMC_DIRECT_CMD_OFFS);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(pl353_smc_set_buswidth);

Why is this an exported interface? Wouldn't that setting just be
determined from DT when the device is probed?

> +/**
> + * pl353_smc_get_nand_int_status_raw - Get NAND interrupt status bit
> + * Return: the raw_int_status1 bit from the memc_status register
> + */
> +int pl353_smc_get_nand_int_status_raw(void)
> +{
> +	u32 reg;
> +
> +	reg = readl(pl353_smc_base + PL353_SMC_MEMC_STATUS_OFFS);
> +	reg >>= PL353_SMC_MEMC_STATUS_RAW_INT_1_SHIFT;
> +	reg &= 1;
> +
> +	return reg;
> +}
> +EXPORT_SYMBOL_GPL(pl353_smc_get_nand_int_status_raw);
> +
> +/**
> + * pl353_smc_clr_nand_int - Clear NAND interrupt
> + */
> +void pl353_smc_clr_nand_int(void)
> +{
> +	writel(PL353_SMC_CFG_CLR_INT_CLR_1,
> +		pl353_smc_base + PL353_SMC_CFG_CLR_OFFS);
> +}
> +EXPORT_SYMBOL_GPL(pl353_smc_clr_nand_int);

Why aren't these just part of the NAND driver?

> +	pl353_smc_set_cycles(t_rc, t_wc, t_rea, t_wp, t_clr, t_ar, t_rr);
> +	writel(PL353_SMC_CFG_CLR_INT_CLR_1,
> +		pl353_smc_base + PL353_SMC_CFG_CLR_OFFS);
> +	writel(PL353_SMC_DC_UPT_NAND_REGS, pl353_smc_base +
> +	       PL353_SMC_DIRECT_CMD_OFFS);
> +	/* Wait till the ECC operation is complete */
> +	do {
> +		if (pl353_smc_ecc_is_busy_noirq())
> +			cpu_relax();
> +		else
> +			break;
> +	} while (!time_after_eq(jiffies, timeout));

This blocks the CPU for up to a second (the timeout value). Since you are
not in atomic context, you can instead sleep here, e.g. using msleep(1)
or some other appropriate timeout.

What is the expected average duration of the loop?

	Arnd
