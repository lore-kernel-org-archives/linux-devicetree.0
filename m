Return-Path: <SRS0=0emD=ZR=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170203163605.GB30336@linaro.org>
References: <1486116655-24111-1-git-send-email-baoyou.xie@linaro.org>
 <1486116655-24111-3-git-send-email-baoyou.xie@linaro.org> <20170203163605.GB30336@linaro.org>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Sat, 4 Feb 2017 08:51:50 +0800
Message-ID: <CA+DQWkzi3PmkUs1pZBCFOdFxaRDJw+4Z4Ms5ApEiavJ6KXeCgw@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] thermal: zx2967: add thermal driver for ZTE's
 zx2967 family
Content-Type: multipart/alternative; boundary=001a11445d94c2b7b60547a9cd6f
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Jun Nie <jun.nie@linaro.org>, rui.zhang@intel.com, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-pm@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--001a11445d94c2b7b60547a9cd6f
Content-Type: text/plain; charset=UTF-8

On 4 February 2017 at 00:36, Mathieu Poirier <mathieu.poirier@linaro.org>
wrote:

> On Fri, Feb 03, 2017 at 06:10:55PM +0800, Baoyou Xie wrote:
> > This patch adds thermal driver for ZTE's zx2967 family.
> >
> > Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> > ---
> >  drivers/thermal/Kconfig          |   8 ++
> >  drivers/thermal/Makefile         |   1 +
> >  drivers/thermal/zx2967_thermal.c | 281 ++++++++++++++++++++++++++++++
> +++++++++
> >  3 files changed, 290 insertions(+)
> >  create mode 100644 drivers/thermal/zx2967_thermal.c
> >
> > diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> > index 18f2de6..f64bd50 100644
> > --- a/drivers/thermal/Kconfig
> > +++ b/drivers/thermal/Kconfig
> > @@ -444,4 +444,12 @@ config BCM2835_THERMAL
> >       help
> >         Support for thermal sensors on Broadcom bcm2835 SoCs.
> >
> > +config ZX2967_THERMAL
> > +     tristate "Thermal sensors on zx2967 SoC"
> > +     depends on ARCH_ZX || COMPILE_TEST
> > +     help
> > +       Enable the zx2967 thermal sensors driver, which supports
> > +       the primitive temperature sensor embedded in zx2967 SoCs.
> > +       This sensor generates the real time die temperature.
> > +
> >  endif
> > diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
> > index 677c6d9..c00c05e 100644
> > --- a/drivers/thermal/Makefile
> > +++ b/drivers/thermal/Makefile
> > @@ -57,3 +57,4 @@ obj-$(CONFIG_HISI_THERMAL)     += hisi_thermal.o
> >  obj-$(CONFIG_MTK_THERMAL)    += mtk_thermal.o
> >  obj-$(CONFIG_GENERIC_ADC_THERMAL)    += thermal-generic-adc.o
> >  obj-$(CONFIG_BCM2835_THERMAL)        += bcm2835_thermal.o
> > +obj-$(CONFIG_ZX2967_THERMAL) += zx2967_thermal.o
> > diff --git a/drivers/thermal/zx2967_thermal.c
> b/drivers/thermal/zx2967_thermal.c
> > new file mode 100644
> > index 0000000..fba55b1c
> > --- /dev/null
> > +++ b/drivers/thermal/zx2967_thermal.c
> > @@ -0,0 +1,281 @@
> > +/*
> > + * ZTE's zx2967 family thermal sensor driver
> > + *
> > + * Copyright (C) 2017 ZTE Ltd.
> > + *
> > + * Author: Baoyou Xie <baoyou.xie@linaro.org>
> > + *
> > + * License terms: GNU General Public License (GPL) version 2
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/thermal.h>
> > +
> > +/* Power Mode: 0->low 1->high */
> > +#define ZX2967_THERMAL_POWER_MODE    0
> > +#define ZX2967_POWER_MODE_LOW                0
> > +#define ZX2967_POWER_MODE_HIGH               1
> > +
> > +/* DCF Control Register */
> > +#define ZX2967_THERMAL_DCF           0x4
> > +#define ZX2967_DCF_EN                        BIT(1)
> > +#define ZX2967_DCF_FREEZE            BIT(0)
> > +
> > +/* Selection Register */
> > +#define ZX2967_THERMAL_SEL           0x8
> > +
> > +/* Control Register */
> > +#define ZX2967_THERMAL_CTRL          0x10
> > +
> > +#define ZX2967_THERMAL_READY         BIT(12)
> > +#define ZX2967_THERMAL_TEMP_MASK     0xfff
> > +#define ZX2967_THERMAL_ID_MASK               0x18
> > +#define ZX2967_THERMAL_ID0           0x10
> > +#define ZX2967_THERMAL_ID1           0x8
> > +
> > +#define ZX2967_GET_TEMP_TIMEOUT_US   (100 * 1024)
> > +
> > +struct zx2967_thermal_sensor {
> > +     struct zx2967_thermal_priv *priv;
> > +     struct thermal_zone_device *tzd;
> > +     int id;
> > +};
> > +
> > +/*
> > + * Now, one sensor remains in system, but in fact, we intend to support
> > + * two sensors.
> > + */
>
> The general rule of thumb is to write drivers for the current HW and add
> enhancement when new revision come out but I will let Zhang and Eduardo
> make the call.
>
> > +#define NUM_SENSORS  1
> > +
> > +struct zx2967_thermal_priv {
> > +     struct zx2967_thermal_sensor    sensors[NUM_SENSORS];
> > +     /* Prevents reads sensor in parallel */
> > +     struct mutex                    lock;
> > +     struct clk                      *clk_gate;
> > +     struct clk                      *pclk;
> > +     void __iomem                    *regs;
> > +     struct device                   *dev;
> > +};
>
> Normally all new structure need to use the proper comment style [1] (as
> noted in my
> previous email) but this one is pretty obvious and private to this file.
> Again
> I'll let Zhang and Eduardo decide what they want to do here.
>
> [1]. http://lxr.free-electrons.com/source/Documentation/CodingStyle
>
> > +
> > +#ifdef CONFIG_PM_SLEEP
> > +static int zx2967_thermal_suspend(struct device *dev)
> > +{
> > +     struct platform_device *pdev = to_platform_device(dev);
> > +     struct zx2967_thermal_priv *priv = platform_get_drvdata(pdev);
> > +
> > +     if (priv && priv->pclk)
> > +             clk_disable_unprepare(priv->pclk);
> > +
> > +     if (priv && priv->clk_gate)
> > +             clk_disable_unprepare(priv->clk_gate);
> > +
> > +     return 0;
> > +}
> > +
> > +static int zx2967_thermal_resume(struct device *dev)
> > +{
> > +     struct platform_device *pdev = to_platform_device(dev);
> > +     struct zx2967_thermal_priv *priv = platform_get_drvdata(pdev);
> > +     int error;
> > +
> > +     error = clk_prepare_enable(priv->clk_gate);
> > +     if (error)
> > +             return error;
> > +
> > +     error = clk_prepare_enable(priv->pclk);
> > +     if (error) {
> > +             clk_disable_unprepare(priv->clk_gate);
> > +             return error;
> > +     }
> > +
> > +     return 0;
> > +}
> > +static SIMPLE_DEV_PM_OPS(zx2967_thermal_pm_ops,
> > +                      zx2967_thermal_suspend, zx2967_thermal_resume);
>
> The pm_runtime macros are built in such a way that the call to
> SIMPLE_DEV_PM_OPS
> itself doesn't have to be enclosed in the #if/#endif.  That way you don't
> have
> to add the #if/#endif in the platform driver definition.
>
> > +#endif
> > +
> > +static int zx2967_thermal_get_temp(void *data, int *temp)
> > +{
> > +     void __iomem *regs;
> > +     struct zx2967_thermal_sensor *sensor = data;
> > +     struct zx2967_thermal_priv *priv = sensor->priv;
> > +     u32 val, sel_id;
> > +     int ret;
> > +
> > +     if (!sensor->tzd)
> > +             return -EAGAIN;
> > +
> > +     regs = priv->regs;
> > +     mutex_lock(&priv->lock);
> > +     writel_relaxed(ZX2967_POWER_MODE_LOW,
> > +                    regs + ZX2967_THERMAL_POWER_MODE);
> > +     writel_relaxed(ZX2967_DCF_EN, regs + ZX2967_THERMAL_DCF);
> > +
> > +     val = readl_relaxed(regs + ZX2967_THERMAL_SEL);
> > +     val &= ~ZX2967_THERMAL_ID_MASK;
> > +     sel_id = sensor->id ? ZX2967_THERMAL_ID1 : ZX2967_THERMAL_ID0;
> > +     val |= sel_id;
> > +     writel_relaxed(val, regs + ZX2967_THERMAL_SEL);
> > +
> > +     usleep_range(100, 300);
>
> You have not addressed my comment from the previous review, something that
> affects my motivation to keep reviewing your work and help you get your
> code
> upstream.
>
>
Hi, Mathieu.

Thanks for your patience. Some wrongs attribute to my pure English :)

