From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V12 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller
Date: Mon, 18 Jul 2016 10:02:43 -0700
Message-ID: <20160718170243.GH76613@google.com>
References: <1465000774-7762-1-git-send-email-marex@denx.de>
 <1465000774-7762-2-git-send-email-marex@denx.de>
 <20160718005238.GA80196@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160718005238.GA80196-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Jul 17, 2016 at 05:52:38PM -0700, Brian Norris wrote:
> On Sat, Jun 04, 2016 at 02:39:34AM +0200, Marek Vasut wrote:
> > From: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > 
> > Add support for the Cadence QSPI controller. This controller is
> > present in the Altera SoCFPGA SoCs and this driver has been tested
> > on the Cyclone V SoC.
> > 
> > Signed-off-by: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> > Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> > Cc: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
> > Cc: Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > ---
> > V2: use NULL instead of modalias in spi_nor_scan call
> > V3: Use existing property is-decoded-cs instead of creating duplicate.
> > V4: Support Micron quad mode by snooping command stream for EVCR command
> >     and subsequently configuring Cadence controller for quad mode.
> > V5: Clean up sparse and smatch complaints.  Remove snooping of Micron
> >     quad mode.  Add comment on XIP mode bit and dummy clock cycles.  Set
> >     up SRAM partition at 1:1 during init.
> > V6: Remove dts patch that was included by mistake.  Incorporate Vikas's
> >     comments regarding fifo width, SRAM partition setting, and trigger
> >     address.  Trigger address was added as an unsigned int, as it is not
> >     an IO resource per se, and does not need to be mapped. Also add
> >     Marek Vasut's workaround for picking up OF properties on subnodes.
> > V7: - Perform coding-style cleanup and type fixes. Remove ugly QSPI_*()
> >       macros and replace them with functions. Get rid of unused variables.
> >     - Implement support for nor->set_protocol() to handle Quad-command,
> >       this patch now depends on the following patch:
> >       mtd: spi-nor: notify (Q)SPI controller about protocol change
> >     - Replace that cqspi_fifo_read() disaster with plain old readsl()
> >       and cqspi_fifo_write() tentacle horror with pretty writesl().
> >     - Remove CQSPI_SUPPORT_XIP_CHIPS, which is broken.
> >     - Get rid of cqspi_find_chipselect() mess, instead just place the
> >       struct cqspi_st and chipselect number into struct cqspi_flash_pdata
> >       and set nor->priv to the struct cqspi_flash_pdata of that particular
> >       chip.
> >     - Replace the odd math in calculate_ticks_for_ns() with DIV_ROUND_UP().
> >     - Make variables const where applicable.
> > V8: - Implement a function to wait for bit being set/unset for a given
> >       period of time and use it to replace the ad-hoc bits of code.
> >     - Configure the write underflow watermark to be 1/8 if FIFO size.
> >     - Extract out the SPI NOR flash probing code into separate function
> >       to clearly mark what will soon be considered a boilerplate code.
> >     - Repair the handling of mode bits, which caused instability in V7.
> >     - Clean up the interrupt handling
> >     - Fix Kconfig help text and make the patch depend on OF and COMPILE_TEST.
> > V9: - Rename CQSPI_REG_IRQ_IND_RD_OVERFLOW to CQSPI_REG_IRQ_IND_SRAM_FULL
> >     - Merge cqspi_controller_disable() into cqspi_controller_enable() and
> >       make the mode selectable via parameter.
> > V10: - Update against Cyrille's new patchset and changes to linux-mtd.
> >      - Repair problem with multiple QSPI NOR devices having the same mtd->name,
> >        they are now named devname.cs , where cs is the chipselect ID.
> > V11: - Replace dependency on ARCH_SOCFPGA with dependency on ARM
> >      - Reinit completion during indirect read and write
> >      - Optimize the control reconfiguration to avoid disabling/enabling of the
> >        controller back and forth
> >      - Add bus-level mutex to avoid race condition when using multiple flashes
> >      - Make sure the controller clock are enabled (thanks to Graham Moore)
> >      - Make sure the correct value of page_size, mtd.erasesize and addr_width
> >        is programmed into the controller registers by checking these values
> >        against the ones which are programmed into the controller on every read,
> >        write, erase, read_reg, write_reg operation. Restructure the code a bit
> >        to make it more readable with this change in.
> >      - Rebase on top of Cyrille's latest QSPI NOR patchset.
> >      - Introduce struct cqspi_flash_pdata->data_width to store the currently
> >        configured width of the data part of the transfer.
> > V12: - Update on top of the latest linux-next
> >      - Drop support for all modes but 1-1-1 for read/write/erase and
> >        1-1-2/1-1-4 for read
> >      - Update the clock computation math and sclk passing (thanks to Trent)
> > ---
> >  drivers/mtd/spi-nor/Kconfig           |   11 +
> >  drivers/mtd/spi-nor/Makefile          |    1 +
> >  drivers/mtd/spi-nor/cadence-quadspi.c | 1299 +++++++++++++++++++++++++++++++++
> >  3 files changed, 1311 insertions(+)
> >  create mode 100644 drivers/mtd/spi-nor/cadence-quadspi.c
> > 
> > diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> > index c546efd..06dfbe8 100644
> > --- a/drivers/mtd/spi-nor/Kconfig
> > +++ b/drivers/mtd/spi-nor/Kconfig
> > @@ -58,4 +58,15 @@ config SPI_NXP_SPIFI
> >  	  Flash. Enable this option if you have a device with a SPIFI
> >  	  controller and want to access the Flash as a mtd device.
> >  
> > +config SPI_CADENCE_QUADSPI
> > +	tristate "Cadence Quad SPI controller"
> > +	depends on OF && (ARM || COMPILE_TEST)
> > +	help
> > +	  Enable support for the Cadence Quad SPI Flash controller.
> > +
> > +	  Cadence QSPI is a specialized controller for connecting an SPI
> > +	  Flash over 1/2/4-bit wide bus. Enable this option if you have a
> > +	  device with a Cadence QSPI controller and want to access the
> > +	  Flash as an MTD device.
> > +

