From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v8 14/14] usb: chipidea: add imx platform driver
Date: Fri, 29 Jun 2012 13:15:14 +0200
Message-ID: <4FED8E42.9020400@pengutronix.de>
References: <1340963342-28735-1-git-send-email-richard.zhao@freescale.com> <1340963342-28735-15-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig2C15D7D387DB0CF8A129EBF8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340963342-28735-15-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig2C15D7D387DB0CF8A129EBF8
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 06/29/2012 11:49 AM, Richard Zhao wrote:
> This patch supports only the host-mode functionality so far.
>=20
> Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Cc: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Tested-by: Subodh Nijsure <snijsure-4jo+YWezP1RWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/ci13xxx-imx.txt        |   18 ++
>  drivers/usb/chipidea/Makefile                      |    3 +
>  drivers/usb/chipidea/ci13xxx_imx.c                 |  198 ++++++++++++=
++++++++
>  3 files changed, 219 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ci13xxx-imx.t=
xt
>  create mode 100644 drivers/usb/chipidea/ci13xxx_imx.c
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt b/Do=
cumentation/devicetree/bindings/usb/ci13xxx-imx.txt
> new file mode 100644
> index 0000000..2c29041
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
> @@ -0,0 +1,18 @@
> +* Freescale i.MX ci13xxx usb controllers
> +
> +Required properties:
> +- compatible: Should be "fsl,imx27-usb"
> +- reg: Should contain registers location and length
> +- interrupts: Should contain controller interrupt
> +
> +Optional properties:
> +- fsl,usbphy: phandler of usb phy that connects to the only one port
> +- vbus-supply: regulator for vbus
> +
> +Examples:
> +usb@02184000 { /* USB OTG */
> +	compatible =3D "fsl,imx6q-usb", "fsl,imx27-usb";
> +	reg =3D <0x02184000 0x200>;
> +	interrupts =3D <0 43 0x04>;
> +	fsl,usbphy =3D <&usbphy1>;
> +};
> diff --git a/drivers/usb/chipidea/Makefile b/drivers/usb/chipidea/Makef=
ile
> index b69900a..5c66d9c 100644
> --- a/drivers/usb/chipidea/Makefile
> +++ b/drivers/usb/chipidea/Makefile
> @@ -14,3 +14,6 @@ ifneq ($(CONFIG_PCI),)
>  	obj-$(CONFIG_USB_CHIPIDEA)	+=3D ci13xxx_pci.o
>  endif
> =20
> +ifneq ($(CONFIG_OF_DEVICE),)
> +	obj-$(CONFIG_USB_CHIPIDEA)	+=3D ci13xxx_imx.o
> +endif
> diff --git a/drivers/usb/chipidea/ci13xxx_imx.c b/drivers/usb/chipidea/=
ci13xxx_imx.c
> new file mode 100644
> index 0000000..ef60d06
> --- /dev/null
> +++ b/drivers/usb/chipidea/ci13xxx_imx.c
> @@ -0,0 +1,198 @@
> +/*
> + * Copyright 2012 Freescale Semiconductor, Inc.
> + * Copyright (C) 2012 Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> + * on behalf of DENX Software Engineering GmbH
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_gpio.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/usb/chipidea.h>
> +#include <linux/clk.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include "ci.h"
> +
> +#define pdev_to_phy(pdev) \
> +	((struct usb_phy *)platform_get_drvdata(pdev))
> +
> +struct ci13xxx_imx_data {
> +	struct device_node *phy_np;
> +	struct usb_phy *phy;
> +	struct platform_device *ci_pdev;
> +	struct clk *clk;
> +	struct regulator *reg_vbus;
> +};
> +
> +static struct ci13xxx_platform_data ci13xxx_imx_platdata __devinitdata=
  =3D {
> +	.name			=3D "ci13xxx_imx",
> +	.flags			=3D CI13XXX_REQUIRE_TRANSCEIVER |
> +				  CI13XXX_PULLUP_ON_VBUS |
> +				  CI13XXX_DISABLE_STREAMING,
> +	.capoffset		=3D DEF_CAPOFFSET,
> +};
> +
> +static int __devinit ci13xxx_imx_probe(struct platform_device *pdev)
> +{
> +	struct ci13xxx_imx_data *data;
> +	struct platform_device *plat_ci, *phy_pdev;
> +	struct device_node *phy_np;
> +	struct resource *res;
> +	struct regulator *reg_vbus;
> +	int ret;
> +
> +	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data) {
> +		dev_err(&pdev->dev, "Failed to allocate CI13xxx-IMX data!\n");
> +		return -ENOMEM;
> +	}
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "Can't get device resources!\n");
> +		return -ENOENT;
> +	}
> +
> +	data->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(data->clk)) {
> +		dev_err(&pdev->dev,
> +			"Failed to get clock, err=3D%ld\n", PTR_ERR(data->clk));
> +		return PTR_ERR(data->clk);
> +	}
> +
> +	ret =3D clk_prepare_enable(data->clk);
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"Failed to prepare or enable clock, err=3D%d\n", ret);
> +		return ret;
> +	}
> +
> +	phy_np =3D of_parse_phandle(pdev->dev.of_node, "fsl,usbphy", 0);
> +	if (phy_np) {
> +		data->phy_np =3D phy_np;
> +		phy_pdev =3D of_find_device_by_node(phy_np);
> +		if (phy_pdev) {
> +			struct usb_phy *phy;
> +			phy =3D pdev_to_phy(phy_pdev);
> +			if (phy &&
> +			    try_module_get(phy_pdev->dev.driver->owner)) {
> +				usb_phy_init(phy);
> +				data->phy =3D phy;
> +			}
> +		}
> +	}

what about using devm_usb_get_phy_by_phandle() as proposed in Kishon's
patch: "drivers: usb: otg: add device tree support to otg library".

Marc

> +
> +	/* we only support host now, so enable vbus here */
> +	reg_vbus =3D devm_regulator_get(&pdev->dev, "vbus");
> +	if (!IS_ERR(reg_vbus)) {
> +		ret =3D regulator_enable(reg_vbus);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"Failed to enable vbus regulator, err=3D%d\n",
> +				ret);
> +			goto put_np;
> +		}
> +		data->reg_vbus =3D reg_vbus;
> +	} else {
> +		reg_vbus =3D NULL;
> +	}
> +
> +	ci13xxx_imx_platdata.phy =3D data->phy;
> +
> +	if (!pdev->dev.dma_mask) {
> +		pdev->dev.dma_mask =3D devm_kzalloc(&pdev->dev,
> +				      sizeof(*pdev->dev.dma_mask), GFP_KERNEL);
> +		if (!pdev->dev.dma_mask) {
> +			ret =3D -ENOMEM;
> +			dev_err(&pdev->dev, "Failed to alloc dma_mask!\n");
> +			goto err;
> +		}
> +		*pdev->dev.dma_mask =3D DMA_BIT_MASK(32);
> +		dma_set_coherent_mask(&pdev->dev, *pdev->dev.dma_mask);
> +	}
> +	plat_ci =3D ci13xxx_add_device(&pdev->dev,
> +				pdev->resource, pdev->num_resources,
> +				&ci13xxx_imx_platdata);
> +	if (IS_ERR(plat_ci)) {
> +		ret =3D PTR_ERR(plat_ci);
> +		dev_err(&pdev->dev,
> +			"Can't register ci_hdrc platform device, err=3D%d\n",
> +			ret);
> +		goto err;
> +	}
> +
> +	data->ci_pdev =3D plat_ci;
> +	platform_set_drvdata(pdev, data);
> +
> +	pm_runtime_no_callbacks(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	return 0;
> +
> +err:
> +	if (reg_vbus)
> +		regulator_disable(reg_vbus);
> +put_np:
> +	if (phy_np)
> +		of_node_put(phy_np);
> +	clk_disable_unprepare(data->clk);
> +	return ret;
> +}
> +
> +static int __devexit ci13xxx_imx_remove(struct platform_device *pdev)
> +{
> +	struct ci13xxx_imx_data *data =3D platform_get_drvdata(pdev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +	ci13xxx_remove_device(data->ci_pdev);
> +
> +	if (data->reg_vbus)
> +		regulator_disable(data->reg_vbus);
> +
> +	if (data->phy) {
> +		usb_phy_shutdown(data->phy);
> +		module_put(data->phy->dev->driver->owner);
> +	}
> +
> +	of_node_put(data->phy_np);
> +
> +	clk_disable_unprepare(data->clk);
> +
> +	platform_set_drvdata(pdev, NULL);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ci13xxx_imx_dt_ids[] =3D {
> +	{ .compatible =3D "fsl,imx27-usb", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ci13xxx_imx_dt_ids);
> +
> +static struct platform_driver ci13xxx_imx_driver =3D {
> +	.probe =3D ci13xxx_imx_probe,
> +	.remove =3D __devexit_p(ci13xxx_imx_remove),
> +	.driver =3D {
> +		.name =3D "imx_usb",
> +		.owner =3D THIS_MODULE,
> +		.of_match_table =3D ci13xxx_imx_dt_ids,
> +	 },
> +};
> +
> +module_platform_driver(ci13xxx_imx_driver);
> +
> +MODULE_ALIAS("platform:imx-usb");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("CI13xxx i.MX USB binding");
> +MODULE_AUTHOR("Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>");
> +MODULE_AUTHOR("Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>");


--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig2C15D7D387DB0CF8A129EBF8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/tjkkACgkQjTAFq1RaXHNP2QCeNiCb45iogoo2y0JuHTZzjFW9
2JkAnAkV4ayI6G6AX6Dtw98W9t1YiB8s
=OXqM
-----END PGP SIGNATURE-----

--------------enig2C15D7D387DB0CF8A129EBF8--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
