From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH v6 3/3] soc: fsl: add RCPM driver
Date: Wed, 21 Aug 2019 03:23:06 +0000
Message-ID: <DB8PR04MB6826A9EA5D9232D55FE8BDEFF1AA0@DB8PR04MB6826.eurprd04.prod.outlook.com>
References: <20190821031537.46824-1-ran.wang_1@nxp.com>
 <20190821031537.46824-3-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821031537.46824-3-ran.wang_1@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Ran Wang <ran.wang_1@nxp.com>, Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Biwen Li <biwen.li@nxp.com>, Len Brown <len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Pavel,

On Wednesday, August 21, 2019 11:16, Ran Wang wrote:
>=20
> The NXP's QorIQ Processors based on ARM Core have RCPM module (Run
> Control and Power Management), which performs system level tasks associat=
ed
> with power management such as wakeup source control.
>=20
> This driver depends on PM wakeup source framework which help to collect w=
ake
> information.
>=20
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Change in v6:
> 	- Adjust related API usage to meet wakeup.c's update in patch 1/3.
> Change in v5:
> 	- Fix v4 regression of the return value of wakeup_source_get_next()
> 	didn't pass to ws in while loop.
> 	- Rename wakeup_source member 'attached_dev' to 'dev'.
> 	- Rename property 'fsl,#rcpm-wakeup-cells' to '#fsl,rcpm-wakeup-cells'.
> 	please see
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
kern
> el.org%2Fpatchwork%2Fpatch%2F1101022%2F&amp;data=3D02%7C01%7Cran.wa
> ng_1%40nxp.com%7C27cff523c0a54ce89afe08d725e5987b%7C686ea1d3bc2b4
> c6fa92cd99c5c301635%7C0%7C0%7C637019540358555022&amp;sdata=3D4YYGD
> lwvB%2B4Y1436c1bOUzFyjYEqTU5HbiUFv5%2FCxi0%3D&amp;reserved=3D0
>=20
> Change in v4:
> 	- Remove extra ',' in author line of rcpm.c
> 	- Update usage of wakeup_source_get_next() to be less confusing to
> the reader, code logic remain the same.
>=20
> Change in v3:
> 	- Some whitespace ajdustment.
>=20
> Change in v2:
> 	- Rebase Kconfig and Makefile update to latest mainline.
>=20
>  drivers/soc/fsl/Kconfig  |   8 +++
>  drivers/soc/fsl/Makefile |   2 +
>  drivers/soc/fsl/rcpm.c   | 128
> +++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 138 insertions(+)
>  create mode 100644 drivers/soc/fsl/rcpm.c
>=20
> diff --git a/drivers/soc/fsl/Kconfig b/drivers/soc/fsl/Kconfig index
> f9ad8ad..4918856 100644
> --- a/drivers/soc/fsl/Kconfig
> +++ b/drivers/soc/fsl/Kconfig
> @@ -40,4 +40,12 @@ config DPAA2_CONSOLE
>  	  /dev/dpaa2_mc_console and /dev/dpaa2_aiop_console,
>  	  which can be used to dump the Management Complex and AIOP
>  	  firmware logs.
> +
> +config FSL_RCPM
> +	bool "Freescale RCPM support"
> +	depends on PM_SLEEP
> +	help
> +	  The NXP QorIQ Processors based on ARM Core have RCPM module
> +	  (Run Control and Power Management), which performs all device-level
> +	  tasks associated with power management, such as wakeup source
> control.
>  endmenu
> diff --git a/drivers/soc/fsl/Makefile b/drivers/soc/fsl/Makefile index
> 71dee8d..28c6dac 100644
> --- a/drivers/soc/fsl/Makefile
> +++ b/drivers/soc/fsl/Makefile
> @@ -6,6 +6,8 @@
>  obj-$(CONFIG_FSL_DPAA)                 +=3D qbman/
>  obj-$(CONFIG_QUICC_ENGINE)		+=3D qe/
>  obj-$(CONFIG_CPM)			+=3D qe/
> +obj-$(CONFIG_FSL_RCPM)			+=3D rcpm.o
>  obj-$(CONFIG_FSL_GUTS)			+=3D guts.o
>  obj-$(CONFIG_FSL_MC_DPIO) 		+=3D dpio/
>  obj-$(CONFIG_DPAA2_CONSOLE)		+=3D dpaa2-console.o
> +obj-y +=3D ftm_alarm.o
> diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c new file mod=
e
> 100644 index 0000000..82c0ad5
> --- /dev/null
> +++ b/drivers/soc/fsl/rcpm.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// rcpm.c - Freescale QorIQ RCPM driver // // Copyright 2019 NXP // //
> +Author: Ran Wang <ran.wang_1@nxp.com>
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_address.h>
> +#include <linux/slab.h>
> +#include <linux/suspend.h>
> +#include <linux/kernel.h>
> +
> +#define RCPM_WAKEUP_CELL_MAX_SIZE	7
> +
> +struct rcpm {
> +	unsigned int	wakeup_cells;
> +	void __iomem	*ippdexpcr_base;
> +	bool		little_endian;
> +};
> +
> +static int rcpm_pm_prepare(struct device *dev) {
> +	struct device_node	*np =3D dev->of_node;
> +	struct wakeup_source	*ws;
> +	struct rcpm		*rcpm;
> +	u32 value[RCPM_WAKEUP_CELL_MAX_SIZE + 1], tmp;
> +	int i, ret, idx;
> +
> +	rcpm =3D dev_get_drvdata(dev);
> +	if (!rcpm)
> +		return -EINVAL;
> +
> +	/* Begin with first registered wakeup source */
> +	ws =3D wakeup_source_get_start(&idx);

Since I have mad some change in this version, could you please take a look =
on this.
If it's OK to you, I would re-add 'Acked-by: Pavel Machek <pavel@ucw.cz> '

> +	do {
> +		/* skip object which is not attached to device */
> +		if (!ws->dev)
> +			continue;
> +
> +		ret =3D device_property_read_u32_array(ws->dev,
> +				"fsl,rcpm-wakeup", value, rcpm->wakeup_cells
> + 1);
> +
> +		/*  Wakeup source should refer to current rcpm device */
> +		if (ret || (np->phandle !=3D value[0])) {
> +			dev_info(dev, "%s doesn't refer to this rcpm\n",
> +					ws->name);
> +			continue;
> +		}
> +
> +		for (i =3D 0; i < rcpm->wakeup_cells; i++) {
> +			/* We can only OR related bits */
> +			if (value[i + 1]) {
> +				if (rcpm->little_endian) {
> +					tmp =3D ioread32(rcpm->ippdexpcr_base
> + i * 4);
> +					tmp |=3D value[i + 1];
> +					iowrite32(tmp, rcpm->ippdexpcr_base
> + i * 4);
> +				} else {
> +					tmp =3D ioread32be(rcpm-
> >ippdexpcr_base + i * 4);
> +					tmp |=3D value[i + 1];
> +					iowrite32be(tmp, rcpm-
> >ippdexpcr_base + i * 4);
> +				}
> +			}
> +		}
> +	} while (ws =3D wakeup_source_get_next(ws));
> +
> +	wakeup_source_get_stop(idx);

And here.

Thank you.

Regards
Ran
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops rcpm_pm_ops =3D {
> +	.prepare =3D  rcpm_pm_prepare,
> +};
> +
> +static int rcpm_probe(struct platform_device *pdev) {
> +	struct device	*dev =3D &pdev->dev;
> +	struct resource *r;
> +	struct rcpm	*rcpm;
> +	int ret;
> +
> +	rcpm =3D devm_kzalloc(dev, sizeof(*rcpm), GFP_KERNEL);
> +	if (!rcpm)
> +		return -ENOMEM;
> +
> +	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!r)
> +		return -ENODEV;
> +
> +	rcpm->ippdexpcr_base =3D devm_ioremap_resource(&pdev->dev, r);
> +	if (IS_ERR(rcpm->ippdexpcr_base)) {
> +		ret =3D  PTR_ERR(rcpm->ippdexpcr_base);
> +		return ret;
> +	}
> +
> +	rcpm->little_endian =3D device_property_read_bool(
> +			&pdev->dev, "little-endian");
> +
> +	ret =3D device_property_read_u32(&pdev->dev,
> +			"#fsl,rcpm-wakeup-cells", &rcpm->wakeup_cells);
> +	if (ret)
> +		return ret;
> +
> +	dev_set_drvdata(&pdev->dev, rcpm);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id rcpm_of_match[] =3D {
> +	{ .compatible =3D "fsl,qoriq-rcpm-2.1+", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, rcpm_of_match);
> +
> +static struct platform_driver rcpm_driver =3D {
> +	.driver =3D {
> +		.name =3D "rcpm",
> +		.of_match_table =3D rcpm_of_match,
> +		.pm	=3D &rcpm_pm_ops,
> +	},
> +	.probe =3D rcpm_probe,
> +};
> +
> +module_platform_driver(rcpm_driver);
> --
> 2.7.4
