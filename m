From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V12 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller
Date: Mon, 18 Jul 2016 09:58:00 -0700
Message-ID: <20160718165800.GF76613@google.com>
References: <1465000774-7762-1-git-send-email-marex@denx.de>
 <1465000774-7762-2-git-send-email-marex@denx.de>
 <20160718005238.GA80196@google.com>
 <be1a637c-7d86-df4e-0d47-8516ec639974@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <be1a637c-7d86-df4e-0d47-8516ec639974-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Jul 18, 2016 at 11:35:59AM +0200, Marek Vasut wrote:
> On 07/18/2016 02:52 AM, Brian Norris wrote:
> >Some trivial comments. I have some proposed diffs, and if y'all are OK
> >with them, I might apply this with some fixups.
> 
> [...]
> 
> >>+static int cqspi_wait_for_bit(void __iomem *reg, const u32 mask, bool clear)
> >>+{
> >>+	unsigned long end = jiffies + msecs_to_jiffies(CQSPI_TIMEOUT_MS);
> >>+	u32 val;
> >>+
> >>+	while (1) {
> >>+		val = readl(reg);
> >>+		if (clear)
> >>+			val = ~val;
> >>+		val &= mask;
> >>+
> >>+		if (val == mask)
> >>+			return 0;
> >>+
> >>+		if (time_after(jiffies, end))
> >>+			return -ETIMEDOUT;
> >>+	}
> >
> >This could all be replaced with readl_poll_timeout(), couldn't it?
> 
> Oh nice, I didn't know we had generic implementation. Yes, let's use it.
> Minor nit to it inline.

Yeah, I think the generic implementation is helpful for getting some of
the finer details correct and for reducing boilerplate.

> >Like
> >the following diff (I won't apply this one now; if anything, maybe I'll
> >send a follow-up patch for review):
> >
> >diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> >index d403ba7b8f43..87586baaae9e 100644
> >--- a/drivers/mtd/spi-nor/cadence-quadspi.c
> >+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> >@@ -22,6 +22,7 @@
> > #include <linux/errno.h>
> > #include <linux/interrupt.h>
> > #include <linux/io.h>
> >+#include <linux/iopoll.h>
> > #include <linux/jiffies.h>
> > #include <linux/kernel.h>
> > #include <linux/module.h>
> >@@ -226,21 +227,11 @@ struct cqspi_st {
> >
> > static int cqspi_wait_for_bit(void __iomem *reg, const u32 mask, bool clear)
> > {
> >-	unsigned long end = jiffies + msecs_to_jiffies(CQSPI_TIMEOUT_MS);
> > 	u32 val;
> >
> >-	while (1) {
> >-		val = readl(reg);
> >-		if (clear)
> >-			val = ~val;
> >-		val &= mask;
> >-
> >-		if (val == mask)
> >-			return 0;
> >-
> >-		if (time_after(jiffies, end))
> >-			return -ETIMEDOUT;
> >-	}
> >+	return readl_poll_timeout(reg, val,
> >+				  (val & mask) == (clear ? ~mask : mask),
> 
> You probably mean "((clear ? ~val : val) & mask) == mask" here.

Yes, that's better.

I probably don't want to do that until someone gets to test it anyway.
And obviously, it's easy enough to get wrong. If anything, I'll send a
follow up patch after merging, since this certainly isn't critical.

> >+				  0, CQSPI_TIMEOUT_MS * 1000);
> > }
> 
> [...]
> 
> >>+static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
> >>+{
> >>+	struct platform_device *pdev = cqspi->pdev;
> >>+	struct device *dev = &pdev->dev;
> >>+	struct cqspi_flash_pdata *f_pdata;
> >>+	struct spi_nor *nor;
> >>+	struct mtd_info *mtd;
> >>+	unsigned int cs;
> >>+	int i, ret;
> >>+
> >>+	/* Get flash device data */
> >>+	for_each_available_child_of_node(dev->of_node, np) {
> >>+		if (of_property_read_u32(np, "reg", &cs)) {
> >>+			dev_err(dev, "Couldn't determine chip select.\n");
> >>+			goto err;
> >>+		}
> >>+
> >>+		if (cs > CQSPI_MAX_CHIPSELECT) {
> >>+			dev_err(dev, "Chip select %d out of range.\n", cs);
> >>+			goto err;
> >>+		}
> >>+
> >>+		f_pdata = &cqspi->f_pdata[cs];
> >>+		f_pdata->cqspi = cqspi;
> >>+		f_pdata->cs = cs;
> >>+
> >>+		ret = cqspi_of_get_flash_pdata(pdev, f_pdata, np);
> >>+		if (ret)
> >>+			goto err;
> >>+
> >>+		nor = &f_pdata->nor;
> >>+		mtd = &nor->mtd;
> >>+
> >>+		mtd->priv = nor;
> >>+
> >>+		nor->dev = dev;
> >>+		spi_nor_set_flash_node(nor, np);
> >>+		nor->priv = f_pdata;
> >>+
> >>+		nor->read_reg = cqspi_read_reg;
> >>+		nor->write_reg = cqspi_write_reg;
> >>+		nor->read = cqspi_read;
> >>+		nor->write = cqspi_write;
> >>+		nor->erase = cqspi_erase;
> >>+		nor->prepare = cqspi_prep;
> >>+		nor->unprepare = cqspi_unprep;
> >>+
> >>+		mtd->name = kasprintf(GFP_KERNEL, "%s.%d", dev_name(dev), cs);
> >
> >Might be easier to just use devm_kasprintf()?
> 
> Yes, I think that'd work.
> 
> >>+		if (!mtd->name) {
> >>+			ret = -ENOMEM;
> >>+			goto err;
> >>+		}
> >>+
> >>+		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
> >>+		if (ret)
> >>+			goto err;
> >>+
> >>+		ret = mtd_device_register(mtd, NULL, 0);
> >>+		if (ret)
> >>+			goto err;
> >>+	}
> >>+
> >>+	return 0;
> >>+
> >>+err:
> >>+	for (i = 0; i < CQSPI_MAX_CHIPSELECT; i++)
> >>+		if (cqspi->f_pdata[i].nor.mtd.name) {
> >
> >Chekcing for 'name' doens't really handle all error paths right. If
> >spi_nor_scan() or mtd_device_register() fails, then you'll be trying to
> >unregister an unregistered MTD.
> 
> Oh, snap. OK.
> 
> >>+			mtd_device_unregister(&cqspi->f_pdata[i].nor.mtd);
> >>+			kfree(cqspi->f_pdata[i].nor.mtd.name);
> >>+		}
> >>+	return ret;
> >>+}
> >>+
> >>+static int cqspi_probe(struct platform_device *pdev)
> >>+{
> >>+	struct device_node *np = pdev->dev.of_node;
> >>+	struct device *dev = &pdev->dev;
> >>+	struct cqspi_st *cqspi;
> >>+	struct resource *res;
> >>+	struct resource *res_ahb;
> >>+	int ret;
> >>+	int irq;
> >>+
> >>+	cqspi = devm_kzalloc(dev, sizeof(*cqspi), GFP_KERNEL);
> >>+	if (!cqspi)
> >>+		return -ENOMEM;
> >>+
> >>+	mutex_init(&cqspi->bus_mutex);
> >>+	cqspi->pdev = pdev;
> >>+	platform_set_drvdata(pdev, cqspi);
> >>+
> >>+	/* Obtain configuration from OF. */
> >>+	ret = cqspi_of_get_pdata(pdev);
> >>+	if (ret) {
> >>+		dev_err(dev, "Cannot get mandatory OF data.\n");
> >>+		return -ENODEV;
> >>+	}
> >>+
> >>+	/* Obtain QSPI clock. */
> >>+	cqspi->clk = devm_clk_get(dev, NULL);
> >>+	if (IS_ERR(cqspi->clk)) {
> >>+		dev_err(dev, "Cannot claim QSPI clock.\n");
> >>+		return PTR_ERR(cqspi->clk);
> >>+	}
> >>+
> >>+	/* Obtain and remap controller address. */
> >>+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >>+	cqspi->iobase = devm_ioremap_resource(dev, res);
> >>+	if (IS_ERR(cqspi->iobase)) {
> >>+		dev_err(dev, "Cannot remap controller address.\n");
> >>+		return PTR_ERR(cqspi->iobase);
> >>+	}
> >>+
> >>+	/* Obtain and remap AHB address. */
> >>+	res_ahb = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> >>+	cqspi->ahb_base = devm_ioremap_resource(dev, res_ahb);
> >>+	if (IS_ERR(cqspi->ahb_base)) {
> >>+		dev_err(dev, "Cannot remap AHB address.\n");
> >>+		return PTR_ERR(cqspi->ahb_base);
> >>+	}
> >>+
> >>+	init_completion(&cqspi->transfer_complete);
> >>+
> >>+	/* Obtain IRQ line. */
> >>+	irq = platform_get_irq(pdev, 0);
> >>+	if (irq < 0) {
> >>+		dev_err(dev, "Cannot obtain IRQ.\n");
> >>+		return -ENXIO;
> >>+	}
> >>+
> >>+	ret = clk_prepare_enable(cqspi->clk);
> >>+	if (ret) {
> >>+		dev_err(dev, "Cannot enable QSPI clock.\n");
> >>+		return ret;
> >>+	}
> >>+
> >>+	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
> >>+
> >>+	ret = devm_request_irq(dev, irq, cqspi_irq_handler, 0,
> >>+			       pdev->name, cqspi);
> >>+	if (ret) {
> >>+		dev_err(dev, "Cannot request IRQ.\n");
> >>+		goto probe_irq_failed;
> >>+	}
> >>+
> >>+	cqspi_wait_idle(cqspi);
> >>+	cqspi_controller_init(cqspi);
> >>+	cqspi->current_cs = -1;
> >>+	cqspi->sclk = 0;
> >>+
> >>+	ret = cqspi_setup_flash(cqspi, np);
> >>+	if (ret) {
> >>+		dev_err(dev, "Cadence QSPI NOR probe failed %d\n", ret);
> >>+		goto probe_setup_failed;
> >>+	}
> >>+
> >>+	return ret;
> >>+probe_irq_failed:
> >>+	cqspi_controller_enable(cqspi, 0);
> >>+probe_setup_failed:
> >>+	clk_disable_unprepare(cqspi->clk);
> >>+	return ret;
> >>+}
> >>+
> >>+static int cqspi_remove(struct platform_device *pdev)
> >>+{
> >>+	struct cqspi_st *cqspi = platform_get_drvdata(pdev);
> >>+	int i;
> >>+
> >>+	cqspi_controller_enable(cqspi, 0);
> >
> >I think you want to disable the controller *after* unregistering the
> >MTDs, no?
> 
> That's a bit of a misnomer, the second parameter is "bool enable",
> so this disables the controller.

Correct, that's for disabling the controller. Did I say something wrong?
I just meant we want to move that after this next loop, since
technically, there could be new MTD transactions being initiated all the
way until we actually unregister the MTD.

> >>+
> >>+	for (i = 0; i < CQSPI_MAX_CHIPSELECT; i++)
> >>+		if (cqspi->f_pdata[i].nor.mtd.name) {
> >>+			mtd_device_unregister(&cqspi->f_pdata[i].nor.mtd);
> >>+			kfree(cqspi->f_pdata[i].nor.mtd.name);
> >>+		}
> >>+
> >>+	clk_disable_unprepare(cqspi->clk);
> >>+
> >>+	return 0;
> >>+}
> >>+
> >>+#ifdef CONFIG_PM_SLEEP
> >>+static int cqspi_suspend(struct device *dev)
> >>+{
> >>+	struct cqspi_st *cqspi = dev_get_drvdata(dev);
> >>+
> >>+	cqspi_controller_enable(cqspi, 0);
> >>+	return 0;
> >>+}
> >>+
> >>+static int cqspi_resume(struct device *dev)
> >>+{
> >>+	struct cqspi_st *cqspi = dev_get_drvdata(dev);
> >>+
> >>+	cqspi_controller_enable(cqspi, 1);
> >>+	return 0;
> >>+}
> >>+
> >>+static const struct dev_pm_ops cqspi__dev_pm_ops = {
> >>+	.suspend = cqspi_suspend,
> >>+	.resume = cqspi_resume,
> >>+};
> >>+
> >>+#define CQSPI_DEV_PM_OPS	(&cqspi__dev_pm_ops)
> >>+#else
> >>+#define CQSPI_DEV_PM_OPS	NULL
> >>+#endif
> >>+
> >>+static struct of_device_id const cqspi_dt_ids[] = {
> >>+	{.compatible = "cdns,qspi-nor",},
> >>+	{ /* end of table */ }
> >>+};
> >>+
> >>+MODULE_DEVICE_TABLE(of, cqspi_dt_ids);
> >>+
> >>+static struct platform_driver cqspi_platform_driver = {
> >>+	.probe = cqspi_probe,
> >>+	.remove = cqspi_remove,
> >>+	.driver = {
> >>+		.name = CQSPI_NAME,
> >>+		.pm = CQSPI_DEV_PM_OPS,
> >>+		.of_match_table = cqspi_dt_ids,
> >>+	},
> >>+};
> >>+
> >>+module_platform_driver(cqspi_platform_driver);
> >>+
> >>+MODULE_DESCRIPTION("Cadence QSPI Controller Driver");
> >>+MODULE_LICENSE("GPL v2");
> >>+MODULE_ALIAS("platform:" CQSPI_NAME);
> >>+MODULE_AUTHOR("Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>");
> >>+MODULE_AUTHOR("Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>");
> >
> >So, I'm thinking of applying this patch with the following diff:
> >
> >diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> >index 2fff31c0b9c3..d403ba7b8f43 100644
> >--- a/drivers/mtd/spi-nor/cadence-quadspi.c
> >+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> >@@ -53,6 +53,7 @@ struct cqspi_flash_pdata {
> > 	u8		addr_width;
> > 	u8		data_width;
> > 	u8		cs;
> >+	bool		registered;
> 
> This feels a bit odd, but I don't have a better solution now.

Yeah, there wasn't really a super clear solution IMO. A possibly slight
improvement could be to just keep a local array in cqspi_setup_flash()
to denote which devices have been registered.

Really, I'd like to improve the spi-nor framework so it handles some of
the boilerplate details like this for us; so rather than walking the
child DT node(s) ourselves and registering/unregistering devices,
spi-nor.c could do the accounting, and just call a driver call-back for
each flash (if needed). So that could kill off this variable and several
other bits of registration code in this driver and others.

[...]

Regards,
Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
