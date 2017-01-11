Return-Path: <SRS0=vO4q=YZ=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170109030023.GK20956@dragon>
References: <1483767488-19778-1-git-send-email-baoyou.xie@linaro.org>
 <1483767488-19778-3-git-send-email-baoyou.xie@linaro.org> <20170109030023.GK20956@dragon>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Wed, 11 Jan 2017 17:46:06 +0800
Message-ID: <CA+DQWkzV+Uh9=mEQEEkQGNL4kvwRpNuc58rRx1KQRBwxeTHJ4g@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] thermal: zx2967: add thermal driver for ZTE's
 zx2967 family
Content-Type: multipart/alternative; boundary=001a114239ce50a2f80545ce7836
To: Shawn Guo <shawnguo@kernel.org>
Cc: rui.zhang@intel.com, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, Jun Nie <jun.nie@linaro.org>, Greg KH <gregkh@linuxfoundation.org>, davem@davemloft.net, geert+renesas@glider.be, akpm@linux-foundation.org, mchehab@kernel.org, Guenter Roeck <linux@roeck-us.net>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--001a114239ce50a2f80545ce7836
Content-Type: text/plain; charset=UTF-8

On 9 January 2017 at 11:00, Shawn Guo <shawnguo@kernel.org> wrote:

> On Sat, Jan 07, 2017 at 01:38:08PM +0800, Baoyou Xie wrote:
> > This patch adds thermal driver for ZTE's zx2967 family.
> >
> > Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> > ---
> >  drivers/thermal/Kconfig          |   6 +
> >  drivers/thermal/Makefile         |   1 +
> >  drivers/thermal/zx2967_thermal.c | 241 ++++++++++++++++++++++++++++++
> +++++++++
> >  3 files changed, 248 insertions(+)
> >  create mode 100644 drivers/thermal/zx2967_thermal.c
> >
> > diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> > index 18f2de6..0dd597e 100644
> > --- a/drivers/thermal/Kconfig
> > +++ b/drivers/thermal/Kconfig
> > @@ -445,3 +445,9 @@ config BCM2835_THERMAL
> >         Support for thermal sensors on Broadcom bcm2835 SoCs.
> >
> >  endif
> > +
> > +config ZX2967_THERMAL
> > +     tristate "Thermal sensors on zx2967 SoC"
> > +     depends on ARCH_ZX
> > +     help
> > +       Support for thermal sensors on ZTE zx2967 SoCs.
> > diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
> > index 677c6d9..c00c05e 100644
> > --- a/drivers/thermal/Makefile
> > +++ b/drivers/thermal/Makefile
> > @@ -57,3 +57,4 @@ obj-$(CONFIG_HISI_THERMAL)     += hisi_thermal.o
> >  obj-$(CONFIG_MTK_THERMAL)    += mtk_thermal.o
> >  obj-$(CONFIG_GENERIC_ADC_THERMAL)    += thermal-generic-adc.o
> >  obj-$(CONFIG_BCM2835_THERMAL)        += bcm2835_thermal.o
> > +obj-$(CONFIG_ZX2967_THERMAL) += zx2967_thermal.o
> > diff --git a/drivers/thermal/zx2967_thermal.c b/drivers/thermal/zx2967_
> thermal.c
> > new file mode 100644
> > index 0000000..1aef070
> > --- /dev/null
> > +++ b/drivers/thermal/zx2967_thermal.c
> > @@ -0,0 +1,241 @@
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
> > +#include <linux/module.h>
> > +#include <linux/device.h>
> > +#include <linux/io.h>
> > +#include <linux/err.h>
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/thermal.h>
> > +
> > +/* DCF Control Register */
> > +#define ZX2967_THERMAL_DCF           0x4
> > +
> > +/* Selection Register */
> > +#define ZX2967_THERMAL_SEL           0x8
> > +
> > +/* Control Register */
> > +#define ZX2967_THERMAL_CTRL          0x10
> > +
> > +#define ZX2967_THERMAL_ID_MASK               (0x18)
> > +
> > +struct zx2967_thermal_sensor {
> > +     struct zx2967_thermal_priv *priv;
> > +     struct thermal_zone_device *tzd;
> > +     int id;
> > +};
> > +
> > +#define NUM_SENSORS  1
> > +
> > +struct zx2967_thermal_priv {
> > +     struct zx2967_thermal_sensor    sensors[NUM_SENSORS];
>
> What's the point of defining an array with only one element?
>
> we might support 2 sensors in future, so I suggest to remain it.


> > +     struct mutex                    lock;
> > +     struct clk                      *clk_gate;
> > +     struct clk                      *pclk;
> > +     void __iomem                    *regs;
>
> > +     struct pinctrl                  *pinmux_dvi0_d3;
> > +     struct pinctrl                  *pinmux_dvi0_d4;
> > +     struct pinctrl                  *pinmux_dvi0_d5;
>
> These three pointers are not used.
>
> > +};
> > +
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
> > +     dev_info(dev, "suspended\n");
>
> Noisy message.
>
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
> > +     if (error)
> > +             return error;
>
> clk_disable_unprepare() should be called for priv->clk_gate before
> returning here.
>
> > +
> > +     dev_info(dev, "resumed\n");
> > +
> > +     return 0;
> > +}
> > +
> > +static int zx2967_thermal_get_temp(void *data, int *temp)
> > +{
> > +     void __iomem *regs;
> > +     struct zx2967_thermal_sensor *sensor = data;
> > +     struct zx2967_thermal_priv *priv = sensor->priv;
> > +     unsigned long timeout = jiffies + msecs_to_jiffies(100);
> > +     u32 val, sel_id;
> > +
> > +     regs = priv->regs;
> > +     mutex_lock(&priv->lock);
> > +
> > +     writel_relaxed(0, regs);
>
> I suggest we have a macro for register at offset 0 as well to improve
> the readability.
>
> > +     writel_relaxed(2, regs + ZX2967_THERMAL_DCF);
> > +
> > +     val = readl_relaxed(regs + ZX2967_THERMAL_SEL);
> > +     val &= ~ZX2967_THERMAL_ID_MASK;
> > +     sel_id = sensor->id ? 8 : 0x10;
> > +     val |= sel_id;
> > +     writel_relaxed(val, regs + ZX2967_THERMAL_SEL);
> > +
> > +     usleep_range(100, 300);
> > +     while (!(readl_relaxed(regs + ZX2967_THERMAL_CTRL) & 0x1000)) {
> > +             if (time_after(jiffies, timeout)) {
> > +                     pr_err("*** Thermal sensor %d data timeout\n",
> > +                           sensor->id);
>
> dev_err?  And drop "*** ".
>
> oh, we don't hold device reference here.


> > +                     mutex_unlock(&priv->lock);
> > +                     return -EIO;
>
> -ETIMEDOUT?
>
> > +             }
> > +     }
> > +
> > +     writel_relaxed(3, regs + ZX2967_THERMAL_DCF);
> > +     val = readl_relaxed(regs + ZX2967_THERMAL_CTRL) & 0xfff;
> > +     writel_relaxed(1, regs);
> > +
> > +     /** Calculate temperature */
> > +     *temp = DIV_ROUND_CLOSEST((val - 922) * 1000, 1951);
> > +
> > +     mutex_unlock(&priv->lock);
> > +
> > +     return 0;
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
> > +     priv->clk_gate = devm_clk_get(&pdev->dev, "tempsensor_gate");
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
> > +     priv->pclk = devm_clk_get(&pdev->dev, "tempsensor_pclk");
> > +     if (IS_ERR(priv->pclk)) {
> > +             ret = PTR_ERR(priv->pclk);
> > +             dev_err(&pdev->dev, "failed to get apb clock: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ret = clk_prepare_enable(priv->pclk);
> > +     if (ret) {
> > +             dev_err(&pdev->dev, "failed to enable converter clock:
> %d\n",
> > +                     ret);
> > +             return ret;
>
> The use count of enable and prepare on priv->clk_gate will be
> unbalanced.
>
> we called devm_clk_get, thus when it fails, the framework will happy to
release it.


> > +     }
> > +
> > +     mutex_init(&priv->lock);
> > +     for (i = 0; i < NUM_SENSORS; i++) {
> > +             struct zx2967_thermal_sensor *sensor = &priv->sensors[i];
> > +
> > +             sensor->priv = priv;
> > +             sensor->id = i;
> > +             sensor->tzd = thermal_zone_of_sensor_register(&pdev->dev,
> > +                                     i,
> > +                                     sensor,
> > +                                     &zx2967_of_thermal_ops);
> > +             if (IS_ERR(sensor->tzd)) {
> > +                     ret = PTR_ERR(sensor->tzd);
> > +                     dev_err(&pdev->dev, "failed to register sensor %d:
> %d\n",
> > +                             i, ret);
> > +                     goto remove_ts;
> > +             }
> > +     }
> > +     platform_set_drvdata(pdev, priv);
> > +
> > +     return 0;
> > +
> > +remove_ts:
> > +     for (i--; i >= 0; i--)
> > +             thermal_zone_of_sensor_unregister(&pdev->dev,
> > +                                               priv->sensors[i].tzd);
> > +
> > +     return ret;
>
> Unbalanced clk_prepare_enable(priv->pclk).
>
> Shawn
>
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
> > +     { .compatible = "zte,zx2967-thermal" },
> > +     { .compatible = "zte,zx296718-thermal" },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, zx2967_thermal_id_table);
> > +
> > +static SIMPLE_DEV_PM_OPS(zx2967_thermal_pm_ops,
> > +                      zx2967_thermal_suspend, zx2967_thermal_resume);
> > +
> > +static struct platform_driver zx2967_thermal_driver = {
> > +     .probe = zx2967_thermal_probe,
> > +     .remove = zx2967_thermal_exit,
> > +     .driver = {
> > +             .name = "zx2967_thermal",
> > +             .of_match_table = zx2967_thermal_id_table,
> > +             .pm = &zx2967_thermal_pm_ops,
> > +     },
> > +};
> > +module_platform_driver(zx2967_thermal_driver);
> > +
> > +MODULE_AUTHOR("Baoyou Xie <baoyou.xie@linaro.org>");
> > +MODULE_DESCRIPTION("ZTE zx2967 thermal driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.7.4
> >
>

--001a114239ce50a2f80545ce7836
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 9 January 2017 at 11:00, Shawn Guo <span dir=3D"ltr">&lt;<a href=3D"=
mailto:shawnguo@kernel.org" target=3D"_blank">shawnguo@kernel.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div clas=
s=3D"gmail-HOEnZb"><div class=3D"gmail-h5">On Sat, Jan 07, 2017 at 01:38:08=
PM +0800, Baoyou Xie wrote:<br>
&gt; This patch adds thermal driver for ZTE&#39;s zx2967 family.<br>
&gt;<br>
&gt; Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org"=
>baoyou.xie@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/thermal/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A06 +<br>
&gt;=C2=A0 drivers/thermal/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/thermal/zx2967_<wbr>thermal.c | 241 ++++++++++++++++++++=
++++++++++<wbr>+++++++++<br>
&gt;=C2=A0 3 files changed, 248 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/thermal/zx2967_<wbr>thermal.c<br>
&gt;<br>
&gt; diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig<br>
&gt; index 18f2de6..0dd597e 100644<br>
&gt; --- a/drivers/thermal/Kconfig<br>
&gt; +++ b/drivers/thermal/Kconfig<br>
&gt; @@ -445,3 +445,9 @@ config BCM2835_THERMAL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Support for thermal sensors on Broadc=
om bcm2835 SoCs.<br>
&gt;<br>
&gt;=C2=A0 endif<br>
&gt; +<br>
&gt; +config ZX2967_THERMAL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;Thermal sensors on zx2967 SoC&quot=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on ARCH_ZX<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Support for thermal sensors on ZTE zx2967 =
SoCs.<br>
&gt; diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile<br>
&gt; index 677c6d9..c00c05e 100644<br>
&gt; --- a/drivers/thermal/Makefile<br>
&gt; +++ b/drivers/thermal/Makefile<br>
&gt; @@ -57,3 +57,4 @@ obj-$(CONFIG_HISI_THERMAL)=C2=A0 =C2=A0 =C2=A0+=3D h=
isi_thermal.o<br>
&gt;=C2=A0 obj-$(CONFIG_MTK_THERMAL)=C2=A0 =C2=A0 +=3D mtk_thermal.o<br>
&gt;=C2=A0 obj-$(CONFIG_GENERIC_ADC_<wbr>THERMAL)=C2=A0 =C2=A0 +=3D thermal=
-generic-adc.o<br>
&gt;=C2=A0 obj-$(CONFIG_BCM2835_THERMAL)=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D bc=
m2835_thermal.o<br>
&gt; +obj-$(CONFIG_ZX2967_THERMAL) +=3D zx2967_thermal.o<br>
&gt; diff --git a/drivers/thermal/zx2967_<wbr>thermal.c b/drivers/thermal/z=
x2967_<wbr>thermal.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..1aef070<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/thermal/zx2967_<wbr>thermal.c<br>
&gt; @@ -0,0 +1,241 @@<br>
&gt; +/*<br>
&gt; + * ZTE&#39;s zx2967 family thermal sensor driver<br>
&gt; + *<br>
&gt; + * Copyright (C) 2017 ZTE Ltd.<br>
&gt; + *<br>
&gt; + * Author: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org">ba=
oyou.xie@linaro.org</a>&gt;<br>
&gt; + *<br>
&gt; + * License terms: GNU General Public License (GPL) version 2<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/device.h&gt;<br>
&gt; +#include &lt;linux/io.h&gt;<br>
&gt; +#include &lt;linux/err.h&gt;<br>
&gt; +#include &lt;linux/clk.h&gt;<br>
&gt; +#include &lt;linux/delay.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +#include &lt;linux/thermal.h&gt;<br>
&gt; +<br>
&gt; +/* DCF Control Register */<br>
&gt; +#define ZX2967_THERMAL_DCF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
4<br>
&gt; +<br>
&gt; +/* Selection Register */<br>
&gt; +#define ZX2967_THERMAL_SEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
8<br>
&gt; +<br>
&gt; +/* Control Register */<br>
&gt; +#define ZX2967_THERMAL_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x10<br=
>
&gt; +<br>
&gt; +#define ZX2967_THERMAL_ID_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(0x18)<br>
&gt; +<br>
&gt; +struct zx2967_thermal_sensor {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_priv *priv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct thermal_zone_device *tzd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int id;<br>
&gt; +};<br>
&gt; +<br>
&gt; +#define NUM_SENSORS=C2=A0 1<br>
&gt; +<br>
&gt; +struct zx2967_thermal_priv {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_sensor=C2=A0 =C2=A0 sensors=
[NUM_SENSORS];<br>
<br>
</div></div>What&#39;s the point of defining an array with only one element=
?<br>
<span class=3D"gmail-"><br></span></blockquote><div>we might support 2 sens=
ors in future, so I suggest to remain it.<br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">
&gt; +=C2=A0 =C2=A0 =C2=A0struct mutex=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct clk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *clk_gate;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct clk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pclk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void __iomem=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *regs;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct pinctrl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *pinmux_dvi0_d3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct pinctrl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *pinmux_dvi0_d4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct pinctrl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *pinmux_dvi0_d5;<br>
<br>
</span>These three pointers are not used.<br>
<span class=3D"gmail-"><br>
&gt; +};<br>
&gt; +<br>
&gt; +static int zx2967_thermal_suspend(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D to_platform_devi=
ce(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_priv *priv =3D platform_get=
_drvdata(pdev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (priv &amp;&amp; priv-&gt;pclk)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare=
(priv-&gt;<wbr>pclk);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (priv &amp;&amp; priv-&gt;clk_gate)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare=
(priv-&gt;<wbr>clk_gate);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_info(dev, &quot;suspended\n&quot;);<br>
<br>
</span>Noisy message.<br>
<span class=3D"gmail-"><br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D clk_prepare_enable(priv-&gt;clk_<wbr>ga=
te);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D clk_prepare_enable(priv-&gt;pclk)<wbr>;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
<br>
</span>clk_disable_unprepare() should be called for priv-&gt;clk_gate befor=
e<br>
returning here.<br>
<span class=3D"gmail-"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_info(dev, &quot;resumed\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int zx2967_thermal_get_temp(void *data, int *temp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *regs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_sensor *sensor =3D data;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_priv *priv =3D sensor-&gt;p=
riv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long timeout =3D jiffies + msecs_to_jiff=
ies(100);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 val, sel_id;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regs =3D priv-&gt;regs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;priv-&gt;lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(0, regs);<br>
<br>
</span>I suggest we have a macro for register at offset 0 as well to improv=
e<br>
the readability.<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(2, regs + ZX2967_THERMAL_DCF);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val =3D readl_relaxed(regs + ZX2967_THERMAL_SEL);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val &amp;=3D ~ZX2967_THERMAL_ID_MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sel_id =3D sensor-&gt;id ? 8 : 0x10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val |=3D sel_id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(val, regs + ZX2967_THERMAL_SEL);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(100, 300);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while (!(readl_relaxed(regs + ZX2967_THERMAL_CTRL=
) &amp; 0x1000)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (time_after(jiffie=
s, timeout)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pr_err(&quot;*** Thermal sensor %d data timeout\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-&gt;id);<br>
<br>
</span>dev_err?=C2=A0 And drop &quot;*** &quot;.<br>
<span class=3D"gmail-"><br></span></blockquote><div>oh, we don&#39;t hold d=
evice reference here.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><span class=3D"gmail-">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0mutex_unlock(&amp;priv-&gt;lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -EIO;<br>
<br>
</span>-ETIMEDOUT?<br>
<div><div class=3D"gmail-h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(3, regs + ZX2967_THERMAL_DCF);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val =3D readl_relaxed(regs + ZX2967_THERMAL_CTRL)=
 &amp; 0xfff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(1, regs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/** Calculate temperature */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*temp =3D DIV_ROUND_CLOSEST((val - 922) * 1000, 1=
951);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;priv-&gt;lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
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
-&gt;<wbr>dev, res);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;regs))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(priv-&=
gt;regs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;clk_gate =3D devm_clk_get(&amp;pdev-&gt;=
dev, &quot;tempsensor_gate&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;clk_gate)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(priv-=
&gt;clk_gate);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;failed to get clock gate: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(priv-&gt;clk_<wbr>gate=
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
 &quot;tempsensor_pclk&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;pclk)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(priv-=
&gt;pclk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;failed to get apb clock: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(priv-&gt;pclk)<wbr>;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;failed to enable converter clock: %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
<br>
</div></div>The use count of enable and prepare on priv-&gt;clk_gate will b=
e<br>
unbalanced.<br>
<div><div class=3D"gmail-h5"><br></div></div></blockquote><div>we called de=
vm_clk_get, thus when it fails, the framework will happy to release it.<br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv><div class=3D"gmail-h5">
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
ermal_zone_of_sensor_<wbr>register(&amp;pdev-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;zx2967_=
of_thermal_ops);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, priv);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +remove_ts:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i--; i &gt;=3D 0; i--)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thermal_zone_of_senso=
r_<wbr>unregister(&amp;pdev-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;sensors[i].tzd);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
<br>
</div></div>Unbalanced clk_prepare_enable(priv-&gt;pclk)<wbr>.<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
Shawn<br>
</font></span><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
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
r_<wbr>unregister(&amp;pdev-&gt;dev, sensor-&gt;tzd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(priv-&gt;<wbr>pclk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(priv-&gt;<wbr>clk_gate);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id zx2967_thermal_id_table[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;zte,zx2967-thermal&quot; =
},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;zte,zx296718-thermal&quot=
; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{}<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, zx2967_thermal_id_table);<br>
&gt; +<br>
&gt; +static SIMPLE_DEV_PM_OPS(zx2967_<wbr>thermal_pm_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 zx2967_thermal_suspend, zx2967_thermal_resume);<br>
&gt; +<br>
&gt; +static struct platform_driver zx2967_thermal_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe =3D zx2967_thermal_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove =3D zx2967_thermal_exit,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;zx296=
7_thermal&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D z=
x2967_thermal_id_table,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pm =3D &amp;zx2967_t=
hermal_pm_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +module_platform_driver(<wbr>zx2967_thermal_driver);<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linar=
o.org">baoyou.xie@linaro.org</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;ZTE zx2967 thermal driver&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL&quot;);<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a114239ce50a2f80545ce7836--
