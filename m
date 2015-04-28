From: Ben Shelton <ben.shelton@ni.com>
Subject: Re: [PATCH v6 2/2] memory: pl353: Add driver for arm pl353 static
 memory controller
Date: Tue, 28 Apr 2015 10:11:38 -0500
Message-ID: <20150428151138.GB11721@bshelton-desktop>
References: <1428941512-26411-1-git-send-email-punnaia@xilinx.com>
 <a1f437fe-51cf-4a89-87b4-8f0a305e68ed@BN1AFFO11FD026.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <a1f437fe-51cf-4a89-87b4-8f0a305e68ed@BN1AFFO11FD026.protection.gbl>
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, michal.simek@xilinx.com, grant.likely@linaro.org, gregkh@linuxfoundation.org, jason@lakedaemon.net, ezequiel.garcia@free-electrons.com, arnd@arndb.de, dwmw2@infradead.org, computersforpeace@gmail.com, artem.bityutskiy@linux.intel.com, jussi.kivilinna@iki.fi, acourbot@nvidia.com, ivan.khoronzhuk@ti.com, joern@logfs.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, kpc528@gmail.com, kalluripunnaiahchoudary@gmail.com, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: devicetree@vger.kernel.org

Hi Punnaiah,

> +/**
> + * pl353_smc_set_cycles - Set memory timing parameters
> + * @dev:	Pointer to the device struct
> + * @t0:	t_rc		read cycle time
> + * @t1:	t_wc		write cycle time
> + * @t2:	t_rea/t_ceoe	output enable assertion delay
> + * @t3:	t_wp		write enable deassertion delay
> + * @t4:	t_clr/t_pc	page cycle time
> + * @t5:	t_ar/t_ta	ID read time/turnaround time
> + * @t6:	t_rr		busy to RE timing
> + *
> + * Sets NAND chip specific timing parameters.
> + */
> +void pl353_smc_set_cycles(struct device *dev, u32 t0, u32 t1, u32 t2, u32 t3,
> +			  u32 t4, u32 t5, u32 t6)
> +{
> +	struct pl353_smc_data *pl353_smc = dev_get_drvdata(dev);
> +
> +	t0 &= PL353_SMC_SET_CYCLES_T0_MASK;
> +	t1 = (t1 & PL353_SMC_SET_CYCLES_T1_MASK) <<
> +			PL353_SMC_SET_CYCLES_T1_SHIFT;
> +	t2 = (t2 & PL353_SMC_SET_CYCLES_T2_MASK) <<
> +			PL353_SMC_SET_CYCLES_T2_SHIFT;
> +	t3 = (t3 & PL353_SMC_SET_CYCLES_T3_MASK) <<
> +			PL353_SMC_SET_CYCLES_T3_SHIFT;
> +	t4 = (t4 & PL353_SMC_SET_CYCLES_T4_MASK) <<
> +			PL353_SMC_SET_CYCLES_T4_SHIFT;
> +	t5 = (t5 & PL353_SMC_SET_CYCLES_T5_MASK) <<
> +			PL353_SMC_SET_CYCLES_T5_SHIFT;
> +	t6 = (t6 & PL353_SMC_SET_CYCLES_T6_MASK) <<
> +			PL353_SMC_SET_CYCLES_T6_SHIFT;

Right now, if the caller (i.e. the PL353 NAND driver) passes in a value for any
of the timing parameters that is too large, it will be truncated with the
corresponding mask and then saved, resulting in unexpected behavior.  I saw
this when the PL353 NAND driver tried to set t_rc and t_wc to 17 cycles, which
does not fit in the 4-bit fields for those values -- it got clipped to 4 bits
and stored as 1 cycle, which made communication with the NAND chip fail and
time out.

It would be good to sanity-check each timing here, and rather than returning
void, return a return code indicating success or failure (e.g. -EINVAL for
invalid timings).

Note also that truncation isn't the only thing to check for here.  The PL350
r2p1 datasheet lists a "Minimum permitted value" for each of these timing
values.

> +
> +	t0 |= t1 | t2 | t3 | t4 | t5 | t6;
> +
> +	writel(t0, pl353_smc->base + PL353_SMC_SET_CYCLES_OFFS);
> +	writel(PL353_SMC_DC_UPT_NAND_REGS, pl353_smc->base +
> +	       PL353_SMC_DIRECT_CMD_OFFS);
> +}
> +EXPORT_SYMBOL_GPL(pl353_smc_set_cycles);
> +

Thanks,
Ben
