Return-Path: <SRS0=9H7/=FX=gmail.com=andy.shevchenko@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1519736330-3985-1-git-send-email-jassisinghbrar@gmail.com>
References: <1519736182-3650-1-git-send-email-jassisinghbrar@gmail.com> <1519736330-3985-1-git-send-email-jassisinghbrar@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 Mar 2018 12:02:45 +0200
Message-ID: <CAHp75VcW_kghNKghXb=4cL4WUnwt4JPZ93aetedie4nWgQKL=w@mail.gmail.com>
Subject: Re: [PATCHv4 2/3] spi: Add spi driver for Socionext Synquacer platform
Content-Type: text/plain; charset="UTF-8"
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-spi <linux-spi@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, tpiepho@impinj.com, Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Feb 27, 2018 at 2:58 PM,  <jassisinghbrar@gmail.com> wrote:
> From: Jassi Brar <jaswinder.singh@linaro.org>
>
> This patch adds support for controller found on synquacer platforms.

Thanks for the patch!

Unfortunately it has a set of typical mistakes.
Perhaps you guys eventually do follow some common style?

See my comments below.

> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +#include <linux/spi/spi.h>
> +#include <linux/spinlock.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>

> +#define PCC0           0x4
> +#define PCC(n)         (PCC0 + (n) * 4)
> +#define RTM    BIT(3)
> +#define ACES   BIT(2)
> +#define SAFESYNC       BIT(16)
> +#define CPHA   BIT(0)
> +#define CPOL   BIT(1)
> +#define SSPOL  BIT(4)
> +#define SDIR   BIT(7)

> +#define SS2CD  5

What is this?

> +#define SENDIAN        BIT(8)

Why above list of bits is unordered?

> +#define CDRS_SHIFT     9

> +#define CDRS_MASK      0x7f

GENMASK() ?

> +#define        DMSTART         0x38
> +#define TRIGGER                BIT(0)
> +#define DMSTOP         BIT(8)

> +#define CS_MASK                3

GENMASK() ?

> +#define CS_SHIFT       16
> +#define DATA_TXRX      0
> +#define DATA_RX                1
> +#define DATA_TX                2

> +#define DATA_MASK      3

GENMASK() ?

> +#define DATA_SHIFT     26
> +#define BUS_WIDTH      24
> +
> +#define        DMBCC           0x3c
> +#define DMSTATUS       0x40

> +#define RX_DATA_MASK   0x1f

GENMASK() ?

> +#define RX_DATA_SHIFT  8

> +#define TX_DATA_MASK   0x1f

GENMASK() ?

> +#define TX_DATA_SHIFT  16
> +
> +#define TXBITCNT       0x44
> +
> +#define FIFOCFG                0x4c

> +#define BPW_MASK       0x3

GENMASK() ?

> +#define BPW_SHIFT      8
> +#define RX_FLUSH       BIT(11)
> +#define TX_FLUSH       BIT(12)

> +#define RX_TRSHLD_MASK         0xf

GENMASK() ?

> +#define RX_TRSHLD_SHIFT                0

> +#define TX_TRSHLD_MASK         0xf

GENMASK() ?

> +#define TX_TRSHLD_SHIFT                4
> +
> +#define TXFIFO         0x50
> +#define RXFIFO         0x90
> +#define MID            0xfc
> +
> +#define FIFO_DEPTH     16
> +#define TX_TRSHLD      4
> +#define RX_TRSHLD      (FIFO_DEPTH - TX_TRSHLD)
> +
> +#define TXBIT  BIT(1)
> +#define RXBIT  BIT(2)
> +
> +#define IHCLK  0
> +#define IPCLK  1

To all above. Can you do all definitions under a dedicated namespace?

> +struct synquacer_spi {

> +       struct device *dev;
> +       struct spi_master *master;

Isn't one refers to another?

> +
> +       unsigned int cs;
> +       unsigned int bpw;
> +       unsigned int mode;
> +       unsigned int speed;
> +       bool aces, rtm;
> +       void *rx_buf;
> +       const void *tx_buf;

> +       struct clk *clk[2];

Ouch. Please, split with a proper names.

> +       void __iomem *regs;
> +       unsigned int tx_words, rx_words;
> +       unsigned int bus_width;
> +};
> +
> +static void read_fifo(struct synquacer_spi *sspi)
> +{
> +       u32 len = readl_relaxed(sspi->regs + DMSTATUS);
> +       int i;
> +
> +       len = (len >> RX_DATA_SHIFT) & RX_DATA_MASK;
> +       len = min_t(unsigned int, len, sspi->rx_words);
> +

> +       switch (sspi->bpw) {
> +       case 8:
> +               {
> +               u8 *buf = sspi->rx_buf;
> +
> +               for (i = 0; i < len; i++)
> +                       *buf++ = readb_relaxed(sspi->regs + RXFIFO);

readsb() ?

> +               sspi->rx_buf = buf;
> +               break;
> +               }
> +       case 16:
> +               {
> +               u16 *buf = sspi->rx_buf;
> +
> +               for (i = 0; i < len; i++)
> +                       *buf++ = readw_relaxed(sspi->regs + RXFIFO);
> +               sspi->rx_buf = buf;
> +               break;
> +               }

readsw() ?

> +       default:
> +               {
> +               u32 *buf = sspi->rx_buf;
> +
> +               for (i = 0; i < len; i++)
> +                       *buf++ = readl_relaxed(sspi->regs + RXFIFO);
> +               sspi->rx_buf = buf;
> +               break;
> +               }

readsl() ?

> +       }
> +
> +       sspi->rx_words -= len;
> +}
> +
> +static void write_fifo(struct synquacer_spi *sspi)
> +{
> +       u32 len = readl_relaxed(sspi->regs + DMSTATUS);
> +       int i;
> +
> +       len = (len >> TX_DATA_SHIFT) & TX_DATA_MASK;
> +       len = min_t(unsigned int, FIFO_DEPTH - len, sspi->tx_words);
> +
> +       switch (sspi->bpw) {
> +       case 8:
> +               {
> +               const u8 *buf = sspi->tx_buf;
> +
> +               for (i = 0; i < len; i++)
> +                       writeb_relaxed(*buf++, sspi->regs + TXFIFO);
> +               sspi->tx_buf = buf;
> +               break;
> +               }

writesb() ?

> +       case 16:
> +               {
> +               const u16 *buf = sspi->tx_buf;
> +
> +               for (i = 0; i < len; i++)
> +                       writew_relaxed(*buf++, sspi->regs + TXFIFO);
> +               sspi->tx_buf = buf;
> +               break;
> +               }

writesw() ?

> +       default:
> +               {
> +               const u32 *buf = sspi->tx_buf;
> +
> +               for (i = 0; i < len; i++)
> +                       writel_relaxed(*buf++, sspi->regs + TXFIFO);
> +               sspi->tx_buf = buf;
> +               break;
> +               }

writesl() ?

> +       }
> +       sspi->tx_words -= len;
> +}
> +
> +static int synquacer_spi_config(struct spi_master *master,
> +                               struct spi_device *spi,
> +                               struct spi_transfer *xfer)
> +{
> +       struct synquacer_spi *sspi = spi_master_get_devdata(master);
> +       unsigned int speed, mode, bpw, cs, bus_width;
> +       unsigned long rate;
> +       u32 val, div;
> +
> +       /* Full Duplex only on 1bit wide bus */

1-bit

> +}

