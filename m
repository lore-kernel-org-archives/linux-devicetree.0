Return-Path: <SRS0=iF9A=TW=linaro.org=masahisa.kojima@kernel.org>
MIME-Version: 1.0
References: <20190521115958.22504-1-masahisa.kojima@linaro.org>
 <20190521115958.22504-4-masahisa.kojima@linaro.org> <20190521181609.GB16633@sirena.org.uk>
In-Reply-To: <20190521181609.GB16633@sirena.org.uk>
From: Masahisa Kojima <masahisa.kojima@linaro.org>
Date: Wed, 22 May 2019 17:27:23 +0900
Message-ID: <CADQ0-X9yKQ2akerpxKfjxOxmRhPiaaxe7ALDO7VQiH+-+SHo3w@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] spi: Add spi driver for Socionext Synquacer platform
Content-Type: text/plain; charset="UTF-8"
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, geert@linux-m68k.org, tpiepho@impinj.com, andy.shevchenko@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Satoru Okamoto <okamoto.satoru@socionext.com>, Yoshitoyo Osaki <osaki.yoshitoyo@socionext.com>
List-ID: <devicetree@vger.kernel.org>

Thank you very much for your comments.

On Wed, 22 May 2019 at 03:16, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, May 21, 2019 at 08:59:58PM +0900, Masahisa Kojima wrote:
>
> > +     switch (sspi->bpw) {
> > +     case 8:
>
> > +             {
> > +             u8 *buf = sspi->rx_buf;
> > +
> > +             readsb(sspi->regs + SYNQUACER_HSSPI_REG_RX_FIFO, buf, len);
> > +             sspi->rx_buf = buf + len;
> > +             break;
> > +             }
>
> Please indent these properly.
>
> > +     default:
> > +             {
> > +             u32 *buf = sspi->rx_buf;
> > +
> > +             readsl(sspi->regs + SYNQUACER_HSSPI_REG_RX_FIFO, buf, len);
> > +             sspi->rx_buf = buf + len;
> > +             break;
> > +             }
>
> It'd be better to explicitly list the values this works for and return
> an error otherwise.
>
> > +     if (sspi->rx_words) {
> > +             val = SYNQUACER_HSSPI_RXE_FIFO_MORE_THAN_THRESHOLD |
> > +                   SYNQUACER_HSSPI_RXE_SLAVE_RELEASED;
> > +             writel_relaxed(val, sspi->regs + SYNQUACER_HSSPI_REG_RXE);
> > +             status = wait_for_completion_timeout(&sspi->transfer_done,
> > +                     msecs_to_jiffies(SYNQUACER_HSSPI_TRANSFER_TMOUT_MSEC));
> > +             writel_relaxed(0, sspi->regs + SYNQUACER_HSSPI_REG_RXE);
> > +     }
> > +
> > +     if (xfer->tx_buf) {
> > +             val = SYNQUACER_HSSPI_TXE_FIFO_EMPTY;
> > +             writel_relaxed(val, sspi->regs + SYNQUACER_HSSPI_REG_TXE);
> > +             status = wait_for_completion_timeout(&sspi->transfer_done,
> > +                     msecs_to_jiffies(SYNQUACER_HSSPI_TRANSFER_TMOUT_MSEC));
> > +             writel_relaxed(0, sspi->regs + SYNQUACER_HSSPI_REG_TXE);
> > +     }
>
> I guess the TX will complete before the RX usually so I'd kind of expect
> the waits to be in the other order?
>
> > +     if (status < 0) {
> > +             dev_err(sspi->dev, "failed to transfer\n");
> > +             return status;
> > +     }
>
> Printing the error code could be helpful for users.
>
> > +static void synquacer_spi_set_cs(struct spi_device *spi, bool enable)
> > +{
> > +     struct synquacer_spi *sspi = spi_master_get_devdata(spi->master);
> > +     u32 val;
> > +
> > +     val = readl_relaxed(sspi->regs + SYNQUACER_HSSPI_REG_DMSTART);
> > +     val &= ~(SYNQUACER_HSSPI_DMPSEL_CS_MASK <<
> > +              SYNQUACER_HSSPI_DMPSEL_CS_SHIFT);
> > +     val |= spi->chip_select << SYNQUACER_HSSPI_DMPSEL_CS_SHIFT;
> > +
> > +     if (enable) {
> > +             val |= SYNQUACER_HSSPI_DMSTOP_STOP;
> > +             writel_relaxed(val, sspi->regs + SYNQUACER_HSSPI_REG_DMSTART);
> > +
> > +             if (sspi->rx_buf) {
> > +                     u32 buf[SYNQUACER_HSSPI_FIFO_DEPTH];
> > +
> > +                     sspi->rx_buf = buf;
> > +                     sspi->rx_words = SYNQUACER_HSSPI_FIFO_DEPTH;
> > +                     read_fifo(sspi);
> > +             }
>
> This is doing things with the FIFO, that's completely inappropriate for
> a set_cs() operation.  The set_cs() operation should set the chip select
> and nothing else.
>
> > +static irqreturn_t sq_spi_rx_handler(int irq, void *priv)
> > +{
> > +     uint32_t val;
> > +     struct synquacer_spi *sspi = priv;
> > +
> > +     val = readl_relaxed(sspi->regs + SYNQUACER_HSSPI_REG_RXF);
> > +     if ((val & SYNQUACER_HSSPI_RXF_SLAVE_RELEASED) ||
> > +         (val & SYNQUACER_HSSPI_RXF_FIFO_MORE_THAN_THRESHOLD))
> > +             read_fifo(sspi);
> > +
> > +     if (sspi->rx_words == 0) {
> > +             writel_relaxed(0, sspi->regs + SYNQUACER_HSSPI_REG_RXE);
> > +             complete(&sspi->transfer_done);
> > +     }
> > +
> > +     return 0;
> > +}
>
> 0 is not a valid return from an interrupt handler, IRQ_HANDLED or
> IRQ_NONE.
>
> > +     ret = devm_request_irq(&pdev->dev, rx_irq, sq_spi_rx_handler,
> > +                             0, "synquacer-spi-rx", sspi);
> > +     ret = devm_request_irq(&pdev->dev, tx_irq, sq_spi_tx_handler,
> > +                             0, "synquacer-spi-tx", sspi);
>
> The code looked awfully like we depend on having interrupts?

I"m not sure I correctly understand what this comment means,
should driver assume the case interrupt is not available?
Do I need to support both interrupt and polling handling?

> > +     master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_TX_DUAL | SPI_RX_DUAL |
> > +                         SPI_TX_QUAD | SPI_RX_QUAD;
>
> I don't see any code in the driver that configures dual or quad mode
> support other than setting _PCC_SAFESYNC, I'm not clear how the driver
> supports these modes?

Configuring single, dual and quad mode is depending on
the spi_transfer member from upper driver.

+static int synquacer_spi_config(struct spi_master *master,

 <snip>

+       if (xfer->tx_buf) {
+               bus_width = xfer->tx_nbits;
+               transfer_mode = SYNQUACER_HSSPI_TRANSFER_MODE_TX;
+       } else {
+               bus_width = xfer->rx_nbits;
+               transfer_mode = SYNQUACER_HSSPI_TRANSFER_MODE_RX;
+       }

 <snip>

+       val &= ~(3 << SYNQUACER_HSSPI_DMTRP_BUS_WIDTH_SHIFT);
+       val |= ((bus_width >> 1) << SYNQUACER_HSSPI_DMTRP_BUS_WIDTH_SHIFT);
+       writel_relaxed(val, sspi->regs + SYNQUACER_HSSPI_REG_DMSTART);