Here, we need some comments and I will append the comments in next patch.

if condition of "val & ZX2967_THERMAL_READY" is true at first run of
readx_poll_timeout() call,  readx_poll_timeout() call never sleep. in this
case, the temp value we got has a few deviation. In other words, it's a
requirement from hardware.

And other suggests are accepted, and they will be fixed in next patch.

> +     ret = readx_poll_timeout(readl, regs + ZX2967_THERMAL_CTRL,
> > +                              val, val & ZX2967_THERMAL_READY, 300,
> > +                              ZX2967_GET_TEMP_TIMEOUT_US);
> > +     if (ret) {
> > +             dev_err(priv->dev, "Thermal sensor %d data timeout\n",
> > +                     sensor->id);
> > +             mutex_unlock(&priv->lock);
>
>                 goto out;
>
> > +             return ret;
> > +     }
> > +
> > +     writel_relaxed(ZX2967_DCF_FREEZE | ZX2967_DCF_EN,
> > +                    regs + ZX2967_THERMAL_DCF);
> > +     val = readl_relaxed(regs + ZX2967_THERMAL_CTRL)
> > +                      & ZX2967_THERMAL_TEMP_MASK;
> > +     writel_relaxed(ZX2967_POWER_MODE_HIGH,
> > +                    regs + ZX2967_THERMAL_POWER_MODE);
> > +
> > +     /*
> > +      * Calculate temperature
> > +      * In dts, coefficients are multiplied by 1000.
> > +      */
> > +     *temp = DIV_ROUND_CLOSEST(((s32)val + sensor->tzd->tzp->offset) *
> 1000,
> > +                               sensor->tzd->tzp->slope);
> >
>
> out:
>
> > +     mutex_unlock(&priv->lock);
> > +
> > +     return 0;
>
>         return ret;
>
> > +}
> > +
> > +static struct thermal_zone_of_device_ops zx2967_of_thermal_ops = {
> > +     .get_temp = zx2967_thermal_get_temp,
> > +};
> > +
> > +static int zx2967_thermal_probe(struct platform_device *pdev)
> > +{
> > +     struct zx2967_thermal_priv *priv;
> > +     struct resource *res;
> > +     int ret, i;
> > +
> > +     priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     priv->regs = devm_ioremap_resource(&pdev->dev, res);
> > +     if (IS_ERR(priv->regs))
> > +             return PTR_ERR(priv->regs);
> > +
> > +     priv->clk_gate = devm_clk_get(&pdev->dev, "gate");
> > +     if (IS_ERR(priv->clk_gate)) {
> > +             ret = PTR_ERR(priv->clk_gate);
> > +             dev_err(&pdev->dev, "failed to get clock gate: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ret = clk_prepare_enable(priv->clk_gate);
> > +     if (ret) {
> > +             dev_err(&pdev->dev, "failed to enable converter clock:
> %d\n",
> > +                     ret);
> > +             return ret;
> > +     }
> > +
> > +     priv->pclk = devm_clk_get(&pdev->dev, "pclk");
> > +     if (IS_ERR(priv->pclk)) {
> > +             ret = PTR_ERR(priv->pclk);
> > +             dev_err(&pdev->dev, "failed to get apb clock: %d\n", ret);
> > +             goto disable_clk_gate;
> > +     }
> > +
> > +     ret = clk_prepare_enable(priv->pclk);
> > +     if (ret) {
> > +             dev_err(&pdev->dev, "failed to enable converter clock:
> %d\n",
> > +                     ret);
> > +             goto disable_clk_gate;
> > +     }
> > +
> > +     mutex_init(&priv->lock);
> > +     for (i = 0; i < NUM_SENSORS; i++) {
> > +             struct zx2967_thermal_sensor *sensor = &priv->sensors[i];
> > +
> > +             sensor->priv = priv;
> > +             sensor->id = i;
> > +             sensor->tzd = thermal_zone_of_sensor_register(&pdev->dev,
> > +                                     i, sensor, &zx2967_of_thermal_ops);
> > +
> > +             if (IS_ERR(sensor->tzd)) {
> > +                     ret = PTR_ERR(sensor->tzd);
> > +                     dev_err(&pdev->dev, "failed to register sensor %d:
> %d\n",
> > +                             i, ret);
> > +                     goto remove_ts;
> > +             }
> > +
> > +             if (sensor->tzd->tzp->slope == 0) {
> > +                     thermal_zone_of_sensor_unregister(&pdev->dev,
> > +                                                     sensor->tzd);
> > +                     dev_err(&pdev->dev,
> > +                             "coefficients of sensor-%d is invalid\n",
> i);
> > +                     ret = -EINVAL;
> > +                     goto remove_ts;
> > +             }
> > +     }
> > +     priv->dev = &pdev->dev;
> > +     platform_set_drvdata(pdev, priv);
> > +
> > +     return 0;
> > +
> > +remove_ts:
> > +     for (i--; i >= 0; i--)
> > +             thermal_zone_of_sensor_unregister(&pdev->dev,
> > +                                               priv->sensors[i].tzd);
> > +     clk_disable_unprepare(priv->pclk);
> > +disable_clk_gate:
> > +     clk_disable_unprepare(priv->clk_gate);
> > +
> > +     return ret;
> > +}
> > +
> > +static int zx2967_thermal_exit(struct platform_device *pdev)
> > +{
> > +     struct zx2967_thermal_priv *priv = platform_get_drvdata(pdev);
> > +     int i;
> > +
> > +     for (i = 0; i < NUM_SENSORS; i++) {
> > +             struct zx2967_thermal_sensor *sensor = &priv->sensors[i];
> > +
> > +             thermal_zone_of_sensor_unregister(&pdev->dev,
> sensor->tzd);
> > +     }
> > +     clk_disable_unprepare(priv->pclk);
> > +     clk_disable_unprepare(priv->clk_gate);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id zx2967_thermal_id_table[] = {
> > +     { .compatible = "zte,zx296718-thermal" },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, zx2967_thermal_id_table);
> > +
> > +static struct platform_driver zx2967_thermal_driver = {
> > +     .probe = zx2967_thermal_probe,
> > +     .remove = zx2967_thermal_exit,
> > +     .driver = {
> > +             .name = "zx2967_thermal",
> > +             .of_match_table = zx2967_thermal_id_table,
> > +#ifdef CONFIG_PM_SLEEP
> > +             .pm = &zx2967_thermal_pm_ops,
> > +#endif
> > +     },
> > +};
> > +module_platform_driver(zx2967_thermal_driver);
> > +
> > +MODULE_AUTHOR("Baoyou Xie <baoyou.xie@linaro.org>");
> > +MODULE_DESCRIPTION("ZTE zx2967 thermal driver");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.7.4
> >
>

--001a11445d94c2b7b60547a9cd6f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 4 February 2017 at 00:36, Mathieu Poirier <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:mathieu.poirier@linaro.org" target=3D"_blank">mathieu.poirier=
@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div class=3D"gmail-m_-6557877926434265908HOEnZb"><div class=3D=
"gmail-m_-6557877926434265908h5">On Fri, Feb 03, 2017 at 06:10:55PM +0800, =
Baoyou Xie wrote:<br>
&gt; This patch adds thermal driver for ZTE&#39;s zx2967 family.<br>
&gt;<br>
&gt; Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org"=
 target=3D"_blank">baoyou.xie@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/thermal/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A08 ++<br>
&gt;=C2=A0 drivers/thermal/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/thermal/zx2967_thermal<wbr>.c | 281 ++++++++++++++++++++=
++++++++++<wbr>+++++++++<br>
&gt;=C2=A0 3 files changed, 290 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/thermal/zx2967_thermal<wbr>.c<br>
&gt;<br>
&gt; diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig<br>
&gt; index 18f2de6..f64bd50 100644<br>
&gt; --- a/drivers/thermal/Kconfig<br>
&gt; +++ b/drivers/thermal/Kconfig<br>
&gt; @@ -444,4 +444,12 @@ config BCM2835_THERMAL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Support for thermal sensors on Broadc=
om bcm2835 SoCs.<br>
&gt;<br>
&gt; +config ZX2967_THERMAL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;Thermal sensors on zx2967 SoC&quot=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on ARCH_ZX || COMPILE_TEST<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Enable the zx2967 thermal sensors driver, =
which supports<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0the primitive temperature sensor embedded =
in zx2967 SoCs.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0This sensor generates the real time die te=
mperature.<br>
&gt; +<br>
&gt;=C2=A0 endif<br>
&gt; diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile<br>
&gt; index 677c6d9..c00c05e 100644<br>
&gt; --- a/drivers/thermal/Makefile<br>
&gt; +++ b/drivers/thermal/Makefile<br>
&gt; @@ -57,3 +57,4 @@ obj-$(CONFIG_HISI_THERMAL)=C2=A0 =C2=A0 =C2=A0+=3D h=
isi_thermal.o<br>
&gt;=C2=A0 obj-$(CONFIG_MTK_THERMAL)=C2=A0 =C2=A0 +=3D mtk_thermal.o<br>
&gt;=C2=A0 obj-$(CONFIG_GENERIC_ADC_THERM<wbr>AL)=C2=A0 =C2=A0 +=3D thermal=
-generic-adc.o<br>
&gt;=C2=A0 obj-$(CONFIG_BCM2835_THERMAL)=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D bc=
m2835_thermal.o<br>
&gt; +obj-$(CONFIG_ZX2967_THERMAL) +=3D zx2967_thermal.o<br>
&gt; diff --git a/drivers/thermal/zx2967_therm<wbr>al.c b/drivers/thermal/z=
x2967_therm<wbr>al.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..fba55b1c<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/thermal/zx2967_therm<wbr>al.c<br>
&gt; @@ -0,0 +1,281 @@<br>
&gt; +/*<br>
&gt; + * ZTE&#39;s zx2967 family thermal sensor driver<br>
&gt; + *<br>
&gt; + * Copyright (C) 2017 ZTE Ltd.<br>
&gt; + *<br>
&gt; + * Author: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org" ta=
rget=3D"_blank">baoyou.xie@linaro.org</a>&gt;<br>
&gt; + *<br>
&gt; + * License terms: GNU General Public License (GPL) version 2<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/clk.h&gt;<br>
&gt; +#include &lt;linux/delay.h&gt;<br>
&gt; +#include &lt;linux/device.h&gt;<br>
&gt; +#include &lt;linux/err.h&gt;<br>
&gt; +#include &lt;linux/iopoll.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +#include &lt;linux/thermal.h&gt;<br>
&gt; +<br>
&gt; +/* Power Mode: 0-&gt;low 1-&gt;high */<br>
&gt; +#define ZX2967_THERMAL_POWER_MODE=C2=A0 =C2=A0 0<br>
&gt; +#define ZX2967_POWER_MODE_LOW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0<br>
&gt; +#define ZX2967_POWER_MODE_HIGH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A01<br>
&gt; +<br>
&gt; +/* DCF Control Register */<br>
&gt; +#define ZX2967_THERMAL_DCF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
4<br>
&gt; +#define ZX2967_DCF_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(1)<br>
&gt; +#define ZX2967_DCF_FREEZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BI=
T(0)<br>
&gt; +<br>
&gt; +/* Selection Register */<br>
&gt; +#define ZX2967_THERMAL_SEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
8<br>
&gt; +<br>
&gt; +/* Control Register */<br>
&gt; +#define ZX2967_THERMAL_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x10<br=
>
&gt; +<br>
&gt; +#define ZX2967_THERMAL_READY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(12)=
<br>
&gt; +#define ZX2967_THERMAL_TEMP_MASK=C2=A0 =C2=A0 =C2=A00xfff<br>
&gt; +#define ZX2967_THERMAL_ID_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x18<br>
&gt; +#define ZX2967_THERMAL_ID0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
10<br>
&gt; +#define ZX2967_THERMAL_ID1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
8<br>
&gt; +<br>
&gt; +#define ZX2967_GET_TEMP_TIMEOUT_US=C2=A0 =C2=A0(100 * 1024)<br>
&gt; +<br>
&gt; +struct zx2967_thermal_sensor {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_priv *priv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct thermal_zone_device *tzd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int id;<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Now, one sensor remains in system, but in fact, we intend to suppo=
rt<br>
&gt; + * two sensors.<br>
&gt; + */<br>
<br>
</div></div>The general rule of thumb is to write drivers for the current H=
W and add<br>
enhancement when new revision come out but I will let Zhang and Eduardo<br>
make the call.<br>
<span><br>
&gt; +#define NUM_SENSORS=C2=A0 1<br>
&gt; +<br>
&gt; +struct zx2967_thermal_priv {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_sensor=C2=A0 =C2=A0 sensors=
[NUM_SENSORS];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Prevents reads sensor in parallel */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mutex=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct clk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *clk_gate;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct clk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pclk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void __iomem=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *regs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*dev;<br>
&gt; +};<br>
<br>
</span>Normally all new structure need to use the proper comment style [1] =
(as noted in my<br>
previous email) but this one is pretty obvious and private to this file.=C2=
=A0 Again<br>
I&#39;ll let Zhang and Eduardo decide what they want to do here.<br>
<br>
[1]. <a href=3D"http://lxr.free-electrons.com/source/Documentation/CodingSt=
yle" rel=3D"noreferrer" target=3D"_blank">http://lxr.free-electrons.com/<wb=
r>source/Documentation/CodingSty<wbr>le</a><br>
<div><div class=3D"gmail-m_-6557877926434265908h5"><br>
&gt; +<br>
&gt; +#ifdef CONFIG_PM_SLEEP<br>
&gt; +static int zx2967_thermal_suspend(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D to_platform_devi=
ce(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_priv *priv =3D platform_get=
_drvdata(pdev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (priv &amp;&amp; priv-&gt;pclk)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare=
(priv-&gt;p<wbr>clk);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (priv &amp;&amp; priv-&gt;clk_gate)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare=
(priv-&gt;c<wbr>lk_gate);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int zx2967_thermal_resume(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D to_platform_devi=
ce(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_priv *priv =3D platform_get=
_drvdata(pdev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D clk_prepare_enable(priv-&gt;clk_g<wbr>a=
te);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D clk_prepare_enable(priv-&gt;pclk)<wbr>;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare=
(priv-&gt;c<wbr>lk_gate);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +static SIMPLE_DEV_PM_OPS(zx2967_therm<wbr>al_pm_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 zx2967_thermal_suspend, zx2967_thermal_resume);<br>
<br>
</div></div>The pm_runtime macros are built in such a way that the call to =
SIMPLE_DEV_PM_OPS<br>
itself doesn&#39;t have to be enclosed in the #if/#endif.=C2=A0 That way yo=
u don&#39;t have<br>
to add the #if/#endif in the platform driver definition.<br>
<div><div class=3D"gmail-m_-6557877926434265908h5"><br>
&gt; +#endif<br>
&gt; +<br>
&gt; +static int zx2967_thermal_get_temp(void *data, int *temp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *regs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_sensor *sensor =3D data;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_priv *priv =3D sensor-&gt;p=
riv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 val, sel_id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!sensor-&gt;tzd)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EAGAIN;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regs =3D priv-&gt;regs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;priv-&gt;lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(ZX2967_POWER_M<wbr>ODE_LOW,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 regs + ZX2967_THERMAL_POWER_MODE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(ZX2967_DCF_EN, regs + ZX2967_THERM=
AL_DCF);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val =3D readl_relaxed(regs + ZX2967_THERMAL_SEL);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val &amp;=3D ~ZX2967_THERMAL_ID_MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sel_id =3D sensor-&gt;id ? ZX2967_THERMAL_ID1 : Z=
X2967_THERMAL_ID0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val |=3D sel_id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(val, regs + ZX2967_THERMAL_SEL);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(100, 300);<br>
<br>
</div></div>You have not addressed my comment from the previous review, som=
ething that<br>
affects my motivation to keep reviewing your work and help you get your cod=
e<br>
upstream.<br>
<span><br></span></blockquote><div><br></div><div>Hi, Mathieu. <br><br></di=
v><div>Thanks for your patience. Some wrongs attribute to my pure English :=
)<br></div><div><br></div><div>Here, we need some comments and I will appen=
d the comments in next patch.<br><br><span>if condition of &quot;</span><sp=
an><span>val &amp; ZX2967_THERMAL_READY</span>&quot; is true at first run o=
f readx_poll_timeout() call,=C2=A0 </span><span><span>readx_poll_timeout() =
call </span>never sleep. in this case, the temp value we got has a few devi=
ation. In other words, it&#39;s a requirement from hardware.<br></span></di=
v><div>=C2=A0<br></div><div>And other suggests are accepted, and they will =
be fixed in next patch.<br><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><span>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D readx_poll_timeout(readl, regs + ZX2967_T=
HERMAL_CTRL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val, val &amp; ZX2967_THERMAL_READY, 30=
0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ZX2967_GET_TEMP_TIMEOUT_US);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(priv-&gt;dev,=
 &quot;Thermal sensor %d data timeout\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0sensor-&gt;id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;pri=
v-&gt;lock);<br>
<br>
</span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br=
>
<span><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(ZX2967_DCF_FRE<wbr>EZE | ZX2967_DC=
F_EN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 regs + ZX2967_THERMAL_DCF);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val =3D readl_relaxed(regs + ZX2967_THERMAL_CTRL)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &amp; ZX2967_THERMAL_TEMP_MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(ZX2967_POWER_M<wbr>ODE_HIGH,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 regs + ZX2967_THERMAL_POWER_MODE);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Calculate temperature<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * In dts, coefficients are multiplied by 1000.<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*temp =3D DIV_ROUND_CLOSEST(((s32)val + sensor-&g=
t;tzd-&gt;tzp-&gt;offset) * 1000,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-&gt;tzd-&gt;tzp-&gt;slope)=
;<br>
&gt;<br>
<br>
</span>out:<br>
<span class=3D"gmail-m_-6557877926434265908im gmail-m_-6557877926434265908H=
OEnZb"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;priv-&gt;lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
<br>
</span><div class=3D"gmail-m_-6557877926434265908HOEnZb"><div class=3D"gmai=
l-m_-6557877926434265908h5">=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct thermal_zone_of_device_ops zx2967_of_thermal_ops =3D {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0.get_temp =3D zx2967_thermal_get_temp,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int zx2967_thermal_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_priv *priv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret, i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(*=
priv), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!priv)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESOURCE_ME=
M, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;regs =3D devm_ioremap_resource(&amp;pdev=
-&gt;d<wbr>ev, res);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;regs))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(priv-&=
gt;regs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;clk_gate =3D devm_clk_get(&amp;pdev-&gt;=
dev, &quot;gate&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;clk_gate)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(priv-=
&gt;clk_gate);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;failed to get clock gate: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(priv-&gt;clk_g<wbr>ate=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;failed to enable converter clock: %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;pclk =3D devm_clk_get(&amp;pdev-&gt;dev,=
 &quot;pclk&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;pclk)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(priv-=
&gt;pclk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;failed to get apb clock: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto disable_clk_gate=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(priv-&gt;pclk)<wbr>;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;failed to enable converter clock: %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto disable_clk_gate=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_init(&amp;priv-&gt;lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; NUM_SENSORS; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_thermal=
_sensor *sensor =3D &amp;priv-&gt;sensors[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-&gt;priv =3D p=
riv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-&gt;id =3D i;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-&gt;tzd =3D th=
ermal_zone_of_sensor_registe<wbr>r(&amp;pdev-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, sensor, &=
amp;zx2967_of_thermal_ops);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(sensor-&gt=
;tzd)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D PTR_ERR(sensor-&gt;tzd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;pdev-&gt;dev, &quot;failed to register sensor %d: %d\n&=
quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto remove_ts;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sensor-&gt;tzd-&g=
t;tzp-&gt;slope =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0thermal_zone_of_sensor_unregi<wbr>ster(&amp;pdev-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-&gt;tzd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;pdev-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;coefficients of sensor-%d is inval=
id\n&quot;, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto remove_ts;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;dev =3D &amp;pdev-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, priv);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +remove_ts:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i--; i &gt;=3D 0; i--)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thermal_zone_of_senso=
r_unregi<wbr>ster(&amp;pdev-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;sensors[i].tzd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(priv-&gt;p<wbr>clk);<br>
&gt; +disable_clk_gate:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(priv-&gt;c<wbr>lk_gate);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int zx2967_thermal_exit(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_priv *priv =3D platform_get=
_drvdata(pdev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; NUM_SENSORS; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_thermal=
_sensor *sensor =3D &amp;priv-&gt;sensors[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thermal_zone_of_senso=
r_unregi<wbr>ster(&amp;pdev-&gt;dev, sensor-&gt;tzd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(priv-&gt;p<wbr>clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(priv-&gt;c<wbr>lk_gate);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id zx2967_thermal_id_table[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;zte,zx296718-thermal&quot=
; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{}<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, zx2967_thermal_id_table);<br>
&gt; +<br>
&gt; +static struct platform_driver zx2967_thermal_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe =3D zx2967_thermal_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove =3D zx2967_thermal_exit,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;zx296=
7_thermal&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D z=
x2967_thermal_id_table,<br>
&gt; +#ifdef CONFIG_PM_SLEEP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pm =3D &amp;zx2967_t=
hermal_pm_ops,<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +module_platform_driver(zx2967<wbr>_thermal_driver);<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linar=
o.org" target=3D"_blank">baoyou.xie@linaro.org</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;ZTE zx2967 thermal driver&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a11445d94c2b7b60547a9cd6f--