> +static int synquacer_spi_transfer_one(struct spi_master *master,
> +                                     struct spi_device *spi,
> +                                     struct spi_transfer *xfer)
> +{

> +       /* See if we can transfer 4-bytes as 1 word even if not asked */

Why?

> +       bpw = xfer->bits_per_word;
> +       if (bpw == 8 && !(xfer->len % 4) && !(spi->mode & SPI_LSB_FIRST))
> +               xfer->bits_per_word = 32;

> +}

> +static void synquacer_spi_set_cs(struct spi_device *spi, bool enable)
> +{
> +       struct synquacer_spi *sspi = spi_master_get_devdata(spi->master);
> +       u32 val;

> +       if (!enable) {

Why not to use positive condition?

> +       } else {

> +       }
> +}

> +static int synquacer_spi_enable(struct spi_master *master)
> +{
> +       struct synquacer_spi *sspi = spi_master_get_devdata(master);

> +       u32 val;

unsigned int retries = 65535;

> +
> +       /* Disable module */
> +       writel_relaxed(0, sspi->regs + MCTRL);

> +       val = 0xfffff;
> +       while (--val && (readl_relaxed(sspi->regs + MCTRL) & MES))
> +               cpu_relax();
> +       if (!val)
> +               return -EBUSY;

while (readl...(...) && --retries)
 cpu_relax();
if (!retries)
 return -EBUSY;


> +static int synquacer_spi_probe(struct platform_device *pdev)
> +{
> +       struct device_node *np = pdev->dev.of_node;
> +       struct spi_master *master;
> +       struct synquacer_spi *sspi;
> +       struct resource *res;
> +       int ret;
> +


> +       master = spi_alloc_master(&pdev->dev, sizeof(*sspi));

s/master/controller/ ?

I guess it might make sense to do for entire driver.

> +       if (!master)
> +               return -ENOMEM;

+ empty line ?

> +       platform_set_drvdata(pdev, master);

> +       clk_prepare_enable(sspi->clk[IPCLK]);

Also can fail.

> +       ret = clk_prepare_enable(sspi->clk[IHCLK]);
> +       if (ret)
> +               goto put_spi;

> +#ifdef CONFIG_PM_SLEEP

__maybe_unused

> +static int synquacer_spi_suspend(struct device *dev)

> +static int synquacer_spi_resume(struct device *dev)

> +               clk_prepare_enable(sspi->clk[IPCLK]);

It can fail.

> +               ret = clk_prepare_enable(sspi->clk[IHCLK]);
> +               if (ret < 0) {
> +                       dev_err(dev, "failed to enable clk (%d)\n", ret);
> +                       return ret;
> +               }

> +}
> +#endif /* CONFIG_PM_SLEEP */

> +static const struct dev_pm_ops synquacer_spi_pm_ops = {
> +       SET_SYSTEM_SLEEP_PM_OPS(synquacer_spi_suspend, synquacer_spi_resume)
> +};

static SIMPLE_DEV_PM_OPS() ?

> +static const struct of_device_id synquacer_spi_of_match[] = {
> +       {.compatible = "socionext,synquacer-spi",},

> +       {},

No comma needed.

> +};
> +MODULE_DEVICE_TABLE(of, synquacer_spi_of_match);

> +static struct platform_driver synquacer_spi_driver = {
> +       .driver = {
> +               .name = "synquacer-spi",
> +               .pm = &synquacer_spi_pm_ops,

> +               .of_match_table = of_match_ptr(synquacer_spi_of_match),

of_match_ptr() should be dropped.

> +       },
> +       .probe = synquacer_spi_probe,
> +       .remove = synquacer_spi_remove,
> +};

-- 
With Best Regards,
Andy Shevchenko
