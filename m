Return-Path: <gyungoh@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1407488899-31065-1-git-send-email-jack.yoo@skyworksinc.com>
References: <1407488899-31065-1-git-send-email-jack.yoo@skyworksinc.com>
Date: Tue, 12 Aug 2014 10:51:13 +0900
Message-ID: <CADDor3-uhXm2x1Hpy4NT9J2OZ+83D-854GkG8JWz8MYUh0YtwA@mail.gmail.com>
Subject: Re: [PATCH 1/3] Adding Skyworks SKY81452 MFD driver
From: GyungOh Yoo <gyungoh@gmail.com>
Content-Type: multipart/alternative; boundary=047d7bdc99aa159ce9050064e8f6
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, grant.likely@linaro.org
Cc: sameo@linux.intel.com, lee.jones@linaro.org, =?UTF-8?B?7Jyg6rK97Jik?= <jack.yoo@skyworksinc.com>, jason@lakedaemon.net, heiko.stuebner@bqreaders.com, florian.vaussard@epfl.ch, thierry.reding@gmail.com, andrew@lunn.ch, silvio.fricke@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--047d7bdc99aa159ce9050064e8f6
Content-Type: text/plain; charset=UTF-8

Hello,

Can somebody please review if the code has anything to improve?

Thanks.


On Fri, Aug 8, 2014 at 6:08 PM, Gyungoh Yoo <gyungoh@gmail.com> wrote:

