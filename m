Return-Path: <SRS0=R6Db=QE=gmail.com=tmaimon77@kernel.org>
MIME-Version: 1.0
References: <20190116164855.200357-1-tmaimon77@gmail.com> <20190116164855.200357-3-tmaimon77@gmail.com>
 <20190119180843.78510580@archlinux> <CAP6Zq1j=wjkKYsP=aFSDCYKV3ESUibtV0oXTXG5P1LikVgdJdw@mail.gmail.com>
 <20190126173240.4f87423d@archlinux>
In-Reply-To: <20190126173240.4f87423d@archlinux>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 28 Jan 2019 12:53:18 +0200
Message-ID: <CAP6Zq1g-Q7JvE1eEot0FEZuiNG-m-bsy3E+Jf2vO_ALjoaMCag@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iio: adc: add NPCM ADC driver
Content-Type: multipart/alternative; boundary="00000000000098947805808265fa"
To: Jonathan Cameron <jic23@kernel.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Brendan Higgins <brendanhiggins@google.com>, Avi Fishman <avifishman70@gmail.com>, Joel Stanley <joel@jms.id.au>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--00000000000098947805808265fa
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

Thanks for the clarification,

 I will like to to Modify the NPCM ADC dt-binding document (
https://patchwork.ozlabs.org/patch/1022527/ - removing rst node).

To send a new commit to the iio.git testing branch or to send a new patch
version?

Thanks,

Tomer

On Sat, 26 Jan 2019 at 19:32, Jonathan Cameron <jic23@kernel.org> wrote:

> On Sun, 20 Jan 2019 17:05:38 +0200
> Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> > Hi Jonathan,
> >
> > Thanks a lot for reviewing our driver,
> >
> > On Sat, 19 Jan 2019 at 20:08, Jonathan Cameron <jic23@kernel.org> wrote:
> >
> > > On Wed, 16 Jan 2019 18:48:55 +0200
> > > Tomer Maimon <tmaimon77@gmail.com> wrote:
> > >
> > > > Add Nuvoton NPCM BMC Analog-to-Digital Converter(ADC) driver.
> > > >
> > > > The NPCM ADC is a 10-bit converter for eight channel inputs.
> > > >
> > > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > > One trivial ordering in remove oddity that I'll just fix up.
> > > Also, I don't particularly like printing a message on success
> > > as it's not providing any useful info.  Hmm. I don't care
> > > strongly enough to remove it though.
> > >
> >
> > The Probe log is is important for us when customers doing bring-up or
> have
> > some issues,
> > we ask the logs w/o asking to do all kinds of things to see if a device
> was
> > probed.
>
> You should probably develop a proper info gathering script.  Chances of
> this
> randomly getting 'tidied up' in future (i.e. remove) is rather high and
> I doubt I'll remember this if you miss the patch...
>
> I don't care all that much though and your problem if it goes away. Kernel
> logs shouldn't be used as ABI.  Even error messages tend to change over
> time!
>
> Jonathan
>
> >
> >
> > > Applied to the togreg branch of iio.git and pushed out as
> > > testing for the autobuilders to play with it.
> > >
> > > Thanks,
> > >
> > > Jonathan
> > >
> > > > ---
> > > >  drivers/iio/adc/Kconfig    |  10 ++
> > > >  drivers/iio/adc/Makefile   |   1 +
> > > >  drivers/iio/adc/npcm_adc.c | 335
> > > +++++++++++++++++++++++++++++++++++++++++++++
> > > >  3 files changed, 346 insertions(+)
> > > >  create mode 100644 drivers/iio/adc/npcm_adc.c
> > > >
> > > > diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> > > > index 7a3ca4ec0cb7..2d1e70a7d5c4 100644
> > > > --- a/drivers/iio/adc/Kconfig
> > > > +++ b/drivers/iio/adc/Kconfig
> > > > @@ -576,6 +576,16 @@ config NAU7802
> > > >         To compile this driver as a module, choose M here: the
> > > >         module will be called nau7802.
> > > >
> > > > +config NPCM_ADC
> > > > +     tristate "Nuvoton NPCM ADC driver"
> > > > +     depends on ARCH_NPCM || COMPILE_TEST
> > > > +     depends on HAS_IOMEM
> > > > +     help
> > > > +       Say yes here to build support for Nuvoton NPCM ADC.
> > > > +
> > > > +       This driver can also be built as a module. If so, the module
> > > > +       will be called npcm_adc.
> > > > +
> > > >  config PALMAS_GPADC
> > > >       tristate "TI Palmas General Purpose ADC"
> > > >       depends on MFD_PALMAS
> > > > diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> > > > index 07df37f621bd..3337eb1f4c30 100644
> > > > --- a/drivers/iio/adc/Makefile
> > > > +++ b/drivers/iio/adc/Makefile
> > > > @@ -55,6 +55,7 @@ obj-$(CONFIG_MEN_Z188_ADC) += men_z188_adc.o
> > > >  obj-$(CONFIG_MESON_SARADC) += meson_saradc.o
> > > >  obj-$(CONFIG_MXS_LRADC_ADC) += mxs-lradc-adc.o
> > > >  obj-$(CONFIG_NAU7802) += nau7802.o
> > > > +obj-$(CONFIG_NPCM_ADC) += npcm_adc.o
> > > >  obj-$(CONFIG_PALMAS_GPADC) += palmas_gpadc.o
> > > >  obj-$(CONFIG_QCOM_SPMI_ADC5) += qcom-spmi-adc5.o
> > > >  obj-$(CONFIG_QCOM_SPMI_IADC) += qcom-spmi-iadc.o
> > > > diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c
> > > > new file mode 100644
> > > > index 000000000000..1cc377cdf1f7
> > > > --- /dev/null
> > > > +++ b/drivers/iio/adc/npcm_adc.c
> > > > @@ -0,0 +1,335 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +// Copyright (c) 2019 Nuvoton Technology corporation.
> > > > +
> > > > +#include <linux/clk.h>
> > > > +#include <linux/device.h>
> > > > +#include <linux/mfd/syscon.h>
> > > > +#include <linux/io.h>
> > > > +#include <linux/iio/iio.h>
> > > > +#include <linux/interrupt.h>
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/regmap.h>
> > > > +#include <linux/regulator/consumer.h>
> > > > +#include <linux/spinlock.h>
> > > > +#include <linux/uaccess.h>
> > > > +
> > > > +struct npcm_adc {
> > > > +     bool int_status;
> > > > +     u32 adc_sample_hz;
> > > > +     struct device *dev;
> > > > +     void __iomem *regs;
> > > > +     struct clk *adc_clk;
> > > > +     wait_queue_head_t wq;
> > > > +     struct regulator *vref;
> > > > +     struct regmap *rst_regmap;
> > > > +};
> > > > +
> > > > +/* NPCM7xx reset module */
> > > > +#define NPCM7XX_IPSRST1_OFFSET               0x020
> > > > +#define NPCM7XX_IPSRST1_ADC_RST              BIT(27)
> > > > +
> > > > +/* ADC registers */
> > > > +#define NPCM_ADCCON   0x00
> > > > +#define NPCM_ADCDATA  0x04
> > > > +
> > > > +/* ADCCON Register Bits */
> > > > +#define NPCM_ADCCON_ADC_INT_EN               BIT(21)
> > > > +#define NPCM_ADCCON_REFSEL           BIT(19)
> > > > +#define NPCM_ADCCON_ADC_INT_ST               BIT(18)
> > > > +#define NPCM_ADCCON_ADC_EN           BIT(17)
> > > > +#define NPCM_ADCCON_ADC_RST          BIT(16)
> > > > +#define NPCM_ADCCON_ADC_CONV         BIT(13)
> > > > +
> > > > +#define NPCM_ADCCON_CH_MASK          GENMASK(27, 24)
> > > > +#define NPCM_ADCCON_CH(x)            ((x) << 24)
> > > > +#define NPCM_ADCCON_DIV_SHIFT                1
> > > > +#define NPCM_ADCCON_DIV_MASK         GENMASK(8, 1)
> > > > +#define NPCM_ADC_DATA_MASK(x)                ((x) & GENMASK(9, 0))
> > > > +
> > > > +#define NPCM_ADC_ENABLE              (NPCM_ADCCON_ADC_EN |
> > > NPCM_ADCCON_ADC_INT_EN)
> > > > +
> > > > +/* ADC General Definition */
> > > > +#define NPCM_RESOLUTION_BITS         10
> > > > +#define NPCM_INT_VREF_MV             2000
> > > > +
> > > > +#define NPCM_ADC_CHAN(ch) {                                  \
> > > > +     .type = IIO_VOLTAGE,                                    \
> > > > +     .indexed = 1,                                           \
> > > > +     .channel = ch,                                          \
> > > > +     .info_mask_separate = BIT(IIO_CHAN_INFO_RAW),           \
> > > > +     .info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE) |  \
> > > > +                             BIT(IIO_CHAN_INFO_SAMP_FREQ),   \
> > > > +}
> > > > +
> > > > +static const struct iio_chan_spec npcm_adc_iio_channels[] = {
> > > > +     NPCM_ADC_CHAN(0),
> > > > +     NPCM_ADC_CHAN(1),
> > > > +     NPCM_ADC_CHAN(2),
> > > > +     NPCM_ADC_CHAN(3),
> > > > +     NPCM_ADC_CHAN(4),
> > > > +     NPCM_ADC_CHAN(5),
> > > > +     NPCM_ADC_CHAN(6),
> > > > +     NPCM_ADC_CHAN(7),
> > > > +};
> > > > +
> > > > +static irqreturn_t npcm_adc_isr(int irq, void *data)
> > > > +{
> > > > +     u32 regtemp;
> > > > +     struct iio_dev *indio_dev = data;
> > > > +     struct npcm_adc *info = iio_priv(indio_dev);
> > > > +
> > > > +     regtemp = ioread32(info->regs + NPCM_ADCCON);
> > > > +     if (regtemp & NPCM_ADCCON_ADC_INT_ST) {
> > > > +             iowrite32(regtemp, info->regs + NPCM_ADCCON);
> > > > +             wake_up_interruptible(&info->wq);
> > > > +             info->int_status = true;
> > > > +     }
> > > > +
> > > > +     return IRQ_HANDLED;
> > > > +}
> > > > +
> > > > +static int npcm_adc_read(struct npcm_adc *info, int *val, u8
> channel)
> > > > +{
> > > > +     int ret;
> > > > +     u32 regtemp;
> > > > +
> > > > +     /* Select ADC channel */
> > > > +     regtemp = ioread32(info->regs + NPCM_ADCCON);
> > > > +     regtemp &= ~NPCM_ADCCON_CH_MASK;
> > > > +     info->int_status = false;
> > > > +     iowrite32(regtemp | NPCM_ADCCON_CH(channel) |
> > > > +               NPCM_ADCCON_ADC_CONV, info->regs + NPCM_ADCCON);
> > > > +
> > > > +     ret = wait_event_interruptible_timeout(info->wq,
> info->int_status,
> > > > +                                            msecs_to_jiffies(10));
> > > > +     if (ret == 0) {
> > > > +             regtemp = ioread32(info->regs + NPCM_ADCCON);
> > > > +             if ((regtemp & NPCM_ADCCON_ADC_CONV) &&
> info->rst_regmap) {
> > > > +                     /* if conversion failed - reset ADC module */
> > > > +                     regmap_write(info->rst_regmap,
> > > NPCM7XX_IPSRST1_OFFSET,
> > > > +                                  NPCM7XX_IPSRST1_ADC_RST);
> > > > +                     msleep(100);
> > > > +                     regmap_write(info->rst_regmap,
> > > NPCM7XX_IPSRST1_OFFSET,
> > > > +                                  0x0);
> > > > +                     msleep(100);
> > > > +
> > > > +                     /* Enable ADC and start conversion module */
> > > > +                     iowrite32(NPCM_ADC_ENABLE |
> NPCM_ADCCON_ADC_CONV,
> > > > +                               info->regs + NPCM_ADCCON);
> > > > +                     dev_err(info->dev, "RESET ADC Complete\n");
> > > > +             }
> > > > +             return -ETIMEDOUT;
> > > > +     }
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     *val = NPCM_ADC_DATA_MASK(ioread32(info->regs + NPCM_ADCDATA));
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int npcm_adc_read_raw(struct iio_dev *indio_dev,
> > > > +                          struct iio_chan_spec const *chan, int
> *val,
> > > > +                          int *val2, long mask)
> > > > +{
> > > > +     int ret;
> > > > +     int vref_uv;
> > > > +     struct npcm_adc *info = iio_priv(indio_dev);
> > > > +
> > > > +     switch (mask) {
> > > > +     case IIO_CHAN_INFO_RAW:
> > > > +             mutex_lock(&indio_dev->mlock);
> > > > +             ret = npcm_adc_read(info, val, chan->channel);
> > > > +             mutex_unlock(&indio_dev->mlock);
> > > > +             if (ret) {
> > > > +                     dev_err(info->dev, "NPCM ADC read failed\n");
> > > > +                     return ret;
> > > > +             }
> > > > +             return IIO_VAL_INT;
> > > > +     case IIO_CHAN_INFO_SCALE:
> > > > +             if (info->vref) {
> > > > +                     vref_uv = regulator_get_voltage(info->vref);
> > > > +                     *val = vref_uv / 1000;
> > > > +             } else {
> > > > +                     *val = NPCM_INT_VREF_MV;
> > > > +             }
> > > > +             *val2 = NPCM_RESOLUTION_BITS;
> > > > +             return IIO_VAL_FRACTIONAL_LOG2;
> > > > +     case IIO_CHAN_INFO_SAMP_FREQ:
> > > > +             *val = info->adc_sample_hz;
> > > > +             return IIO_VAL_INT;
> > > > +     default:
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static const struct iio_info npcm_adc_iio_info = {
> > > > +     .read_raw = &npcm_adc_read_raw,
> > > > +};
> > > > +
> > > > +static const struct of_device_id npcm_adc_match[] = {
> > > > +     { .compatible = "nuvoton,npcm750-adc", },
> > > > +     { /* sentinel */ }
> > > > +};
> > > > +MODULE_DEVICE_TABLE(of, npcm_adc_match);
> > > > +
> > > > +static int npcm_adc_probe(struct platform_device *pdev)
> > > > +{
> > > > +     int ret;
> > > > +     int irq;
> > > > +     u32 div;
> > > > +     u32 reg_con;
> > > > +     struct resource *res;
> > > > +     struct npcm_adc *info;
> > > > +     struct iio_dev *indio_dev;
> > > > +     struct device *dev = &pdev->dev;
> > > > +     struct device_node *np = pdev->dev.of_node;
> > > > +
> > > > +     indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*info));
> > > > +     if (!indio_dev)
> > > > +             return -ENOMEM;
> > > > +     info = iio_priv(indio_dev);
> > > > +
> > > > +     info->dev = &pdev->dev;
> > > > +
> > > > +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > +     info->regs = devm_ioremap_resource(&pdev->dev, res);
> > > > +     if (IS_ERR(info->regs))
> > > > +             return PTR_ERR(info->regs);
> > > > +
> > > > +     info->adc_clk = devm_clk_get(&pdev->dev, NULL);
> > > > +     if (IS_ERR(info->adc_clk)) {
> > > > +             dev_warn(&pdev->dev, "ADC clock failed: can't read
> clk\n");
> > > > +             return PTR_ERR(info->adc_clk);
> > > > +     }
> > > > +
> > > > +     /* calculate ADC clock sample rate */
> > > > +     reg_con = ioread32(info->regs + NPCM_ADCCON);
> > > > +     div = reg_con & NPCM_ADCCON_DIV_MASK;
> > > > +     div = div >> NPCM_ADCCON_DIV_SHIFT;
> > > > +     info->adc_sample_hz = clk_get_rate(info->adc_clk) / ((div + 1)
> *
> > > 2);
> > > > +
> > > > +     if (of_device_is_compatible(np, "nuvoton,npcm750-adc")) {
> > > > +             info->rst_regmap = syscon_regmap_lookup_by_compatible
> > > > +                     ("nuvoton,npcm750-rst");
> > > > +             if (IS_ERR(info->rst_regmap)) {
> > > > +                     dev_err(&pdev->dev, "Failed to find
> > > nuvoton,npcm750-rst\n");
> > > > +                     ret = PTR_ERR(info->rst_regmap);
> > > > +                     goto err_disable_clk;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     irq = platform_get_irq(pdev, 0);
> > > > +     if (irq <= 0) {
> > > > +             dev_err(dev, "failed getting interrupt resource\n");
> > > > +             ret = -EINVAL;
> > > > +             goto err_disable_clk;
> > > > +     }
> > > > +
> > > > +     ret = devm_request_irq(&pdev->dev, irq, npcm_adc_isr, 0,
> > > > +                            "NPCM_ADC", indio_dev);
> > > > +     if (ret < 0) {
> > > > +             dev_err(dev, "failed requesting interrupt\n");
> > > > +             goto err_disable_clk;
> > > > +     }
> > > > +
> > > > +     reg_con = ioread32(info->regs + NPCM_ADCCON);
> > > > +     info->vref = devm_regulator_get_optional(&pdev->dev, "vref");
> > > > +     if (!IS_ERR(info->vref)) {
> > > > +             ret = regulator_enable(info->vref);
> > > > +             if (ret) {
> > > > +                     dev_err(&pdev->dev, "Can't enable ADC
> reference
> > > voltage\n");
> > > > +                     goto err_disable_clk;
> > > > +             }
> > > > +
> > > > +             iowrite32(reg_con & ~NPCM_ADCCON_REFSEL,
> > > > +                       info->regs + NPCM_ADCCON);
> > > > +     } else {
> > > > +             /*
> > > > +              * Any error which is not ENODEV indicates the
> regulator
> > > > +              * has been specified and so is a failure case.
> > > > +              */
> > > > +             if (PTR_ERR(info->vref) != -ENODEV) {
> > > > +                     ret = PTR_ERR(info->vref);
> > > > +                     goto err_disable_clk;
> > > > +             }
> > > > +
> > > > +             /* Use internal reference */
> > > > +             iowrite32(reg_con | NPCM_ADCCON_REFSEL,
> > > > +                       info->regs + NPCM_ADCCON);
> > > > +     }
> > > > +
> > > > +     init_waitqueue_head(&info->wq);
> > > > +
> > > > +     reg_con = ioread32(info->regs + NPCM_ADCCON);
> > > > +     reg_con |= NPCM_ADC_ENABLE;
> > > > +
> > > > +     /* Enable the ADC Module */
> > > > +     iowrite32(reg_con, info->regs + NPCM_ADCCON);
> > > > +
> > > > +     /* Start ADC conversion */
> > > > +     iowrite32(reg_con | NPCM_ADCCON_ADC_CONV, info->regs +
> > > NPCM_ADCCON);
> > > > +
> > > > +     platform_set_drvdata(pdev, indio_dev);
> > > > +     indio_dev->name = dev_name(&pdev->dev);
> > > > +     indio_dev->dev.parent = &pdev->dev;
> > > > +     indio_dev->info = &npcm_adc_iio_info;
> > > > +     indio_dev->modes = INDIO_DIRECT_MODE;
> > > > +     indio_dev->channels = npcm_adc_iio_channels;
> > > > +     indio_dev->num_channels = ARRAY_SIZE(npcm_adc_iio_channels);
> > > > +
> > > > +     ret = iio_device_register(indio_dev);
> > > > +     if (ret) {
> > > > +             dev_err(&pdev->dev, "Couldn't register the device.\n");
> > > > +             goto err_iio_register;
> > > > +     }
> > > > +
> > > > +     pr_info("NPCM ADC driver probed\n");
> > > Hmm. Not sure this tells us anything useful.  If we have succeeding
> > > in probing there are lots of ways to find out that are better than
> > > filling up the kernel log.
> > >
> > > > +
> > > > +     return 0;
> > > > +
> > > > +err_iio_register:
> > > > +     iowrite32(reg_con & ~NPCM_ADCCON_ADC_EN, info->regs +
> NPCM_ADCCON);
> > > > +     if (!IS_ERR(info->vref))
> > > > +             regulator_disable(info->vref);
> > > > +err_disable_clk:
> > > > +     clk_disable_unprepare(info->adc_clk);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int npcm_adc_remove(struct platform_device *pdev)
> > > > +{
> > > > +     struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> > > > +     struct npcm_adc *info = iio_priv(indio_dev);
> > > > +     u32 regtemp;
> > > > +
> > > > +     regtemp = ioread32(info->regs + NPCM_ADCCON);
> > >
> > > The ordering is a bit odd here.  I would have done the unregister
> > > first then read the value.  Doesn't have any real effect other than
> making
> > > reviewers wonder if there is something interesting going on!
> > >
> > > > +
> > > > +     iio_device_unregister(indio_dev);
> > > > +     iowrite32(regtemp & ~NPCM_ADCCON_ADC_EN, info->regs +
> NPCM_ADCCON);
> > > > +     if (!IS_ERR(info->vref))
> > > > +             regulator_disable(info->vref);
> > > > +     clk_disable_unprepare(info->adc_clk);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static struct platform_driver npcm_adc_driver = {
> > > > +     .probe          = npcm_adc_probe,
> > > > +     .remove         = npcm_adc_remove,
> > > > +     .driver         = {
> > > > +             .name   = "npcm_adc",
> > > > +             .of_match_table = npcm_adc_match,
> > > > +     },
> > > > +};
> > > > +
> > > > +module_platform_driver(npcm_adc_driver);
> > > > +
> > > > +MODULE_DESCRIPTION("Nuvoton NPCM ADC Driver");
> > > > +MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
> > > > +MODULE_LICENSE("GPL v2");
> > >
> > >
> > Thanks,
> >
> > Tomer
>
>

--00000000000098947805808265fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Jonathan,<div><br></div><div>Than=
ks for the clarification,</div><div><br></div><div>=C2=A0I will like to to =
Modify the NPCM ADC dt-binding document (<a href=3D"https://patchwork.ozlab=
s.org/patch/1022527/">https://patchwork.ozlabs.org/patch/1022527/</a> - rem=
oving rst node).</div><div><br></div><div>To send a new commit to the iio.g=
it testing branch or to send a new patch version?</div><div><br></div><div>=
Thanks,</div><div><br></div><div>Tomer</div></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail-m_-7544673861919322502gmail-m_7=
523592715727817579gmail-m_-4599046323260618770gmail_attr">On Sat, 26 Jan 20=
19 at 19:32, Jonathan Cameron &lt;<a href=3D"mailto:jic23@kernel.org" targe=
t=3D"_blank">jic23@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Sun, 20 Jan 2019 17:05:38 +0200<br>
Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">t=
maimon77@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Hi Jonathan,<br>
&gt; <br>
&gt; Thanks a lot for reviewing our driver,<br>
&gt; <br>
&gt; On Sat, 19 Jan 2019 at 20:08, Jonathan Cameron &lt;<a href=3D"mailto:j=
ic23@kernel.org" target=3D"_blank">jic23@kernel.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Wed, 16 Jan 2019 18:48:55 +0200<br>
&gt; &gt; Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D=
"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; Add Nuvoton NPCM BMC Analog-to-Digital Converter(ADC) driver=
.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The NPCM ADC is a 10-bit converter for eight channel inputs.=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@=
gmail.com" target=3D"_blank">tmaimon77@gmail.com</a>&gt;=C2=A0 <br>
&gt; &gt; One trivial ordering in remove oddity that I&#39;ll just fix up.<=
br>
&gt; &gt; Also, I don&#39;t particularly like printing a message on success=
<br>
&gt; &gt; as it&#39;s not providing any useful info.=C2=A0 Hmm. I don&#39;t=
 care<br>
&gt; &gt; strongly enough to remove it though.<br>
&gt; &gt;=C2=A0 <br>
&gt; <br>
&gt; The Probe log is is important for us when customers doing bring-up or =
have<br>
&gt; some issues,<br>
&gt; we ask the logs w/o asking to do all kinds of things to see if a devic=
e was<br>
&gt; probed.<br>
<br>
You should probably develop a proper info gathering script.=C2=A0 Chances o=
f this<br>
randomly getting &#39;tidied up&#39; in future (i.e. remove) is rather high=
 and<br>
I doubt I&#39;ll remember this if you miss the patch...<br>
<br>
I don&#39;t care all that much though and your problem if it goes away. Ker=
nel<br>
logs shouldn&#39;t be used as ABI.=C2=A0 Even error messages tend to change=
 over time!<br>
<br>
Jonathan<br>
<br>
&gt; <br>
&gt; <br>
&gt; &gt; Applied to the togreg branch of iio.git and pushed out as<br>
&gt; &gt; testing for the autobuilders to play with it.<br>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt;<br>
&gt; &gt; Jonathan<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 drivers/iio/adc/Kconfig=C2=A0 =C2=A0 |=C2=A0 10 ++<br>
&gt; &gt; &gt;=C2=A0 drivers/iio/adc/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=A01 +=
<br>
&gt; &gt; &gt;=C2=A0 drivers/iio/adc/npcm_adc.c | 335=C2=A0 <br>
&gt; &gt; +++++++++++++++++++++++++++++++++++++++++++++=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 3 files changed, 346 insertions(+)<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 drivers/iio/adc/npcm_adc.c<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconf=
ig<br>
&gt; &gt; &gt; index 7a3ca4ec0cb7..2d1e70a7d5c4 100644<br>
&gt; &gt; &gt; --- a/drivers/iio/adc/Kconfig<br>
&gt; &gt; &gt; +++ b/drivers/iio/adc/Kconfig<br>
&gt; &gt; &gt; @@ -576,6 +576,16 @@ config NAU7802<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0To compile this driver as a=
 module, choose M here: the<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0module will be called nau78=
02.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +config NPCM_ADC<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;Nuvoton NPCM ADC driver&=
quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0depends on ARCH_NPCM || COMPILE_TEST<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0depends on HAS_IOMEM<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Say yes here to build support fo=
r Nuvoton NPCM ADC.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0This driver can also be built as=
 a module. If so, the module<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0will be called npcm_adc.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 config PALMAS_GPADC<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;TI Palmas General P=
urpose ADC&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on MFD_PALMAS<br>
&gt; &gt; &gt; diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Make=
file<br>
&gt; &gt; &gt; index 07df37f621bd..3337eb1f4c30 100644<br>
&gt; &gt; &gt; --- a/drivers/iio/adc/Makefile<br>
&gt; &gt; &gt; +++ b/drivers/iio/adc/Makefile<br>
&gt; &gt; &gt; @@ -55,6 +55,7 @@ obj-$(CONFIG_MEN_Z188_ADC) +=3D men_z188_a=
dc.o<br>
&gt; &gt; &gt;=C2=A0 obj-$(CONFIG_MESON_SARADC) +=3D meson_saradc.o<br>
&gt; &gt; &gt;=C2=A0 obj-$(CONFIG_MXS_LRADC_ADC) +=3D mxs-lradc-adc.o<br>
&gt; &gt; &gt;=C2=A0 obj-$(CONFIG_NAU7802) +=3D nau7802.o<br>
&gt; &gt; &gt; +obj-$(CONFIG_NPCM_ADC) +=3D npcm_adc.o<br>
&gt; &gt; &gt;=C2=A0 obj-$(CONFIG_PALMAS_GPADC) +=3D palmas_gpadc.o<br>
&gt; &gt; &gt;=C2=A0 obj-$(CONFIG_QCOM_SPMI_ADC5) +=3D qcom-spmi-adc5.o<br>
&gt; &gt; &gt;=C2=A0 obj-$(CONFIG_QCOM_SPMI_IADC) +=3D qcom-spmi-iadc.o<br>
&gt; &gt; &gt; diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/np=
cm_adc.c<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 000000000000..1cc377cdf1f7<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/drivers/iio/adc/npcm_adc.c<br>
&gt; &gt; &gt; @@ -0,0 +1,335 @@<br>
&gt; &gt; &gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; &gt; &gt; +// Copyright (c) 2019 Nuvoton Technology corporation.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#include &lt;linux/clk.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/device.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/mfd/syscon.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/io.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/iio/iio.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/interrupt.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/module.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/regmap.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/regulator/consumer.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/spinlock.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/uaccess.h&gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +struct npcm_adc {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0bool int_status;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0u32 adc_sample_hz;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *regs;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct clk *adc_clk;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0wait_queue_head_t wq;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct regulator *vref;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct regmap *rst_regmap;<br>
&gt; &gt; &gt; +};<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +/* NPCM7xx reset module */<br>
&gt; &gt; &gt; +#define NPCM7XX_IPSRST1_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x020<br>
&gt; &gt; &gt; +#define NPCM7XX_IPSRST1_ADC_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 BIT(27)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +/* ADC registers */<br>
&gt; &gt; &gt; +#define NPCM_ADCCON=C2=A0 =C2=A00x00<br>
&gt; &gt; &gt; +#define NPCM_ADCDATA=C2=A0 0x04<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +/* ADCCON Register Bits */<br>
&gt; &gt; &gt; +#define NPCM_ADCCON_ADC_INT_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(21)<br>
&gt; &gt; &gt; +#define NPCM_ADCCON_REFSEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(19)<br>
&gt; &gt; &gt; +#define NPCM_ADCCON_ADC_INT_ST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(18)<br>
&gt; &gt; &gt; +#define NPCM_ADCCON_ADC_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(17)<br>
&gt; &gt; &gt; +#define NPCM_ADCCON_ADC_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 BIT(16)<br>
&gt; &gt; &gt; +#define NPCM_ADCCON_ADC_CONV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0BIT(13)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#define NPCM_ADCCON_CH_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 GENMASK(27, 24)<br>
&gt; &gt; &gt; +#define NPCM_ADCCON_CH(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ((x) &lt;&lt; 24)<br>
&gt; &gt; &gt; +#define NPCM_ADCCON_DIV_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
&gt; &gt; &gt; +#define NPCM_ADCCON_DIV_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0GENMASK(8, 1)<br>
&gt; &gt; &gt; +#define NPCM_ADC_DATA_MASK(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((x) &amp; GENMASK(9, 0))<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#define NPCM_ADC_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (NPCM_ADCCON_ADC_EN |=C2=A0 <br>
&gt; &gt; NPCM_ADCCON_ADC_INT_EN)=C2=A0 <br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +/* ADC General Definition */<br>
&gt; &gt; &gt; +#define NPCM_RESOLUTION_BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A010<br>
&gt; &gt; &gt; +#define NPCM_INT_VREF_MV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A02000<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#define NPCM_ADC_CHAN(ch) {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0.type =3D IIO_VOLTAGE,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0.indexed =3D 1,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0.channel =3D ch,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0.info_mask_separate =3D BIT(IIO_CHAN_IN=
FO_RAW),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0.info_mask_shared_by_type =3D BIT(IIO_C=
HAN_INFO_SCALE) |=C2=A0 \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(IIO_CHAN_INFO_SAMP_FREQ),=
=C2=A0 =C2=A0\<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static const struct iio_chan_spec npcm_adc_iio_channels[] =
=3D {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0NPCM_ADC_CHAN(0),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0NPCM_ADC_CHAN(1),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0NPCM_ADC_CHAN(2),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0NPCM_ADC_CHAN(3),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0NPCM_ADC_CHAN(4),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0NPCM_ADC_CHAN(5),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0NPCM_ADC_CHAN(6),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0NPCM_ADC_CHAN(7),<br>
&gt; &gt; &gt; +};<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static irqreturn_t npcm_adc_isr(int irq, void *data)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0u32 regtemp;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct iio_dev *indio_dev =3D data;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_adc *info =3D iio_priv(indi=
o_dev);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0regtemp =3D ioread32(info-&gt;regs + NP=
CM_ADCCON);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (regtemp &amp; NPCM_ADCCON_ADC_INT_S=
T) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite32(r=
egtemp, info-&gt;regs + NPCM_ADCCON);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up_int=
erruptible(&amp;info-&gt;wq);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;in=
t_status =3D true;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return IRQ_HANDLED;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static int npcm_adc_read(struct npcm_adc *info, int *val, u=
8 channel)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0u32 regtemp;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* Select ADC channel */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0regtemp =3D ioread32(info-&gt;regs + NP=
CM_ADCCON);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0regtemp &amp;=3D ~NPCM_ADCCON_CH_MASK;<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0info-&gt;int_status =3D false;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0iowrite32(regtemp | NPCM_ADCCON_CH(chan=
nel) |<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM=
_ADCCON_ADC_CONV, info-&gt;regs + NPCM_ADCCON);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0ret =3D wait_event_interruptible_timeou=
t(info-&gt;wq, info-&gt;int_status,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 msecs_to_jiffies(10));<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regtemp =3D=
 ioread32(info-&gt;regs + NPCM_ADCCON);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((regtem=
p &amp; NPCM_ADCCON_ADC_CONV) &amp;&amp; info-&gt;rst_regmap) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* if conversion failed - reset ADC module */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0regmap_write(info-&gt;rst_regmap,=C2=A0 <br>
&gt; &gt; NPCM7XX_IPSRST1_OFFSET,=C2=A0 <br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_IPSRST1=
_ADC_RST);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0msleep(100);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0regmap_write(info-&gt;rst_regmap,=C2=A0 <br>
&gt; &gt; NPCM7XX_IPSRST1_OFFSET,=C2=A0 <br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0msleep(100);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* Enable ADC and start conversion module */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0iowrite32(NPCM_ADC_ENABLE | NPCM_ADCCON_ADC_CONV,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;regs + NPCM_AD=
CCON);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dev_err(info-&gt;dev, &quot;RESET ADC Complete\n&quot;);<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ETI=
MEDOUT;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;=
<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0*val =3D NPCM_ADC_DATA_MASK(ioread32(in=
fo-&gt;regs + NPCM_ADCDATA));<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static int npcm_adc_read_raw(struct iio_dev *indio_dev,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct iio_chan_spec const *chan, int *val,=
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int *val2, long mask)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int vref_uv;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_adc *info =3D iio_priv(indi=
o_dev);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0switch (mask) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0case IIO_CHAN_INFO_RAW:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(=
&amp;indio_dev-&gt;mlock);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D npc=
m_adc_read(info, val, chan-&gt;channel);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unloc=
k(&amp;indio_dev-&gt;mlock);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dev_err(info-&gt;dev, &quot;NPCM ADC read failed\n&quot;);=
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return IIO_=
VAL_INT;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0case IIO_CHAN_INFO_SCALE:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (info-&g=
t;vref) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0vref_uv =3D regulator_get_voltage(info-&gt;vref);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*val =3D vref_uv / 1000;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*val =3D NPCM_INT_VREF_MV;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val2 =3D N=
PCM_RESOLUTION_BITS;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return IIO_=
VAL_FRACTIONAL_LOG2;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0case IIO_CHAN_INFO_SAMP_FREQ:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D in=
fo-&gt;adc_sample_hz;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return IIO_=
VAL_INT;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EIN=
VAL;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static const struct iio_info npcm_adc_iio_info =3D {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0.read_raw =3D &amp;npcm_adc_read_raw,<b=
r>
&gt; &gt; &gt; +};<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static const struct of_device_id npcm_adc_match[] =3D {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;nuvoton,npcm750=
-adc&quot;, },<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0{ /* sentinel */ }<br>
&gt; &gt; &gt; +};<br>
&gt; &gt; &gt; +MODULE_DEVICE_TABLE(of, npcm_adc_match);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static int npcm_adc_probe(struct platform_device *pdev)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int irq;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0u32 div;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0u32 reg_con;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_adc *info;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct iio_dev *indio_dev;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;de=
v;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *np =3D pdev-&gt;dev=
.of_node;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0indio_dev =3D devm_iio_device_alloc(&am=
p;pdev-&gt;dev, sizeof(*info));<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!indio_dev)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENO=
MEM;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0info =3D iio_priv(indio_dev);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0info-&gt;dev =3D &amp;pdev-&gt;dev;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IOR=
ESOURCE_MEM, 0);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0info-&gt;regs =3D devm_ioremap_resource=
(&amp;pdev-&gt;dev, res);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(info-&gt;regs))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_=
ERR(info-&gt;regs);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0info-&gt;adc_clk =3D devm_clk_get(&amp;=
pdev-&gt;dev, NULL);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(info-&gt;adc_clk)) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&a=
mp;pdev-&gt;dev, &quot;ADC clock failed: can&#39;t read clk\n&quot;);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_=
ERR(info-&gt;adc_clk);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* calculate ADC clock sample rate */<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0reg_con =3D ioread32(info-&gt;regs + NP=
CM_ADCCON);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0div =3D reg_con &amp; NPCM_ADCCON_DIV_M=
ASK;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0div =3D div &gt;&gt; NPCM_ADCCON_DIV_SH=
IFT;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0info-&gt;adc_sample_hz =3D clk_get_rate=
(info-&gt;adc_clk) / ((div + 1) *=C2=A0 <br>
&gt; &gt; 2);=C2=A0 <br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (of_device_is_compatible(np, &quot;n=
uvoton,npcm750-adc&quot;)) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;rs=
t_regmap =3D syscon_regmap_lookup_by_compatible<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(&quot;nuvoton,npcm750-rst&quot;);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(=
info-&gt;rst_regmap)) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt;dev, &quot;Failed to find=C2=A0 <br>
&gt; &gt; nuvoton,npcm750-rst\n&quot;);=C2=A0 <br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(info-&gt;rst_regmap);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0goto err_disable_clk;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0irq =3D platform_get_irq(pdev, 0);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (irq &lt;=3D 0) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev=
, &quot;failed getting interrupt resource\n&quot;);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EI=
NVAL;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_di=
sable_clk;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0ret =3D devm_request_irq(&amp;pdev-&gt;=
dev, irq, npcm_adc_isr, 0,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;NPCM_ADC&quot;, indio_dev);<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev=
, &quot;failed requesting interrupt\n&quot;);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_di=
sable_clk;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0reg_con =3D ioread32(info-&gt;regs + NP=
CM_ADCCON);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0info-&gt;vref =3D devm_regulator_get_op=
tional(&amp;pdev-&gt;dev, &quot;vref&quot;);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!IS_ERR(info-&gt;vref)) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D reg=
ulator_enable(info-&gt;vref);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt;dev, &quot;Can&#39;t enable ADC refe=
rence=C2=A0 <br>
&gt; &gt; voltage\n&quot;);=C2=A0 <br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0goto err_disable_clk;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite32(r=
eg_con &amp; ~NPCM_ADCCON_REFSEL,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;regs + NPCM_ADCCON);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Any erro=
r which is not ENODEV indicates the regulator<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * has been=
 specified and so is a failure case.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (PTR_ERR=
(info-&gt;vref) !=3D -ENODEV) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(info-&gt;vref);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0goto err_disable_clk;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Use inte=
rnal reference */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite32(r=
eg_con | NPCM_ADCCON_REFSEL,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;regs + NPCM_ADCCON);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0init_waitqueue_head(&amp;info-&gt;wq);<=
br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0reg_con =3D ioread32(info-&gt;regs + NP=
CM_ADCCON);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0reg_con |=3D NPCM_ADC_ENABLE;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* Enable the ADC Module */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0iowrite32(reg_con, info-&gt;regs + NPCM=
_ADCCON);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* Start ADC conversion */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0iowrite32(reg_con | NPCM_ADCCON_ADC_CON=
V, info-&gt;regs +=C2=A0 <br>
&gt; &gt; NPCM_ADCCON);=C2=A0 <br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, indio_dev);<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;name =3D dev_name(&amp;pd=
ev-&gt;dev);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;dev.parent =3D &amp;pdev-=
&gt;dev;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;info =3D &amp;npcm_adc_ii=
o_info;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;modes =3D INDIO_DIRECT_MO=
DE;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;channels =3D npcm_adc_iio=
_channels;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;num_channels =3D ARRAY_SI=
ZE(npcm_adc_iio_channels);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0ret =3D iio_device_register(indio_dev);=
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&am=
p;pdev-&gt;dev, &quot;Couldn&#39;t register the device.\n&quot;);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_ii=
o_register;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0pr_info(&quot;NPCM ADC driver probed\n&=
quot;);=C2=A0 <br>
&gt; &gt; Hmm. Not sure this tells us anything useful.=C2=A0 If we have suc=
ceeding<br>
&gt; &gt; in probing there are lots of ways to find out that are better tha=
n<br>
&gt; &gt; filling up the kernel log.<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +err_iio_register:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0iowrite32(reg_con &amp; ~NPCM_ADCCON_AD=
C_EN, info-&gt;regs + NPCM_ADCCON);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!IS_ERR(info-&gt;vref))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator_d=
isable(info-&gt;vref);<br>
&gt; &gt; &gt; +err_disable_clk:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(info-&gt;adc_clk)=
;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static int npcm_adc_remove(struct platform_device *pdev)<br=
>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct iio_dev *indio_dev =3D platform_=
get_drvdata(pdev);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_adc *info =3D iio_priv(indi=
o_dev);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0u32 regtemp;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0regtemp =3D ioread32(info-&gt;regs + NP=
CM_ADCCON);=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; The ordering is a bit odd here.=C2=A0 I would have done the unreg=
ister<br>
&gt; &gt; first then read the value.=C2=A0 Doesn&#39;t have any real effect=
 other than making<br>