It's nice to have the driver Kconfig entries in alphabetical order. I've
fixed up.

> >  endif # MTD_SPI_NOR
> > diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> > index 15259136..4ff6824 100644
> > --- a/drivers/mtd/spi-nor/Makefile
> > +++ b/drivers/mtd/spi-nor/Makefile
> > @@ -1,4 +1,5 @@
> >  obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
> > +obj-$(CONFIG_SPI_CADENCE_QUADSPI)	+= cadence-quadspi.o
> >  obj-$(CONFIG_SPI_FSL_QUADSPI)	+= fsl-quadspi.o
> >  obj-$(CONFIG_MTD_MT81xx_NOR)    += mtk-quadspi.o
> >  obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
> > diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> > new file mode 100644
> > index 0000000..2fff31c
> > --- /dev/null
> > +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> > @@ -0,0 +1,1299 @@

[...]

> So, I'm thinking of applying this patch with the following diff:
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 2fff31c0b9c3..d403ba7b8f43 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -53,6 +53,7 @@ struct cqspi_flash_pdata {
>  	u8		addr_width;
>  	u8		data_width;
>  	u8		cs;
> +	bool		registered;
>  };
>  
>  struct cqspi_st {
> @@ -1111,7 +1112,8 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>  		nor->prepare = cqspi_prep;
>  		nor->unprepare = cqspi_unprep;
>  
> -		mtd->name = kasprintf(GFP_KERNEL, "%s.%d", dev_name(dev), cs);
> +		mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%s.%d",
> +					   dev_name(dev), cs);
>  		if (!mtd->name) {
>  			ret = -ENOMEM;
>  			goto err;
> @@ -1124,16 +1126,16 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>  		ret = mtd_device_register(mtd, NULL, 0);
>  		if (ret)
>  			goto err;
> +
> +		f_pdata->registered = true;
>  	}
>  
>  	return 0;
>  
>  err:
>  	for (i = 0; i < CQSPI_MAX_CHIPSELECT; i++)
> -		if (cqspi->f_pdata[i].nor.mtd.name) {
> +		if (cqspi->f_pdata[i].registered)
>  			mtd_device_unregister(&cqspi->f_pdata[i].nor.mtd);
> -			kfree(cqspi->f_pdata[i].nor.mtd.name);
> -		}
>  	return ret;
>  }
>  
> @@ -1233,13 +1235,11 @@ static int cqspi_remove(struct platform_device *pdev)
>  	struct cqspi_st *cqspi = platform_get_drvdata(pdev);
>  	int i;
>  
> -	cqspi_controller_enable(cqspi, 0);
> -
>  	for (i = 0; i < CQSPI_MAX_CHIPSELECT; i++)
> -		if (cqspi->f_pdata[i].nor.mtd.name) {
> +		if (cqspi->f_pdata[i].registered)
>  			mtd_device_unregister(&cqspi->f_pdata[i].nor.mtd);
> -			kfree(cqspi->f_pdata[i].nor.mtd.name);
> -		}
> +
> +	cqspi_controller_enable(cqspi, 0);
>  
>  	clk_disable_unprepare(cqspi->clk);
>  

Applied to l2-mtd.git with the above diff, and the Kconfig relocation.

Thanks,
Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