> Signed-off-by: Gyungoh Yoo <jack.yoo@skyworksinc.com>
> ---
>  Documentation/devicetree/bindings/mfd/sky81452.txt |  24 +++++
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  drivers/mfd/Kconfig                                |  12 +++
>  drivers/mfd/Makefile                               |   1 +
>  drivers/mfd/sky81452.c                             | 113
> +++++++++++++++++++++
>  include/linux/mfd/sky81452.h                       |  32 ++++++
>  6 files changed, 183 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/sky81452.txt
>  create mode 100644 drivers/mfd/sky81452.c
>  create mode 100644 include/linux/mfd/sky81452.h
>
> diff --git a/Documentation/devicetree/bindings/mfd/sky81452.txt
> b/Documentation/devicetree/bindings/mfd/sky81452.txt
> new file mode 100644
> index 0000000..5fb0b4f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/sky81452.txt
> @@ -0,0 +1,24 @@
> +SKY81452 bindings
> +
> +Required properties:
> +- compatible   : Must be "skyworks,sky81452"
> +
> +Required child nodes:
> +- backlight    : container node for backlight following the binding
> +               in video/backlight/sky81452-backlight.txt
> +- regulator    : container node for regulators following the binding
> +               in regulator/sky81452-regulator.txt
> +
> +Example:
> +
> +       sky81452@2C {
> +               compatible = "skyworks,sky81452";
> +
> +               backlight {
> +                       ...
> +               };
> +
> +               regulator {
> +                       ...
> +               };
> +       };
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
> b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index d415b38..ce76e10 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -122,6 +122,7 @@ silabs      Silicon Laboratories
>  simtek
>  sii    Seiko Instruments, Inc.
>  sirf   SiRF Technology, Inc.
> +skyworks       Skyworks Solutions, Inc.
>  smsc   Standard Microsystems Corporation
>  snps   Synopsys, Inc.
>  spansion       Spansion Inc.
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index de5abf2..acfb2e5 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -626,6 +626,18 @@ config MFD_SM501_GPIO
>          lines on the SM501. The platform data is used to supply the
>          base number for the first GPIO line to register.
>
> +config SKY81452
> +       tristate "Skyworks Solutions SKY81452"
> +       select MFD_CORE
> +       select REGMAP_I2C
> +       depends on I2C=y
> +       help
> +         This is the core driver for the Skyworks SKY81452 backlight and
> +         voltage regulator device.
> +
> +         This driver can also be built as a module.  If so, the module
> +         will be called sky81452.
> +
>  config MFD_SMSC
>         bool "SMSC ECE1099 series chips"
>         depends on I2C=y
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index f001487..191c656 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -169,6 +169,7 @@ obj-$(CONFIG_MFD_AS3711)    += as3711.o
>  obj-$(CONFIG_MFD_AS3722)       += as3722.o
>  obj-$(CONFIG_MFD_STW481X)      += stw481x.o
>  obj-$(CONFIG_MFD_IPAQ_MICRO)   += ipaq-micro.o
> +obj-$(CONFIG_SKY81452)         += sky81452.o
>
>  intel-soc-pmic-objs            := intel_soc_pmic_core.o
> intel_soc_pmic_crc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC)   += intel-soc-pmic.o
> diff --git a/drivers/mfd/sky81452.c b/drivers/mfd/sky81452.c
> new file mode 100644
> index 0000000..566912f
> --- /dev/null
> +++ b/drivers/mfd/sky81452.c
> @@ -0,0 +1,113 @@
> +/*
> + * sky81452.c  SKY81452 MFD driver
> + *
> + * Copyright 2014 Skyworks Solutions Inc.
> + * Author : Gyungoh Yoo <jack.yoo@skyworksinc.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2, or (at your option) any
> + * later version.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/err.h>
> +#include <linux/slab.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/sky81452.h>
> +
> +static const struct regmap_config sky81452_config = {
> +       .reg_bits = 8,
> +       .val_bits = 8,
> +};
> +
> +static int sky81452_register_devices(struct device *dev,
> +               const struct sky81452_platform_data *pdata)
> +{
> +       struct mfd_cell cells[] = {
> +               {
> +                       .name = "sky81452-bl",
> +                       .platform_data = pdata->bl_pdata,
> +                       .pdata_size = sizeof(*pdata->bl_pdata),
> +               },
> +               {
> +                       .name = "sky81452-regulator",
> +                       .platform_data = pdata->regulator_init_data,
> +                       .pdata_size = sizeof(*pdata->regulator_init_data),
> +               },
> +       };
> +
> +       return mfd_add_devices(dev, -1, cells, ARRAY_SIZE(cells),
> +                       NULL, 0, NULL);
> +}
> +
> +static int sky81452_probe(struct i2c_client *client,
> +               const struct i2c_device_id *id)
> +{
> +       struct device *dev = &client->dev;
> +       const struct sky81452_platform_data *pdata = dev_get_platdata(dev);
> +       struct regmap *map;
> +
> +       if (!pdata) {
> +               pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +               if (!pdata)
> +                       return -ENOMEM;
> +       }
> +
> +       map = devm_regmap_init_i2c(client, &sky81452_config);
> +       if (IS_ERR(map))
> +               return PTR_ERR(map);
> +
> +       i2c_set_clientdata(client, map);
> +
> +       return sky81452_register_devices(dev, pdata);
> +}
> +
> +static int sky81452_remove(struct i2c_client *client)
> +{
> +       mfd_remove_devices(&client->dev);
> +       return 0;
> +}
> +
> +static const struct i2c_device_id sky81452_ids[] = {
> +       { "sky81452", 0 },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(i2c, sky81452_ids);
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id sky81452_of_match[] = {
> +       { .compatible = "skyworks,sky81452", },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, sky81452_of_match);
> +#endif
> +
> +static struct i2c_driver sky81452_driver = {
> +       .driver = {
> +               .name = "sky81452",
> +               .of_match_table = of_match_ptr(sky81452_of_match),
> +       },
> +       .probe = sky81452_probe,
> +       .remove = sky81452_remove,
> +       .id_table = sky81452_ids,
> +};
> +
> +module_i2c_driver(sky81452_driver);
> +
> +MODULE_DESCRIPTION("Skyworks SKY81452 MFD driver");
> +MODULE_AUTHOR("Gyungoh Yoo <jack.yoo@skyworksinc.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_VERSION("1.0");
> diff --git a/include/linux/mfd/sky81452.h b/include/linux/mfd/sky81452.h
> new file mode 100644
> index 0000000..8d8ed35
> --- /dev/null
> +++ b/include/linux/mfd/sky81452.h
> @@ -0,0 +1,32 @@
> +/*
> + * sky81452.h  SKY81452 backlight driver
> + *
> + * Copyright 2014 Skyworks Solutions Inc.
> + * Author : Gyungoh Yoo <jack.yoo@skyworksinc.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2, or (at your option) any
> + * later version.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef _SKY81452_H
> +#define _SKY81452_H
> +
> +#include "linux/sky81452-backlight.h"
> +#include "linux/regulator/machine.h"
> +
> +struct sky81452_platform_data {
> +       struct sky81452_bl_platform_data *bl_pdata;
> +       struct regulator_init_data *regulator_init_data;
> +};
> +
> +#endif
> --
> 1.9.1
>
>

--047d7bdc99aa159ce9050064e8f6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hello,<br><br></div></div>Can somebody plea=
se review if the code has anything to improve?<br><br></div>Thanks.<br></di=
v><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Fri, Aug=
 8, 2014 at 6:08 PM, Gyungoh Yoo <span dir=3D"ltr">&lt;<a href=3D"mailto:gy=
ungoh@gmail.com" target=3D"_blank">gyungoh@gmail.com</a>&gt;</span> wrote:<=
br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Signed-off-by: Gyungoh Yoo &lt;<a href=3D"ma=
ilto:jack.yoo@skyworksinc.com">jack.yoo@skyworksinc.com</a>&gt;<br>
---<br>
=C2=A0Documentation/devicetree/bindings/mfd/sky81452.txt | =C2=A024 +++++<b=
r>
=C2=A0.../devicetree/bindings/vendor-prefixes.txt =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 1 +<br>
=C2=A0drivers/mfd/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A012 ++=
+<br>
=C2=A0drivers/mfd/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 1 +<br>
=C2=A0drivers/mfd/sky81452.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 113 ++++++++++++++++=
+++++<br>
=C2=A0include/linux/mfd/sky81452.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A032 ++++++<br>
=C2=A06 files changed, 183 insertions(+)<br>
=C2=A0create mode 100644 Documentation/devicetree/bindings/mfd/sky81452.txt=
<br>
=C2=A0create mode 100644 drivers/mfd/sky81452.c<br>
=C2=A0create mode 100644 include/linux/mfd/sky81452.h<br>
<br>
diff --git a/Documentation/devicetree/bindings/mfd/sky81452.txt b/Documenta=
tion/devicetree/bindings/mfd/sky81452.txt<br>
new file mode 100644<br>
index 0000000..5fb0b4f<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/bindings/mfd/sky81452.txt<br>
@@ -0,0 +1,24 @@<br>
+SKY81452 bindings<br>
+<br>
+Required properties:<br>
+- compatible =C2=A0 : Must be &quot;skyworks,sky81452&quot;<br>
+<br>
+Required child nodes:<br>
+- backlight =C2=A0 =C2=A0: container node for backlight following the bind=
ing<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in video/backlight/sky81=
452-backlight.txt<br>
+- regulator =C2=A0 =C2=A0: container node for regulators following the bin=
ding<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in regulator/sky81452-re=
gulator.txt<br>
+<br>
+Example:<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 sky81452@2C {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;sky=
works,sky81452&quot;;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backlight {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ...<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regulator {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ...<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+ =C2=A0 =C2=A0 =C2=A0 };<br>
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Docume=
ntation/devicetree/bindings/vendor-prefixes.txt<br>
index d415b38..ce76e10 100644<br>
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt<br>
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt<br>
@@ -122,6 +122,7 @@ silabs =C2=A0 =C2=A0 =C2=A0Silicon Laboratories<br>
=C2=A0simtek<br>
=C2=A0sii =C2=A0 =C2=A0Seiko Instruments, Inc.<br>
=C2=A0sirf =C2=A0 SiRF Technology, Inc.<br>
+skyworks =C2=A0 =C2=A0 =C2=A0 Skyworks Solutions, Inc.<br>
=C2=A0smsc =C2=A0 Standard Microsystems Corporation<br>
=C2=A0snps =C2=A0 Synopsys, Inc.<br>
=C2=A0spansion =C2=A0 =C2=A0 =C2=A0 Spansion Inc.<br>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig<br>
index de5abf2..acfb2e5 100644<br>
--- a/drivers/mfd/Kconfig<br>
+++ b/drivers/mfd/Kconfig<br>
@@ -626,6 +626,18 @@ config MFD_SM501_GPIO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lines on the SM501. The platform data is =
used to supply the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base number for the first GPIO line to re=
gister.<br>
<br>
+config SKY81452<br>
+ =C2=A0 =C2=A0 =C2=A0 tristate &quot;Skyworks Solutions SKY81452&quot;<br>
+ =C2=A0 =C2=A0 =C2=A0 select MFD_CORE<br>
+ =C2=A0 =C2=A0 =C2=A0 select REGMAP_I2C<br>
+ =C2=A0 =C2=A0 =C2=A0 depends on I2C=3Dy<br>
+ =C2=A0 =C2=A0 =C2=A0 help<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is the core driver for the Skyworks SKY8=
1452 backlight and<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 voltage regulator device.<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 This driver can also be built as a module. =
=C2=A0If so, the module<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 will be called sky81452.<br>
+<br>
=C2=A0config MFD_SMSC<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;SMSC ECE1099 series chips&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on I2C=3Dy<br>
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile<br>
index f001487..191c656 100644<br>
--- a/drivers/mfd/Makefile<br>
+++ b/drivers/mfd/Makefile<br>
@@ -169,6 +169,7 @@ obj-$(CONFIG_MFD_AS3711) =C2=A0 =C2=A0+=3D as3711.o<br>
=C2=A0obj-$(CONFIG_MFD_AS3722) =C2=A0 =C2=A0 =C2=A0 +=3D as3722.o<br>
=C2=A0obj-$(CONFIG_MFD_STW481X) =C2=A0 =C2=A0 =C2=A0+=3D stw481x.o<br>
=C2=A0obj-$(CONFIG_MFD_IPAQ_MICRO) =C2=A0 +=3D ipaq-micro.o<br>
+obj-$(CONFIG_SKY81452) =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D sky81452.o<br>
<br>
=C2=A0intel-soc-pmic-objs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D int=
el_soc_pmic_core.o intel_soc_pmic_crc.o<br>
=C2=A0obj-$(CONFIG_INTEL_SOC_PMIC) =C2=A0 +=3D intel-soc-pmic.o<br>
diff --git a/drivers/mfd/sky81452.c b/drivers/mfd/sky81452.c<br>
new file mode 100644<br>
index 0000000..566912f<br>
--- /dev/null<br>
+++ b/drivers/mfd/sky81452.c<br>
@@ -0,0 +1,113 @@<br>
+/*<br>
+ * sky81452.c =C2=A0SKY81452 MFD driver<br>
+ *<br>
+ * Copyright 2014 Skyworks Solutions Inc.<br>
+ * Author : Gyungoh Yoo &lt;<a href=3D"mailto:jack.yoo@skyworksinc.com">ja=
ck.yoo@skyworksinc.com</a>&gt;<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms of the GNU General Public License as published by the<b=
r>
+ * Free Software Foundation; either version 2, or (at your option) any<br>
+ * later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful, but<br>
+ * WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See the GNU<=
br>
+ * General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
<br>
+ * with this program; if not, see &lt;<a href=3D"http://www.gnu.org/licens=
es/" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.<br>
+ */<br>
+<br>
+#include &lt;linux/kernel.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
+#include &lt;linux/init.h&gt;<br>
+#include &lt;linux/err.h&gt;<br>
+#include &lt;linux/slab.h&gt;<br>
+#include &lt;linux/i2c.h&gt;<br>
+#include &lt;linux/regmap.h&gt;<br>
+#include &lt;linux/mfd/core.h&gt;<br>
+#include &lt;linux/mfd/sky81452.h&gt;<br>
+<br>
+static const struct regmap_config sky81452_config =3D {<br>
+ =C2=A0 =C2=A0 =C2=A0 .reg_bits =3D 8,<br>
+ =C2=A0 =C2=A0 =C2=A0 .val_bits =3D 8,<br>
+};<br>
+<br>
+static int sky81452_register_devices(struct device *dev,<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct sky81452_pl=
atform_data *pdata)<br>
+{<br>
+ =C2=A0 =C2=A0 =C2=A0 struct mfd_cell cells[] =3D {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .name =3D &quot;sky81452-bl&quot;,<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .platform_data =3D pdata-&gt;bl_pdata,<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .pdata_size =3D sizeof(*pdata-&gt;bl_pdata),<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .name =3D &quot;sky81452-regulator&quot;,<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .platform_data =3D pdata-&gt;regulator_init_data,<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .pdata_size =3D sizeof(*pdata-&gt;regulator_init_data),<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+ =C2=A0 =C2=A0 =C2=A0 };<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 return mfd_add_devices(dev, -1, cells, ARRAY_SIZE(ce=
lls),<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL, 0, NULL);<br>
+}<br>
+<br>
+static int sky81452_probe(struct i2c_client *client,<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct i2c_device_=
id *id)<br>
+{<br>
+ =C2=A0 =C2=A0 =C2=A0 struct device *dev =3D &amp;client-&gt;dev;<br>
+ =C2=A0 =C2=A0 =C2=A0 const struct sky81452_platform_data *pdata =3D dev_g=
et_platdata(dev);<br>
+ =C2=A0 =C2=A0 =C2=A0 struct regmap *map;<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 if (!pdata) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdata =3D devm_kzalloc(d=
ev, sizeof(*pdata), GFP_KERNEL);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!pdata)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return -ENOMEM;<br>
+ =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 map =3D devm_regmap_init_i2c(client, &amp;sky81452_c=
onfig);<br>
+ =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(map))<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTR_ERR(map);<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 i2c_set_clientdata(client, map);<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 return sky81452_register_devices(dev, pdata);<br>
+}<br>
+<br>
+static int sky81452_remove(struct i2c_client *client)<br>
+{<br>
+ =C2=A0 =C2=A0 =C2=A0 mfd_remove_devices(&amp;client-&gt;dev);<br>
+ =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static const struct i2c_device_id sky81452_ids[] =3D {<br>
+ =C2=A0 =C2=A0 =C2=A0 { &quot;sky81452&quot;, 0 },<br>
+ =C2=A0 =C2=A0 =C2=A0 { }<br>
+};<br>
+MODULE_DEVICE_TABLE(i2c, sky81452_ids);<br>
+<br>
+#ifdef CONFIG_OF<br>
+static const struct of_device_id sky81452_of_match[] =3D {<br>
+ =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;skyworks,sky81452&quot;, },<=
br>
+ =C2=A0 =C2=A0 =C2=A0 { }<br>
+};<br>
+MODULE_DEVICE_TABLE(of, sky81452_of_match);<br>
+#endif<br>
+<br>
+static struct i2c_driver sky81452_driver =3D {<br>
+ =C2=A0 =C2=A0 =C2=A0 .driver =3D {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;sky81452=
&quot;,<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .of_match_table =3D of_m=
atch_ptr(sky81452_of_match),<br>
+ =C2=A0 =C2=A0 =C2=A0 },<br>
+ =C2=A0 =C2=A0 =C2=A0 .probe =3D sky81452_probe,<br>
+ =C2=A0 =C2=A0 =C2=A0 .remove =3D sky81452_remove,<br>
+ =C2=A0 =C2=A0 =C2=A0 .id_table =3D sky81452_ids,<br>
+};<br>
+<br>
+module_i2c_driver(sky81452_driver);<br>
+<br>
+MODULE_DESCRIPTION(&quot;Skyworks SKY81452 MFD driver&quot;);<br>
+MODULE_AUTHOR(&quot;Gyungoh Yoo &lt;<a href=3D"mailto:jack.yoo@skyworksinc=
.com">jack.yoo@skyworksinc.com</a>&gt;&quot;);<br>
+MODULE_LICENSE(&quot;GPL&quot;);<br>
+MODULE_VERSION(&quot;1.0&quot;);<br>
diff --git a/include/linux/mfd/sky81452.h b/include/linux/mfd/sky81452.h<br=
>
new file mode 100644<br>
index 0000000..8d8ed35<br>
--- /dev/null<br>
+++ b/include/linux/mfd/sky81452.h<br>
@@ -0,0 +1,32 @@<br>
+/*<br>
+ * sky81452.h =C2=A0SKY81452 backlight driver<br>
+ *<br>
+ * Copyright 2014 Skyworks Solutions Inc.<br>
+ * Author : Gyungoh Yoo &lt;<a href=3D"mailto:jack.yoo@skyworksinc.com">ja=
ck.yoo@skyworksinc.com</a>&gt;<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms of the GNU General Public License as published by the<b=
r>
+ * Free Software Foundation; either version 2, or (at your option) any<br>
+ * later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful, but<br>
+ * WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See the GNU<=
br>
+ * General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
<br>
+ * with this program; if not, see &lt;<a href=3D"http://www.gnu.org/licens=
es/" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.<br>
+ */<br>
+<br>
+#ifndef _SKY81452_H<br>
+#define _SKY81452_H<br>
+<br>
+#include &quot;linux/sky81452-backlight.h&quot;<br>
+#include &quot;linux/regulator/machine.h&quot;<br>
+<br>
+struct sky81452_platform_data {<br>
+ =C2=A0 =C2=A0 =C2=A0 struct sky81452_bl_platform_data *bl_pdata;<br>
+ =C2=A0 =C2=A0 =C2=A0 struct regulator_init_data *regulator_init_data;<br>
+};<br>
+<br>
+#endif<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br></div>

--047d7bdc99aa159ce9050064e8f6--
