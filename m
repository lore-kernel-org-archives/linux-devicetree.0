Return-Path: <SRS0=vO4q=YZ=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <843c634a-c624-e7db-99f6-8efdc19d7243@linaro.org>
References: <1483767488-19778-1-git-send-email-baoyou.xie@linaro.org>
 <1483767488-19778-3-git-send-email-baoyou.xie@linaro.org> <843c634a-c624-e7db-99f6-8efdc19d7243@linaro.org>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Wed, 11 Jan 2017 16:54:24 +0800
Message-ID: <CA+DQWkwGH0F10+FF5wQ8eZXB3ayrHOJz0s2+Mn5vbyj6182nZQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] thermal: zx2967: add thermal driver for ZTE's
 zx2967 family
Content-Type: multipart/alternative; boundary=001a1140338a611e6f0545cdbfcc
To: Jun Nie <jun.nie@linaro.org>
Cc: rui.zhang@intel.com, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, Greg KH <gregkh@linuxfoundation.org>, davem@davemloft.net, geert+renesas@glider.be, akpm@linux-foundation.org, mchehab@kernel.org, Guenter Roeck <linux@roeck-us.net>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--001a1140338a611e6f0545cdbfcc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9 January 2017 at 11:00, Jun Nie <jun.nie@linaro.org> wrote:

> On 2017=E5=B9=B401=E6=9C=8807=E6=97=A5 13:38, Baoyou Xie wrote:
>
>> This patch adds thermal driver for ZTE's zx2967 family.
>>
>> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
>> ---
>>  drivers/thermal/Kconfig          |   6 +
>>  drivers/thermal/Makefile         |   1 +
>>  drivers/thermal/zx2967_thermal.c | 241 ++++++++++++++++++++++++++++++
>> +++++++++
>>  3 files changed, 248 insertions(+)
>>  create mode 100644 drivers/thermal/zx2967_thermal.c
>>
>> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
>> index 18f2de6..0dd597e 100644
>> --- a/drivers/thermal/Kconfig
>> +++ b/drivers/thermal/Kconfig
>> @@ -445,3 +445,9 @@ config BCM2835_THERMAL
>>           Support for thermal sensors on Broadcom bcm2835 SoCs.
>>
>>  endif
>> +
>> +config ZX2967_THERMAL
>> +       tristate "Thermal sensors on zx2967 SoC"
>> +       depends on ARCH_ZX
>> +       help
>> +         Support for thermal sensors on ZTE zx2967 SoCs.
>> diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
>> index 677c6d9..c00c05e 100644
>> --- a/drivers/thermal/Makefile
>> +++ b/drivers/thermal/Makefile
>> @@ -57,3 +57,4 @@ obj-$(CONFIG_HISI_THERMAL)     +=3D hisi_thermal.o
>>  obj-$(CONFIG_MTK_THERMAL)      +=3D mtk_thermal.o
>>  obj-$(CONFIG_GENERIC_ADC_THERMAL)      +=3D thermal-generic-adc.o
>>  obj-$(CONFIG_BCM2835_THERMAL)  +=3D bcm2835_thermal.o
>> +obj-$(CONFIG_ZX2967_THERMAL)   +=3D zx2967_thermal.o
>> diff --git a/drivers/thermal/zx2967_thermal.c
>> b/drivers/thermal/zx2967_thermal.c
>> new file mode 100644
>> index 0000000..1aef070
>> --- /dev/null
>> +++ b/drivers/thermal/zx2967_thermal.c
>> @@ -0,0 +1,241 @@
>> +/*
>> + * ZTE's zx2967 family thermal sensor driver
>> + *
>> + * Copyright (C) 2017 ZTE Ltd.
>> + *
>> + * Author: Baoyou Xie <baoyou.xie@linaro.org>
>> + *
>> + * License terms: GNU General Public License (GPL) version 2
>> + */
>> +
>> +#include <linux/module.h>
>>
> Please follow alphabet sequence.
>
> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/err.h>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/thermal.h>
>> +
>> +/* DCF Control Register */
>> +#define ZX2967_THERMAL_DCF             0x4
>> +
>> +/* Selection Register */
>> +#define ZX2967_THERMAL_SEL             0x8
>> +
>> +/* Control Register */
>> +#define ZX2967_THERMAL_CTRL            0x10
>> +
>> +#define ZX2967_THERMAL_ID_MASK         (0x18)
>> +
>> +struct zx2967_thermal_sensor {
>> +       struct zx2967_thermal_priv *priv;
>> +       struct thermal_zone_device *tzd;
>> +       int id;
>> +};
>> +
>> +#define NUM_SENSORS    1
>> +
>> +struct zx2967_thermal_priv {
>> +       struct zx2967_thermal_sensor    sensors[NUM_SENSORS];
>> +       struct mutex                    lock;
>> +       struct clk                      *clk_gate;
>> +       struct clk                      *pclk;
>> +       void __iomem                    *regs;
>> +       struct pinctrl                  *pinmux_dvi0_d3;
>> +       struct pinctrl                  *pinmux_dvi0_d4;
>> +       struct pinctrl                  *pinmux_dvi0_d5;
>>
>
> I do not see usage of pinmux_div0_d*, please remove it.
>
>
> +};
>> +
>> +static int zx2967_thermal_suspend(struct device *dev)
>> +{
>> +       struct platform_device *pdev =3D to_platform_device(dev);
>> +       struct zx2967_thermal_priv *priv =3D platform_get_drvdata(pdev);
>> +
>> +       if (priv && priv->pclk)
>> +               clk_disable_unprepare(priv->pclk);
>> +
>> +       if (priv && priv->clk_gate)
>> +               clk_disable_unprepare(priv->clk_gate);
>> +       dev_info(dev, "suspended\n");
>> +
>> +       return 0;
>> +}
>> +
>> +static int zx2967_thermal_resume(struct device *dev)
>> +{
>> +       struct platform_device *pdev =3D to_platform_device(dev);
>> +       struct zx2967_thermal_priv *priv =3D platform_get_drvdata(pdev);
>> +       int error;
>> +
>> +       error =3D clk_prepare_enable(priv->clk_gate);
>> +       if (error)
>>
> Use IS_ERR(ret) to check error.
>
>> +               return error;
>> +
>> +       error =3D clk_prepare_enable(priv->pclk);
>> +       if (error)
>>
> Ditto.
>
>> +               return error;
>> +
>> +       dev_info(dev, "resumed\n");
>> +
>> +       return 0;
>> +}
>> +
>> +static int zx2967_thermal_get_temp(void *data, int *temp)
>> +{
>> +       void __iomem *regs;
>> +       struct zx2967_thermal_sensor *sensor =3D data;
>> +       struct zx2967_thermal_priv *priv =3D sensor->priv;
>> +       unsigned long timeout =3D jiffies + msecs_to_jiffies(100);
>> +       u32 val, sel_id;
>> +
>> +       regs =3D priv->regs;
>> +       mutex_lock(&priv->lock);
>> +
>> +       writel_relaxed(0, regs);
>> +       writel_relaxed(2, regs + ZX2967_THERMAL_DCF);
>> +
>> +       val =3D readl_relaxed(regs + ZX2967_THERMAL_SEL);
>> +       val &=3D ~ZX2967_THERMAL_ID_MASK;
>> +       sel_id =3D sensor->id ? 8 : 0x10;
>>
>
> You can define a macro for 8 and 0x10. BTW: NUM_SENSORS is 1 currently,
> you can change it to 2 if hardware support it. Or you can add TODO mark f=
or
> later work.
>
> we can't change NUM_SENSORS to 2, cause of hardware supports only 1 senso=
r
now. BTW: it can support 2 sensor, so we're happy to remain this code.


> +       val |=3D sel_id;
>> +       writel_relaxed(val, regs + ZX2967_THERMAL_SEL);
>> +
>> +       usleep_range(100, 300);
>> +       while (!(readl_relaxed(regs + ZX2967_THERMAL_CTRL) & 0x1000)) {
>> +               if (time_after(jiffies, timeout)) {
>> +                       pr_err("*** Thermal sensor %d data timeout\n",
>> +                             sensor->id);
>> +                       mutex_unlock(&priv->lock);
>> +                       return -EIO;
>> +               }
>> +       }
>> +
>> +       writel_relaxed(3, regs + ZX2967_THERMAL_DCF);
>> +       val =3D readl_relaxed(regs + ZX2967_THERMAL_CTRL) & 0xfff;
>>
>
> Define 0xfff as a macro.
>
>
> +       writel_relaxed(1, regs);
>> +
>> +       /** Calculate temperature */
>> +       *temp =3D DIV_ROUND_CLOSEST((val - 922) * 1000, 1951);
>> +
>> +       mutex_unlock(&priv->lock);
>> +
>> +       return 0;
>> +}
>> +
>> +static struct thermal_zone_of_device_ops zx2967_of_thermal_ops =3D {
>> +       .get_temp =3D zx2967_thermal_get_temp,
>> +};
>> +
>> +static int zx2967_thermal_probe(struct platform_device *pdev)
>> +{
>> +       struct zx2967_thermal_priv *priv;
>> +       struct resource *res;
>> +       int ret, i;
>> +
>> +       priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> +       if (!priv)
>> +               return -ENOMEM;
>> +
>> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       priv->regs =3D devm_ioremap_resource(&pdev->dev, res);
>> +       if (IS_ERR(priv->regs))
>> +               return PTR_ERR(priv->regs);
>> +
>> +       priv->clk_gate =3D devm_clk_get(&pdev->dev, "tempsensor_gate");
>> +       if (IS_ERR(priv->clk_gate)) {
>> +               ret =3D PTR_ERR(priv->clk_gate);
>> +               dev_err(&pdev->dev, "failed to get clock gate: %d\n",
>> ret);
>> +               return ret;
>> +       }
>> +
>> +       ret =3D clk_prepare_enable(priv->clk_gate);
>> +       if (ret) {
>>
> Use IS_ERR(ret) to check error.
>
> +               dev_err(&pdev->dev, "failed to enable converter clock:
>> %d\n",
>> +                       ret);
>> +               return ret;
>> +       }
>> +
>> +       priv->pclk =3D devm_clk_get(&pdev->dev, "tempsensor_pclk");
>> +       if (IS_ERR(priv->pclk)) {
>> +               ret =3D PTR_ERR(priv->pclk);
>> +               dev_err(&pdev->dev, "failed to get apb clock: %d\n", ret=
);
>> +               return ret;
>> +       }
>> +
>> +       ret =3D clk_prepare_enable(priv->pclk);
>> +       if (ret) {
>>
> Ditto.
>
> +               dev_err(&pdev->dev, "failed to enable converter clock:
>> %d\n",
>> +                       ret);
>> +               return ret;
>> +       }
>> +
>> +       mutex_init(&priv->lock);
>> +       for (i =3D 0; i < NUM_SENSORS; i++) {
>> +               struct zx2967_thermal_sensor *sensor =3D &priv->sensors[=
i];
>> +
>> +               sensor->priv =3D priv;
>> +               sensor->id =3D i;
>> +               sensor->tzd =3D thermal_zone_of_sensor_register(&pdev->d=
ev,
>> +                                       i,
>> +                                       sensor,
>>
> No need to create new line.
>
>
> +                                       &zx2967_of_thermal_ops);
>> +               if (IS_ERR(sensor->tzd)) {
>> +                       ret =3D PTR_ERR(sensor->tzd);
>> +                       dev_err(&pdev->dev, "failed to register sensor
>> %d: %d\n",
>> +                               i, ret);
>> +                       goto remove_ts;
>> +               }
>> +       }
>> +       platform_set_drvdata(pdev, priv);
>> +
>> +       return 0;
>> +
>> +remove_ts:
>> +       for (i--; i >=3D 0; i--)
>> +               thermal_zone_of_sensor_unregister(&pdev->dev,
>> +                                                 priv->sensors[i].tzd);
>> +
>> +       return ret;
>> +}
>> +
>> +static int zx2967_thermal_exit(struct platform_device *pdev)
>> +{
>> +       struct zx2967_thermal_priv *priv =3D platform_get_drvdata(pdev);
>> +       int i;
>> +
>> +       for (i =3D 0; i < NUM_SENSORS; i++) {
>> +               struct zx2967_thermal_sensor *sensor =3D &priv->sensors[=
i];
>> +
>> +               thermal_zone_of_sensor_unregister(&pdev->dev,
>> sensor->tzd);
>> +       }
>> +       clk_disable_unprepare(priv->pclk);
>> +       clk_disable_unprepare(priv->clk_gate);
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct of_device_id zx2967_thermal_id_table[] =3D {
>> +       { .compatible =3D "zte,zx2967-thermal" },
>> +       { .compatible =3D "zte,zx296718-thermal" },
>>
>
> Does the sensors that maps to the two compatibles have any difference? If
> yes, we can add the difference with data member. If not, we can use the
> same compatible string.
>
>
> +       {}
>> +};
>> +MODULE_DEVICE_TABLE(of, zx2967_thermal_id_table);
>> +
>> +static SIMPLE_DEV_PM_OPS(zx2967_thermal_pm_ops,
>> +                        zx2967_thermal_suspend, zx2967_thermal_resume);
>> +
>> +static struct platform_driver zx2967_thermal_driver =3D {
>> +       .probe =3D zx2967_thermal_probe,
>> +       .remove =3D zx2967_thermal_exit,
>> +       .driver =3D {
>> +               .name =3D "zx2967_thermal",
>> +               .of_match_table =3D zx2967_thermal_id_table,
>> +               .pm =3D &zx2967_thermal_pm_ops,
>> +       },
>> +};
>> +module_platform_driver(zx2967_thermal_driver);
>> +
>> +MODULE_AUTHOR("Baoyou Xie <baoyou.xie@linaro.org>");
>> +MODULE_DESCRIPTION("ZTE zx2967 thermal driver");
>> +MODULE_LICENSE("GPL");
>>
>>
>

--001a1140338a611e6f0545cdbfcc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 9 January 2017 at 11:00, Jun Nie <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:jun.nie@linaro.org" target=3D"_blank">jun.nie@linaro.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D=
"gmail-HOEnZb"><div class=3D"gmail-h5">On 2017=E5=B9=B401=E6=9C=8807=E6=97=
=A5 13:38, Baoyou Xie wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
This patch adds thermal driver for ZTE&#39;s zx2967 family.<br>
<br>
Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org" targ=
et=3D"_blank">baoyou.xie@linaro.org</a>&gt;<br>
---<br>
=C2=A0drivers/thermal/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A06 +<br>
=C2=A0drivers/thermal/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0drivers/thermal/zx2967_therma<wbr>l.c | 241 +++++++++++++++++++++++++=
+++++<wbr>+++++++++<br>
=C2=A03 files changed, 248 insertions(+)<br>
=C2=A0create mode 100644 drivers/thermal/zx2967_thermal<wbr>.c<br>
<br>
diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig<br>
index 18f2de6..0dd597e 100644<br>
--- a/drivers/thermal/Kconfig<br>
+++ b/drivers/thermal/Kconfig<br>
@@ -445,3 +445,9 @@ config BCM2835_THERMAL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Support for thermal sensors on Broadcom =
bcm2835 SoCs.<br>
<br>
=C2=A0endif<br>
+<br>
+config ZX2967_THERMAL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Thermal sensors on zx2967 SoC&qu=
ot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARCH_ZX<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Support for thermal sensors on ZTE zx296=
7 SoCs.<br>
diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile<br>
index 677c6d9..c00c05e 100644<br>
--- a/drivers/thermal/Makefile<br>
+++ b/drivers/thermal/Makefile<br>
@@ -57,3 +57,4 @@ obj-$(CONFIG_HISI_THERMAL)=C2=A0 =C2=A0 =C2=A0+=3D hisi_t=
hermal.o<br>
=C2=A0obj-$(CONFIG_MTK_THERMAL)=C2=A0 =C2=A0 =C2=A0 +=3D mtk_thermal.o<br>
=C2=A0obj-$(CONFIG_GENERIC_ADC_THER<wbr>MAL)=C2=A0 =C2=A0 =C2=A0 +=3D therm=
al-generic-adc.o<br>
=C2=A0obj-$(CONFIG_BCM2835_THERMAL)<wbr>=C2=A0 +=3D bcm2835_thermal.o<br>
+obj-$(CONFIG_ZX2967_THERMAL)=C2=A0 =C2=A0+=3D zx2967_thermal.o<br>
diff --git a/drivers/thermal/zx2967_therm<wbr>al.c b/drivers/thermal/zx2967=
_therm<wbr>al.c<br>
new file mode 100644<br>
index 0000000..1aef070<br>
--- /dev/null<br>
+++ b/drivers/thermal/zx2967_therm<wbr>al.c<br>
@@ -0,0 +1,241 @@<br>
+/*<br>
+ * ZTE&#39;s zx2967 family thermal sensor driver<br>
+ *<br>
+ * Copyright (C) 2017 ZTE Ltd.<br>
+ *<br>
+ * Author: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org" target=
=3D"_blank">baoyou.xie@linaro.org</a>&gt;<br>
+ *<br>
+ * License terms: GNU General Public License (GPL) version 2<br>
+ */<br>
+<br>
+#include &lt;linux/module.h&gt;<br>
</blockquote></div></div>
Please follow alphabet sequence.<div><div class=3D"gmail-h5"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+#include &lt;linux/device.h&gt;<br>
+#include &lt;linux/io.h&gt;<br>
+#include &lt;linux/err.h&gt;<br>
+#include &lt;linux/clk.h&gt;<br>
+#include &lt;linux/delay.h&gt;<br>
+#include &lt;linux/platform_device.h&gt;<br>
+#include &lt;linux/thermal.h&gt;<br>
+<br>
+/* DCF Control Register */<br>
+#define ZX2967_THERMAL_DCF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x4<br>
+<br>
+/* Selection Register */<br>
+#define ZX2967_THERMAL_SEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x8<br>
+<br>
+/* Control Register */<br>
+#define ZX2967_THERMAL_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x10<=
br>
+<br>
+#define ZX2967_THERMAL_ID_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x18)<br>
+<br>
+struct zx2967_thermal_sensor {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_priv *priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct thermal_zone_device *tzd;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int id;<br>
+};<br>
+<br>
+#define NUM_SENSORS=C2=A0 =C2=A0 1<br>
+<br>
+struct zx2967_thermal_priv {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_sensor=C2=A0 =C2=A0 senso=
rs[NUM_SENSORS];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mutex=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lock;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *clk_gate;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pclk;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *regs;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pinctrl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pinmux_dvi0_d3;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pinctrl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pinmux_dvi0_d4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pinctrl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pinmux_dvi0_d5;<br>
</blockquote>
<br></div></div>
I do not see usage of pinmux_div0_d*, please remove it.<div><div class=3D"g=
mail-h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+};<br>
+<br>
+static int zx2967_thermal_suspend(struct device *dev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D to_platform_de=
vice(dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_priv *priv =3D platform_g=
et_drvdata(pdev);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (priv &amp;&amp; priv-&gt;pclk)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepa=
re(priv-&gt;p<wbr>clk);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (priv &amp;&amp; priv-&gt;clk_gate)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepa=
re(priv-&gt;c<wbr>lk_gate);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(dev, &quot;suspended\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int zx2967_thermal_resume(struct device *dev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D to_platform_de=
vice(dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_priv *priv =3D platform_g=
et_drvdata(pdev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int error;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D clk_prepare_enable(priv-&gt;clk_g<wbr=
>ate);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (error)<br>
</blockquote></div></div>
Use IS_ERR(ret) to check error.<span class=3D"gmail-"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D clk_prepare_enable(priv-&gt;pclk)<wbr=
>;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (error)<br>
</blockquote></span>
Ditto.<span class=3D"gmail-"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(dev, &quot;resumed\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int zx2967_thermal_get_temp(void *data, int *temp)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *regs;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_sensor *sensor =3D data;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_priv *priv =3D sensor-&gt=
;priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long timeout =3D jiffies + msecs_to_ji=
ffies(100);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val, sel_id;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regs =3D priv-&gt;regs;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;priv-&gt;lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(0, regs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(2, regs + ZX2967_THERMAL_DCF);<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl_relaxed(regs + ZX2967_THERMAL_SEL=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val &amp;=3D ~ZX2967_THERMAL_ID_MASK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sel_id =3D sensor-&gt;id ? 8 : 0x10;<br>
</blockquote>
<br></span>
You can define a macro for 8 and 0x10. BTW: NUM_SENSORS is 1 currently, you=
 can change it to 2 if hardware support it. Or you can add TODO mark for la=
ter work.<span class=3D"gmail-"><br>
<br></span></blockquote><div>we can&#39;t change NUM_SENSORS to 2, cause of=
 hardware supports only 1 sensor now. BTW: it can support 2 sensor, so we&#=
39;re happy to remain this code.<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><span class=3D"gmail-">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D sel_id;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(val, regs + ZX2967_THERMAL_SEL);=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(100, 300);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (!(readl_relaxed(regs + ZX2967_THERMAL_CT=
RL) &amp; 0x1000)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (time_after(jiff=
ies, timeout)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pr_err(&quot;*** Thermal sensor %d data timeout\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-&gt;id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mutex_unlock(&amp;priv-&gt;lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EIO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(3, regs + ZX2967_THERMAL_DCF);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl_relaxed(regs + ZX2967_THERMAL_CTR=
L) &amp; 0xfff;<br>
</blockquote>
<br></span>
Define 0xfff as a macro.<div><div class=3D"gmail-h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(1, regs);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** Calculate temperature */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*temp =3D DIV_ROUND_CLOSEST((val - 922) * 1000,=
 1951);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;priv-&gt;lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static struct thermal_zone_of_device_ops zx2967_of_thermal_ops =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.get_temp =3D zx2967_thermal_get_temp,<br>
+};<br>
+<br>
+static int zx2967_thermal_probe(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_priv *priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret, i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0priv =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof=
(*priv), GFP_KERNEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!priv)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESOURCE_=
MEM, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;regs =3D devm_ioremap_resource(&amp;pd=
ev-&gt;d<wbr>ev, res);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;regs))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(priv=
-&gt;regs);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;clk_gate =3D devm_clk_get(&amp;pdev-&g=
t;dev, &quot;tempsensor_gate&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;clk_gate)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(pri=
v-&gt;clk_gate);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;failed to get clock gate: %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(priv-&gt;clk_g<wbr>a=
te);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
</blockquote></div></div>
Use IS_ERR(ret) to check error.<span class=3D"gmail-"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;failed to enable converter clock: %d\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;pclk =3D devm_clk_get(&amp;pdev-&gt;de=
v, &quot;tempsensor_pclk&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;pclk)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(pri=
v-&gt;pclk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;failed to get apb clock: %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(priv-&gt;pclk)<wbr>;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
</blockquote></span>
Ditto.<span class=3D"gmail-"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;failed to enable converter clock: %d\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&amp;priv-&gt;lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; NUM_SENSORS; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_therm=
al_sensor *sensor =3D &amp;priv-&gt;sensors[i];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-&gt;priv =3D=
 priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-&gt;id =3D i=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor-&gt;tzd =3D =
thermal_zone_of_sensor_registe<wbr>r(&amp;pdev-&gt;dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensor,<b=
r>
</blockquote></span>
No need to create new line.<div><div class=3D"gmail-h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;zx29=
67_of_thermal_ops);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(sensor-&=
gt;tzd)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D PTR_ERR(sensor-&gt;tzd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(&amp;pdev-&gt;dev, &quot;failed to register sensor %d: %d=
\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto remove_ts;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, priv);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+remove_ts:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i--; i &gt;=3D 0; i--)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thermal_zone_of_sen=
sor_unregi<wbr>ster(&amp;pdev-&gt;dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;sensors[i].tzd);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+static int zx2967_thermal_exit(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_thermal_priv *priv =3D platform_g=
et_drvdata(pdev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; NUM_SENSORS; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_therm=
al_sensor *sensor =3D &amp;priv-&gt;sensors[i];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thermal_zone_of_sen=
sor_unregi<wbr>ster(&amp;pdev-&gt;dev, sensor-&gt;tzd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(priv-&gt;p<wbr>clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(priv-&gt;c<wbr>lk_gate);<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static const struct of_device_id zx2967_thermal_id_table[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;zte,zx2967-thermal&quot=
; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;zte,zx296718-thermal&qu=
ot; },<br>
</blockquote>
<br></div></div>
Does the sensors that maps to the two compatibles have any difference? If y=
es, we can add the difference with data member. If not, we can use the same=
 compatible string.<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{}<br>
+};<br>
+MODULE_DEVICE_TABLE(of, zx2967_thermal_id_table);<br>
+<br>
+static SIMPLE_DEV_PM_OPS(zx2967_therm<wbr>al_pm_ops,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 zx2967_thermal_suspend, zx2967_thermal_resume);<br>
+<br>
+static struct platform_driver zx2967_thermal_driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe =3D zx2967_thermal_probe,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =3D zx2967_thermal_exit,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;zx2=
967_thermal&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D=
 zx2967_thermal_id_table,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pm =3D &amp;zx2967=
_thermal_pm_ops,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+};<br>
+module_platform_driver(zx2967<wbr>_thermal_driver);<br>
+<br>
+MODULE_AUTHOR(&quot;Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org=
" target=3D"_blank">baoyou.xie@linaro.org</a>&gt;&quot;);<br>
+MODULE_DESCRIPTION(&quot;ZTE zx2967 thermal driver&quot;);<br>
+MODULE_LICENSE(&quot;GPL&quot;);<br>
<br>
</blockquote>
<br>
</div></div></blockquote></div><br></div></div>

--001a1140338a611e6f0545cdbfcc--
