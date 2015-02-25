From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/2] rockchip: efuse: add efuse driver for rk3288 efuse
Date: Thu, 26 Feb 2015 00:35:02 +0100
Message-ID: <1482124.H9onLN8roL@diego>
References: <1417419281-9243-1-git-send-email-jay.xu@rock-chips.com> <1529852.GW1hFGtilD@diego> <547DD519.4080505@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <547DD519.4080505-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jianqun <xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jianqun,

Am Dienstag, 2. Dezember 2014, 23:04:57 schrieb Jianqun:
> =E5=9C=A8 12/01/2014 10:10 PM, Heiko St=C3=BCbner =E5=86=99=E9=81=93:
> > Am Montag, 1. Dezember 2014, 15:34:41 schrieb Jianqun Xu:
> >> Add driver for efuse found on rk3288 board based on rk3288 SoC.
> >> Driver will read fuse information of chip at the boot stage of
> >> kernel, this information new is for further usage.
> >>=20
> >> Signed-off-by: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >=20
> > General question would be, what is the purpose of this driver?
>=20
> This driver will get efuse information, and other module will use it =
for
> some useage, such as dvfs will ajust OPP according to the differences
> between chips, that can make chips run on a powersave status
>=20
> Also can get the chip version... but this patch only show a part feat=
hur

just because I noticed this today, there seems to be an eeprom [0] and =
efuse=20
[1] framework in the works. And as the mail from Maxime [2] suggests, b=
oth=20
should probably merge.

So the rockchip efuse driver should probably the framework that will be=
come of=20
those two.


Heiko


[0] https://lkml.org/lkml/2015/2/19/307
[1] https://lkml.org/lkml/2015/2/25/173
[2] https://lkml.org/lkml/2015/2/25/191


