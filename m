From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller.
Date: Wed, 26 Aug 2015 08:19:02 +0200
Message-ID: <201508260819.02535.marex@denx.de>
References: <1440148851-14621-1-git-send-email-marex@denx.de> <1440148851-14621-2-git-send-email-marex@denx.de> <55DCE7AE.5070501@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55DCE7AE.5070501-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vikas <vikas.manocha-qxv4g6HH51o@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday, August 26, 2015 at 12:09:50 AM, vikas wrote:
> Hi,
> 
> On 08/21/2015 02:20 AM, Marek Vasut wrote:
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
> > Cc: Vikas MANOCHA <vikas.manocha-qxv4g6HH51o@public.gmane.org>
> > Cc: Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > ---
> > 
> >  drivers/mtd/spi-nor/Kconfig           |   11 +
> >  drivers/mtd/spi-nor/Makefile          |    1 +
> >  drivers/mtd/spi-nor/cadence-quadspi.c | 1260
> >  +++++++++++++++++++++++++++++++++ 3 files changed, 1272 insertions(+)
> >  create mode 100644 drivers/mtd/spi-nor/cadence-quadspi.c
> > 
> > V2: use NULL instead of modalias in spi_nor_scan call
> > V3: Use existing property is-decoded-cs instead of creating duplicate.
> > V4: Support Micron quad mode by snooping command stream for EVCR command
> > 
> >     and subsequently configuring Cadence controller for quad mode.
> > 
> > V5: Clean up sparse and smatch complaints.  Remove snooping of Micron
> > 
> >     quad mode.  Add comment on XIP mode bit and dummy clock cycles.  Set
> >     up SRAM partition at 1:1 during init.
> > 
> > V6: Remove dts patch that was included by mistake.  Incorporate Vikas's
> > 
> >     comments regarding fifo width, SRAM partition setting, and trigger
> >     address.  Trigger address was added as an unsigned int, as it is not
> >     an IO resource per se, and does not need to be mapped. Also add
> >     Marek Vasut's workaround for picking up OF properties on subnodes.
> > 
> > V7: - Perform coding-style cleanup and type fixes. Remove ugly QSPI_*()
> > 
> >       macros and replace them with functions. Get rid of unused
> >       variables.
> >     
> >     - Implement support for nor->set_protocol() to handle Quad-command,
> >     
> >       this patch now depends on the following patch:
> >       mtd: spi-nor: notify (Q)SPI controller about protocol change
> >     
> >     - Replace that cqspi_fifo_read() disaster with plain old readsl()
> >     
> >       and cqspi_fifo_write() tentacle horror with pretty writesl().
> >     
> >     - Remove CQSPI_SUPPORT_XIP_CHIPS, which is broken.
> >     - Get rid of cqspi_find_chipselect() mess, instead just place the
> >     
> >       struct cqspi_st and chipselect number into struct cqspi_flash_pdata
> >       and set nor->priv to the struct cqspi_flash_pdata of that
> >       particular chip.
> >     
> >     - Replace the odd math in calculate_ticks_for_ns() with
> >     DIV_ROUND_UP(). - Make variables const where applicable.
> > 
> > V8: - Implement a function to wait for bit being set/unset for a given
> > 
> >       period of time and use it to replace the ad-hoc bits of code.
> >     
> >     - Configure the write underflow watermark to be 1/8 if FIFO size.
> >     - Extract out the SPI NOR flash probing code into separate function
> >     
> >       to clearly mark what will soon be considered a boilerplate code.
> >     
> >     - Repair the handling of mode bits, which caused instability in V7.
> >     - Clean up the interrupt handling
> >     - Fix Kconfig help text and make the patch depend on OF and
> >     COMPILE_TEST.
> > 
> > diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> > index 89bf4c1..ed253a2 100644
> > --- a/drivers/mtd/spi-nor/Kconfig
> > +++ b/drivers/mtd/spi-nor/Kconfig
> > @@ -40,4 +40,15 @@ config SPI_NXP_SPIFI
> > 
> >           Flash. Enable this option if you have a device with a SPIFI
> >           controller and want to access the Flash as a mtd device.
> > 
> > +config SPI_CADENCE_QUADSPI
> > +       tristate "Cadence Quad SPI controller"
> > +       depends on OF && COMPILE_TEST
> > +       help
> > +         Enable support for the Cadence Quad SPI Flash controller.
> > +
> > +         Cadence QSPI is a specialized controller for connecting an SPI
> > +         Flash over 1/2/4-bit wide bus. Enable this option if you have a
> > +         device with a Cadence QSPI controller and want to access the
> > +         Flash as an MTD device.
> > +
> 
> the patch failed to apply, please rebase it to master.

it's based on -next, I'm sure you can fix trivial conflicts yourself if you
need to apply it elsewhere. Do you have any other review comments ?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
