From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V10 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Fri, 13 May 2016 02:24:46 +0200
Message-ID: <57351ECE.2020009@denx.de>
References: <1452486886-8049-1-git-send-email-marex@denx.de>	 <1452486886-8049-2-git-send-email-marex@denx.de> <1463097635.9103.301.camel@rtred1test09.kymeta.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463097635.9103.301.camel-dVGoCQn2UwS33l2LyG1otL1RWLrjA2wiZkel5v8DVj8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Trent Piepho <tpiepho-KTxT7QYAYfgCx7yrEBmKXg@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "R, Vignesh" <vigneshr-l0cyMroinI0@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/13/2016 02:00 AM, Trent Piepho wrote:
> On Mon, 2016-01-11 at 05:34 +0100, Marek Vasut wrote:
>> From: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
>>
>> Add support for the Cadence QSPI controller. This controller is
>> present in the Altera SoCFPGA SoCs and this driver has been tested
>> on the Cyclone V SoC.
> 
> I'm trying to use this driver the Alaric Devkit for Altera's Arria10
> SoC.  It's not working so far.  In the course of trying to debug it,
> I've found a few things with the driver in the socfpga-4.1-ltsi branch.

So are you trying to debug this driver or some other out-of-tree driver?
btw. I pushed the latest version here:

https://git.kernel.org/cgit/linux/kernel/git/marex/linux-2.6.git/log/?h=next/cadence-qspi

> However most of them are in code that's not present in this driver,
> which is the newest post of the code I could find to reply to.

I will check the rest later, thanks!

>> +					 CQSPI_REG_IRQ_WATERMARK	| \
>> +					 CQSPI_REG_IRQ_UNDERFLOW)
>> +
>> +#define CQSPI_IRQ_STATUS_MASK		0x1FFFF
>> +
> 
> Perhaps a comment.
> /* waits for all bits set in mask to be zero (clear==false) or one
> (clear==true) */
> 
>> +static int cqspi_wait_for_bit(void __iomem *reg, const u32 mask, bool clear)
>> +{
>> +	unsigned long end = jiffies + msecs_to_jiffies(CQSPI_TIMEOUT_MS);
>> +	u32 val;
>> +
>> +	while (1) {
>> +		val = readl(reg);
>> +		if (clear)
>> +			val = ~val;
>> +		val &= mask;
>> +
>> +		if (val == mask)
>> +			return 0;
> 
> Somewhat simpler.
> 
> if ((readl(reg) & mask) == (clear ? 0 : mask))
>         return 0;
> 
>> +
>> +		if (time_after(jiffies, end))
>> +			return -ETIMEDOUT;
> 
> Note that there is a hypervisor/vm/long hardirq etc. bug that can happen
> without timeouts like this.  What happens is after the check of the bits
> fails, there is a very long delay before this task runs again.  This can
> be easy if one is running under virtualization.  The the time_after call
> reports the timeout expired.  But the last time it the bit was checked,
> before the long delay, was well before the timeout expired.  The way to
> avoid this is to always be sure to check the condition once after the
> timeout expired.  This is sure to give the full timeout.
> 
> 
>> +	}
>> +}
>> +
> 
>> +
>> +static unsigned int calculate_ticks_for_ns(const unsigned int ref_clk_hz,
>> +					   const unsigned int ns_val)
>> +{
>> +	unsigned int ticks;
>> +
>> +	ticks = ref_clk_hz / 1000;	/* kHz */
> This division doesn't round up.
> 
>> +	ticks = DIV_ROUND_UP(ticks * ns_val, 1000000);
> But this one does.
> 
>> +
>> +	return ticks;
>> +}
>> +
>> +static void cqspi_delay(struct spi_nor *nor, const unsigned int sclk_hz)
>> +{
>> +	struct cqspi_flash_pdata *f_pdata = nor->priv;
>> +	struct cqspi_st *cqspi = f_pdata->cqspi;
> 
> Isn't the sclk_hz parameter of this function already available here as
> cqspi->sclk?
> 
>> +	void __iomem *iobase = cqspi->iobase;
>> +	const unsigned int ref_clk_hz = cqspi->master_ref_clk_hz;
>> +	unsigned int tshsl, tchsh, tslch, tsd2d;
>> +	unsigned int reg;
>> +	unsigned int tsclk;
>> +
>> +	/* calculate the number of ref ticks for one sclk tick */
>> +	tsclk = (ref_clk_hz + sclk_hz - 1) / sclk_hz;
> 
> DIV_ROUND_UP(ref_clk_hz, sclk_hz);
> 
>> +
>> +	tshsl = calculate_ticks_for_ns(ref_clk_hz, f_pdata->tshsl_ns);
>> +	/* this particular value must be at least one sclk */
>> +	if (tshsl < tsclk)
>> +		tshsl = tsclk;
>> +
>> +	tchsh = calculate_ticks_for_ns(ref_clk_hz, f_pdata->tchsh_ns);
>> +	tslch = calculate_ticks_for_ns(ref_clk_hz, f_pdata->tslch_ns);
>> +	tsd2d = calculate_ticks_for_ns(ref_clk_hz, f_pdata->tsd2d_ns);
>> +
>> +	reg = (tshsl & CQSPI_REG_DELAY_TSHSL_MASK)
>> +	       << CQSPI_REG_DELAY_TSHSL_LSB;
>> +	reg |= (tchsh & CQSPI_REG_DELAY_TCHSH_MASK)
>> +		<< CQSPI_REG_DELAY_TCHSH_LSB;
>> +	reg |= (tslch & CQSPI_REG_DELAY_TSLCH_MASK)
>> +		<< CQSPI_REG_DELAY_TSLCH_LSB;
>> +	reg |= (tsd2d & CQSPI_REG_DELAY_TSD2D_MASK)
>> +		<< CQSPI_REG_DELAY_TSD2D_LSB;
>> +	writel(reg, iobase + CQSPI_REG_DELAY);
>> +}
>> +
>> +static void cqspi_config_baudrate_div(struct cqspi_st *cqspi,
>> +				      const unsigned int sclk_hz)
>> +{
> 
> sclk_hz is available as cqspi->sclk.
> 
>> +	const unsigned int ref_clk_hz = cqspi->master_ref_clk_hz;
>> +	void __iomem *reg_base = cqspi->iobase;
>> +	unsigned int reg;
>> +	unsigned int div;
>> +
>> +	reg = readl(reg_base + CQSPI_REG_CONFIG);
>> +	reg &= ~(CQSPI_REG_CONFIG_BAUD_MASK << CQSPI_REG_CONFIG_BAUD_LSB);
>> +
>> +	div = ref_clk_hz / sclk_hz;
> 
> Should this round up too?
> 
>> +
>> +	/* Recalculate the baudrate divisor based on QSPI specification. */
>> +	if (div > 32)
>> +		div = 32;
>> +
>> +	/* Check if even number. */
>> +	if (div & 1)
>> +		div = (div / 2);
>> +	else
>> +		div = (div / 2) - 1;
> 
> Wouldn't this be the same as div = DIV_ROUND_UP(div, 2) - 1;
> 
> The entire div calculation could be done with:
> 
>    /* Register programmed with divider minus 1 */
>    div = DIV_ROUND_UP(ref_clk_hz, s_clk_hz * 2) - 1;
>    if (div > 15)
>         div = 15;
> 
> 
>> +
>> +	div = (div & CQSPI_REG_CONFIG_BAUD_MASK) << CQSPI_REG_CONFIG_BAUD_LSB;
>> +	reg |= div;
>> +	writel(reg, reg_base + CQSPI_REG_CONFIG);
>> +}
>> +
> 


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