> > I don't see any publically usable functions and the only thing happ=
ening
> > is
> > the
> >=20
> > 	dev_info(efuse->dev, "leakage (%d %d %d)\n",...
> >=20
> > output that emits some information from the efuse to the kernel log=
?
>=20
> can I make it a node under some debug directory ? For now only show i=
t in
> boot message.
> > In the dt-binding doc you write:
> >> The 32x32 eFuse can only be accessed by APB bus when IO_SECURITYse=
l is
> >> high.>=20
> > While the TRM also says this, IO_SECURITY is not mentioned anywhere=
 else
> > in
> > the document. Is this a pin or a bit somewhere in the GRF - i.e. so=
mething
> > whichs state is readable?
> >=20
> >=20
> > Some more comments inline.
> >=20
> >> ---
> >>=20
> >>  arch/arm/mach-rockchip/efuse.c | 165
> >>=20
> >> +++++++++++++++++++++++++++++++++++++++++ arch/arm/mach-rockchip/e=
fuse.h
> >> |
> >> 15 ++++
> >>=20
> >>  2 files changed, 180 insertions(+)
> >>  create mode 100644 arch/arm/mach-rockchip/efuse.c
> >>  create mode 100644 arch/arm/mach-rockchip/efuse.h
> >>=20
> >> diff --git a/arch/arm/mach-rockchip/efuse.c
> >> b/arch/arm/mach-rockchip/efuse.c new file mode 100644
> >> index 0000000..326d81e
> >> --- /dev/null
> >> +++ b/arch/arm/mach-rockchip/efuse.c
> >=20
> > a driver like this should probably live in something like
> > drivers/soc/rockchip.
> >=20
> >> @@ -0,0 +1,165 @@
> >> +/* mach-rockchip/efuse.c
> >> + *
> >> + * Copyright (c) 2014 Rockchip Electronics Co. Ltd.
> >> + * Author: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> + *
> >> + * Tmis program is free software; you can redistribute it and/or =
modify
> >> it
> >> + * under the terms of version 2 of the GNU General Public License=
 as
> >> + * published by the Free Software Foundation.
> >> + *
> >> + * Tmis program is distributed in the hope that it will be useful=
, but
> >=20
> > type Tmis -> This
> >=20
> >> WITHOUT + * ANY WARRANTY; without even the implied warranty of
> >> MERCHANTABILITY or + * FITNESS FOR A PARTICULAR PURPOSE.  See the =
GNU
> >> General Public License for + * more details.
> >> + *
> >> + * You should have received a copy of the GNU General Public Lice=
nse
> >> along
> >> with + * tmis program; if not, write to the Free Software Foundati=
on,
> >> Inc.,
> >> + * 51 Franklin Street, Fifth Floor, Boston, MA 02110, USA
> >> + *
> >> + * Tme full GNU General Public License is included in this distri=
bution
> >> in
> >> the + * file called LICENSE.
> >> + */
> >> +
> >> +#include <linux/kernel.h>
> >> +#include <linux/module.h>
> >> +#include <linux/device.h>
> >> +#include <linux/delay.h>
> >> +#include <linux/platform_device.h>
> >> +#include <linux/of_address.h>
> >> +#include <linux/io.h>
> >> +
> >> +#include "efuse.h"
> >> +
> >> +#define EFUSE_BUF_SIZE	(32)
> >> +#define EFUSE_BUF_LKG_CPU	(23)
> >> +#define EFUSE_BUF_LKG_GPU	(24)
> >> +#define EFUSE_BUF_LKG_LOG	(25)
> >=20
> > no braces needed for those numbers
> >=20
> >> +
> >> +struct rk_efuse_info {
> >> +	/* Platform device */
> >> +	struct device *dev;
> >> +
> >> +	/* Hardware resources */
> >> +	void __iomem *regs;
> >> +
> >> +	/* buffer to store registers' values */
> >> +	unsigned int buf[EFUSE_BUF_SIZE];
> >> +};
> >> +
> >> +static void efuse_writel(struct rk_efuse_info *efuse,
> >> +			 unsigned int value,
> >> +			 unsigned int offset)
> >> +{
> >> +	writel_relaxed(value, efuse->regs + offset);
> >> +}
> >> +
> >> +static unsigned int efuse_readl(struct rk_efuse_info *efuse,
> >> +				unsigned int offset)
> >> +{
> >> +	return readl_relaxed(efuse->regs + offset);
> >> +}
> >=20
> > why these indirections for readl and writel? They don't seem to pro=
vide
> > any
> > additional benefit over calling writel_relaxed/readl_relaxed direct=
ly
> > below.>=20
> >> +
> >> +static unsigned int rockchip_efuse_leakage(struct rk_efuse_info *=
efuse,
> >> +					 int channel)
> >> +{
> >> +	switch (channel) {
> >> +	case EFUSE_BUF_LKG_CPU:
> >> +	case EFUSE_BUF_LKG_GPU:
> >> +	case EFUSE_BUF_LKG_LOG:
> >> +		return efuse->buf[channel];
> >> +	default:
> >> +		dev_err(efuse->dev, "unknown channel\n");
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void rockchip_efuse_info(struct rk_efuse_info *efuse)
> >> +{
> >> +	dev_info(efuse->dev, "leakage (%d %d %d)\n",
> >> +		 rockchip_efuse_leakage(efuse, EFUSE_BUF_LKG_CPU),
> >> +		 rockchip_efuse_leakage(efuse, EFUSE_BUF_LKG_GPU),
> >> +		 rockchip_efuse_leakage(efuse, EFUSE_BUF_LKG_LOG));
> >> +}
> >> +
> >> +static int rockchip_efuse_init(struct rk_efuse_info *efuse)
> >> +{
> >> +	int start =3D 0;
> >> +	int ret =3D 0;
> >> +
> >> +	efuse_writel(efuse, EFUSE_CSB, REG_EFUSE_CTRL);
> >> +	efuse_writel(efuse, EFUSE_LOAD | EFUSE_PGENB, REG_EFUSE_CTRL);
> >> +	udelay(2);
> >> +
> >> +	for (start =3D 0; start <=3D EFUSE_BUF_SIZE; start++) {
> >> +		efuse_writel(efuse, efuse_readl(efuse, REG_EFUSE_CTRL) &
> >> +			     (~(EFUSE_A_MASK << EFUSE_A_SHIFT)),
> >> +			     REG_EFUSE_CTRL);
> >> +		efuse_writel(efuse, efuse_readl(efuse, REG_EFUSE_CTRL) |
> >> +			     ((start & EFUSE_A_MASK) << EFUSE_A_SHIFT),
> >> +			     REG_EFUSE_CTRL);
> >> +		udelay(2);
> >> +		efuse_writel(efuse, efuse_readl(efuse, REG_EFUSE_CTRL) |
> >> +			     EFUSE_STROBE, REG_EFUSE_CTRL);
> >> +		udelay(2);
> >> +
> >> +		efuse->buf[start] =3D efuse_readl(efuse, REG_EFUSE_DOUT);
> >> +
> >> +		efuse_writel(efuse, efuse_readl(efuse, REG_EFUSE_CTRL) &
> >> +			     (~EFUSE_STROBE), REG_EFUSE_CTRL);
> >> +		udelay(2);
> >> +	}
> >> +
> >> +	udelay(2);
> >> +	efuse_writel(efuse, efuse_readl(efuse, REG_EFUSE_CTRL) |
> >> +		     EFUSE_CSB, REG_EFUSE_CTRL);
> >> +	udelay(2);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static int rockchip_efuse_probe(struct platform_device *pdev)
> >> +{
> >> +	struct rk_efuse_info *efuse;
> >> +	struct resource *mem;
> >> +	int ret =3D 0;
> >> +
> >> +	efuse =3D devm_kzalloc(&pdev->dev, sizeof(*efuse), GFP_KERNEL);
> >> +	if (!efuse)
> >> +		return -ENOMEM;
> >> +
> >> +	mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >> +	efuse->regs =3D devm_ioremap_resource(&pdev->dev, mem);
> >> +	if (IS_ERR(efuse->regs))
> >> +		return PTR_ERR(efuse->regs);
> >> +
> >> +	platform_set_drvdata(pdev, efuse);
> >> +	efuse->dev =3D &pdev->dev;
> >> +
> >> +	ret =3D rockchip_efuse_init(efuse);
> >> +	if (!ret)
> >> +		rockchip_efuse_info(efuse);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static const struct of_device_id rockchip_efuse_match[] =3D {
> >> +	{ .compatible =3D "rockchip,rk3288-efuse", },
> >=20
> > what about other Rockchip SoCs? At least the rk3188 seems to contai=
n an
> > efuse [though the TRM I have only directs to a RK3188 eFuse.pdf wit=
hout
> > describing the component. So I don't know if it's the same type.
> >=20
> >> +	{},
> >> +};
> >> +
> >> +static struct platform_driver rockchip_efuse_driver =3D {
> >> +	.probe =3D rockchip_efuse_probe,
> >> +	.driver =3D {
> >> +		.name =3D "rk3288-efuse",
> >> +		.owner =3D THIS_MODULE,
> >=20
> > .owner gets already set through module_platform_driver
> >=20
> >> +		.of_match_table =3D of_match_ptr(rockchip_efuse_match),
> >> +	},
> >> +};
> >> +
> >> +module_platform_driver(rockchip_efuse_driver);
> >> +
> >> +MODULE_DESCRIPTION("Rockchip eFuse Driver");
> >> +MODULE_AUTHOR("Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
> >> +MODULE_LICENSE("GPL v2");
> >> diff --git a/arch/arm/mach-rockchip/efuse.h
> >> b/arch/arm/mach-rockchip/efuse.h new file mode 100644
> >> index 0000000..3fdcf6d
> >> --- /dev/null
> >> +++ b/arch/arm/mach-rockchip/efuse.h
> >=20
> > why does this need to be a separate header? The stuff below could v=
ery
> > well
> > simply live inside the fuse.c
> >=20
> >> @@ -0,0 +1,15 @@
> >> +#ifndef _ARCH_ROCKCHIP_EFUSE_H_
> >> +#define _ARCH_ROCKCHIP_EFUSE_H_
> >> +
> >> +/* Rockchip eFuse controller register */
> >> +#define EFUSE_A_SHIFT		(6)
> >> +#define EFUSE_A_MASK		(0x3FF)
> >> +#define EFUSE_PGENB		(1 << 3)
> >=20
> > please use BIT(3) instead of (1 << 3)
> > Same for the bits below.
> >=20
> >> +#define EFUSE_LOAD		(1 << 2)
> >> +#define EFUSE_STROBE		(1 << 1)
> >> +#define EFUSE_CSB		(1 << 0)
> >> +
> >> +#define REG_EFUSE_CTRL		(0x0000)
> >> +#define REG_EFUSE_DOUT		(0x0004)
> >=20
> > no braces necessary for basic numerals
> >=20
> >> +
> >> +#endif /* _ARCH_ROCKCHIP_EFUSE_H_ */

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