&gt; &gt; reviewers wonder if there is something interesting going on!<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0iio_device_unregister(indio_dev);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0iowrite32(regtemp &amp; ~NPCM_ADCCON_AD=
C_EN, info-&gt;regs + NPCM_ADCCON);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!IS_ERR(info-&gt;vref))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator_d=
isable(info-&gt;vref);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(info-&gt;adc_clk)=
;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static struct platform_driver npcm_adc_driver =3D {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D npcm_adc_probe,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D npcm_adc_remove,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0.driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0=
 =C2=A0=3D &quot;npcm_adc&quot;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_t=
able =3D npcm_adc_match,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; &gt; +};<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +module_platform_driver(npcm_adc_driver);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +MODULE_DESCRIPTION(&quot;Nuvoton NPCM ADC Driver&quot;);<br=
>
&gt; &gt; &gt; +MODULE_AUTHOR(&quot;Tomer Maimon &lt;<a href=3D"mailto:tome=
r.maimon@nuvoton.com" target=3D"_blank">tomer.maimon@nuvoton.com</a>&gt;&qu=
ot;);<br>
&gt; &gt; &gt; +MODULE_LICENSE(&quot;GPL v2&quot;);=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 <br>
&gt; Thanks,<br>
&gt; <br>
&gt; Tomer<br>
<br>
</blockquote></div>

--00000000000098947805808265fa--
