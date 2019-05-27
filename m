Return-Path: <SRS0=hgdc=T3=linaro.org=masahisa.kojima@kernel.org>
MIME-Version: 1.0
References: <20190521115958.22504-1-masahisa.kojima@linaro.org>
 <20190521115958.22504-4-masahisa.kojima@linaro.org> <CAHp75VdJLB6Tqu7z-o++44TfWnY3ghfSn=Kb=nAtxdFggOxBnw@mail.gmail.com>
In-Reply-To: <CAHp75VdJLB6Tqu7z-o++44TfWnY3ghfSn=Kb=nAtxdFggOxBnw@mail.gmail.com>
From: Masahisa Kojima <masahisa.kojima@linaro.org>
Date: Mon, 27 May 2019 17:31:44 +0900
Message-ID: <CADQ0-X_Kws0K8H0GG8NVXmpxj9gx=TfrcKoXFGXX1XvK2hJOCA@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] spi: Add spi driver for Socionext Synquacer platform
Content-Type: text/plain; charset="UTF-8"
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-spi <linux-spi@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Trent Piepho <tpiepho@impinj.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Satoru Okamoto <okamoto.satoru@socionext.com>, Yoshitoyo Osaki <osaki.yoshitoyo@socionext.com>
List-ID: <devicetree@vger.kernel.org>

Thank you for your comments.

