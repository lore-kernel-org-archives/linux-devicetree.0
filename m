From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 2/2] usb: dwc3: Add Xilinx ZynqMP platform specific glue layer
Date: Wed, 18 Nov 2015 12:04:41 -0600
Message-ID: <87egfni3pi.fsf@saruman.tx.rr.com>
References: <1447851071-16330-1-git-send-email-sbhatta@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg=pgp-sha1;
	protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447851071-16330-1-git-send-email-sbhatta@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com>, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com> writes:
> This patch adds glue driver for DWC3 core in Xilinx ZynqMP SOC.
> DWC3 glue layer is hardware layer around Synopsys DesignWare
> USB3 core. Its purpose is to supply Synopsys IP with required clocks
> and interface it with the rest of the SoC.
>
> Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
> ---
>  drivers/usb/dwc3/Kconfig       |   8 +++
>  drivers/usb/dwc3/Makefile      |   1 +
>  drivers/usb/dwc3/dwc3-xilinx.c | 131 +++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 140 insertions(+)
>  create mode 100644 drivers/usb/dwc3/dwc3-xilinx.c
>
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 5a42c45..a447879 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -104,4 +104,12 @@ config USB_DWC3_QCOM
>  	  Recent Qualcomm SoCs ship with one DesignWare Core USB3 IP inside,
>  	  say 'Y' or 'M' if you have one such device.
>=20=20
> +config USB_DWC3_XILINX
> +	tristate "Xilinx ZynqMP Platform"
> +	depends on ARCH_ZYNQMP || COMPILE_TEST
> +	default USB_DWC3
> +	help
> +	  Xilinx ZynqMP SOC ship with two DesignWare Core USB3 IPs inside,
> +	  say 'Y' or 'M' if you have one such device.
> +
>  endif
> diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> index acc951d..50cb626 100644
> --- a/drivers/usb/dwc3/Makefile
> +++ b/drivers/usb/dwc3/Makefile
> @@ -39,3 +39,4 @@ obj-$(CONFIG_USB_DWC3_PCI)		+=3D dwc3-pci.o
>  obj-$(CONFIG_USB_DWC3_KEYSTONE)		+=3D dwc3-keystone.o
>  obj-$(CONFIG_USB_DWC3_QCOM)		+=3D dwc3-qcom.o
>  obj-$(CONFIG_USB_DWC3_ST)		+=3D dwc3-st.o
> +obj-$(CONFIG_USB_DWC3_XILINX)		+=3D dwc3-xilinx.o
> diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilin=
x.c
> new file mode 100644
> index 0000000..a0dce3e
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-xilinx.c
> @@ -0,0 +1,131 @@
> +/**
> + * dwc3-xilinx.c - Xilinx ZynqMP specific Glue layer
> + *
> + * Copyright (C) 2015 Xilinx Inc.
> + *
> + * Author: Subbaraya Sundeep <sbhatta@xilinx.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2  of
> + * the License as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +
> +/**
> + * struct xilinx_dwc3 - dwc3 xilinx glue structure
> + * @dev: device pointer
> + * @ref_clk: clock input to core during PHY power down
> + * @bus_clk: bus clock input to core
> + */
> +struct xilinx_dwc3 {
> +	struct device	*dev;
> +	struct clk	*ref_clk;
> +	struct clk	*bus_clk;
> +};
> +
> +/**
> + * xilinx_dwc3_probe - The device probe function for driver initializati=
on.
> + * @pdev: pointer to the platform device structure.
> + *
> + * Return: 0 for success and error value on failure
> + */
> +static int xilinx_dwc3_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node =3D pdev->dev.of_node;
> +	struct xilinx_dwc3 *xdwc3;
> +	int ret;
> +
> +	xdwc3 =3D devm_kzalloc(&pdev->dev, sizeof(*xdwc3), GFP_KERNEL);
> +	if (!xdwc3)
> +		return -ENOMEM;
> +
> +	xdwc3->dev =3D &pdev->dev;
> +
> +	xdwc3->bus_clk =3D devm_clk_get(xdwc3->dev, "bus_clk");
> +	if (IS_ERR(xdwc3->bus_clk)) {
> +		dev_err(xdwc3->dev, "unable to get usb bus clock");
> +		return PTR_ERR(xdwc3->bus_clk);
> +	}
> +
> +	xdwc3->ref_clk =3D devm_clk_get(xdwc3->dev, "ref_clk");
> +	if (IS_ERR(xdwc3->ref_clk)) {
> +		dev_err(xdwc3->dev, "unable to get usb ref clock");
> +		return PTR_ERR(xdwc3->ref_clk);
> +	}
> +
> +	ret =3D clk_prepare_enable(xdwc3->bus_clk);
> +	if (ret)
> +		goto err_bus_clk;
> +	ret =3D clk_prepare_enable(xdwc3->ref_clk);
> +	if (ret)
> +		goto err_ref_clk;
> +
> +	platform_set_drvdata(pdev, xdwc3);
> +
> +	ret =3D of_platform_populate(node, NULL, NULL, xdwc3->dev);
> +	if (ret) {
> +		dev_err(xdwc3->dev, "failed to create dwc3 core\n");
> +		goto err_dwc3_core;
> +	}
> +
> +	return 0;
> +
> +err_dwc3_core:
> +	clk_disable_unprepare(xdwc3->ref_clk);
> +err_ref_clk:
> +	clk_disable_unprepare(xdwc3->bus_clk);
> +err_bus_clk:
> +	return ret;
> +}
> +
> +/**
> + * xilinx_dwc3_remove - Releases the resources allocated during initiali=
zation.
> + * @pdev: pointer to the platform device structure.
> + *
> + * Return: 0 always
> + */
> +static int xilinx_dwc3_remove(struct platform_device *pdev)
> +{
> +	struct xilinx_dwc3 *xdwc3 =3D platform_get_drvdata(pdev);
> +
> +	of_platform_depopulate(xdwc3->dev);
> +
> +	clk_disable_unprepare(xdwc3->bus_clk);
> +	clk_disable_unprepare(xdwc3->ref_clk);
> +	platform_set_drvdata(pdev, NULL);
> +
> +	return 0;
> +}
> +
> +/* Match table for of_platform binding */
> +static const struct of_device_id xilinx_dwc3_of_match[] =3D {
> +	{ .compatible =3D "xlnx,zynqmp-dwc3", },
> +	{ /* end of list */ },
> +};
> +MODULE_DEVICE_TABLE(of, xilinx_dwc3_of_match);
> +
> +static struct platform_driver xilinx_dwc3_driver =3D {
> +	.probe		=3D xilinx_dwc3_probe,
> +	.remove		=3D xilinx_dwc3_remove,
> +	.driver		=3D {
> +		.name		=3D "xilinx-dwc3",
> +		.of_match_table	=3D xilinx_dwc3_of_match,
> +	},
> +};
> +
> +module_platform_driver(xilinx_dwc3_driver);
> +
> +MODULE_AUTHOR("Xilinx Inc.");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("DesignWare USB3 Xilinx Glue Layer");

