From: Ben Shelton <ben.shelton@ni.com>
Subject: Re: [PATCH v6 1/3] nand: pl353: Add basic driver for arm pl353 smc
 nand interface
Date: Tue, 28 Apr 2015 10:38:13 -0500
Message-ID: <20150428153813.GC11721@bshelton-desktop>
References: <1428941550-4620-1-git-send-email-punnaia@xilinx.com>
 <858a607d-7c5a-4066-aa79-ab14c456b8e5@BN1BFFO11FD046.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <858a607d-7c5a-4066-aa79-ab14c456b8e5@BN1BFFO11FD046.protection.gbl>
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, michal.simek@xilinx.com, grant.likely@linaro.org, gregkh@linuxfoundation.org, jason@lakedaemon.net, ezequiel.garcia@free-electrons.com, arnd@arndb.de, dwmw2@infradead.org, computersforpeace@gmail.com, artem.bityutskiy@linux.intel.com, jussi.kivilinna@iki.fi, acourbot@nvidia.com, ivan.khoronzhuk@ti.com, joern@logfs.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, kpc528@gmail.com, kalluripunnaiahchoudary@gmail.com, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: devicetree@vger.kernel.org

Hi Punnaiah,

On 04/13, Punnaiah Choudary Kalluri wrote:
> Add driver for arm pl353 static memory controller nand interface with
> HW ECC support. This controller is used in xilinx zynq soc for interfacing
> the nand flash memory.
> 
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>

[...]

> +
> +static int pl353_nand_init_timing(struct device *dev, int mode)
> +{
> +	const struct nand_sdr_timings *time;
> +	u32 t_rc, t_wc, t_rea, t_wp, t_clr, t_ar, t_rr;
> +	ulong clkrate;
> +
> +	time = onfi_async_timing_mode_to_sdr_timings(mode);
> +	if (IS_ERR(time))
> +		return PTR_ERR(time);
> +
> +	clkrate = pl353_smc_get_clkrate(dev);
> +	t_rc  = get_cyc_from_ns(clkrate, time->tRC_min / 1000);
> +	t_wc  = get_cyc_from_ns(clkrate, time->tWC_min / 1000);
> +	t_rea = get_cyc_from_ns(clkrate, time->tREA_max / 1000);
> +	t_wp  = get_cyc_from_ns(clkrate, time->tWP_min / 1000);
> +	t_clr = get_cyc_from_ns(clkrate, time->tCLR_min / 1000);
> +	t_ar  = get_cyc_from_ns(clkrate, time->tAR_min / 1000);
> +	t_rr  = get_cyc_from_ns(clkrate, time->tRR_min / 1000);

I tested this patch set in conjunction with your PL353 SMC patch set.

Our first stage bootloader sets the SMC memclk rate to 166.6 MHz, which leads
this code to calculate a t_rc and t_wc of 17 cycles for ONFI mode 0.  As I
mentioned in my response to your SMC patch, this overflows the 4-bit-wide
register fields in the SMC that hold these values.

Could we somehow set it up so the NAND and SMC drivers work together to adjust
the memclk rate, if necessary, to achieve the desired timings?  Or is there a
better way to handle this?

> +
> +	pl353_smc_set_cycles(dev, t_rc, t_wc, t_rea, t_wp, t_clr, t_ar, t_rr);
> +
> +	return 0;
> +}

Thanks,
Ben