On Wed, 22 May 2019 at 01:38, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Tue, May 21, 2019 at 3:00 PM Masahisa Kojima
> <masahisa.kojima@linaro.org> wrote:
> >
> > This patch adds support for controller found on synquacer platforms.
>
> > +       case 8:
> > +               {
> > +               u8 *buf = sspi->rx_buf;
> > +
> > +               readsb(sspi->regs + SYNQUACER_HSSPI_REG_RX_FIFO, buf, len);
> > +               sspi->rx_buf = buf + len;
> > +               break;
> > +               }
>
> Slightly better style
> case FOO: {
>   ...
> }
>
> > +       /* Full Duplex only on 1-bit wide bus */
> > +       if (xfer->rx_buf && xfer->tx_buf &&
> > +           (xfer->rx_nbits != 1 || xfer->tx_nbits != 1)) {
> > +               dev_err(sspi->dev,
> > +                       "RX and TX bus widths must match for Full-Duplex!\n");
>
> The message is not telling full truth. Not only match, but also be equal 1.
>
> > +               return -EINVAL;
> > +       }
>
> > +static int synquacer_spi_transfer_one(struct spi_master *master,
> > +                                     struct spi_device *spi,
> > +                                     struct spi_transfer *xfer)
> > +{
> > +       struct synquacer_spi *sspi = spi_master_get_devdata(master);
> > +       int ret;
> > +       int status = 0;
> > +       unsigned int words;
> > +       u8 bpw;
> > +       u32 val;
> > +
> > +       val = readl_relaxed(sspi->regs + SYNQUACER_HSSPI_REG_FIFOCFG);
> > +       val |= SYNQUACER_HSSPI_FIFOCFG_RX_FLUSH;
> > +       val |= SYNQUACER_HSSPI_FIFOCFG_TX_FLUSH;
> > +       writel_relaxed(val, sspi->regs + SYNQUACER_HSSPI_REG_FIFOCFG);
> > +
> > +       /*
> > +        * See if we can transfer 4-bytes as 1 word
> > +        * to maximize the FIFO buffer effficiency
>
> Typo here, and period is missed.
>
> > +        */
>
> > +       case 8:
> > +               words = xfer->len;
> > +               break;
> > +       case 16:
> > +               words = xfer->len / 2;
> > +               break;
> > +       default:
> > +               words = xfer->len / 4;
> > +               break;
>
> Hmm... Shouldn't be rather "less then or equal" comparisons?

As Mark's comment, I will explicitly list the values(8, 16, 24 and 32).

> > +       unsigned int retries = 0xfffff;
>
> Hmm... better to use decimal value.

Instead of implementing retry with counter, I will implement
wait function with checking time_before(jiffies, timeout).

>
> > +       /* Disable module */
> > +       writel_relaxed(0, sspi->regs + SYNQUACER_HSSPI_REG_MCTRL);
>
> > +       while ((readl_relaxed(sspi->regs + SYNQUACER_HSSPI_REG_MCTRL) &
> > +               SYNQUACER_HSSPI_MCTRL_MES) && --retries)
> > +               cpu_relax();
> > +       if (!retries)
> > +               return -EBUSY;
>
> And here something like
> do {
> } while (--retries)
>
> would look slightly better due to understanding that we do at least
> one iteration.
>
> Also, can readx_poll_timeout be used here?
>
> > +static irqreturn_t sq_spi_tx_handler(int irq, void *priv)
> > +{
> > +       uint32_t val;
> > +       struct synquacer_spi *sspi = priv;
> > +
> > +       val = readl_relaxed(sspi->regs + SYNQUACER_HSSPI_REG_TXF);
> > +
> > +       if (val & SYNQUACER_HSSPI_TXF_FIFO_EMPTY) {
> > +               if (sspi->tx_words == 0) {
> > +                       writel_relaxed(0, sspi->regs + SYNQUACER_HSSPI_REG_TXE);
> > +                       complete(&sspi->transfer_done);
>
> > +                       return 0;
>
> irqreturn_t type, please. We have corresponding defines.
>
> > +               }
> > +               write_fifo(sspi);
> > +       }
> > +
> > +       return 0;
>
> Ditto.
>
> > +}
>
> > +static int synquacer_spi_probe(struct platform_device *pdev)
> > +{
> > +       struct device_node *np = pdev->dev.of_node;
> > +       struct spi_master *master;
> > +       struct synquacer_spi *sspi;
> > +       struct resource *res;
> > +       int ret;
> > +       int rx_irq, tx_irq;
> > +
> > +       master = spi_alloc_master(&pdev->dev, sizeof(*sspi));
> > +       if (!master)
> > +               return -ENOMEM;
> > +
> > +       platform_set_drvdata(pdev, master);
> > +
> > +       sspi = spi_master_get_devdata(master);
> > +       sspi->dev = &pdev->dev;
> > +
>
> > +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       sspi->regs = devm_ioremap_resource(sspi->dev, res);
>
> devm_platform_ioremap_resource()
>
> > +       if (IS_ERR(sspi->regs)) {
> > +               ret = PTR_ERR(sspi->regs);
> > +               goto put_spi;
> > +       }
>
> > +       } else {
> > +               dev_err(&pdev->dev, "specified wrong clock source\n");
> > +               ret = -EINVAL;
> > +               goto put_spi;
> > +       }
>
> Not an issue for ACPI.
>
> > +       if (IS_ERR(sspi->clk)) {
> > +               dev_err(&pdev->dev, "clock not found\n");
> > +               ret = PTR_ERR(sspi->clk);
> > +               goto put_spi;
> > +       }
> > +
> > +       sspi->aces = of_property_read_bool(np, "socionext,set-aces");
> > +       sspi->rtm = of_property_read_bool(np, "socionext,use-rtm");
> > +
> > +       master->num_chipselect = SYNQUACER_HSSPI_NUM_CHIP_SELECT;
> > +
> > +       init_completion(&sspi->transfer_done);
> > +
> > +       rx_irq = platform_get_irq(pdev, 0);
> > +       if (rx_irq < 0)
> > +               dev_err(&pdev->dev, "get rx_irq failed\n");
> > +
> > +       tx_irq = platform_get_irq(pdev, 1);
> > +       if (tx_irq < 0)
> > +               dev_err(&pdev->dev, "get tx_irq failed\n");
> > +
> > +       ret = devm_request_irq(&pdev->dev, rx_irq, sq_spi_rx_handler,
> > +                               0, "synquacer-spi-rx", sspi);
> > +       ret = devm_request_irq(&pdev->dev, tx_irq, sq_spi_tx_handler,
> > +                               0, "synquacer-spi-tx", sspi);
> > +
> > +       ret = clk_prepare_enable(sspi->clk);
> > +       if (ret)
> > +               goto put_spi;
> > +
> > +       master->dev.of_node = np;
> > +       master->auto_runtime_pm = true;
> > +       master->bus_num = pdev->id;
> > +
> > +       master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_TX_DUAL | SPI_RX_DUAL |
> > +                           SPI_TX_QUAD | SPI_RX_QUAD;
> > +       master->bits_per_word_mask = SPI_BPW_MASK(32) | SPI_BPW_MASK(24) |
> > +                                    SPI_BPW_MASK(16) | SPI_BPW_MASK(8);
> > +
> > +       master->max_speed_hz = clk_get_rate(sspi->clk);
> > +       master->min_speed_hz = master->max_speed_hz / 254;
> > +
> > +       master->set_cs = synquacer_spi_set_cs;
> > +       master->transfer_one = synquacer_spi_transfer_one;
> > +
> > +       ret = synquacer_spi_enable(master);
> > +       if (ret)
> > +               goto fail_enable;
> > +
> > +       pm_runtime_set_active(sspi->dev);
> > +       pm_runtime_enable(sspi->dev);
> > +
> > +       ret = devm_spi_register_master(sspi->dev, master);
> > +       if (ret)
> > +               goto disable_pm;
> > +
> > +       return 0;
> > +
> > +disable_pm:
> > +       pm_runtime_disable(sspi->dev);
> > +fail_enable:
> > +       clk_disable_unprepare(sspi->clk);
> > +put_spi:
> > +       spi_master_put(master);
> > +
> > +       return ret;
> > +}
>
>
> > +       if (!pm_runtime_suspended(dev))
>
> This is not enough to check.

I checked other drivers, but I could find what is missing.
Could you kindly share more details?

>
> > +       if (!pm_runtime_suspended(dev)) {
>
> Ditto.
>
> --
> With Best Regards,
> Andy Shevchenko
