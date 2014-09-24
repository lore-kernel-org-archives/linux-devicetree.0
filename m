From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 1/3] mfd: add support for Qualcomm SPMI PMICs
Date: Wed, 24 Sep 2014 10:12:50 +0100
Message-ID: <20140924091250.GK17801@lee--X1>
References: <1406903450-27283-1-git-send-email-svarbanov@mm-sol.com>
 <1406903450-27283-2-git-send-email-svarbanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1406903450-27283-2-git-send-email-svarbanov@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Courtney Cavin <courtney.cavin@sonymobile.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Josh Cartwright <joshc@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, David Collins <collinsd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, 01 Aug 2014, Stanimir Varbanov wrote:
> From: Josh Cartwright <joshc@codeaurora.org>
>=20
> The Qualcomm SPMI PMIC chips are components used with the
> Snapdragon 800 series SoC family.  This driver exists
> largely as a glue mfd component, it exists to be an owner
> of an SPMI regmap for children devices described in
> device tree.
>=20
> Signed-off-by: Josh Cartwright <joshc@codeaurora.org>
> Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mfd/Kconfig          |   15 +++++++++
>  drivers/mfd/Makefile         |    1 +
>  drivers/mfd/qcom-spmi-pmic.c |   67 ++++++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 83 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/mfd/qcom-spmi-pmic.c

Applied, thanks.

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6cc4b6a..abfe12a 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -524,6 +524,21 @@ config MFD_PM8921_CORE
>  	  Say M here if you want to include support for PM8921 chip as a mo=
dule.
>  	  This will build a module called "pm8921-core".
> =20
> +config MFD_SPMI_PMIC
> +	tristate "Qualcomm SPMI PMICs"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on OF
> +	depends on SPMI
> +	select REGMAP_SPMI
> +	help
> +	  This enables support for the Qualcomm SPMI PMICs.
> +	  These PMICs are currently used with the Snapdragon 800 series of
> +	  SoCs.  Note, that this will only be useful paired with descriptio=
ns
> +	  of the independent functions as children nodes in the device tree=
=2E
> +
> +	  Say M here if you want to include support for the SPMI PMIC
> +	  series as a module.  The module will be called "qcom-spmi-pmic".
> +
>  config MFD_RDC321X
>  	tristate "RDC R-321x southbridge"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 8afedba..0e7f32e 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -153,6 +153,7 @@ obj-$(CONFIG_MFD_SI476X_CORE)	+=3D si476x-core.o
>  obj-$(CONFIG_MFD_CS5535)	+=3D cs5535-mfd.o
>  obj-$(CONFIG_MFD_OMAP_USB_HOST)	+=3D omap-usb-host.o omap-usb-tll.o
>  obj-$(CONFIG_MFD_PM8921_CORE) 	+=3D pm8921-core.o ssbi.o
> +obj-$(CONFIG_MFD_SPMI_PMIC)	+=3D qcom-spmi-pmic.o
>  obj-$(CONFIG_TPS65911_COMPARATOR)	+=3D tps65911-comparator.o
>  obj-$(CONFIG_MFD_TPS65090)	+=3D tps65090.o
>  obj-$(CONFIG_MFD_AAT2870_CORE)	+=3D aat2870-core.o
> diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmi=
c.c
> new file mode 100644
> index 0000000..4b8beb2
> --- /dev/null
> +++ b/drivers/mfd/qcom-spmi-pmic.c
> @@ -0,0 +1,67 @@
> +/*
> + * Copyright (c) 2014, The Linux Foundation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 an=
d
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/spmi.h>
> +#include <linux/regmap.h>
> +#include <linux/of_platform.h>
> +
> +static const struct regmap_config spmi_regmap_config =3D {
> +	.reg_bits	=3D 16,
> +	.val_bits	=3D 8,
> +	.max_register	=3D 0xffff,
> +	.fast_io	=3D true,
> +};
> +
> +static int pmic_spmi_probe(struct spmi_device *sdev)
> +{
> +	struct device_node *root =3D sdev->dev.of_node;
> +	struct regmap *regmap;
> +
> +	regmap =3D devm_regmap_init_spmi_ext(sdev, &spmi_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	return of_platform_populate(root, NULL, NULL, &sdev->dev);
> +}
> +
> +static void pmic_spmi_remove(struct spmi_device *sdev)
> +{
> +	of_platform_depopulate(&sdev->dev);
> +}
> +
> +static const struct of_device_id pmic_spmi_id_table[] =3D {
> +	{ .compatible =3D "qcom,spmi-pmic" },
> +	{ .compatible =3D "qcom,pm8941" },
> +	{ .compatible =3D "qcom,pm8841" },
> +	{ .compatible =3D "qcom,pma8084" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, pmic_spmi_id_table);
> +
> +static struct spmi_driver pmic_spmi_driver =3D {
> +	.probe =3D pmic_spmi_probe,
> +	.remove =3D pmic_spmi_remove,
> +	.driver =3D {
> +		.name =3D "pmic-spmi",
> +		.of_match_table =3D pmic_spmi_id_table,
> +	},
> +};
> +module_spmi_driver(pmic_spmi_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm SPMI PMIC driver");
> +MODULE_ALIAS("spmi:spmi-pmic");
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Josh Cartwright <joshc@codeaurora.org>");
> +MODULE_AUTHOR("Stanimir Varbanov <svarbanov@mm-sol.com>");

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
