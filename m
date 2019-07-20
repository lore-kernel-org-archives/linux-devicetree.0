From: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v1 2/2] auxadc: mediatek: support efuse calibration in
 auxadc driver
Date: Sat, 20 Jul 2019 22:13:51 +0800
Message-ID: <CANMq1KBzLjshQGqfULdPFbzzYxMx2+T+Ku6B4j0QoFRhgsP_nw@mail.gmail.com>
References: <20190718080119.30707-1-zhiyong.tao@mediatek.com> <20190718080119.30707-3-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718080119.30707-3-zhiyong.tao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, jic23@kernel.org, knaack.h@gmx.de, Lars-Peter Clausen <lars@metafoo.de>, pmeerw@pmeerw.net, srv_heupstream <srv_heupstream@mediatek.com>, hui.liu@mediatek.com, jg_poxu@mediatek.com, sj.huang@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Erin Lo <erin.lo@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-iio@vger.kernel.org, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2019 at 4:01 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> This patch support efuse calibration in auxadc driver
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> Signed-off-by: jg_poxu <jg_poxu@mediatek.com>
> ---
>  drivers/iio/adc/mt6577_auxadc.c | 71 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>
> diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> index 95d76abb64ec..e30d9736b1a5 100644
> --- a/drivers/iio/adc/mt6577_auxadc.c
> +++ b/drivers/iio/adc/mt6577_auxadc.c
> @@ -17,12 +17,14 @@
>  #include <linux/err.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/nvmem-consumer.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/iopoll.h>
>  #include <linux/io.h>
>  #include <linux/iio/iio.h>
> +#include <linux/slab.h>
>
>  /* Register definitions */
>  #define MT6577_AUXADC_CON0                    0x00
> @@ -42,6 +44,13 @@
>  #define MT6577_AUXADC_POWER_READY_MS          1
>  #define MT6577_AUXADC_SAMPLE_READY_US         25
>
> +#define ADC_GE_A_SHIFT      10
> +#define ADC_GE_A_MASK       (0x3ff << ADC_GE_A_SHIFT)
> +#define ADC_OE_A_SHIFT      0
> +#define ADC_OE_A_MASK       (0x3ff << ADC_OE_A_SHIFT)
> +#define ADC_CALI_EN_A_SHIFT 20
> +#define ADC_CALI_EN_A_MASK  (0x1 << ADC_CALI_EN_A_SHIFT)
> +
>  struct mt6577_auxadc_device {
>         void __iomem *reg_base;
>         struct clk *adc_clk;
> @@ -74,6 +83,64 @@ static const struct iio_chan_spec mt6577_auxadc_iio_channels[] = {
>         MT6577_AUXADC_CHANNEL(15),
>  };
>
> +s32 cali_oe;
> +s32 cali_ge;

Why do you need these 2 (global) variables? They are set in
mt6577_auxadc_update_cali but never read anywhere.

> +struct adc_cali_info {
> +       u32 cali_ge_a;
> +       u32 cali_oe_a;
> +       u32 gain;
> +};
> +static struct adc_cali_info adc_cali;

This should be inside struct mt6577_auxadc_device structure. And... I
still do not understand what this does, since nothing reads back
adc_cali either...

On gerrit (https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1624410),
you mentioned that thermal module will use these, can you please
upload these changes as part of this series, so that we can review the
whole thing in one piece (and understand better how to fix this
interface).

> +
> +static int mt6577_auxadc_update_cali(struct device *dev)
> +{
> +       struct nvmem_cell *cell;
> +       u32 *buf;
> +       size_t len;
> +       int ret = 0;
> +
> +       cali_oe = 0;
> +       cali_ge = 0;
> +
> +       cell = nvmem_cell_get(dev, "calibration-data");
> +       if (IS_ERR(cell)) {
> +               if (PTR_ERR(cell) == -EPROBE_DEFER)
> +                       return PTR_ERR(cell);
> +               return 0;
> +       }
> +
> +       buf = (u32 *)nvmem_cell_read(cell, &len);

Cast is not necessary.

> +
> +       nvmem_cell_put(cell);
> +
> +       if (IS_ERR(buf))
> +               return PTR_ERR(buf);
> +
> +       if (len < sizeof(u32)) {
> +               dev_warn(dev, "invalid calibration data\n");
> +               ret = -EINVAL;
> +               goto out;
> +       }
> +
> +       if (((buf[0] & ADC_CALI_EN_A_MASK) >> ADC_CALI_EN_A_SHIFT) != 0) {
> +               adc_cali.cali_oe_a =
> +                       (buf[0] & ADC_OE_A_MASK) >> ADC_OE_A_SHIFT;
> +               adc_cali.cali_ge_a =
> +                       ((buf[0] & ADC_GE_A_MASK) >> ADC_GE_A_SHIFT);
> +
> +               cali_ge = adc_cali.cali_ge_a - 512;
> +               cali_oe = adc_cali.cali_oe_a - 512;
> +               adc_cali.gain = 1 + cali_ge;
> +       }  else {
> +               dev_info(dev, "Device not calibrated, using default calibration values\n");
> +       }
> +
> +out:
> +       kfree(buf);
> +
> +       return ret;
> +}
> +
>  static inline void mt6577_auxadc_mod_reg(void __iomem *reg,
>                                          u32 or_mask, u32 and_mask)
>  {
> @@ -274,6 +341,10 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
>                 goto err_power_off;
>         }
>
> +       ret = mt6577_auxadc_update_cali(&pdev->dev);
> +       if (ret)
> +               return ret;
> +
>         return 0;

Or just
return mt6577_auxadc_update_cali(&pdev->dev);

>
>  err_power_off:
> --
> 2.12.5
>