this is very similar to dwc3-qcom and dwc3-exynos. Looks like we can
combine them into a single dwc3-of-simple.c if we can make clk and
regulators generic enough.

Seems like of_clk_get_parent_count() and regulator_bulk* should help
here. I'll try to cook something up quickly. Gimme a couple hours.

cheers

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWTL25AAoJEIaOsuA1yqRESOEP/01K6vR95wr+cwLe0VDPyUvA
iWWfj9pqmf4kQmHB5pUVDh549LgUsLRbqUKEk1zhgWh8KOZTJZrn+gTQwHjfjQFT
oX7u+SD0ZFGCpr5f/ObMyFhntEVd2VtnlUkI6RmHxpzYyEiyPqi8K6oh+EuAboda
MfwrvyHFK2kxUkL56vwq0Jj2aesmqT4IILnnPqP/IbS+EVhf/zQUXExAqwdvL6Kk
bfiBTuE+o7EonTte7TYiQ4GwC+Xzs39f+zjrqklv0GpPCXzqhfJMQEx1LGh4TXam
EM1Tgfoc1FN4cteyBrJ7vY2fFjDKdBZiwWsG9fXoxyPXoG9PSkSDsVcB/WLqFwc6
AV3DB0vAahM6R+7yFZeGpOOHd5OAdvwxdPEknNViMdoyr1DoTgqxtwf0bs4YpQiX
29mQVXfLjmfKkrUEt5Me7PVidOIg11POrE/kYO71Lw5dgi/MtD86d/xLX9cMBJxA
tQF7u5plOx5V+wVaFLnnzviCHYRthjxOR0Go0vhX3YZWSonbzsWVKd2gqrwGFr/+
M21H+2P7Pt3reZDk3+djFn51NEp7DDt5i845ZjPJYmXxf3JRmEEdD3UcgyovzNg6
w8ASiUegR9xOxSLB4odIqc8hy3oCCQx50ZQl2eUsFRtp0IGY9IDbojbEpBn5E8hU
oaqbdpE1Jrofxu8RBjsj
=H+Gp
-----END PGP SIGNATURE-----
--=-=-=--
