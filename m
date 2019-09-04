From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Date: Wed, 4 Sep 2019 17:33:25 +0300
Message-ID: <CAHp75VcV_tFNMm=oRNVBtwn8orQGuokSgT6YDzNVpQ0vXw_Yag@mail.gmail.com>
References: <20190708100641.2702-1-dongchun.zhu@mediatek.com>
 <20190708100641.2702-3-dongchun.zhu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190708100641.2702-3-dongchun.zhu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dongchun.zhu@mediatek.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, srv_heupstream@mediatek.com, shengnan.wang@mediatek.com, Tomasz Figa <tfiga@chromium.org>, louis.kuo@mediatek.com, sj.huang@mediatek.com, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, bingbu.cao@intel.com, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 8, 2019 at 5:13 PM <dongchun.zhu@mediatek.com> wrote:
>
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
>
> This patch adds a V4L2 sub-device driver for DW9768 lens voice coil,
> and provides control to set the desired focus.
>
> The DW9807 is a 10 bit DAC from Dongwoon, designed for linear
> control of voice coil motor.

> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + */

2019?

> +       if (!client->adapter)
> +               return -ENODEV;

Is it ever possible?

> +       w_buf = kzalloc(size, GFP_KERNEL);
> +       if (!w_buf)
> +               return -1;

Error code?

> +       do {
> +               ret = i2c_transfer(client->adapter, &msg, 1);

> +               if (ret != 1)
> +                       dev_err(&client->dev, "write fail, ret:%d, retry:%d\n",
> +                               ret, retry_cnt);

This is noise. And better to use positive condition.

> +               else
> +                       break;

> +               retry_cnt--;
> +       } while (retry_cnt != 0);
> +

} while (--retry_cnt);

> +       if (retry_cnt == 0)     {
> +               dev_err(&client->dev, "i2c write fail(%d)\n", ret);
> +               return -EIO;
> +       }

> +
> +       kfree(w_buf);
> +
> +       return 0;
> +}

> +static int dw9768_power_off(struct dw9768_device *dw9768_dev, bool standby)
> +{
> +       struct i2c_client *client = v4l2_get_subdevdata(&dw9768_dev->sd);
> +       int ret;
> +
> +       /*
> +        * Go to standby first as real power off my be denied by the hardware
> +        * (single power line control for both dw9768_dev and sensor).
> +        */
> +       if (standby) {
> +               dw9768_dev->standby = true;
> +               ret = dw9768_release(dw9768_dev);

> +               if (ret)

> +                       dev_err(&client->dev, "dw9768_release failed!\n");

Is it fatal or not?

> +       }

> +       ret = regulator_disable(dw9768_dev->analog_regulator);
> +       if (ret)
> +               return ret;
> +
> +       return 0;

return regulator_disable(...);

> +}

> +               dev_err(dw9768_dev->sd.dev, "%s fail error: 0x%x\n",
> +                       __func__, hdl->error);

Non-informative message.

> +static int dw9768_probe(struct i2c_client *client)
> +{
> +       struct device *dev = &client->dev;
> +       struct dw9768_device *dw9768_dev;
> +       int rval;
> +
> +       dw9768_dev = devm_kzalloc(&client->dev, sizeof(*dw9768_dev),
> +                                 GFP_KERNEL);
> +       if (!dw9768_dev)
> +               return -ENOMEM;
> +
> +       dw9768_dev->analog_regulator = devm_regulator_get(dev, "afvdd");
> +       if (IS_ERR(dw9768_dev->analog_regulator)) {

> +               dev_err(dev, "cannot get analog regulator\n");

Would be noise in case of deferred probe.

> +               return PTR_ERR(dw9768_dev->analog_regulator);
> +       }

> +err_cleanup:
> +       mutex_destroy(&dw9768_dev->power_lock);
> +       dw9768_subdev_cleanup(dw9768_dev);

> +       dev_err(dev, "Probe failed: %d\n", rval);

Noise. Device core has this already.

> +       return rval;
> +}

> +static const struct i2c_device_id dw9768_id_table[] = {
> +       { DW9768_NAME, 0 },
> +       { { 0 } }

{} is enough.

> +};
> +MODULE_DEVICE_TABLE(i2c, dw9768_id_table);
> +
> +static const struct of_device_id dw9768_of_table[] = {
> +       { .compatible = "dongwoon,dw9768" },

> +       { { 0 } }

Ditto.

> +};

-- 
With Best Regards,
Andy Shevchenko
