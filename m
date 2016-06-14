From: Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 2/2] phy: rockchip-inno-usb2: add a new driver for
 Rockchip usb2phy
Date: Tue, 14 Jun 2016 06:50:31 -0700
Message-ID: <CABXOdTfzDeg3KOmEkJkeUWs76wFind89D-bSrs=7-jSxmdhSHQ@mail.gmail.com>
References: <1465783810-18756-1-git-send-email-frank.wang@rock-chips.com>
 <1465783810-18756-3-git-send-email-frank.wang@rock-chips.com> <7225720.0AClDW7eQ6@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7225720.0AClDW7eQ6@diego>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ziyuan Xu <xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 14, 2016 at 6:27 AM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> Am Montag, 13. Juni 2016, 10:10:10 schrieb Frank Wang:
>> The newer SoCs (rk3366, rk3399) take a different usb-phy IP block
>> than rk3288 and before, and most of phy-related registers are also
>> different from the past, so a new phy driver is required necessarily=
=2E
>>
>> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>
>> Changes in v5:
>>  - Added 'reg' in the data block to match the different phy-blocks i=
n dt.
>>
>> Changes in v4:
>>  - Removed some processes related to 'vbus_host-supply'.
>>
>> Changes in v3:
>>  - Resolved the mapping defect between fixed value in driver and the
>> property in devicetree.
>>  - Optimized 480m output clock register function.
>>  - Code cleanup.
>>
>> Changes in v2:
>>  - Changed vbus_host operation from gpio to regulator in *_probe.
>>  - Improved the fault treatment relate to 480m clock register.
>>  - Cleaned up some meaningless codes in *_clk480m_disable.
>>  - made more clear the comment of *_sm_work.
>>
>>  drivers/phy/Kconfig                  |    7 +
>>  drivers/phy/Makefile                 |    1 +
>>  drivers/phy/phy-rockchip-inno-usb2.c |  645
>> ++++++++++++++++++++++++++++++++++ 3 files changed, 653 insertions(+=
)
>>  create mode 100644 drivers/phy/phy-rockchip-inno-usb2.c
>>
>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>> index b869b98..29ef15c 100644
>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>> @@ -347,6 +347,13 @@ config PHY_ROCKCHIP_USB
>>       help
>>         Enable this to support the Rockchip USB 2.0 PHY.
>>
>> +config PHY_ROCKCHIP_INNO_USB2
>> +     tristate "Rockchip INNO USB2PHY Driver"
>> +     depends on ARCH_ROCKCHIP && OF
>> +     select GENERIC_PHY
>> +     help
>> +       Support for Rockchip USB2.0 PHY with Innosilicon IP block.
>> +
>>  config PHY_ROCKCHIP_EMMC
>>       tristate "Rockchip EMMC PHY Driver"
>>       depends on ARCH_ROCKCHIP && OF
>> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
>> index 9c3e73c..4963fbc 100644
>> --- a/drivers/phy/Makefile
>> +++ b/drivers/phy/Makefile
>> @@ -38,6 +38,7 @@ phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)  +=3D
>> phy-s5pv210-usb2.o obj-$(CONFIG_PHY_EXYNOS5_USBDRD)   +=3D phy-exyno=
s5-usbdrd.o
>>  obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)  +=3D phy-qcom-apq8064-sata.o
>>  obj-$(CONFIG_PHY_ROCKCHIP_USB) +=3D phy-rockchip-usb.o
>> +obj-$(CONFIG_PHY_ROCKCHIP_INNO_USB2) +=3D phy-rockchip-inno-usb2.o
>>  obj-$(CONFIG_PHY_ROCKCHIP_EMMC) +=3D phy-rockchip-emmc.o
>>  obj-$(CONFIG_PHY_ROCKCHIP_DP)                +=3D phy-rockchip-dp.o
>>  obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)  +=3D phy-qcom-ipq806x-sata.o
>> diff --git a/drivers/phy/phy-rockchip-inno-usb2.c
>> b/drivers/phy/phy-rockchip-inno-usb2.c new file mode 100644
>> index 0000000..fc599c7
>> --- /dev/null
>> +++ b/drivers/phy/phy-rockchip-inno-usb2.c
>> @@ -0,0 +1,645 @@
>> +/*
>> + * Rockchip USB2.0 PHY with Innosilicon IP block driver
>> + *
>> + * Copyright (C) 2016 Fuzhou Rockchip Electronics Co., Ltd
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License as publishe=
d by
>> + * the Free Software Foundation; either version 2 of the License, o=
r
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/delay.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/mfd/syscon.h>
>> +
>> +#define BIT_WRITEABLE_SHIFT  16
>> +#define SCHEDULE_DELAY       (60 * HZ)
>> +
>> +enum rockchip_usb2phy_port_id {
>> +     USB2PHY_PORT_OTG,
>> +     USB2PHY_PORT_HOST,
>> +     USB2PHY_NUM_PORTS,
>> +};
>> +
>> +enum rockchip_usb2phy_host_state {
>> +     PHY_STATE_HS_ONLINE     =3D 0,
>> +     PHY_STATE_DISCONNECT    =3D 1,
>> +     PHY_STATE_HS_CONNECT    =3D 2,
>> +     PHY_STATE_FS_CONNECT    =3D 4,
>> +};
>> +
>> +struct usb2phy_reg {
>> +     unsigned int    offset;
>> +     unsigned int    bitend;
>> +     unsigned int    bitstart;
>> +     unsigned int    disable;
>> +     unsigned int    enable;
>> +};
>> +
>> +/**
>> + * struct rockchip_usb2phy_port_cfg: usb-phy port configuration.
>> + * @phy_sus: phy suspend register.
>> + * @ls_det_en: linestate detection enable register.
>> + * @ls_det_st: linestate detection state register.
>> + * @ls_det_clr: linestate detection clear register.
>> + * @utmi_ls: utmi linestate state register.
>> + * @utmi_hstdet: utmi host disconnect register.
>> + */
>> +struct rockchip_usb2phy_port_cfg {
>> +     struct usb2phy_reg      phy_sus;
>> +     struct usb2phy_reg      ls_det_en;
>> +     struct usb2phy_reg      ls_det_st;
>> +     struct usb2phy_reg      ls_det_clr;
>> +     struct usb2phy_reg      utmi_ls;
>> +     struct usb2phy_reg      utmi_hstdet;
>> +};
>> +
>> +/**
>> + * struct rockchip_usb2phy_cfg: usb-phy configuration.
>> + * @reg: the address offset of grf for usb-phy config.
>> + * @num_ports: specify how many ports that the phy has.
>> + * @clkout_ctl: keep on/turn off output clk of phy.
>> + */
>> +struct rockchip_usb2phy_cfg {
>> +     unsigned int    reg;
>> +     unsigned int    num_ports;
>> +     struct usb2phy_reg      clkout_ctl;
>> +     const struct rockchip_usb2phy_port_cfg  port_cfgs[USB2PHY_NUM_=
PORTS];
>> +};
>> +
>> +/**
>> + * struct rockchip_usb2phy_port: usb-phy port data.
>> + * @port_id: flag for otg port or host port.
>> + * @suspended: phy suspended flag.
>> + * @ls_irq: IRQ number assigned for linestate detection.
>> + * @mutex: for register updating in sm_work.
>> + * @sm_work: OTG state machine work.
>> + * @phy_cfg: port register configuration, assigned by driver data.
>> + */
>> +struct rockchip_usb2phy_port {
>> +     struct phy      *phy;
>> +     unsigned int    port_id;
>> +     bool            suspended;
>> +     int             ls_irq;
>> +     struct mutex    mutex;
>> +     struct          delayed_work sm_work;
>> +     const struct    rockchip_usb2phy_port_cfg *port_cfg;
>> +};
>> +
>> +/**
>> + * struct rockchip_usb2phy: usb2.0 phy driver data.
>> + * @grf: General Register Files regmap.
>> + * @clk: clock struct of phy input clk.
>> + * @clk480m: clock struct of phy output clk.
>> + * @clk_hw: clock struct of phy output clk management.
>> + * @phy_cfg: phy register configuration, assigned by driver data.
>> + * @ports: phy port instance.
>> + */
>> +struct rockchip_usb2phy {
>> +     struct device   *dev;
>> +     struct regmap   *grf;
>> +     struct clk      *clk;
>> +     struct clk      *clk480m;
>> +     struct clk_hw   clk480m_hw;
>> +     const struct rockchip_usb2phy_cfg       *phy_cfg;
>> +     struct rockchip_usb2phy_port    ports[USB2PHY_NUM_PORTS];
>> +};
>> +
>> +static inline int property_enable(struct rockchip_usb2phy *rphy,
>> +                               const struct usb2phy_reg *reg, bool =
en)
>> +{
>> +     unsigned int val, mask, tmp;
>> +
>> +     tmp =3D en ? reg->enable : reg->disable;
>> +     mask =3D GENMASK(reg->bitend, reg->bitstart);
>> +     val =3D (tmp << reg->bitstart) | (mask << BIT_WRITEABLE_SHIFT)=
;
>> +
>> +     return regmap_write(rphy->grf, reg->offset, val);
>> +}
>> +
>> +static inline bool property_enabled(struct rockchip_usb2phy *rphy,
>> +                                 const struct usb2phy_reg *reg)
>> +{
>> +     int ret;
>> +     unsigned int tmp, orig;
>> +     unsigned int mask =3D GENMASK(reg->bitend, reg->bitstart);
>> +
>> +     ret =3D regmap_read(rphy->grf, reg->offset, &orig);
>> +     if (ret)
>> +             return false;
>> +
>> +     tmp =3D (orig & mask) >> reg->bitstart;
>> +     return tmp =3D=3D reg->enable;
>> +}
>> +
>> +static int rockchip_usb2phy_clk480m_enable(struct clk_hw *hw)
>> +{
>> +     struct rockchip_usb2phy *rphy =3D
>> +             container_of(hw, struct rockchip_usb2phy, clk480m_hw);
>> +     int ret;
>> +
>> +     /* turn on 480m clk output if it is off */
>> +     if (!property_enabled(rphy, &rphy->phy_cfg->clkout_ctl)) {
>> +             ret =3D property_enable(rphy, &rphy->phy_cfg->clkout_c=
tl, true);
>> +             if (ret)
>> +                     return ret;
>> +
>> +             /* waitting for the clk become stable */
>> +             mdelay(1);
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static void rockchip_usb2phy_clk480m_disable(struct clk_hw *hw)
>> +{
>> +     struct rockchip_usb2phy *rphy =3D
>> +             container_of(hw, struct rockchip_usb2phy, clk480m_hw);
>> +
>> +     /* turn off 480m clk output */
>> +     property_enable(rphy, &rphy->phy_cfg->clkout_ctl, false);
>> +}
>> +
>> +static int rockchip_usb2phy_clk480m_enabled(struct clk_hw *hw)
>> +{
>> +     struct rockchip_usb2phy *rphy =3D
>> +             container_of(hw, struct rockchip_usb2phy, clk480m_hw);
>> +
>> +     return property_enabled(rphy, &rphy->phy_cfg->clkout_ctl);
>> +}
>> +
>> +static unsigned long
>> +rockchip_usb2phy_clk480m_recalc_rate(struct clk_hw *hw,
>> +                                  unsigned long parent_rate)
>> +{
>> +     return 480000000;
>> +}
>> +
>> +static const struct clk_ops rockchip_usb2phy_clkout_ops =3D {
>> +     .enable =3D rockchip_usb2phy_clk480m_enable,
>> +     .disable =3D rockchip_usb2phy_clk480m_disable,
>> +     .is_enabled =3D rockchip_usb2phy_clk480m_enabled,
>> +     .recalc_rate =3D rockchip_usb2phy_clk480m_recalc_rate,
>> +};
>> +
>> +static void rockchip_usb2phy_clk480m_unregister(void *data)
>> +{
>> +     struct rockchip_usb2phy *rphy =3D data;
>> +
>> +     of_clk_del_provider(rphy->dev->of_node);
>> +     clk_unregister(rphy->clk480m);
>> +
>> +     if (rphy->clk)
>> +             clk_put(rphy->clk);
>> +}
>> +
>> +static int
>> +rockchip_usb2phy_clk480m_register(struct rockchip_usb2phy *rphy)
>> +{
>> +     struct device_node *node =3D rphy->dev->of_node;
>> +     struct clk_init_data init;
>> +     const char *clk_name;
>> +     int ret;
>> +
>> +     init.flags =3D 0;
>> +     init.name =3D "clk_usbphy_480m";
>> +     init.ops =3D &rockchip_usb2phy_clkout_ops;
>> +
>> +     /* optional override of the clockname */
>> +     of_property_read_string(node, "clock-output-names", &init.name=
);
>> +
>> +     rphy->clk =3D of_clk_get_by_name(node, "phyclk");
>> +     if (IS_ERR(rphy->clk)) {
>> +             rphy->clk =3D NULL;
>> +             init.parent_names =3D NULL;
>> +             init.num_parents =3D 0;
>> +     } else {
>> +             clk_name =3D __clk_get_name(rphy->clk);
>> +             init.parent_names =3D &clk_name;
>> +             init.num_parents =3D 1;
>> +     }
>> +
>> +     rphy->clk480m_hw.init =3D &init;
>> +
>> +     /* register the clock */
>> +     rphy->clk480m =3D clk_register(rphy->dev, &rphy->clk480m_hw);
>> +     if (IS_ERR(rphy->clk480m)) {
>> +             ret =3D PTR_ERR(rphy->clk480m);
>> +             goto err_register;
>> +     }
>> +
>> +     ret =3D of_clk_add_provider(node, of_clk_src_simple_get, rphy-=
>clk480m);
>> +     if (ret < 0)
>> +             goto err_clk_provider;
>> +
>> +     ret =3D devm_add_action(rphy->dev, rockchip_usb2phy_clk480m_un=
register,
>> +                           rphy);
>> +     if (ret < 0)
>> +             goto err_unreg_action;
>> +
>> +     return 0;
>> +
>> +err_unreg_action:
>> +     of_clk_del_provider(node);
>> +err_clk_provider:
>> +     clk_unregister(rphy->clk480m);
>> +err_register:
>> +     if (rphy->clk)
>> +             clk_put(rphy->clk);
>> +     return ret;
>> +}
>> +
>> +static int rockchip_usb2phy_init(struct phy *phy)
>> +{
>> +     struct rockchip_usb2phy_port *rport =3D phy_get_drvdata(phy);
>> +     struct rockchip_usb2phy *rphy =3D dev_get_drvdata(phy->dev.par=
ent);
>> +     int ret;
>> +
>
>         if (!rport->port_cfg)
>                 return 0;
>
> Otherwise the currently empty otg-port will cause null-pointer derefe=
rences
> when it gets assigned in the devicetree already.
>

Not really, at least not here - that port should not have port_id set
to USB2PHY_PORT_HOST.

Does it even make sense to instantiate the otg port ? Is it going to
do anything without port configuration ?

>
>> +     if (rport->port_id =3D=3D USB2PHY_PORT_HOST) {
>> +             /* clear linestate and enable linestate detect irq */
>> +             mutex_lock(&rport->mutex);
>> +
>> +             ret =3D property_enable(rphy, &rport->port_cfg->ls_det=
_clr, true);
>> +             if (ret) {
>> +                     mutex_unlock(&rport->mutex);
>> +                     return ret;
>> +             }
>> +
>> +             ret =3D property_enable(rphy, &rport->port_cfg->ls_det=
_en, true);
>> +             if (ret) {
>> +                     mutex_unlock(&rport->mutex);
>> +                     return ret;
>> +             }
>> +
>> +             mutex_unlock(&rport->mutex);
>> +             schedule_delayed_work(&rport->sm_work, SCHEDULE_DELAY)=
;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int rockchip_usb2phy_resume(struct phy *phy)
>> +{
>> +     struct rockchip_usb2phy_port *rport =3D phy_get_drvdata(phy);
>> +     struct rockchip_usb2phy *rphy =3D dev_get_drvdata(phy->dev.par=
ent);
>> +     int ret;
>> +
>> +     dev_dbg(&rport->phy->dev, "port resume\n");
>
>         if (!rport->port_cfg)
>                 return 0;
>
>> +
>> +     ret =3D clk_prepare_enable(rphy->clk480m);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret =3D property_enable(rphy, &rport->port_cfg->phy_sus, false=
);
>> +     if (ret)
>> +             return ret;
>> +
>> +     rport->suspended =3D false;
>> +     return 0;
>> +}
>> +
>> +static int rockchip_usb2phy_suspend(struct phy *phy)
>> +{
>> +     struct rockchip_usb2phy_port *rport =3D phy_get_drvdata(phy);
>> +     struct rockchip_usb2phy *rphy =3D dev_get_drvdata(phy->dev.par=
ent);
>> +     int ret;
>> +
>
>         if (!rport->port_cfg)
>                 return 0;
>
>> +     dev_dbg(&rport->phy->dev, "port suspend\n");
>> +
>> +     ret =3D property_enable(rphy, &rport->port_cfg->phy_sus, true)=
;
>> +     if (ret)
>> +             return ret;
>> +
>> +     rport->suspended =3D true;
>> +     clk_disable_unprepare(rphy->clk480m);
>> +     return 0;
>> +}
>> +
>> +static int rockchip_usb2phy_exit(struct phy *phy)
>> +{
>> +     struct rockchip_usb2phy_port *rport =3D phy_get_drvdata(phy);
>> +
>
>         if (!rport->port_cfg)
>                 return 0;
>
No access to port_cfg here ?

>> +     if (rport->port_id =3D=3D USB2PHY_PORT_HOST)
>> +             cancel_delayed_work_sync(&rport->sm_work);
>> +
>
> you will also need to resume the port here, if it is suspended at thi=
s point,
> as phy_power_off gets called after phy_exit and would probably produc=
e clk
> enable/disable mismatches otherwise.
>
>
>> +     return 0;
>> +}
>> +
>> +static const struct phy_ops rockchip_usb2phy_ops =3D {
>> +     .init           =3D rockchip_usb2phy_init,
>> +     .exit           =3D rockchip_usb2phy_exit,
>> +     .power_on       =3D rockchip_usb2phy_resume,
>> +     .power_off      =3D rockchip_usb2phy_suspend,
>> +     .owner          =3D THIS_MODULE,
>> +};
>> +
>> +/*
>> + * The function manage host-phy port state and suspend/resume phy p=
ort
>> + * to save power.
>> + *
>> + * we rely on utmi_linestate and utmi_hostdisconnect to identify wh=
ether
>> + * FS/HS is disconnect or not. Besides, we do not need care it is F=
S
>> + * disconnected or HS disconnected, actually, we just only need get=
 the
>> + * device is disconnected at last through rearm the delayed work,
>> + * to suspend the phy port in _PHY_STATE_DISCONNECT_ case.
>> + *
>> + * NOTE: It may invoke *phy_suspend or *phy_resume which will invok=
e some
>> + * clk related APIs, so do not invoke it from interrupt context dir=
ectly.
>> + */
>> +static void rockchip_usb2phy_sm_work(struct work_struct *work)
>> +{
>> +     struct rockchip_usb2phy_port *rport =3D
>> +             container_of(work, struct rockchip_usb2phy_port, sm_wo=
rk.work);
>> +     struct rockchip_usb2phy *rphy =3D dev_get_drvdata(rport->phy->=
dev.parent);
>> +     unsigned int sh =3D rport->port_cfg->utmi_hstdet.bitend -
>> +                       rport->port_cfg->utmi_hstdet.bitstart + 1;
>> +     unsigned int ul, uhd, state;
>> +     unsigned int ul_mask, uhd_mask;
>> +     int ret;
>> +
>> +     mutex_lock(&rport->mutex);
>> +
>> +     ret =3D regmap_read(rphy->grf, rport->port_cfg->utmi_ls.offset=
, &ul);
>> +     if (ret < 0)
>> +             goto next_schedule;
>> +
>> +     ret =3D regmap_read(rphy->grf, rport->port_cfg->utmi_hstdet.of=
fset,
>> +                       &uhd);
>> +     if (ret < 0)
>> +             goto next_schedule;
>> +
>> +     uhd_mask =3D GENMASK(rport->port_cfg->utmi_hstdet.bitend,
>> +                        rport->port_cfg->utmi_hstdet.bitstart);
>> +     ul_mask =3D GENMASK(rport->port_cfg->utmi_ls.bitend,
>> +                       rport->port_cfg->utmi_ls.bitstart);
>> +
>> +     /* stitch on utmi_ls and utmi_hstdet as phy state */
>> +     state =3D ((uhd & uhd_mask) >> rport->port_cfg->utmi_hstdet.bi=
tstart) |
>> +             (((ul & ul_mask) >> rport->port_cfg->utmi_ls.bitstart)=
 << sh);
>> +
>> +     switch (state) {
>> +     case PHY_STATE_HS_ONLINE:
>> +             dev_dbg(&rport->phy->dev, "HS online\n");
>> +             break;
>> +     case PHY_STATE_FS_CONNECT:
>> +             /*
>> +              * For FS device, the online state share with connect =
state
>> +              * from utmi_ls and utmi_hstdet register, so we distin=
guish
>> +              * them via suspended flag.
>> +              */
>> +             if (!rport->suspended) {
>> +                     dev_dbg(&rport->phy->dev, "FS online\n");
>> +                     break;
>> +             }
>> +             /* fall through */
>> +     case PHY_STATE_HS_CONNECT:
>> +             if (rport->suspended) {
>> +                     dev_dbg(&rport->phy->dev, "HS/FS connected\n")=
;
>> +                     rockchip_usb2phy_resume(rport->phy);
>> +                     rport->suspended =3D false;
>> +             }
>> +             break;
>> +     case PHY_STATE_DISCONNECT:
>> +             if (!rport->suspended) {
>> +                     dev_dbg(&rport->phy->dev, "HS/FS disconnected\=
n");
>> +                     rockchip_usb2phy_suspend(rport->phy);
>> +                     rport->suspended =3D true;
>> +             }
>> +
>> +             /*
>> +              * activate the linestate detection to get the next de=
vice
>> +              * plug-in irq.
>> +              */
>> +             property_enable(rphy, &rport->port_cfg->ls_det_clr, tr=
ue);
>> +             property_enable(rphy, &rport->port_cfg->ls_det_en, tru=
e);
>> +
>> +             /*
>> +              * we don't need to rearm the delayed work when the ph=
y port
>> +              * is suspended.
>> +              */
>> +             mutex_unlock(&rport->mutex);
>> +             return;
>> +     default:
>> +             dev_dbg(&rport->phy->dev, "unknown phy state\n");
>> +             break;
>> +     }
>> +
>> +next_schedule:
>> +     mutex_unlock(&rport->mutex);
>> +     schedule_delayed_work(&rport->sm_work, SCHEDULE_DELAY);
>> +}
>> +
>> +static irqreturn_t rockchip_usb2phy_linestate_irq(int irq, void *da=
ta)
>> +{
>> +     struct rockchip_usb2phy_port *rport =3D data;
>> +     struct rockchip_usb2phy *rphy =3D dev_get_drvdata(rport->phy->=
dev.parent);
>> +
>> +     if (!property_enabled(rphy, &rport->port_cfg->ls_det_st))
>> +             return IRQ_NONE;
>> +
>> +     mutex_lock(&rport->mutex);
>> +
>> +     /* disable linestate detect irq and clear its status */
>> +     property_enable(rphy, &rport->port_cfg->ls_det_en, false);
>> +     property_enable(rphy, &rport->port_cfg->ls_det_clr, true);
>> +
>> +     mutex_unlock(&rport->mutex);
>> +
>> +     /*
>> +      * In this case for host phy port, a new device is plugged in,
>> +      * meanwhile, if the phy port is suspended, we need rearm the =
work to
>> +      * resume it and mange its states; otherwise, we do nothing ab=
out that.
>> +      */
>> +     if (rport->suspended && rport->port_id =3D=3D USB2PHY_PORT_HOS=
T)
>> +             rockchip_usb2phy_sm_work(&rport->sm_work.work);
>> +
>> +     return IRQ_HANDLED;
>> +}
>> +
>> +static int rockchip_usb2phy_host_port_init(struct rockchip_usb2phy =
*rphy,
>> +                                        struct rockchip_usb2phy_por=
t *rport,
>> +                                        struct device_node *child_n=
p)
>> +{
>> +     int ret;
>> +
>> +     rport->port_id =3D USB2PHY_PORT_HOST;
>> +     rport->port_cfg =3D &rphy->phy_cfg->port_cfgs[USB2PHY_PORT_HOS=
T];
>> +
>> +     mutex_init(&rport->mutex);
>> +     INIT_DELAYED_WORK(&rport->sm_work, rockchip_usb2phy_sm_work);
>> +
>> +     rport->ls_irq =3D of_irq_get_byname(child_np, "linestate");
>> +     if (rport->ls_irq < 0) {
>> +             dev_err(rphy->dev, "no linestate irq provided\n");
>> +             return rport->ls_irq;
>> +     }
>> +
>> +     ret =3D devm_request_threaded_irq(rphy->dev, rport->ls_irq, NU=
LL,
>> +                                     rockchip_usb2phy_linestate_irq=
,
>> +                                     IRQF_ONESHOT,
>> +                                     "rockchip_usb2phy", rport);
>> +     if (ret) {
>> +             dev_err(rphy->dev, "failed to request irq handle\n");
>> +             return ret;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int rockchip_usb2phy_probe(struct platform_device *pdev)
>> +{
>> +     struct device *dev =3D &pdev->dev;
>> +     struct device_node *np =3D dev->of_node;
>> +     struct device_node *child_np;
>> +     struct phy_provider *provider;
>> +     struct rockchip_usb2phy *rphy;
>> +     const struct rockchip_usb2phy_cfg *phy_cfgs;
>> +     const struct of_device_id *match;
>> +     unsigned int reg;
>> +     int index, ret;
>> +
>> +     rphy =3D devm_kzalloc(dev, sizeof(*rphy), GFP_KERNEL);
>> +     if (!rphy)
>> +             return -ENOMEM;
>> +
>> +     match =3D of_match_device(dev->driver->of_match_table, dev);
>> +     if (!match || !match->data) {
>> +             dev_err(dev, "phy configs are not assigned!\n");
>> +             return -EINVAL;
>> +     }
>> +
>> +     if (!dev->parent || !dev->parent->of_node)
>> +             return -EINVAL;
>> +
>> +     rphy->grf =3D syscon_node_to_regmap(dev->parent->of_node);
>> +     if (IS_ERR(rphy->grf))
>> +             return PTR_ERR(rphy->grf);
>> +
>> +     if (of_property_read_u32(np, "reg", &reg)) {
>> +             dev_err(dev, "the reg property is not assigned in %s n=
ode\n",
>> +                     np->name);
>> +             return -EINVAL;
>> +     }
>> +
>> +     rphy->dev =3D dev;
>> +     phy_cfgs =3D match->data;
>> +     platform_set_drvdata(pdev, rphy);
>> +
>> +     /* find out a proper config which can be matched with dt. */
>> +     index =3D 0;
>> +     while (phy_cfgs[index].reg) {
>> +             if (phy_cfgs[index].reg =3D=3D reg) {
>> +                     rphy->phy_cfg =3D &phy_cfgs[index];
>> +                     break;
>> +             }
>> +
>> +             ++index;
>> +     }
>> +
>> +     if (!rphy->phy_cfg) {
>> +             dev_err(dev, "no phy-config can be matched with %s nod=
e\n",
>> +                     np->name);
>> +             return -EINVAL;
>> +     }
>> +
>> +     ret =3D rockchip_usb2phy_clk480m_register(rphy);
>> +     if (ret) {
>> +             dev_err(dev, "failed to register 480m output clock\n")=
;
>> +             return ret;
>> +     }
>> +
>> +     index =3D 0;
>> +     for_each_available_child_of_node(np, child_np) {
>> +             struct rockchip_usb2phy_port *rport =3D &rphy->ports[i=
ndex];
>> +             struct phy *phy;
>> +
>> +             phy =3D devm_phy_create(dev, child_np, &rockchip_usb2p=
hy_ops);
>> +             if (IS_ERR(phy)) {
>> +                     dev_err(dev, "failed to create phy\n");
>> +                     ret =3D PTR_ERR(phy);
>> +                     goto put_child;
>> +             }
>> +
>> +             rport->phy =3D phy;
>
>         phy_set_drvdata(rport->phy, rport);
>
>> +
>> +             /* initialize otg/host port separately */
>> +             if (!of_node_cmp(child_np->name, "host-port")) {
>> +                     ret =3D rockchip_usb2phy_host_port_init(rphy, =
rport,
>> +                                                           child_np=
);
>> +                     if (ret)
>> +                             goto put_child;
>> +             }
>> +
>> +             phy_set_drvdata(rport->phy, rport);
>
> move this to the location above to prevent null-pointer dereferences =
with
> devices plugged in on boot.
>
> I've tested this a bit on a rk3036 (which is lacking the disconnect-d=
etection
> it seems), so in general (apart from the stuff mentioned above) this =
looks
> nice now. So with the stuff above fixed:
>
> Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Tested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>
>
> Heiko
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
