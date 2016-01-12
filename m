From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [2/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller.
Date: Tue, 12 Jan 2016 14:50:54 +0100
Message-ID: <201601121450.54279.marex@denx.de>
References: <1440148851-14621-2-git-send-email-marex@denx.de> <201601110550.25422.marex@denx.de> <5694881F.10707@ti.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5694881F.10707-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday, January 12, 2016 at 05:59:11 AM, Vignesh R wrote:
> Hi,

Hi!

> On 01/11/2016 10:20 AM, Marek Vasut wrote:
> > On Monday, January 11, 2016 at 05:14:17 AM, R, Vignesh wrote:
> >> Hi Marek,
> > 
> > Hi!
> > 
> >> On 08/21/2015 02:50 PM, Marek Vasut wrote:
> >>> From: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> >>> 
> >>> Add support for the Cadence QSPI controller. This controller is
> >>> present in the Altera SoCFPGA SoCs and this driver has been tested
> >>> on the Cyclone V SoC.
> >> 
> >> Thanks for the patch.
> >> I have a TI EVM with Cadence QSPI controller connected to Spansion
> >> flash(s25fl512s), and I gave this series a try. It worked with couple of
> >> changes, please see comments inline.
> > 
> > I just posted the latest greatest version I have in tree, could you give
> > it a spin please ?
> 
> Thanks, I will test it soon.

Cool

> >>> Signed-off-by: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> >>> Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> >>> Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> >>> Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>> Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> >>> Cc: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> >>> Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> >>> Cc: Vikas MANOCHA <vikas.manocha-qxv4g6HH51o@public.gmane.org>
> >>> Cc: Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> >>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > 
> > [...]
> > 
> >>> +static irqreturn_t cqspi_irq_handler(int this_irq, void *dev)
> >>> +{
> >>> +	struct cqspi_st *cqspi = dev;
> >>> +	unsigned int irq_status;
> >>> +
> >>> +	/* Read interrupt status */
> >>> +	irq_status = readl(cqspi->iobase + CQSPI_REG_IRQSTATUS);
> >>> +
> >>> +	/* Clear interrupt */
> >>> +	writel(irq_status, cqspi->iobase + CQSPI_REG_IRQSTATUS);
> >>> +
> >>> +	irq_status &= CQSPI_IRQ_MASK_RD | CQSPI_IRQ_MASK_WR;
> >>> +
> >>> +	if (irq_status)
> >>> +		complete(&cqspi->transfer_complete);
> >>> +
> >> 
> >> You seem to signal completion even if the interrupt is
> >> CQSPI_REG_IRQ_IND_(WR|RD)_OVERFLOW. Doesn't this lead to data loss on
> >> overflow?
> > 
> > That's a good question. The write routine,
> > cqspi_indirect_write_execute(), always writes a page and then waits for
> > completion, so the overflow should never happen.
> > 
> > What would you suggest to do about write overflow interrupt anyway ? :(
> 
> My concern was signalling completion on CQSPI_REG_IRQ_IND_WR_OVERFLOW
> interrupt which meant data loss.
> But, I see you have disabled CQSPI_REG_IRQ_IND_WR_OVERFLOW in v10. This
> addresses my concern.

All right :)

> >>> +	return IRQ_HANDLED;
> >>> +}
> > 
> > [...]
> > 
> >>> +static int cqspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
> >>> +{
> >>> +	struct cqspi_flash_pdata *f_pdata = nor->priv;
> >>> +	struct cqspi_st *cqspi = f_pdata->cqspi;
> >>> +	const unsigned int sclk = f_pdata->clk_rate;
> >>> +
> >>> +	/* Switch chip select. */
> >>> +	if (cqspi->current_cs != f_pdata->cs) {
> >>> +		cqspi->current_cs = f_pdata->cs;
> >>> +		cqspi_switch_cs(nor);
> >>> +	}
> >>> +
> >>> +	/* Setup baudrate divisor and delays */
> >>> +	if (cqspi->sclk != sclk) {
> >>> +		cqspi->sclk = sclk;
> >>> +		cqspi_controller_disable(cqspi);
> >>> +		cqspi_config_baudrate_div(cqspi, sclk);
> >>> +		cqspi_delay(nor, sclk);
> >>> +		cqspi_readdata_capture(cqspi, 1, f_pdata->read_delay);
> >> 
> >> I see bypass field value is being hard coded to 1. Atleast on TI SoC,
> >> bypass=0 when SPI bus frequency is  >= 50MHz. Therefore, is it possible
> >> to provide a way to configure bypass bit from DT?
> >> Or if bypass=0 for >=50MHz on your SoC too then, its better to configure
> >> bypass bit based on SPI bus frequency.
> > 
> > You can have multiple SPI peripherals attached to the QSPI block, each
> > running at different bus speed, so I think the bypass should be
> > configured based on the frequency of the active peripheral, not from OF.
> 
> I agree, if the dependency is uniform across SoCs, then bypass should be
> configured based on the frequency of the active peripheral.
> 
> > I don't know exactly what impact configuring this bit has, the socfpga
> > datasheet is not very clear about the meaning of this bit, so it'd be
> > better if someone from Altera answered this question.
> 
> Have you tested the driver at SPI bus frequency >50MHz?

Yeah, I run it at 100MHz .

> >>> +		cqspi_controller_enable(cqspi);
> >>> +	}
> >>> +	return 0;
> >>> +}
> > 
> > [...]
> 
> [...]
> 
> >>> +	ret = devm_request_irq(dev, irq, cqspi_irq_handler, 0,
> >>> +			       pdev->name, cqspi);
> >>> +	if (ret) {
> >>> +		dev_err(dev, "Cannot request IRQ.\n");
> >>> +		return ret;
> >>> +	}
> >>> +
> >> 
> >> pm_runtime_enable(), pm_runtime_get_sync() might be needed here as QSPI
> >> clocks may not be enabled by default on all platforms.
> > 
> > Can you whip up a bit of code and test it on your platform ? I dont think
> > socfpga has runtime PM yet. I'd like to add it into the driver or you can
> > send a small patch later, whichever way you prefer.
> 
> Ok, I can send a patch once the driver is accepted.

Thanks!

> >>> +	cqspi_wait_idle(cqspi);
> >>> +	cqspi_controller_init(cqspi);
> >>> +	cqspi->current_cs = -1;
> >>> +	cqspi->sclk = 0;
> >>> +
> >>> +	ret = cqspi_setup_flash(cqspi, np);
> >>> +	if (ret) {
> >>> +		dev_err(dev, "Cadence QSPI NOR probe failed %d\n", ret);
> >>> +		cqspi_controller_disable(cqspi);
> >>> +	}
> >>> +
> >>> +	return ret;
> >>> +}
> > 
> > Thanks!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
