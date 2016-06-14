From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V12 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller
Date: Tue, 14 Jun 2016 14:59:03 +0200
Message-ID: <575FFF97.7040104@denx.de>
References: <1465000774-7762-1-git-send-email-marex@denx.de>
 <1465000774-7762-2-git-send-email-marex@denx.de> <575F91B2.7010304@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <575F91B2.7010304@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Vignesh R <vigneshr@ti.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alan Tull <atull@opensource.altera.com>, Yves Vandervennet <yvanderv@opensource.altera.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Graham Moore <grmoore@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On 06/14/2016 07:10 AM, Vignesh R wrote:
> Hi,

Hi,

> On Saturday 04 June 2016 06:09 AM, Marek Vasut wrote:
> [...]
>> +
>> +static int cqspi_indirect_read_execute(struct spi_nor *nor,
>> +				       u8 *rxbuf, const unsigned n_rx)
>> +{
>> +	struct cqspi_flash_pdata *f_pdata = nor->priv;
>> +	struct cqspi_st *cqspi = f_pdata->cqspi;
>> +	void __iomem *reg_base = cqspi->iobase;
>> +	void __iomem *ahb_base = cqspi->ahb_base;
>> +	unsigned int remaining = n_rx;
>> +	unsigned int bytes_to_read = 0;
>> +	int ret = 0;
>> +
>> +	writel(remaining, reg_base + CQSPI_REG_INDIRECTRDBYTES);
>> +
>> +	/* Clear all interrupts. */
>> +	writel(CQSPI_IRQ_STATUS_MASK, reg_base + CQSPI_REG_IRQSTATUS);
>> +
>> +	writel(CQSPI_IRQ_MASK_RD, reg_base + CQSPI_REG_IRQMASK);
>> +
>> +	reinit_completion(&cqspi->transfer_complete);
>> +	writel(CQSPI_REG_INDIRECTRD_START_MASK,
>> +	       reg_base + CQSPI_REG_INDIRECTRD);
>> +
>> +	while (remaining > 0) {
>> +		ret = wait_for_completion_timeout(&cqspi->transfer_complete,
>> +						  msecs_to_jiffies
>> +						  (CQSPI_READ_TIMEOUT_MS));
>> +
>> +		bytes_to_read = cqspi_get_rd_sram_level(cqspi);
>> +
>> +		if (!ret && bytes_to_read == 0) {
>> +			dev_err(nor->dev, "Indirect read timeout, no bytes\n");
>> +			ret = -ETIMEDOUT;
>> +			goto failrd;
>> +		}
>> +
>> +		while (bytes_to_read != 0) {
>> +			bytes_to_read *= cqspi->fifo_width;
>> +			bytes_to_read = bytes_to_read > remaining ?
>> +					remaining : bytes_to_read;
>> +			readsl(ahb_base, rxbuf, DIV_ROUND_UP(bytes_to_read, 4));
>> +			rxbuf += bytes_to_read;
>> +			remaining -= bytes_to_read;
>> +			bytes_to_read = cqspi_get_rd_sram_level(cqspi);
>> +		}
>> +
>> +		if (remaining > 0)
>> +			reinit_completion(&cqspi->transfer_complete);
>> +	}
>> +
>> +	/* Check indirect done status */
>> +	ret = cqspi_wait_for_bit(reg_base + CQSPI_REG_INDIRECTRD,
>> +				 CQSPI_REG_INDIRECTRD_DONE_MASK, 0);
>> +
> 
> I was wondering if its better to use direct access mode[1].

The link leads to altera documentation front page, but I have an idea
what you mean. You might want to refer to [2] instead.

[2] https://www.altera.com/en_US/pdfs/literature/hb/cyclone-v/cv_5v4.pdf

> With this
> mode there is no need to wait for IRQ or monitor sdram level. By setting
> up QSPI in direct access mode, this entire function can be replaced by:
> memcpy(buf, cqspi->ahb_base + from, n_rx)

The altera docs, page 993, show how to use the direct access mode. The
idea is to map 1 MiB blocks of the flash in the address space, one at a
time and then do IO into those. I don't like such solution:

- I didn't find any way to find when all the data in the current 1 MiB
  block were written and you can remap another 1 MiB block in place.
- Since the controller doesn't use the internal buffer in direct
  operation mode, it will block the AHB bus during it's operation.
- I didn't find how IO errors get handled in this case, but maybe I
  didn't drill deep enough on this one.

Moreover, page 991 bottom of [2] states that the indirect mode is
"high-performance". I am inclined to believe that as it uses the
internal buffer of the QSPI controller, which is tightly coupled to the
block,
so the data are available immediately when the flash is ready instead
of having to wait for the next AHB turn.

My impression is that the Direct mode is great when the system boots
from the QSPI because it can "map" the flash and just execute code from
it. But for normal operation, the indirect mode seems the better choice.

> IMO, this might give better throughput. Have tested this mode?

I haven't tested it, no.

> [1] https://documentation.altera.com/#/00038604-AA$AA00045811
> 
> 
> 


-- 
Best regards,
Marek Vasut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
