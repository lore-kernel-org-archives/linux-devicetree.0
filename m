Return-Path: <krzk@kernel.org>
MIME-Version: 1.0
References: <5fcd93bbbcd55a5c23f1c75effdc3670ce7a811b.1535446321.git.baolin.wang@linaro.org>
 <e8a3aba289cd2505db4a8891256bf731f32072cd.1535446321.git.baolin.wang@linaro.org>
In-Reply-To: <e8a3aba289cd2505db4a8891256bf731f32072cd.1535446321.git.baolin.wang@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 29 Aug 2018 16:29:44 +0200
Message-ID: <CAJKOXPc3-4fztM6WTKOQj0a-WneO2BwPaSGE5=LXMv0oNsrbEA@mail.gmail.com>
Subject: Re: [PATCH 2/2] power: supply: Add Spreadtrum SC2731 charger support
Content-Type: multipart/alternative; boundary="000000000000dd3f69057493ca31"
To: baolin.wang@linaro.org
Cc: sre@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yuanjiang.yu@unisoc.com, broonie@kernel.org
List-ID: <devicetree@vger.kernel.org>

--000000000000dd3f69057493ca31
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Aug 2018 at 11:04, Baolin Wang <baolin.wang@linaro.org> wrote:
>
> This patch adds the SC2731 PMIC switch charger support.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
>  drivers/power/supply/Kconfig          |    7 +
>  drivers/power/supply/Makefile         |    1 +
>  drivers/power/supply/sc2731_charger.c |  451
+++++++++++++++++++++++++++++++++
>  3 files changed, 459 insertions(+)
>  create mode 100644 drivers/power/supply/sc2731_charger.c
>
> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> index ff6dab0..f27cf07 100644
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -645,4 +645,11 @@ config CHARGER_CROS_USBPD
>           what is connected to USB PD ports from the EC and converts
>           that into power_supply properties.
>
> +config CHARGER_SC2731
> +       tristate "Spreadtrum SC2731 charger driver"
> +       depends on MFD_SC27XX_PMIC || COMPILE_TEST
> +       help
> +        Say Y here to enable support for battery charging with SC2731
> +        PMIC chips.
> +
>  endif # POWER_SUPPLY
> diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
> index a26b402..767105b 100644
> --- a/drivers/power/supply/Makefile
> +++ b/drivers/power/supply/Makefile
> @@ -85,3 +85,4 @@ obj-$(CONFIG_CHARGER_TPS65217)        +=
tps65217_charger.o
>  obj-$(CONFIG_AXP288_FUEL_GAUGE) += axp288_fuel_gauge.o
>  obj-$(CONFIG_AXP288_CHARGER)   += axp288_charger.o
>  obj-$(CONFIG_CHARGER_CROS_USBPD)       += cros_usbpd-charger.o
> +obj-$(CONFIG_CHARGER_SC2731)   += sc2731_charger.o
> diff --git a/drivers/power/supply/sc2731_charger.c
b/drivers/power/supply/sc2731_charger.c
> new file mode 100644
> index 0000000..49ae16a
> --- /dev/null
> +++ b/drivers/power/supply/sc2731_charger.c
> @@ -0,0 +1,451 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2018 Spreadtrum Communications Inc.
> +
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/power_supply.h>
> +#include <linux/slab.h>

slab.h includes looks not needed.

> +#include <linux/usb/phy.h>
> +#include <linux/regmap.h>
> +#include <linux/extcon.h>

Looks not used.

> +#include <linux/notifier.h>
> +#include <linux/of.h>
> +
> +/* PMIC global registers definition */
> +#define SC2731_CHARGE_STATUS           0xedc
> +#define SC2731_CHARGE_FULL             BIT(4)
> +#define SC2731_MODULE_EN1              0xc0c
> +#define SC2731_CHARGE_EN               BIT(5)
> +
> +/* SC2731 switch charger registers definition */
> +#define SC2731_CHG_CFG0                        0x0
> +#define SC2731_CHG_CFG1                        0x4
> +#define SC2731_CHG_CFG2                        0x8
> +#define SC2731_CHG_CFG3                        0xc
> +#define SC2731_CHG_CFG4                        0x10
> +#define SC2731_CHG_CFG5                        0x28
> +
> +/* SC2731_CHG_CFG0 register definition */
> +#define SC2731_PRECHG_RNG_SHIFT                11
> +#define SC2731_PRECHG_RNG_MASK         GENMASK(12, 11)
> +
> +#define SC2731_TERMINATION_VOL_MASK    GENMASK(2, 1)
> +#define SC2731_TERMINATION_VOL_SHIFT   1
> +#define SC2731_TERMINATION_VOL_CAL_MASK        GENMASK(8, 3)
> +#define SC2731_TERMINATION_VOL_CAL_SHIFT       3
> +#define SC2731_TERMINATION_CUR_MASK    GENMASK(2, 0)
> +
> +#define SC2731_CC_EN                   BIT(13)
> +#define SC2731_CHARGER_PD              BIT(0)
> +
> +/* SC2731_CHG_CFG1 register definition */
> +#define SC2731_CUR_MASK                        GENMASK(5, 0)
> +
> +/* SC2731_CHG_CFG5 register definition */
> +#define SC2731_CUR_LIMIT_SHIFT         8
> +#define SC2731_CUR_LIMIT_MASK          GENMASK(9, 8)
> +
> +#define SC2731_CURRENT_LIMIT_100       100
> +#define SC2731_CURRENT_LIMIT_500       500
> +#define SC2731_CURRENT_LIMIT_900       900
> +#define SC2731_CURRENT_LIMIT_2000      2000
> +
> +#define SC2731_CURRENT_PRECHG          450
> +#define SC2731_CURRENT_STEP            50

