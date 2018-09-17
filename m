Return-Path: <SRS0=9FCA=L7=broadcom.com=pramod.kumar@kernel.org>
MIME-Version: 1.0
References: <1533819299-3401-1-git-send-email-srinath.mannam@broadcom.com>
 <1533819299-3401-4-git-send-email-srinath.mannam@broadcom.com> <190f80d4-624b-a46a-c3a0-578a2dbb38b8@linaro.org>
In-Reply-To: <190f80d4-624b-a46a-c3a0-578a2dbb38b8@linaro.org>
From: Pramod Kumar <pramod.kumar@broadcom.com>
Date: Mon, 17 Sep 2018 12:23:12 +0530
Message-ID: <CAJ+tv6+asp4dBt4t-FHgUh=J+UfvH3RXqW-RmWComn6fH50Ajw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] thermal: broadcom: Add Stingray thermal driver
Content-Type: multipart/alternative; boundary="000000000000250e5905760ba10c"
To: daniel.lezcano@linaro.org
Cc: "Srinath (Srinath Babu) Mannam" <srinath.mannam@broadcom.com>, rui.zhang@intel.com, edubezval@gmail.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-ID: <devicetree@vger.kernel.org>

--000000000000250e5905760ba10c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 14, 2018 at 7:51 PM Daniel Lezcano <daniel.lezcano@linaro.org>
wrote:

> On 09/08/2018 14:54, Srinath Mannam wrote:
> > From: Pramod Kumar <pramod.kumar@broadcom.com>
> >
> > Adds stingray thermal driver to monitor six
> > thermal zones temperature and trips at critical temperature.
>
> Hi Pramod,
>
> could you elaborate a bit more the description? As you are introducing a
> new driver it would be nice to give the sensor details.
>

Hi Denial,

Our SoC has six temperature sensor which gets configured/initialized and
controlled by m0 processor, running in secure zone. This processor sample
the sensors values and and populates in DDR memory to be read by other
agents like Linux. Since Sensors are not in direct control of Linux hence
sensor details has not been added here. Apart from this, In case Linux
fails to take action because of some unexpected reason, m0 Processor will
takes action to save the SoCs from being burned out.

Regards,
Pramod


