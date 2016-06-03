From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [v2, 2/2] phy: rockchip-inno-usb2: add a new driver for Rockchip usb2phy
Date: Fri, 03 Jun 2016 23:24:23 +0200
Message-ID: <1561602.DGny4Hlya3@diego>
References: <1464850090-99371-3-git-send-email-frank.wang@rock-chips.com> <20160603195922.GB3524@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160603195922.GB3524-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 3. Juni 2016, 12:59:22 schrieb Guenter Roeck:
> On Thu, Jun 02, 2016 at 02:48:10PM +0800, Frank Wang wrote:
> > The newer SoCs (rk3366, rk3399) take a different usb-phy IP block
> > than rk3288 and before, and most of phy-related registers are also
> > different from the past, so a new phy driver is required necessarily.
> > 
> > Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > ---
> > 
> > Changes in v2:
> >  - Changed vbus_host operation from gpio to regulator in *_probe.
> >  - Improved the fault treatment relate to 480m clock register.
> >  - Cleaned up some meaningless codes in *_clk480m_disable.
> >  - made more clear the comment of *_sm_work.
> >  
> >  drivers/phy/Kconfig                  |    7 +
> >  drivers/phy/Makefile                 |    1 +
> >  drivers/phy/phy-rockchip-inno-usb2.c |  604
> >  ++++++++++++++++++++++++++++++++++ 3 files changed, 612 insertions(+)
> >  create mode 100644 drivers/phy/phy-rockchip-inno-usb2.c
> > 
> > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > index b869b98..29ef15c 100644
> > --- a/drivers/phy/Kconfig
> > +++ b/drivers/phy/Kconfig
> > @@ -347,6 +347,13 @@ config PHY_ROCKCHIP_USB
> > 
> >  	help
> >  	
> >  	  Enable this to support the Rockchip USB 2.0 PHY.
> > 
> > +config PHY_ROCKCHIP_INNO_USB2
> > +	tristate "Rockchip INNO USB2PHY Driver"
> > +	depends on ARCH_ROCKCHIP && OF
> > +	select GENERIC_PHY
> > +	help
> > +	  Support for Rockchip USB2.0 PHY with Innosilicon IP block.
> > +
> > 
> >  config PHY_ROCKCHIP_EMMC
> >  
> >  	tristate "Rockchip EMMC PHY Driver"
> >  	depends on ARCH_ROCKCHIP && OF
> > 
> > diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> > index 9c3e73c..4963fbc 100644
> > --- a/drivers/phy/Makefile
> > +++ b/drivers/phy/Makefile
> > @@ -38,6 +38,7 @@ phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+=
> > phy-s5pv210-usb2.o> 
> >  obj-$(CONFIG_PHY_EXYNOS5_USBDRD)	+= phy-exynos5-usbdrd.o
> >  obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)	+= phy-qcom-apq8064-sata.o
> >  obj-$(CONFIG_PHY_ROCKCHIP_USB) += phy-rockchip-usb.o
> > 
> > +obj-$(CONFIG_PHY_ROCKCHIP_INNO_USB2)	+= phy-rockchip-inno-usb2.o
> > 
> >  obj-$(CONFIG_PHY_ROCKCHIP_EMMC) += phy-rockchip-emmc.o
> >  obj-$(CONFIG_PHY_ROCKCHIP_DP)		+= phy-rockchip-dp.o
> >  obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
> > 
> > diff --git a/drivers/phy/phy-rockchip-inno-usb2.c
> > b/drivers/phy/phy-rockchip-inno-usb2.c new file mode 100644
> > index 0000000..eca46ff
> > --- /dev/null
> > +++ b/drivers/phy/phy-rockchip-inno-usb2.c
> > @@ -0,0 +1,604 @@
> > +/*
> > + * Rockchip USB2.0 PHY with Innosilicon IP block driver
> > + *
> > + * Copyright (C) 2016 Fuzhou Rockchip Electronics Co., Ltd
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/delay.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
> > +
> > +#define BIT_WRITEABLE_SHIFT	16
> > +#define SCHEDULE_DELAY	(60 * HZ)
> > +
> > +enum rockchip_usb2phy_port_id {
> > +	USB2PHY_PORT_OTG,
> > +	USB2PHY_PORT_HOST,
> > +	USB2PHY_NUM_PORTS,
> > +};
> > +
> > +enum rockchip_usb2phy_host_state {
> > +	PHY_STATE_HS_ONLINE	= 0,
> > +	PHY_STATE_DISCONNECT	= 1,
> > +	PHY_STATE_HS_CONNECT	= 2,
> > +	PHY_STATE_FS_CONNECT	= 4,
> > +};
> > +
> > +struct usb2phy_reg {
> > +	unsigned int	offset;
> > +	unsigned int	bitend;
> > +	unsigned int	bitstart;
> > +	unsigned int	disable;
> > +	unsigned int	enable;
> > +};
> > +
> > +/**
> > + * struct rockchip_usb2phy_port_cfg: usb-phy port configuration.
> > + * @phy_sus: phy suspend register.
> > + * @ls_det_en: linestate detection enable register.
> > + * @ls_det_st: linestate detection state register.
> > + * @ls_det_clr: linestate detection clear register.
> > + * @utmi_ls: utmi linestate state register.
> > + * @utmi_hstdet: utmi host disconnect register.
> > + */
> > +struct rockchip_usb2phy_port_cfg {
> > +	struct usb2phy_reg	phy_sus;
> > +	struct usb2phy_reg	ls_det_en;
> > +	struct usb2phy_reg	ls_det_st;
> > +	struct usb2phy_reg	ls_det_clr;
> > +	struct usb2phy_reg	utmi_ls;
> > +	struct usb2phy_reg	utmi_hstdet;
> > +};
> > +
> > +/**
> > + * struct rockchip_usb2phy_cfg: usb-phy configuration.
> > + * @num_ports: specify how many ports that the phy has.
> > + * @clkout_ctl: keep on/turn off output clk of phy.
> > + */
> > +struct rockchip_usb2phy_cfg {
> > +	unsigned int	num_ports;
> > +	struct usb2phy_reg	clkout_ctl;
> > +	const struct rockchip_usb2phy_port_cfg	*port_cfgs;
> > +};
> > +
> > +/**
> > + * struct rockchip_usb2phy_port: usb-phy port data.
> > + * @port_id: flag for otg port or host port.
> > + * @suspended: phy suspended flag.
> > + * @ls_irq: IRQ number assigned for linestate detection.
> > + * @mutex: for register updating in sm_work.
> > + * @sm_work: OTG state machine work.
> > + * @phy_cfg: port register configuration, assigned by driver data.
> > + */
> > +struct rockchip_usb2phy_port {
> > +	struct phy	*phy;
> > +	unsigned int	port_id;
> > +	bool		suspended;
> > +	int		ls_irq;
> > +	struct mutex	mutex;
> > +	struct		delayed_work sm_work;
> > +	const struct	rockchip_usb2phy_port_cfg *port_cfg;
> > +};
> > +
> > +/**
> > + * struct rockchip_usb2phy: usb2.0 phy driver data.
> > + * @grf: General Register Files regmap.
> > + * @clk480m: clock struct of phy output clk.
> > + * @clk_hw: clock struct of phy output clk management.
> > + * @vbus_host: the regulator for vbus_host supply.
> > + * @phy_cfg: phy register configuration, assigned by driver data.
> > + * @ports: phy port instance.
> > + */
> > +struct rockchip_usb2phy {
> > +	struct device	*dev;
> > +	struct regmap	*grf;
> > +	struct clk	*clk480m;
> > +	struct clk_hw	clk480m_hw;
> > +	struct regulator	*vbus_host;
> > +	const struct rockchip_usb2phy_cfg	*phy_cfg;
> > +	struct rockchip_usb2phy_port	ports[USB2PHY_NUM_PORTS];
> > +};
> > +
> > +static inline int property_enable(struct rockchip_usb2phy *rphy,
> > +				  const struct usb2phy_reg *reg, bool en)
> > +{
> > +	unsigned int val, mask, tmp;
> > +
> > +	tmp = en ? reg->enable : reg->disable;
> > +	mask = GENMASK(reg->bitend, reg->bitstart);
> > +	val = (tmp << reg->bitstart) | (mask << BIT_WRITEABLE_SHIFT);
> > +
> > +	return regmap_write(rphy->grf, reg->offset, val);
> > +}
> > +
> > +static inline bool property_enabled(struct rockchip_usb2phy *rphy,
> > +				    const struct usb2phy_reg *reg)
> > +{
> > +	int ret;
> > +	unsigned int tmp, orig;
> > +	unsigned int mask = GENMASK(reg->bitend, reg->bitstart);
> > +
> > +	ret = regmap_read(rphy->grf, reg->offset, &orig);
> > +	if (ret)
> > +		return false;
> > +
> > +	tmp = (orig & mask) >> reg->bitstart;
> > +	return tmp == reg->enable;
> > +}
> > +
> > +static int rockchip_usb2phy_clk480m_enable(struct clk_hw *hw)
> > +{
> > +	struct rockchip_usb2phy *rphy =
> > +		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
> > +	int ret = 0;
> > +
> > +	/* turn on 480m clk output if it is off */
> > +	if (!property_enabled(rphy, &rphy->phy_cfg->clkout_ctl)) {
> > +		ret = property_enable(rphy, &rphy->phy_cfg->clkout_ctl, true);
> > +		if (ret)
> > +			return ret;
> > +
> > +		/* waitting for the clk become stable */
> > +		mdelay(1);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static void rockchip_usb2phy_clk480m_disable(struct clk_hw *hw)
> > +{
> > +	struct rockchip_usb2phy *rphy =
> > +		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
> > +
> > +	/* turn off 480m clk output */
> > +	property_enable(rphy, &rphy->phy_cfg->clkout_ctl, false);
> > +}
> > +
> > +static int rockchip_usb2phy_clk480m_enabled(struct clk_hw *hw)
> > +{
> > +	struct rockchip_usb2phy *rphy =
> > +		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
> > +
> > +	return property_enabled(rphy, &rphy->phy_cfg->clkout_ctl);
> > +}
> > +
> > +static unsigned long
> > +rockchip_usb2phy_clk480m_recalc_rate(struct clk_hw *hw,
> > +				     unsigned long parent_rate)
> > +{
> > +	return 480000000;
> > +}
> > +
> > +static const struct clk_ops rockchip_usb2phy_clkout_ops = {
> > +	.enable = rockchip_usb2phy_clk480m_enable,
> > +	.disable = rockchip_usb2phy_clk480m_disable,
> > +	.is_enabled = rockchip_usb2phy_clk480m_enabled,
> > +	.recalc_rate = rockchip_usb2phy_clk480m_recalc_rate,
> > +};
> > +
> > +static void rockchip_usb2phy_clk480m_unregister(void *data)
> > +{
> > +	struct rockchip_usb2phy *rphy = data;
> > +
> > +	of_clk_del_provider(rphy->dev->of_node);
> > +	clk_unregister(rphy->clk480m);
> > +}
> > +
> > +static struct clk *
> > +rockchip_usb2phy_clk480m_register(struct rockchip_usb2phy *rphy)
> > +{
> > +	struct device_node *node = rphy->dev->of_node;
> > +	struct clk *clk;
> > +	struct clk_init_data init;
> > +	int ret;
> > +
> > +	init.name = "clk_usbphy_480m";
> > +	init.ops = &rockchip_usb2phy_clkout_ops;
> > +	init.flags = CLK_IS_ROOT;
> 
> One more comment:
> 
> include/linux/clk-provider.h:#define CLK_IS_ROOT                BIT(4) /*
> Deprecated: Don't use */
> 
> ... and the definition has been removed in linux-next.

also, the created clock should be a child of the phy-supply clock. Please take 
a look at the picophy-variant (phy-rockchip-usb) that already handles that 
parent assignment.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