What units are used for all these currents?

> +
> +struct sc2731_charger_info {
> +       struct device *dev;
> +       struct regmap *regmap;
> +       struct usb_phy *usb_phy;
> +       struct notifier_block usb_notify;
> +       struct power_supply *psy_usb;
> +       bool charging;
> +       u32 base;
> +};
> +
> +static void sc2731_charger_stop_charge(struct sc2731_charger_info *info)
> +{
> +       regmap_update_bits(info->regmap, info->base + SC2731_CHG_CFG0,
> +                          SC2731_CC_EN, 0);
> +
> +       regmap_update_bits(info->regmap, info->base + SC2731_CHG_CFG0,
> +                          SC2731_CHARGER_PD, SC2731_CHARGER_PD);
> +}
> +
> +static int sc2731_charger_start_charge(struct sc2731_charger_info *info)
> +{
> +       int ret;
> +
> +       /* Enable charger constant current mode */
> +       ret = regmap_update_bits(info->regmap, info->base +
SC2731_CHG_CFG0,
> +                                SC2731_CC_EN, SC2731_CC_EN);
> +       if (ret)
> +               return ret;
> +
> +       /* Start charging */
> +       return regmap_update_bits(info->regmap, info->base +
SC2731_CHG_CFG0,
> +                                 SC2731_CHARGER_PD, 0);
> +}
> +
> +static int sc2731_charger_set_current_limit(struct sc2731_charger_info
*info,
> +                                           u32 limit)
> +{
> +       u32 val;
> +
> +       if (limit <= SC2731_CURRENT_LIMIT_100)
> +               val = 0;
> +       else if (limit <= SC2731_CURRENT_LIMIT_500)
> +               val = 3;
> +       else if (limit <= SC2731_CURRENT_LIMIT_900)
> +               val = 2;
> +       else
> +               val = 1;
> +
> +       return regmap_update_bits(info->regmap, info->base +
SC2731_CHG_CFG5,
> +                                 SC2731_CUR_LIMIT_MASK,
> +                                 val << SC2731_CUR_LIMIT_SHIFT);
> +}
> +
> +static int sc2731_charger_set_current(struct sc2731_charger_info *info,
u32 cur)
> +{
> +       u32 val;
> +       int ret;
> +
> +       if (cur > SC2731_CURRENT_LIMIT_2000)
> +               cur = SC2731_CURRENT_LIMIT_2000;
> +       else if (cur < SC2731_CURRENT_PRECHG)
> +               cur = SC2731_CURRENT_PRECHG;
> +
> +       /* Calculte the step value, each step is 50 mA */

s/Calculte/Calculate/

> +       val = (cur - SC2731_CURRENT_PRECHG) / SC2731_CURRENT_STEP;
> +
> +       /* Set pre-charge current as 450 mA */
> +       ret = regmap_update_bits(info->regmap, info->base +
SC2731_CHG_CFG0,
> +                                SC2731_PRECHG_RNG_MASK,
> +                                0x3 << SC2731_PRECHG_RNG_SHIFT);
> +       if (ret)
> +               return ret;
> +
> +       return regmap_update_bits(info->regmap, info->base +
SC2731_CHG_CFG1,
> +                                 SC2731_CUR_MASK, val);
> +}
> +
> +static int sc2731_charger_get_status(struct sc2731_charger_info *info)
> +{
> +       u32 val;
> +       int ret;
> +
> +       ret = regmap_read(info->regmap, SC2731_CHARGE_STATUS, &val);
> +       if (ret)
> +               return ret;
> +
> +       if (val & SC2731_CHARGE_FULL)
> +               return POWER_SUPPLY_STATUS_FULL;
> +
> +       return POWER_SUPPLY_STATUS_CHARGING;

What about POWER_SUPPLY_STATUS_DISCHARGING? When charger is not online you
would return charging status...

> +}
> +
> +static int sc2731_charger_get_current(struct sc2731_charger_info *info,
> +                                     u32 *cur)
> +{
> +       int ret;
> +       u32 val;
> +
> +       ret = regmap_read(info->regmap, info->base + SC2731_CHG_CFG1,
&val);
> +       if (ret)
> +               return ret;
> +
> +       val &= SC2731_CUR_MASK;
> +       *cur = val * SC2731_CURRENT_STEP + SC2731_CURRENT_PRECHG;

One empty line please.

> +       return 0;
> +}
> +
> +static int sc2731_charger_get_current_limit(struct sc2731_charger_info
*info,
> +                                           u32 *cur)
> +{
> +       int ret;
> +       u32 val;
> +
> +       ret = regmap_read(info->regmap, info->base + SC2731_CHG_CFG5,
&val);
> +       if (ret)
> +               return ret;
> +
> +       val = (val & SC2731_CUR_LIMIT_MASK) >> SC2731_CUR_LIMIT_SHIFT;
> +
> +       switch (val) {
> +       case 0:
> +               *cur = SC2731_CURRENT_LIMIT_100;
> +               break;
> +
> +       case 1:
> +               *cur = SC2731_CURRENT_LIMIT_2000;
> +               break;
> +
> +       case 2:
> +               *cur = SC2731_CURRENT_LIMIT_900;
> +               break;
> +
> +       case 3:
> +               *cur = SC2731_CURRENT_LIMIT_500;
> +               break;
> +
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int
> +sc2731_charger_usb_set_property(struct power_supply *psy,
> +                               enum power_supply_property psp,
> +                               const union power_supply_propval *val)
> +{
> +       struct sc2731_charger_info *info = power_supply_get_drvdata(psy);
> +       int ret;
> +
> +       switch (psp) {
> +       case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
> +               ret = sc2731_charger_set_current(info, val->intval);
> +               if (ret < 0)
> +                       dev_warn(info->dev, "set charge current
failed\n");
> +               break;
> +       case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
> +               ret = sc2731_charger_set_current_limit(info, val->intval);
> +               if (ret < 0)
> +                       dev_warn(info->dev, "set input current limit
failed\n");
> +               break;
> +       default:
> +               ret = -EINVAL;
> +       }
> +
> +       return ret;
> +}
> +
> +static int sc2731_charger_usb_get_property(struct power_supply *psy,
> +                                          enum power_supply_property psp,
> +                                          union power_supply_propval
*val)
> +{
> +       struct sc2731_charger_info *info = power_supply_get_drvdata(psy);
> +       u32 cur;
> +       int ret;
> +
> +       switch (psp) {
> +       case POWER_SUPPLY_PROP_STATUS:
> +               if (info->charging)
> +                       val->intval = sc2731_charger_get_status(info);
> +               else
> +                       val->intval = POWER_SUPPLY_STATUS_NOT_CHARGING;
> +               break;
> +
> +       case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
> +               if (!info->charging) {
> +                       val->intval = 0;
> +                       break;
> +               }
> +
> +               ret = sc2731_charger_get_current(info, &cur);
> +               if (ret)
> +                       return ret;
> +
> +               val->intval = cur;
> +               break;
> +
> +       case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
> +               if (!info->charging) {
> +                       val->intval = 0;
> +                       break;
> +               }
> +
> +               ret = sc2731_charger_get_current_limit(info, &cur);
> +               if (ret)
> +                       return ret;
> +
> +               val->intval = cur;
> +               break;
> +
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int sc2731_charger_property_is_writeable(struct power_supply *psy,
> +                                               enum
power_supply_property psp)
> +{
> +       int ret;
> +
> +       switch (psp) {
> +       case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
> +       case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
> +               ret = 1;
> +               break;
> +       default:
> +               ret = 0;
> +       }
> +
> +       return ret;
> +}
> +
> +static enum power_supply_property sc2731_usb_props[] = {
> +       POWER_SUPPLY_PROP_STATUS,
> +       POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT,
> +       POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT,
> +};
> +
> +static const struct power_supply_desc sc2731_charger_desc = {
> +       .name                   = "sc2731_charger",
> +       .type                   = POWER_SUPPLY_TYPE_USB,
> +       .properties             = sc2731_usb_props,
> +       .num_properties         = ARRAY_SIZE(sc2731_usb_props),
> +       .get_property           = sc2731_charger_usb_get_property,
> +       .set_property           = sc2731_charger_usb_set_property,
> +       .property_is_writeable  = sc2731_charger_property_is_writeable,
> +};
> +
> +static int sc2731_charger_usb_change(struct notifier_block *nb,
> +                                    unsigned long limit, void *data)
> +{
> +       struct sc2731_charger_info *info =
> +               container_of(nb, struct sc2731_charger_info, usb_notify);
> +       int ret;
> +
> +       /* set current limitation and start to charge */
> +       if (limit > 0) {
> +               ret = sc2731_charger_set_current_limit(info, limit);
> +               if (ret)
> +                       return ret;
> +
> +               ret = sc2731_charger_set_current(info, limit);
> +               if (ret)
> +                       return ret;
> +
> +               ret = sc2731_charger_start_charge(info);
> +               if (ret)
> +                       return ret;
> +
> +               info->charging = true;
> +               return 0;
> +       }
> +
> +       /* Stop charging */
> +       sc2731_charger_stop_charge(info);
> +       info->charging = false;

Here and in other places (get_property) you depend on information from USB
phy. But maybe your device already provides information whether it is
charging or not. It should be more accurate.

> +
> +       return 0;
> +}
> +
> +static int sc2731_charger_hw_init(struct sc2731_charger_info *info)
> +{
> +       int ret;
> +
> +       /* Enable charger module */
> +       ret = regmap_update_bits(info->regmap, SC2731_MODULE_EN1,
> +                                SC2731_CHARGE_EN, SC2731_CHARGE_EN);
> +       if (ret)
> +               return ret;
> +
> +       /* Set default charge termination current to 120 mA */

Looks like DeviceTree property.

> +       ret = regmap_update_bits(info->regmap, info->base +
SC2731_CHG_CFG2,
> +                                SC2731_TERMINATION_CUR_MASK, 0x2);
> +       if (ret)
> +               goto error;
> +
> +       /* Set default charge termination voltage to 4.35V */

Looks like DeviceTree property.

Best regards,
Krzysztof

--000000000000dd3f69057493ca31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Tue, 28 Aug 2018 at 11:04, Baolin Wang &lt;<a href=3D"m=
ailto:baolin.wang@linaro.org">baolin.wang@linaro.org</a>&gt; wrote:<br>&gt;=
<br>&gt; This patch adds the SC2731 PMIC switch charger support.<br>&gt;<br=
>&gt; Signed-off-by: Baolin Wang &lt;<a href=3D"mailto:baolin.wang@linaro.o=
rg">baolin.wang@linaro.org</a>&gt;<br>&gt; ---<br>&gt; =C2=A0drivers/power/=
supply/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A07 +<br>&gt;=
 =C2=A0drivers/power/supply/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A01 +<br>&gt; =C2=A0drivers/power/supply/sc2731_charger.c | =C2=A0451 +=
++++++++++++++++++++++++++++++++<br>&gt; =C2=A03 files changed, 459 inserti=
ons(+)<br>&gt; =C2=A0create mode 100644 drivers/power/supply/sc2731_charger=
.c<br>&gt;<br>&gt; diff --git a/drivers/power/supply/Kconfig b/drivers/powe=
r/supply/Kconfig<br>&gt; index ff6dab0..f27cf07 100644<br>&gt; --- a/driver=
s/power/supply/Kconfig<br>&gt; +++ b/drivers/power/supply/Kconfig<br>&gt; @=
@ -645,4 +645,11 @@ config CHARGER_CROS_USBPD<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 what is connected to USB PD ports from the EC and converts<br=
>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 that into power_supply properties.=
<br>&gt;<br>&gt; +config CHARGER_SC2731<br>&gt; + =C2=A0 =C2=A0 =C2=A0 tris=
tate &quot;Spreadtrum SC2731 charger driver&quot;<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 depends on MFD_SC27XX_PMIC || COMPILE_TEST<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 help<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0Say Y here to enable suppo=
rt for battery charging with SC2731<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0PM=
IC chips.<br>&gt; +<br>&gt; =C2=A0endif # POWER_SUPPLY<br>&gt; diff --git a=
/drivers/power/supply/Makefile b/drivers/power/supply/Makefile<br>&gt; inde=
x a26b402..767105b 100644<br>&gt; --- a/drivers/power/supply/Makefile<br>&g=
t; +++ b/drivers/power/supply/Makefile<br>&gt; @@ -85,3 +85,4 @@ obj-$(CONF=
IG_CHARGER_TPS65217) =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D tps65217_charger.o<br>=
&gt; =C2=A0obj-$(CONFIG_AXP288_FUEL_GAUGE) +=3D axp288_fuel_gauge.o<br>&gt;=
 =C2=A0obj-$(CONFIG_AXP288_CHARGER) =C2=A0 +=3D axp288_charger.o<br>&gt; =
=C2=A0obj-$(CONFIG_CHARGER_CROS_USBPD) =C2=A0 =C2=A0 =C2=A0 +=3D cros_usbpd=
-charger.o<br>&gt; +obj-$(CONFIG_CHARGER_SC2731) =C2=A0 +=3D sc2731_charger=
.o<br>&gt; diff --git a/drivers/power/supply/sc2731_charger.c b/drivers/pow=
er/supply/sc2731_charger.c<br>&gt; new file mode 100644<br>&gt; index 00000=
00..49ae16a<br>&gt; --- /dev/null<br>&gt; +++ b/drivers/power/supply/sc2731=
_charger.c<br>&gt; @@ -0,0 +1,451 @@<br>&gt; +// SPDX-License-Identifier: G=
PL-2.0<br>&gt; +// Copyright (C) 2018 Spreadtrum Communications Inc.<br>&gt=
; +<br>&gt; +#include &lt;linux/err.h&gt;<br>&gt; +#include &lt;linux/modul=
e.h&gt;<br>&gt; +#include &lt;linux/platform_device.h&gt;<br>&gt; +#include=
 &lt;linux/power_supply.h&gt;<br>&gt; +#include &lt;linux/slab.h&gt;<br><br=
>slab.h includes looks not needed.<br><br>&gt; +#include &lt;linux/usb/phy.=
h&gt;<br>&gt; +#include &lt;linux/regmap.h&gt;<br>&gt; +#include &lt;linux/=
extcon.h&gt;<br><br>Looks not used.<br><br>&gt; +#include &lt;linux/notifie=
r.h&gt;<br>&gt; +#include &lt;linux/of.h&gt;<br>&gt; +<br>&gt; +/* PMIC glo=
bal registers definition */<br>&gt; +#define SC2731_CHARGE_STATUS =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xedc<br>&gt; +#define SC2731_CHARGE_FULL =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(4)<br>&gt; +#define SC2731_MODUL=
E_EN1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xc0c<br>&gt; +#defin=
e SC2731_CHARGE_EN =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(5)<=
br>&gt; +<br>&gt; +/* SC2731 switch charger registers definition */<br>&gt;=
 +#define SC2731_CHG_CFG0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0<br>&gt; +#define SC2731_CHG_CFG1 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x4<br>&gt; +#define SC2731_CHG_CFG2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x8<br>&gt; +#define SC=
2731_CHG_CFG3 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00xc<br>&gt; +#define SC2731_CHG_CFG4 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x10<b=
r>&gt; +#define SC2731_CHG_CFG5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x28<br>&gt; +<br>&gt; +/* SC2731_=
CHG_CFG0 register definition */<br>&gt; +#define SC2731_PRECHG_RNG_SHIFT =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A011<br>&gt; +#define =
SC2731_PRECHG_RNG_MASK =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMASK(12, 11)<br>&gt; =
+<br>&gt; +#define SC2731_TERMINATION_VOL_MASK =C2=A0 =C2=A0GENMASK(2, 1)<b=
r>&gt; +#define SC2731_TERMINATION_VOL_SHIFT =C2=A0 1<br>&gt; +#define SC27=
31_TERMINATION_VOL_CAL_MASK =C2=A0 =C2=A0 =C2=A0 =C2=A0GENMASK(8, 3)<br>&gt=
; +#define SC2731_TERMINATION_VOL_CAL_SHIFT =C2=A0 =C2=A0 =C2=A0 3<br>&gt; =
+#define SC2731_TERMINATION_CUR_MASK =C2=A0 =C2=A0GENMASK(2, 0)<br>&gt; +<b=
r>&gt; +#define SC2731_CC_EN =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(13)<br>&gt; +#define SC2731_CHARGER_PD =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)<br>&gt; +<br>&gt; +/* SC2731_CHG_C=
FG1 register definition */<br>&gt; +#define SC2731_CUR_MASK =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GENMAS=
K(5, 0)<br>&gt; +<br>&gt; +/* SC2731_CHG_CFG5 register definition */<br>&gt=
; +#define SC2731_CUR_LIMIT_SHIFT =C2=A0 =C2=A0 =C2=A0 =C2=A0 8<br>&gt; +#d=
efine SC2731_CUR_LIMIT_MASK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GENMASK(9, 8)=
<br>&gt; +<br>&gt; +#define SC2731_CURRENT_LIMIT_100 =C2=A0 =C2=A0 =C2=A0 1=
00<br>&gt; +#define SC2731_CURRENT_LIMIT_500 =C2=A0 =C2=A0 =C2=A0 500<br>&g=
t; +#define SC2731_CURRENT_LIMIT_900 =C2=A0 =C2=A0 =C2=A0 900<br>&gt; +#def=
ine SC2731_CURRENT_LIMIT_2000 =C2=A0 =C2=A0 =C2=A02000<br>&gt; +<br>&gt; +#=
define SC2731_CURRENT_PRECHG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0450<br>&gt; =
+#define SC2731_CURRENT_STEP =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A050<br=
><br>What units are used for all these currents?<br><br>&gt; +<br>&gt; +str=
uct sc2731_charger_info {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 struct device *dev=
;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 struct regmap *regmap;<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 struct usb_phy *usb_phy;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 struc=
t notifier_block usb_notify;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 struct power_su=
pply *psy_usb;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 bool charging;<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 u32 base;<br>&gt; +};<br>&gt; +<br>&gt; +static void sc27=
31_charger_stop_charge(struct sc2731_charger_info *info)<br>&gt; +{<br>&gt;=
 + =C2=A0 =C2=A0 =C2=A0 regmap_update_bits(info-&gt;regmap, info-&gt;base +=
 SC2731_CHG_CFG0,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SC2731_CC_EN, 0);<br>&gt; +<br=
>&gt; + =C2=A0 =C2=A0 =C2=A0 regmap_update_bits(info-&gt;regmap, info-&gt;b=
ase + SC2731_CHG_CFG0,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SC2731_CHARGER_PD, SC2731_C=
HARGER_PD);<br>&gt; +}<br>&gt; +<br>&gt; +static int sc2731_charger_start_c=
harge(struct sc2731_charger_info *info)<br>&gt; +{<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 int ret;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 /* Enable charger =
constant current mode */<br>&gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D regmap_upda=
te_bits(info-&gt;regmap, info-&gt;base + SC2731_CHG_CFG0,<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SC2731_CC_EN, SC2731_CC_EN);<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 if (ret)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ret;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 /* Start ch=
arging */<br>&gt; + =C2=A0 =C2=A0 =C2=A0 return regmap_update_bits(info-&gt=
;regmap, info-&gt;base + SC2731_CHG_CFG0,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 SC2731_CHARGER_PD, 0);<br>&gt; +}<br>&gt; +<br>&gt; +stat=
ic int sc2731_charger_set_current_limit(struct sc2731_charger_info *info,<b=
r>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 u32 limit)<br>&gt; +{<br>&gt; + =C2=A0 =C2=A0 =C2=A0 u32 val;<br>&gt=
; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 if (limit &lt;=3D SC2731_CURRENT_LIMIT_1=
00)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 0;<b=
r>&gt; + =C2=A0 =C2=A0 =C2=A0 else if (limit &lt;=3D SC2731_CURRENT_LIMIT_5=
00)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 3;<b=
r>&gt; + =C2=A0 =C2=A0 =C2=A0 else if (limit &lt;=3D SC2731_CURRENT_LIMIT_9=
00)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 2;<b=
r>&gt; + =C2=A0 =C2=A0 =C2=A0 else<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 val =3D 1;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 re=
turn regmap_update_bits(info-&gt;regmap, info-&gt;base + SC2731_CHG_CFG5,<b=
r>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SC2731_CUR_LIMIT_MASK,<br>&gt=
; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val &lt;&lt; SC2731_CUR_LIMIT_SHI=
FT);<br>&gt; +}<br>&gt; +<br>&gt; +static int sc2731_charger_set_current(st=
ruct sc2731_charger_info *info, u32 cur)<br>&gt; +{<br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 u32 val;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 int ret;<br>&gt; +<br>&gt; =
+ =C2=A0 =C2=A0 =C2=A0 if (cur &gt; SC2731_CURRENT_LIMIT_2000)<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cur =3D SC2731_CURRENT_LIM=
IT_2000;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 else if (cur &lt; SC2731_CURRENT_PR=
ECHG)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cur =3D SC=
2731_CURRENT_PRECHG;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 /* Calculte t=
he step value, each step is 50 mA */<br><br>s/Calculte/Calculate/<br><br>&g=
t; + =C2=A0 =C2=A0 =C2=A0 val =3D (cur - SC2731_CURRENT_PRECHG) / SC2731_CU=
RRENT_STEP;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 /* Set pre-charge curr=
ent as 450 mA */<br>&gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D regmap_update_bits(=
info-&gt;regmap, info-&gt;base + SC2731_CHG_CFG0,<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0SC2731_PRECHG_RNG_MASK,<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x3 &lt;&lt; SC2731_PRECHG_RNG_SHIFT);<br>&gt; + =C2=A0=
 =C2=A0 =C2=A0 if (ret)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return ret;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 return regmap_=
update_bits(info-&gt;regmap, info-&gt;base + SC2731_CHG_CFG1,<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SC2731_CUR_MASK, val);<br>&gt; +}<br>&gt=
; +<br>&gt; +static int sc2731_charger_get_status(struct sc2731_charger_inf=
o *info)<br>&gt; +{<br>&gt; + =C2=A0 =C2=A0 =C2=A0 u32 val;<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 int ret;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D=
 regmap_read(info-&gt;regmap, SC2731_CHARGE_STATUS, &amp;val);<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 if (ret)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return ret;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 if (val =
&amp; SC2731_CHARGE_FULL)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return POWER_SUPPLY_STATUS_FULL;<br>&gt; +<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 return POWER_SUPPLY_STATUS_CHARGING;<br><br>What about POWER_SUP=
PLY_STATUS_DISCHARGING? When charger is not online you would return chargin=
g status...<br><br>&gt; +}<br>&gt; +<br>&gt; +static int sc2731_charger_get=
_current(struct sc2731_charger_info *info,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 *cur)<br>&gt; +{<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 int ret;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 u32 val;<br>&gt; +<br>&g=
t; + =C2=A0 =C2=A0 =C2=A0 ret =3D regmap_read(info-&gt;regmap, info-&gt;bas=
e + SC2731_CHG_CFG1, &amp;val);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 if (ret)<br>=
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>&gt;=
 +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 val &amp;=3D SC2731_CUR_MASK;<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 *cur =3D val * SC2731_CURRENT_STEP + SC2731_CURRENT_PR=
ECHG;<br><br>One empty line please.<br><br>&gt; + =C2=A0 =C2=A0 =C2=A0 retu=
rn 0;<br>&gt; +}<br>&gt; +<br>&gt; +static int sc2731_charger_get_current_l=
imit(struct sc2731_charger_info *info,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 *cur)<br>&gt; +{<br>&g=
t; + =C2=A0 =C2=A0 =C2=A0 int ret;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 u32 val;<=
br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D regmap_read(info-&gt;regma=
p, info-&gt;base + SC2731_CHG_CFG5, &amp;val);<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 if (ret)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
urn ret;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 val =3D (val &amp; SC2731=
_CUR_LIMIT_MASK) &gt;&gt; SC2731_CUR_LIMIT_SHIFT;<br>&gt; +<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 switch (val) {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 case 0:<br>=
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *cur =3D SC2731_CUR=
RENT_LIMIT_100;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
break;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 case 1:<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *cur =3D SC2731_CURRENT_LIMIT_200=
0;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>&gt=
; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 case 2:<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *cur =3D SC2731_CURRENT_LIMIT_900;<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>&gt; +<br>&gt; +=
 =C2=A0 =C2=A0 =C2=A0 case 3:<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 *cur =3D SC2731_CURRENT_LIMIT_500;<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 default:<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return -EINVAL;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt; +<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 return 0;<br>&gt; +}<br>&gt; +<br>&gt; +static int<br>&gt=
; +sc2731_charger_usb_set_property(struct power_supply *psy,<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enum power_supply_property psp,<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const union power_supply_propval *val)<br>&gt; =
+{<br>&gt; + =C2=A0 =C2=A0 =C2=A0 struct sc2731_charger_info *info =3D powe=
r_supply_get_drvdata(psy);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 int ret;<br>&gt; =
+<br>&gt; + =C2=A0 =C2=A0 =C2=A0 switch (psp) {<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:<br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sc2731_charger_set_current(info=
, val-&gt;intval);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (ret &lt; 0)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_warn(info-&gt;dev, &quot;set charge cur=
rent failed\n&quot;);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 break;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 case POWER_SUPPLY_PROP_INPUT_C=
URRENT_LIMIT:<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 re=
t =3D sc2731_charger_set_current_limit(info, val-&gt;intval);<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d=
ev_warn(info-&gt;dev, &quot;set input current limit failed\n&quot;);<br>&gt=
; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 default:<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ret =3D -EINVAL;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt; +<br>&=
gt; + =C2=A0 =C2=A0 =C2=A0 return ret;<br>&gt; +}<br>&gt; +<br>&gt; +static=
 int sc2731_charger_usb_get_property(struct power_supply *psy,<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0en=
um power_supply_property psp,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0union power_supply_propval *val)<br>&=
gt; +{<br>&gt; + =C2=A0 =C2=A0 =C2=A0 struct sc2731_charger_info *info =3D =
power_supply_get_drvdata(psy);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 u32 cur;<br>&=
gt; + =C2=A0 =C2=A0 =C2=A0 int ret;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 switch (psp) {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 case POWER_SUPPLY_PROP_ST=
ATUS:<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info-&=
gt;charging)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 val-&gt;intval =3D sc2731_charger_get_status(info)=
;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>&gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 val-&gt;intval =3D POWER_SUPPLY_STATUS_NOT_CHARGING;<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>&gt; +<br>&gt; + =C2=A0=
 =C2=A0 =C2=A0 case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!info-&gt;charging) {<=
br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 val-&gt;intval =3D 0;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; +<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sc2731_charger_get_current(i=
nfo, &amp;cur);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
if (ret)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 return ret;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 val-&gt;intval =3D cur;<br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>&gt; +<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!info-&gt;charging) {<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 val-&gt;intval =3D 0;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sc2731_charger_get_current_limit(info, =
&amp;cur);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r=
et)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return ret;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 val-&gt;intval =3D cur;<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 default:<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return -EINVAL;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt; +<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 return 0;<br>&gt; +}<br>&gt; +<br>&gt; +static int sc2731=
_charger_property_is_writeable(struct power_supply *psy,<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 enum power_supply_property psp)<br>&gt; +{<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 int ret;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 switch (psp) {<br>=
&gt; + =C2=A0 =C2=A0 =C2=A0 case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:=
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:=
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 1;<br>&=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 default:<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ret =3D 0;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&gt; +<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 return ret;<br>&gt; +}<br>&gt; +<br>&gt; +static enum =
power_supply_property sc2731_usb_props[] =3D {<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 POWER_SUPPLY_PROP_STATUS,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 POWER_SUPPLY_P=
ROP_CONSTANT_CHARGE_CURRENT,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 POWER_SUPPLY_PR=
OP_INPUT_CURRENT_LIMIT,<br>&gt; +};<br>&gt; +<br>&gt; +static const struct =
power_supply_desc sc2731_charger_desc =3D {<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
.name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &q=
uot;sc2731_charger&quot;,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 .type =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D POWER_SUPPLY_TYPE_=
USB,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 .properties =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D sc2731_usb_props,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 .num_pr=
operties =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D ARRAY_SIZE(sc2731_usb_props),<br>&=
gt; + =C2=A0 =C2=A0 =C2=A0 .get_property =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D sc2731_charger_usb_get_property,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 .set_p=
roperty =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D sc2731_charger_usb_set_prope=
rty,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 .property_is_writeable =C2=A0=3D sc2731=
_charger_property_is_writeable,<br>&gt; +};<br>&gt; +<br>&gt; +static int s=
c2731_charger_usb_change(struct notifier_block *nb,<br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long limit, void *data)<br>&=
gt; +{<br>&gt; + =C2=A0 =C2=A0 =C2=A0 struct sc2731_charger_info *info =3D<=
br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 container_of(nb,=
 struct sc2731_charger_info, usb_notify);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 in=
t ret;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 /* set current limitation a=
nd start to charge */<br>&gt; + =C2=A0 =C2=A0 =C2=A0 if (limit &gt; 0) {<br=
>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sc2731_cha=
rger_set_current_limit(info, limit);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if (ret)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>&gt; +<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sc2731_charger_set=
_current(info, limit);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (ret)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D sc2731_charger_start_charge(info=
);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>&=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return ret;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 info-&gt;charging =3D true;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 }<br>&=
gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 /* Stop charging */<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 sc2731_charger_stop_charge(info);<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 info-&gt;charging =3D false;<br><br>Here and in other places (get_prope=
rty) you depend on information from USB phy. But maybe your device already =
provides information whether it is charging or not. It should be more accur=
ate.<br><br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 return 0;<br>&gt; +}<br>&=
gt; +<br>&gt; +static int sc2731_charger_hw_init(struct sc2731_charger_info=
 *info)<br>&gt; +{<br>&gt; + =C2=A0 =C2=A0 =C2=A0 int ret;<br>&gt; +<br>&gt=
; + =C2=A0 =C2=A0 =C2=A0 /* Enable charger module */<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 ret =3D regmap_update_bits(info-&gt;regmap, SC2731_MODULE_EN1,<b=
r>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SC2731_CHARGE_EN, SC2731_CHARG=
E_EN);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 if (ret)<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>&gt; +<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 /* Set default charge termination current to 120 mA */<br><br>Lo=
oks like DeviceTree property.<div><br>&gt; + =C2=A0 =C2=A0 =C2=A0 ret =3D r=
egmap_update_bits(info-&gt;regmap, info-&gt;base + SC2731_CHG_CFG2,<br>&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SC2731_TERMINATION_CUR_MASK, 0x2);=
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 if (ret)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 /* Set default charge termination voltage to 4.35V */<br><br>Looks like=
 DeviceTree property.</div><div><br></div><div>Best regards,</div><div>Krzy=
sztof</div></div>

--000000000000dd3f69057493ca31--