>
> > Signed-off-by: Pramod Kumar <pramod.kumar@broadcom.com>
> > Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> > Reviewed-by: Ray Jui <ray.jui@broadcom.com>
> > Reviewed-by: Scott Branden <scott.branden@broadcom.com>
> > Reviewed-by: Vikram Prakash <vikram.prakash@broadcom.com>
> > ---
> >  drivers/thermal/Kconfig               |   3 +-
> >  drivers/thermal/broadcom/Kconfig      |   9 ++
> >  drivers/thermal/broadcom/Makefile     |   1 +
> >  drivers/thermal/broadcom/sr-thermal.c | 216
> ++++++++++++++++++++++++++++++++++
> >  4 files changed, 228 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/thermal/broadcom/sr-thermal.c
> >
> > diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> > index 8297988..26d39d4 100644
> > --- a/drivers/thermal/Kconfig
> > +++ b/drivers/thermal/Kconfig
> > @@ -416,7 +416,8 @@ config MTK_THERMAL
> >         controller present in Mediatek SoCs
> >
> >  menu "Broadcom thermal drivers"
> > -depends on ARCH_BCM || ARCH_BRCMSTB || ARCH_BCM2835 || COMPILE_TEST
> > +depends on ARCH_BCM || ARCH_BRCMSTB || ARCH_BCM2835 || ARCH_BCM_IPROC
> || \
> > +             COMPILE_TEST
> >  source "drivers/thermal/broadcom/Kconfig"
> >  endmenu
> >
> > diff --git a/drivers/thermal/broadcom/Kconfig
> b/drivers/thermal/broadcom/Kconfig
> > index c106a15..dc9a9bd 100644
> > --- a/drivers/thermal/broadcom/Kconfig
> > +++ b/drivers/thermal/broadcom/Kconfig
> > @@ -22,3 +22,12 @@ config BCM_NS_THERMAL
> >         BCM4708, BCM4709, BCM5301x, BCM95852X, etc). It contains DMU
> (Device
> >         Management Unit) block with a thermal sensor that allows
> checking CPU
> >         temperature.
> > +
> > +config BCM_SR_THERMAL
> > +     tristate "Stingray thermal driver"
> > +     depends on ARCH_BCM_IPROC || COMPILE_TEST
> > +     default ARCH_BCM_IPROC
> > +     help
> > +       Support for the Stingray family of SoCs. Its different blocks
> like
> > +       iHost, CRMU and NITRO has thermal sensor that allows checking i=
ts
> > +       temperature.
> > diff --git a/drivers/thermal/broadcom/Makefile
> b/drivers/thermal/broadcom/Makefile
> > index fae10ec..79df69e 100644
> > --- a/drivers/thermal/broadcom/Makefile
> > +++ b/drivers/thermal/broadcom/Makefile
> > @@ -1,3 +1,4 @@
> >  obj-$(CONFIG_BCM2835_THERMAL)                +=3D bcm2835_thermal.o
> >  obj-$(CONFIG_BRCMSTB_THERMAL)                +=3D brcmstb_thermal.o
> >  obj-$(CONFIG_BCM_NS_THERMAL)         +=3D ns-thermal.o
> > +obj-$(CONFIG_BCM_SR_THERMAL)         +=3D sr-thermal.o
> > diff --git a/drivers/thermal/broadcom/sr-thermal.c
> b/drivers/thermal/broadcom/sr-thermal.c
> > new file mode 100644
> > index 0000000..909f80c
> > --- /dev/null
> > +++ b/drivers/thermal/broadcom/sr-thermal.c
> > @@ -0,0 +1,216 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2018 Broadcom
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/module.h>
> > +#include <linux/of_address.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/thermal.h>
> > +
> > +#define TMON_CRIT_TEMP          105000 /* temp in millidegree C */
>
> I suggest to move this in the DT?
>
> > +#define SR_TMON_MAX_LIST        6
> > +
> > +/*
> > + * In stingray thermal IO memory,
> > + * Total Number of available TMONs MASK is at offset 0
> > + * temperature registers BASE is at 4 byte offset.
> > + * Each TMON temperature register size is 4.
> > + */
> > +#define SR_TMON_TEMP_BASE(id)   ((id) * 0x4)
> > +
> > +static const char * const sr_tmon_names[SR_TMON_MAX_LIST] =3D {
>
> It will be more elegant to replace the macro SR_TMON_MAX_LIST by
> ARRAY_SIZE(sr_tmon_names) and declare this array as:
>
> static const char *const sr_tmon_name[] =3D {
>         ...
> };
>
> > +     "sr_tmon_ihost0",
> > +     "sr_tmon_ihost1",
> > +     "sr_tmon_ihost2",
> > +     "sr_tmon_ihost3",
> > +     "sr_tmon_crmu",
> > +     "sr_tmon_nitro",
> > +};
> > +
> > +struct sr_tmon {
> > +     struct thermal_zone_device *tz;
> > +     unsigned int crit_temp;
> > +     unsigned int tmon_id;
> > +     struct sr_thermal *priv;
> > +};
> > +
> > +struct sr_thermal {
> > +     struct device *dev;
>
> This field is used for dev_dbg, may be it could be removed along with
> the dev_dbg message?
>
> > +     void __iomem *regs;
> > +     struct sr_tmon tmon[SR_TMON_MAX_LIST];
> > +};
> > +
> > +static int sr_get_temp(struct thermal_zone_device *tz, int *temp)
> > +{
> > +     struct sr_tmon *tmon =3D tz->devdata;
> > +     struct sr_thermal *sr_thermal =3D tmon->priv;
> > +
> > +     *temp =3D readl(sr_thermal->regs + SR_TMON_TEMP_BASE(tmon->tmon_i=
d));
> > +
> > +     return 0;
> > +}
> > +
> > +static int sr_get_trip_type(struct thermal_zone_device *tz, int trip,
> > +                                     enum thermal_trip_type *type)
> > +{
> > +     struct sr_tmon *tmon =3D tz->devdata;
> > +     struct sr_thermal *sr_thermal =3D tmon->priv;
> > +
> > +     switch (trip) {
> > +     case 0:
> > +             *type =3D THERMAL_TRIP_CRITICAL;
> > +             break;
> > +     default:
> > +             dev_dbg(sr_thermal->dev,
> > +                     "Driver does not support more than 1 trip
> point\n");
> > +             return -EINVAL;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int sr_get_trip_temp(struct thermal_zone_device *tz, int trip,
> int *temp)
> > +{
> > +     struct sr_tmon *tmon =3D tz->devdata;
> > +     struct sr_thermal *sr_thermal =3D tmon->priv;
> > +
> > +     switch (trip) {
> > +     case 0:
> > +             *temp =3D tmon->crit_temp;
> > +             break;
> > +     default:
> > +             dev_dbg(sr_thermal->dev,
> > +                     "Driver does not support more than 1 trip
> point\n");
> > +             return -EINVAL;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int sr_set_trip_temp(struct thermal_zone_device *tz, int trip,
> int temp)
> > +{
> > +     struct sr_tmon *tmon =3D tz->devdata;
> > +
> > +     switch (trip) {
> > +     case 0:
> > +             /*
> > +              * Allow the user to change critical temperature
> > +              * as per their requirement, could be for debug
> > +              * purpose, even if it's more than the recommended
> > +              * critical temperature.
> > +              */
>
> Couldn't the user harm the hardware with a too high value?
>
> Why not define this value in the DT?
>
> > +             tmon->crit_temp =3D temp;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +     return 0;
> > +}
>
> Is it possible to factor out these 3 functions above and remove the
> 'switch' in all of them ?
>
> > +static struct thermal_zone_device_ops sr_thermal_ops =3D {
> > +     .get_temp =3D sr_get_temp,
> > +     .get_trip_type =3D sr_get_trip_type,
> > +     .get_trip_temp =3D sr_get_trip_temp,
> > +     .set_trip_temp =3D sr_set_trip_temp,
> > +};
> > +
> > +static int sr_thermal_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct sr_thermal *sr_thermal;
> > +     struct sr_tmon *tmon;
> > +     struct resource *res;
> > +     uint32_t sr_tmon_list =3D 0;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     sr_thermal =3D devm_kzalloc(dev, sizeof(*sr_thermal), GFP_KERNEL)=
;
> > +     if (!sr_thermal)
> > +             return -ENOMEM;
> > +
> > +     sr_thermal->dev =3D dev;
> > +
> > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     sr_thermal->regs =3D (void __iomem *)devm_memremap(&pdev->dev,
> res->start,
> > +                                      resource_size(res), MEMREMAP_WB)=
;
> > +     if (IS_ERR(sr_thermal->regs)) {
> > +             dev_err(dev, "failed to get io address\n");
> > +             return PTR_ERR(sr_thermal->regs);
> > +     }
> > +
> > +     ret =3D device_property_read_u32(dev, "brcm,tmon-mask",
> &sr_tmon_list);
> > +     if (ret)
> > +             return ret;
> > +
> > +     for (i =3D 0; i < SR_TMON_MAX_LIST; i++) {
> > +
> > +             if (!(sr_tmon_list & BIT(i)))
> > +                     continue;
> > +
> > +             /* Flush temperature registers */
> > +             writel(0, sr_thermal->regs + SR_TMON_TEMP_BASE(i));
> > +             tmon =3D &sr_thermal->tmon[i];
>
> It is possible to initialize tmon to:
>
>                 tmon =3D &sr_thermal->tmon;
>
> and then use the pointer increment:
>                 tmon++;
>
>
> > +             tmon->crit_temp =3D TMON_CRIT_TEMP;
> > +             tmon->tmon_id =3D i;
> > +             tmon->priv =3D sr_thermal;
> > +             tmon->tz =3D thermal_zone_device_register(sr_tmon_names[i=
],
> > +                             1, 1,
> > +                             tmon,
> > +                             &sr_thermal_ops,
> > +                             NULL, 1000, 1000);
> > +             if (IS_ERR(tmon->tz))
> > +                     goto err_exit;
> > +
> > +             dev_info(dev, "%s: registered\n", sr_tmon_names[i]);
> > +     }
> > +     platform_set_drvdata(pdev, sr_thermal);
> > +
> > +     return 0;
> > +
> > +err_exit:
> > +     while (--i >=3D 0) {
> > +             if (sr_thermal->tmon[i].tz)
> > +
>  thermal_zone_device_unregister(sr_thermal->tmon[i].tz);
> > +     }
> > +
> > +     return PTR_ERR(tmon->tz);
> > +}
> > +
> > +static int sr_thermal_remove(struct platform_device *pdev)
> > +{
> > +     struct sr_thermal *sr_thermal =3D platform_get_drvdata(pdev);
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < SR_TMON_MAX_LIST; i++)
> > +             if (sr_thermal->tmon[i].tz)
> > +
>  thermal_zone_device_unregister(sr_thermal->tmon[i].tz);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id sr_thermal_of_match[] =3D {
> > +     { .compatible =3D "brcm,sr-thermal", },
> > +     {},
> > +};
> > +MODULE_DEVICE_TABLE(of, sr_thermal_of_match);
> > +
> > +static const struct acpi_device_id sr_thermal_acpi_ids[] =3D {
> > +     { .id =3D "BRCM0500" },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(acpi, sr_thermal_acpi_ids);
> > +
> > +static struct platform_driver sr_thermal_driver =3D {
> > +     .probe          =3D sr_thermal_probe,
> > +     .remove         =3D sr_thermal_remove,
> > +     .driver =3D {
> > +             .name =3D "sr-thermal",
> > +             .of_match_table =3D sr_thermal_of_match,
> > +             .acpi_match_table =3D ACPI_PTR(sr_thermal_acpi_ids),
> > +     },
> > +};
> > +module_platform_driver(sr_thermal_driver);
> > +
> > +MODULE_AUTHOR("Pramod Kumar <pramod.kumar@broadcom.com>");
> > +MODULE_DESCRIPTION("Stingray thermal driver");
> > +MODULE_LICENSE("GPL v2");
> >
>
>
> --
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>
>

--000000000000250e5905760ba10c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri=
, Sep 14, 2018 at 7:51 PM Daniel Lezcano &lt;<a href=3D"mailto:daniel.lezca=
no@linaro.org">daniel.lezcano@linaro.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">On 09/08/2018 14:54, Srinath Mannam wrote:<br>
&gt; From: Pramod Kumar &lt;<a href=3D"mailto:pramod.kumar@broadcom.com" ta=
rget=3D"_blank">pramod.kumar@broadcom.com</a>&gt;<br>
&gt; <br>
&gt; Adds stingray thermal driver to monitor six<br>
&gt; thermal zones temperature and trips at critical temperature.<br>
<br>
Hi Pramod,<br>
<br>
could you elaborate a bit more the description? As you are introducing a<br=
>
new driver it would be nice to give the sensor details.<br></blockquote><di=
v><br></div><div>Hi Denial,</div><div><br></div><div>Our SoC has six temper=
ature sensor which gets configured/initialized and controlled by m0 process=
or, running in secure zone. This processor sample the sensors values and an=
d populates in DDR memory to be read by other agents like Linux. Since Sens=
ors are not in direct control of Linux hence sensor details has not been ad=
ded here. Apart from this, In case Linux fails to take action because of so=
me unexpected reason, m0 Processor will takes action to save the SoCs from =
being burned out.</div><div><br></div><div>Regards,</div><div>Pramod</div><=
div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; Signed-off-by: Pramod Kumar &lt;<a href=3D"mailto:pramod.kumar@broadco=
m.com" target=3D"_blank">pramod.kumar@broadcom.com</a>&gt;<br>
&gt; Signed-off-by: Srinath Mannam &lt;<a href=3D"mailto:srinath.mannam@bro=
adcom.com" target=3D"_blank">srinath.mannam@broadcom.com</a>&gt;<br>
&gt; Reviewed-by: Ray Jui &lt;<a href=3D"mailto:ray.jui@broadcom.com" targe=
t=3D"_blank">ray.jui@broadcom.com</a>&gt;<br>
&gt; Reviewed-by: Scott Branden &lt;<a href=3D"mailto:scott.branden@broadco=
m.com" target=3D"_blank">scott.branden@broadcom.com</a>&gt;<br>
&gt; Reviewed-by: Vikram Prakash &lt;<a href=3D"mailto:vikram.prakash@broad=
com.com" target=3D"_blank">vikram.prakash@broadcom.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/thermal/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 drivers/thermal/broadcom/Kconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A09 ++<br>
&gt;=C2=A0 drivers/thermal/broadcom/Makefile=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 drivers/thermal/broadcom/sr-thermal.c | 216 ++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 4 files changed, 228 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 drivers/thermal/broadcom/sr-thermal.c<br>
&gt; <br>
&gt; diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig<br>
&gt; index 8297988..26d39d4 100644<br>
&gt; --- a/drivers/thermal/Kconfig<br>
&gt; +++ b/drivers/thermal/Kconfig<br>
&gt; @@ -416,7 +416,8 @@ config MTK_THERMAL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0controller present in Mediatek SoCs<b=
r>
&gt;=C2=A0 <br>
&gt;=C2=A0 menu &quot;Broadcom thermal drivers&quot;<br>
&gt; -depends on ARCH_BCM || ARCH_BRCMSTB || ARCH_BCM2835 || COMPILE_TEST<b=
r>
&gt; +depends on ARCH_BCM || ARCH_BRCMSTB || ARCH_BCM2835 || ARCH_BCM_IPROC=
 || \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0COMPILE_TEST<br>
&gt;=C2=A0 source &quot;drivers/thermal/broadcom/Kconfig&quot;<br>
&gt;=C2=A0 endmenu<br>
&gt;=C2=A0 <br>
&gt; diff --git a/drivers/thermal/broadcom/Kconfig b/drivers/thermal/broadc=
om/Kconfig<br>
&gt; index c106a15..dc9a9bd 100644<br>
&gt; --- a/drivers/thermal/broadcom/Kconfig<br>
&gt; +++ b/drivers/thermal/broadcom/Kconfig<br>
&gt; @@ -22,3 +22,12 @@ config BCM_NS_THERMAL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BCM4708, BCM4709, BCM5301x, BCM95852X=
, etc). It contains DMU (Device<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Management Unit) block with a thermal=
 sensor that allows checking CPU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0temperature.<br>
&gt; +<br>
&gt; +config BCM_SR_THERMAL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;Stingray thermal driver&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on ARCH_BCM_IPROC || COMPILE_TEST<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default ARCH_BCM_IPROC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Support for the Stingray family of SoCs. I=
ts different blocks like<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0iHost, CRMU and NITRO has thermal sensor t=
hat allows checking its<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0temperature.<br>
&gt; diff --git a/drivers/thermal/broadcom/Makefile b/drivers/thermal/broad=
com/Makefile<br>
&gt; index fae10ec..79df69e 100644<br>
&gt; --- a/drivers/thermal/broadcom/Makefile<br>
&gt; +++ b/drivers/thermal/broadcom/Makefile<br>
&gt; @@ -1,3 +1,4 @@<br>
&gt;=C2=A0 obj-$(CONFIG_BCM2835_THERMAL)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 +=3D bcm2835_thermal.o<br>
&gt;=C2=A0 obj-$(CONFIG_BRCMSTB_THERMAL)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 +=3D brcmstb_thermal.o<br>
&gt;=C2=A0 obj-$(CONFIG_BCM_NS_THERMAL)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=
=3D ns-thermal.o<br>
&gt; +obj-$(CONFIG_BCM_SR_THERMAL)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D sr=
-thermal.o<br>
&gt; diff --git a/drivers/thermal/broadcom/sr-thermal.c b/drivers/thermal/b=
roadcom/sr-thermal.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..909f80c<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/thermal/broadcom/sr-thermal.c<br>
&gt; @@ -0,0 +1,216 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2018 Broadcom<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/acpi.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/of_address.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +#include &lt;linux/thermal.h&gt;<br>
&gt; +<br>
&gt; +#define TMON_CRIT_TEMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 105000 /* te=
mp in millidegree C */<br>
<br>
I suggest to move this in the DT?<br>
<br>
&gt; +#define SR_TMON_MAX_LIST=C2=A0 =C2=A0 =C2=A0 =C2=A0 6<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * In stingray thermal IO memory,<br>
&gt; + * Total Number of available TMONs MASK is at offset 0<br>
&gt; + * temperature registers BASE is at 4 byte offset.<br>
&gt; + * Each TMON temperature register size is 4.<br>
&gt; + */<br>
&gt; +#define SR_TMON_TEMP_BASE(id)=C2=A0 =C2=A0((id) * 0x4)<br>
&gt; +<br>
&gt; +static const char * const sr_tmon_names[SR_TMON_MAX_LIST] =3D {<br>
<br>
It will be more elegant to replace the macro SR_TMON_MAX_LIST by<br>
ARRAY_SIZE(sr_tmon_names) and declare this array as:<br>
<br>
static const char *const sr_tmon_name[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
};<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;sr_tmon_ihost0&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;sr_tmon_ihost1&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;sr_tmon_ihost2&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;sr_tmon_ihost3&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;sr_tmon_crmu&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;sr_tmon_nitro&quot;,<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct sr_tmon {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct thermal_zone_device *tz;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int crit_temp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int tmon_id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sr_thermal *priv;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct sr_thermal {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
<br>
This field is used for dev_dbg, may be it could be removed along with<br>
the dev_dbg message?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *regs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sr_tmon tmon[SR_TMON_MAX_LIST];<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int sr_get_temp(struct thermal_zone_device *tz, int *temp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sr_tmon *tmon =3D tz-&gt;devdata;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sr_thermal *sr_thermal =3D tmon-&gt;priv;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*temp =3D readl(sr_thermal-&gt;regs + SR_TMON_TEM=
P_BASE(tmon-&gt;tmon_id));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sr_get_trip_type(struct thermal_zone_device *tz, int trip,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum thermal=
_trip_type *type)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sr_tmon *tmon =3D tz-&gt;devdata;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sr_thermal *sr_thermal =3D tmon-&gt;priv;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (trip) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case 0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*type =3D THERMAL_TRI=
P_CRITICAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(sr_thermal-&g=
t;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;Driver does not support more than 1 trip point\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sr_get_trip_temp(struct thermal_zone_device *tz, int trip,=
 int *temp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sr_tmon *tmon =3D tz-&gt;devdata;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sr_thermal *sr_thermal =3D tmon-&gt;priv;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (trip) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case 0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*temp =3D tmon-&gt;cr=
it_temp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(sr_thermal-&g=
t;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;Driver does not support more than 1 trip point\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sr_set_trip_temp(struct thermal_zone_device *tz, int trip,=
 int temp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sr_tmon *tmon =3D tz-&gt;devdata;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (trip) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case 0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Allow the user to =
change critical temperature<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * as per their requi=
rement, could be for debug<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * purpose, even if i=
t&#39;s more than the recommended<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * critical temperatu=
re.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
<br>
Couldn&#39;t the user harm the hardware with a too high value?<br>
<br>
Why not define this value in the DT?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmon-&gt;crit_temp =
=3D temp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
<br>
Is it possible to factor out these 3 functions above and remove the<br>
&#39;switch&#39; in all of them ?<br>
<br>
&gt; +static struct thermal_zone_device_ops sr_thermal_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.get_temp =3D sr_get_temp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.get_trip_type =3D sr_get_trip_type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.get_trip_temp =3D sr_get_trip_temp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.set_trip_temp =3D sr_set_trip_temp,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int sr_thermal_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sr_thermal *sr_thermal;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sr_tmon *tmon;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uint32_t sr_tmon_list =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sr_thermal =3D devm_kzalloc(dev, sizeof(*sr_therm=
al), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!sr_thermal)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sr_thermal-&gt;dev =3D dev;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESOURCE_ME=
M, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sr_thermal-&gt;regs =3D (void __iomem *)devm_memr=
emap(&amp;pdev-&gt;dev, res-&gt;start,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resource_si=
ze(res), MEMREMAP_WB);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(sr_thermal-&gt;regs)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;fa=
iled to get io address\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(sr_the=
rmal-&gt;regs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D device_property_read_u32(dev, &quot;brcm,=
tmon-mask&quot;, &amp;sr_tmon_list);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; SR_TMON_MAX_LIST; i++) {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(sr_tmon_list &a=
mp; BIT(i)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Flush temperature =
registers */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(0, sr_thermal-=
&gt;regs + SR_TMON_TEMP_BASE(i));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmon =3D &amp;sr_ther=
mal-&gt;tmon[i];<br>
<br>
It is possible to initialize tmon to:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmon =3D &amp;sr_th=
ermal-&gt;tmon;<br>
<br>
and then use the pointer increment:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmon++;<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmon-&gt;crit_temp =
=3D TMON_CRIT_TEMP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmon-&gt;tmon_id =3D =
i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmon-&gt;priv =3D sr_=
thermal;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmon-&gt;tz =3D therm=
al_zone_device_register(sr_tmon_names[i],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01, 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmon,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sr_thermal_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, 1000, 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(tmon-&gt;t=
z))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto err_exit;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(dev, &quot;%=
s: registered\n&quot;, sr_tmon_names[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, sr_thermal);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +err_exit:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while (--i &gt;=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sr_thermal-&gt;tm=
on[i].tz)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0thermal_zone_device_unregister(sr_thermal-&gt;tmon[i].tz);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return PTR_ERR(tmon-&gt;tz);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sr_thermal_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sr_thermal *sr_thermal =3D platform_get_dr=
vdata(pdev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; SR_TMON_MAX_LIST; i++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sr_thermal-&gt;tm=
on[i].tz)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0thermal_zone_device_unregister(sr_thermal-&gt;tmon[i].tz);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id sr_thermal_of_match[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;brcm,sr-thermal&quot;, },=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{},<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, sr_thermal_of_match);<br>
&gt; +<br>
&gt; +static const struct acpi_device_id sr_thermal_acpi_ids[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .id =3D &quot;BRCM0500&quot; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ /* sentinel */ }<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(acpi, sr_thermal_acpi_ids);<br>
&gt; +<br>
&gt; +static struct platform_driver sr_thermal_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D sr_t=
hermal_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D sr_t=
hermal_remove,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;sr-th=
ermal&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D s=
r_thermal_of_match,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.acpi_match_table =3D=
 ACPI_PTR(sr_thermal_acpi_ids),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +module_platform_driver(sr_thermal_driver);<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Pramod Kumar &lt;<a href=3D"mailto:pramod.kumar@b=
roadcom.com" target=3D"_blank">pramod.kumar@broadcom.com</a>&gt;&quot;);<br=
>
&gt; +MODULE_DESCRIPTION(&quot;Stingray thermal driver&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt; <br>
<br>
<br>
-- <br>
=C2=A0&lt;<a href=3D"http://www.linaro.org/" rel=3D"noreferrer" target=3D"_=
blank">http://www.linaro.org/</a>&gt; Linaro.org =E2=94=82 Open source soft=
ware for ARM SoCs<br>
<br>
Follow Linaro:=C2=A0 &lt;<a href=3D"http://www.facebook.com/pages/Linaro" r=
el=3D"noreferrer" target=3D"_blank">http://www.facebook.com/pages/Linaro</a=
>&gt; Facebook |<br>
&lt;<a href=3D"http://twitter.com/#!/linaroorg" rel=3D"noreferrer" target=
=3D"_blank">http://twitter.com/#!/linaroorg</a>&gt; Twitter |<br>
&lt;<a href=3D"http://www.linaro.org/linaro-blog/" rel=3D"noreferrer" targe=
t=3D"_blank">http://www.linaro.org/linaro-blog/</a>&gt; Blog<br>
<br>
</blockquote></div></div>

--000000000000250e5905760ba10c--
