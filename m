From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCH V10 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Mon, 11 Jan 2016 10:09:24 -0600
Message-ID: <5693D3B4.2090304@opensource.altera.com>
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <1452486886-8049-2-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1452486886-8049-2-git-send-email-marex@denx.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org
Cc: devicetree@vger.kernel.org, "R, Vignesh" <vigneshr@ti.com>, Alan Tull <atull@opensource.altera.com>, Yves Vandervennet <yvanderv@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Graham Moore <grmoore@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On 01/10/2016 10:34 PM, Marek Vasut wrote:
> From: Graham Moore <grmoore@opensource.altera.com>
> 
> Add support for the Cadence QSPI controller. This controller is
> present in the Altera SoCFPGA SoCs and this driver has been tested
> on the Cyclone V SoC.
> 
> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alan Tull <atull@opensource.altera.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Dinh Nguyen <dinguyen@opensource.altera.com>
> Cc: Graham Moore <grmoore@opensource.altera.com>
> Cc: "R, Vignesh" <vigneshr@ti.com>
> Cc: Yves Vandervennet <yvanderv@opensource.altera.com>
> Cc: devicetree@vger.kernel.org
> ---
>  drivers/mtd/spi-nor/Kconfig           |   11 +
>  drivers/mtd/spi-nor/Makefile          |    1 +
>  drivers/mtd/spi-nor/cadence-quadspi.c | 1280 +++++++++++++++++++++++++++++++++
>  3 files changed, 1292 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/cadence-quadspi.c
> 
> V2: use NULL instead of modalias in spi_nor_scan call
> V3: Use existing property is-decoded-cs instead of creating duplicate.
> V4: Support Micron quad mode by snooping command stream for EVCR command
>     and subsequently configuring Cadence controller for quad mode.
> V5: Clean up sparse and smatch complaints.  Remove snooping of Micron
>     quad mode.  Add comment on XIP mode bit and dummy clock cycles.  Set
>     up SRAM partition at 1:1 during init.
> V6: Remove dts patch that was included by mistake.  Incorporate Vikas's
>     comments regarding fifo width, SRAM partition setting, and trigger
>     address.  Trigger address was added as an unsigned int, as it is not
>     an IO resource per se, and does not need to be mapped. Also add
>     Marek Vasut's workaround for picking up OF properties on subnodes.
> V7: - Perform coding-style cleanup and type fixes. Remove ugly QSPI_*()
>       macros and replace them with functions. Get rid of unused variables.
>     - Implement support for nor->set_protocol() to handle Quad-command,
>       this patch now depends on the following patch:
>       mtd: spi-nor: notify (Q)SPI controller about protocol change
>     - Replace that cqspi_fifo_read() disaster with plain old readsl()
>       and cqspi_fifo_write() tentacle horror with pretty writesl().
>     - Remove CQSPI_SUPPORT_XIP_CHIPS, which is broken.
>     - Get rid of cqspi_find_chipselect() mess, instead just place the
>       struct cqspi_st and chipselect number into struct cqspi_flash_pdata
>       and set nor->priv to the struct cqspi_flash_pdata of that particular
>       chip.
>     - Replace the odd math in calculate_ticks_for_ns() with DIV_ROUND_UP().
>     - Make variables const where applicable.
> V8: - Implement a function to wait for bit being set/unset for a given
>       period of time and use it to replace the ad-hoc bits of code.
>     - Configure the write underflow watermark to be 1/8 if FIFO size.
>     - Extract out the SPI NOR flash probing code into separate function
>       to clearly mark what will soon be considered a boilerplate code.
>     - Repair the handling of mode bits, which caused instability in V7.
>     - Clean up the interrupt handling
>     - Fix Kconfig help text and make the patch depend on OF and COMPILE_TEST.
> V9: - Rename CQSPI_REG_IRQ_IND_RD_OVERFLOW to CQSPI_REG_IRQ_IND_SRAM_FULL
>     - Merge cqspi_controller_disable() into cqspi_controller_enable() and
>       make the mode selectable via parameter.
> V10: - Update against Cyrille's new patchset and changes to linux-mtd.
>      - Repair problem with multiple QSPI NOR devices having the same mtd->name,
>        they are now named devname.cs , where cs is the chipselect ID.
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 43bafde..7e29050 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -50,4 +50,15 @@ config SPI_NXP_SPIFI
>  	  Flash. Enable this option if you have a device with a SPIFI
>  	  controller and want to access the Flash as a mtd device.
>  
> +config SPI_CADENCE_QUADSPI
> +	tristate "Cadence Quad SPI controller"
> +	depends on OF && (ARCH_SOCFPGA || COMPILE_TEST)

I think you can remove the ARCH_SOCFPGA dependency as this driver is
used on a TI EVM as well.

Dinh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
