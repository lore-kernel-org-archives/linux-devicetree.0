From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [2/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller.
Date: Mon, 11 Jan 2016 05:50:25 +0100
Message-ID: <201601110550.25422.marex@denx.de>
References: <1440148851-14621-2-git-send-email-marex@denx.de> <56932C19.6000509@ti.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56932C19.6000509-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "R, Vignesh" <vigneshr-l0cyMroinI0@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday, January 11, 2016 at 05:14:17 AM, R, Vignesh wrote:
> Hi Marek,

Hi!

> On 08/21/2015 02:50 PM, Marek Vasut wrote:
> > From: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > 
> > Add support for the Cadence QSPI controller. This controller is
> > present in the Altera SoCFPGA SoCs and this driver has been tested
> > on the Cyclone V SoC.
> 
> Thanks for the patch.
> I have a TI EVM with Cadence QSPI controller connected to Spansion
> flash(s25fl512s), and I gave this series a try. It worked with couple of
> changes, please see comments inline.

I just posted the latest greatest version I have in tree, could you give it
a spin please ?

> > Signed-off-by: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> > Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> > Cc: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: Vikas MANOCHA <vikas.manocha-qxv4g6HH51o@public.gmane.org>
> > Cc: Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

[...]

> > +static irqreturn_t cqspi_irq_handler(int this_irq, void *dev)
> > +{
> > +	struct cqspi_st *cqspi = dev;
> > +	unsigned int irq_status;
> > +
> > +	/* Read interrupt status */
> > +	irq_status = readl(cqspi->iobase + CQSPI_REG_IRQSTATUS);
> > +
> > +	/* Clear interrupt */
> > +	writel(irq_status, cqspi->iobase + CQSPI_REG_IRQSTATUS);
> > +
> > +	irq_status &= CQSPI_IRQ_MASK_RD | CQSPI_IRQ_MASK_WR;
> > +
> > +	if (irq_status)
> > +		complete(&cqspi->transfer_complete);
> > +
> 
> You seem to signal completion even if the interrupt is
> CQSPI_REG_IRQ_IND_(WR|RD)_OVERFLOW. Doesn't this lead to data loss on
> overflow?

That's a good question. The write routine, cqspi_indirect_write_execute(),
always writes a page and then waits for completion, so the overflow should
never happen.

What would you suggest to do about write overflow interrupt anyway ? :(

> > +	return IRQ_HANDLED;
> > +}

[...]

> > +static int cqspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
> > +{
> > +	struct cqspi_flash_pdata *f_pdata = nor->priv;
> > +	struct cqspi_st *cqspi = f_pdata->cqspi;
> > +	const unsigned int sclk = f_pdata->clk_rate;
> > +
> > +	/* Switch chip select. */
> > +	if (cqspi->current_cs != f_pdata->cs) {
> > +		cqspi->current_cs = f_pdata->cs;
> > +		cqspi_switch_cs(nor);
> > +	}
> > +
> > +	/* Setup baudrate divisor and delays */
> > +	if (cqspi->sclk != sclk) {
> > +		cqspi->sclk = sclk;
> > +		cqspi_controller_disable(cqspi);
> > +		cqspi_config_baudrate_div(cqspi, sclk);
> > +		cqspi_delay(nor, sclk);
> > +		cqspi_readdata_capture(cqspi, 1, f_pdata->read_delay);
> 
> I see bypass field value is being hard coded to 1. Atleast on TI SoC,
> bypass=0 when SPI bus frequency is  >= 50MHz. Therefore, is it possible
> to provide a way to configure bypass bit from DT?
> Or if bypass=0 for >=50MHz on your SoC too then, its better to configure
> bypass bit based on SPI bus frequency.

You can have multiple SPI peripherals attached to the QSPI block, each running 
at different bus speed, so I think the bypass should be configured based on the 
frequency of the active peripheral, not from OF.

I don't know exactly what impact configuring this bit has, the socfpga datasheet 
is not very clear about the meaning of this bit, so it'd be better if someone 
from Altera answered this question.

> > +		cqspi_controller_enable(cqspi);
> > +	}
> > +	return 0;
> > +}

[...]

> > +static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node
> > *np) +{
> > +	struct platform_device *pdev = cqspi->pdev;
> > +	struct device *dev = &pdev->dev;
> > +	struct mtd_part_parser_data ppdata;
> > +	struct cqspi_flash_pdata *f_pdata;
> > +	struct spi_nor *nor;
> > +	struct mtd_info *mtd;
> > +	unsigned int cs;
> > +	int i, ret;
> > +
> > +	/* Get flash device data */
> > +	for_each_available_child_of_node(dev->of_node, np) {
> > +		if (of_property_read_u32(np, "reg", &cs)) {
> > +			dev_err(dev, "Couldn't determine chip select.\n");
> > +			goto err;
> > +		}
> > +
> > +		if (cs > CQSPI_MAX_CHIPSELECT) {
> > +			dev_err(dev, "Chip select %d out of range.\n", cs);
> > +			goto err;
> > +		}
> > +
> > +		f_pdata = &cqspi->f_pdata[cs];
> > +		f_pdata->cqspi = cqspi;
> > +		f_pdata->cs = cs;
> > +
> > +		ret = cqspi_of_get_flash_pdata(pdev, f_pdata, np);
> > +		if (ret)
> > +			goto err;
> > +
> > +		nor = &f_pdata->nor;
> > +		mtd = &f_pdata->mtd;
> > +
> > +		mtd->priv = nor;
> > +
> > +		nor->mtd = mtd;
> > +		nor->dev = dev;
> > +		nor->dn = np;
> > +		nor->priv = f_pdata;
> > +
> > +		nor->read_reg = cqspi_read_reg;
> > +		nor->write_reg = cqspi_write_reg;
> > +		nor->read = cqspi_read;
> > +		nor->write = cqspi_write;
> > +		nor->erase = cqspi_erase;
> > +		nor->prepare = cqspi_prep;
> > 
> > 
> > +		nor->set_protocol = cqspi_set_protocol;
> 
> IMO, this functionality can be added once dependent patches have been
> merged. This will enable this driver to be picked up early. (just a
> suggestion)

Yeah, it's a struggle to get this driver mainlined and the same problem is
with the Atmel driver ;-) But something tells me the patches will be applied
soon, so no problem here.

> > +
> > +		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
> > +		if (ret)
> > +			goto err;
> > +
> > +		ppdata.of_node = np;
> > +		ret = mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
> > +		if (ret)
> > +			goto err;
> > +	}
> > +
> > +	return 0;
> > +
> > +err:
> > +	for (i = 0; i < CQSPI_MAX_CHIPSELECT; i++)
> > +		if (cqspi->f_pdata[i].mtd.name)
> > +			mtd_device_unregister(&cqspi->f_pdata[i].mtd);
> > +	return ret;
> > +}
> > +
> > +static int cqspi_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *np = pdev->dev.of_node;
> > +	struct device *dev = &pdev->dev;
> > +	struct cqspi_st *cqspi;
> > +	struct resource *res;
> > +	struct resource *res_ahb;
> > +	int ret;
> > +	int irq;
> > +
> > +	cqspi = devm_kzalloc(dev, sizeof(*cqspi), GFP_KERNEL);
> > +	if (!cqspi)
> > +		return -ENOMEM;
> > +
> > +	cqspi->pdev = pdev;
> > +	platform_set_drvdata(pdev, cqspi);
> > +
> > +	/* Obtain configuration from OF. */
> > +	ret = cqspi_of_get_pdata(pdev);
> > +	if (ret) {
> > +		dev_err(dev, "Cannot get mandatory OF data.\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	/* Obtain QSPI clock. */
> > +	cqspi->clk = devm_clk_get(dev, NULL);
> > +	if (IS_ERR(cqspi->clk)) {
> > +		dev_err(dev, "Cannot claim QSPI clock.\n");
> > +		return PTR_ERR(cqspi->clk);
> > +	}
> > +
> > +	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
> > +
> > +	/* Obtain and remap controller address. */
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	cqspi->iobase = devm_ioremap_resource(dev, res);
> > +	if (IS_ERR(cqspi->iobase)) {
> > +		dev_err(dev, "Cannot remap controller address.\n");
> > +		return PTR_ERR(cqspi->iobase);
> > +	}
> > +
> > +	/* Obtain and remap AHB address. */
> > +	res_ahb = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > +	cqspi->ahb_base = devm_ioremap_resource(dev, res_ahb);
> > +	if (IS_ERR(cqspi->ahb_base)) {
> > +		dev_err(dev, "Cannot remap AHB address.\n");
> > +		return PTR_ERR(cqspi->ahb_base);
> > +	}
> > +
> > +	init_completion(&cqspi->transfer_complete);
> > +
> > +	/* Obtain IRQ line. */
> > +	irq = platform_get_irq(pdev, 0);
> > +	if (irq < 0) {
> > +		dev_err(dev, "Cannot obtain IRQ.\n");
> > +		return -ENXIO;
> > +	}
> > +
> > +	ret = devm_request_irq(dev, irq, cqspi_irq_handler, 0,
> > +			       pdev->name, cqspi);
> > +	if (ret) {
> > +		dev_err(dev, "Cannot request IRQ.\n");
> > +		return ret;
> > +	}
> > +
> 
> pm_runtime_enable(), pm_runtime_get_sync() might be needed here as QSPI
> clocks may not be enabled by default on all platforms.

Can you whip up a bit of code and test it on your platform ? I dont think
socfpga has runtime PM yet. I'd like to add it into the driver or you can
send a small patch later, whichever way you prefer.

> > +	cqspi_wait_idle(cqspi);
> > +	cqspi_controller_init(cqspi);
> > +	cqspi->current_cs = -1;
> > +	cqspi->sclk = 0;
> > +
> > +	ret = cqspi_setup_flash(cqspi, np);
> > +	if (ret) {
> > +		dev_err(dev, "Cadence QSPI NOR probe failed %d\n", ret);
> > +		cqspi_controller_disable(cqspi);
> > +	}
> > +
> > +	return ret;
> > +}

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
