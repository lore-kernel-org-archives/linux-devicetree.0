From: punnaiah choudary kalluri <punnaia@xilinx.com>
Subject: Re: [PATCH RFC v3 2/2] memory: pl353: Add driver for arm pl353 static
 memory controller
Date: Mon, 7 Jul 2014 22:15:38 +0530
Message-ID: <CAGnW=BaU6iS6BNa_MQNAK_Sck-Cv=Z3iL87gMENPQOq2otMjKg@mail.gmail.com>
References: <1403838162-18756-1-git-send-email-punnaia@xilinx.com>
 <4e814a4c-64f9-4dc0-abbb-0f8e87d94a94@BY2FFO11FD003.protection.gbl>
 <4355153.EcMz3bZZ97@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <4355153.EcMz3bZZ97@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "jussi.kivilinna@iki.fi" <jussi.kivilinna@iki.fi>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "joern@logfs.org" <joern@logfs.org>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "acourbot@nvidia.com" <acourbot@nvidia.com>"Gupta, Pekon" <p>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 3, 2014 at 4:09 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Friday 27 June 2014 08:32:42 Punnaiah Choudary Kalluri wrote:
>
>> +/**
>> + * struct pl353_smc_data - Private smc driver structure
>> + * @devclk:          Pointer to the peripheral clock
>> + * @aperclk:         Pointer to the APER clock
>> + */
>> +struct pl353_smc_data {
>> +     struct clk              *memclk;
>> +     struct clk              *aclk;
>> +};
>> +
>> +/* SMC virtual register base */
>> +static void __iomem *pl353_smc_base;
>
> Drivers should not assume that there is only a single instance of the
> hardware in the system. Please remove this global variable and
> change the code to pass around a pointer to a structure containing
> it.

Since, the pl353 nand driver has dependency with this driver for configuring the
bus width,operational parameters and ecc specific settings.
So, i didnt find any mechanism for passing this instance from other driver other
than exporting this instance.
http://lists.infradead.org/pipermail/linux-mtd/2014-April/053432.html

Please suggest the better option if you want it to be not global.

>> +/**
>> + * pl353_smc_set_buswidth - Set memory buswidth
>> + * @bw:      Memory buswidth (8 | 16)
>> + * Return: 0 on success or negative errno.
>> + */
>> +int pl353_smc_set_buswidth(unsigned int bw)
>> +{
>> +
>> +     if (bw != PL353_SMC_MEM_WIDTH_8  && bw != PL353_SMC_MEM_WIDTH_16)
>> +             return -EINVAL;
>> +
>> +     writel(bw, pl353_smc_base + PL353_SMC_SET_OPMODE_OFFS);
>> +     writel(PL353_SMC_DC_UPT_NAND_REGS, pl353_smc_base +
>> +            PL353_SMC_DIRECT_CMD_OFFS);
>> +
>> +     return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(pl353_smc_set_buswidth);
>
> Why is this an exported interface? Wouldn't that setting just be
> determined from DT when the device is probed?

Nand driver rely on auto bus width detection mechanism for identifying
the bus width using onfi parameter page settings. So, once the driver
finds the bus width, updates accordingly using this API

>
>> +/**
>> + * pl353_smc_get_nand_int_status_raw - Get NAND interrupt status bit
>> + * Return: the raw_int_status1 bit from the memc_status register
>> + */
>> +int pl353_smc_get_nand_int_status_raw(void)
>> +{
>> +     u32 reg;
>> +
>> +     reg = readl(pl353_smc_base + PL353_SMC_MEMC_STATUS_OFFS);
>> +     reg >>= PL353_SMC_MEMC_STATUS_RAW_INT_1_SHIFT;
>> +     reg &= 1;
>> +
>> +     return reg;
>> +}
>> +EXPORT_SYMBOL_GPL(pl353_smc_get_nand_int_status_raw);
>> +
>> +/**
>> + * pl353_smc_clr_nand_int - Clear NAND interrupt
>> + */
>> +void pl353_smc_clr_nand_int(void)
>> +{
>> +     writel(PL353_SMC_CFG_CLR_INT_CLR_1,
>> +             pl353_smc_base + PL353_SMC_CFG_CLR_OFFS);
>> +}
>> +EXPORT_SYMBOL_GPL(pl353_smc_clr_nand_int);
>
> Why aren't these just part of the NAND driver?

As mentioned, SMC supports two interfaces and most of the register contains
the control/status bits for both the interfaces. so, the smc driver
provides relevant
APIs for controlling the nand and nor/sram interfaces. The current
version of the
driver supports nand interface but the future versions include
nor/sram interface.

>
>> +     pl353_smc_set_cycles(t_rc, t_wc, t_rea, t_wp, t_clr, t_ar, t_rr);
>> +     writel(PL353_SMC_CFG_CLR_INT_CLR_1,
>> +             pl353_smc_base + PL353_SMC_CFG_CLR_OFFS);
>> +     writel(PL353_SMC_DC_UPT_NAND_REGS, pl353_smc_base +
>> +            PL353_SMC_DIRECT_CMD_OFFS);
>> +     /* Wait till the ECC operation is complete */
>> +     do {
>> +             if (pl353_smc_ecc_is_busy_noirq())
>> +                     cpu_relax();
>> +             else
>> +                     break;
>> +     } while (!time_after_eq(jiffies, timeout));
>
> This blocks the CPU for up to a second (the timeout value). Since you are
> not in atomic context, you can instead sleep here, e.g. using msleep(1)
> or some other appropriate timeout.
>
> What is the expected average duration of the loop?

The expected duration of the loop depends on the given timing parameters.
In the worst case it should not be more than 2-3 milli seconds and in the best
case it should be 2-3 micro seconds. I agree your point to use msleep rather
than the busy wait using cpu_relax. I will fix this in next version.

Please provide your inputs for my above answers.

Thanks for the review
Punnaiah
>
>         Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
