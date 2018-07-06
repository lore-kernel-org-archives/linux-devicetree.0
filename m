Return-Path: <SRS0=WJ9a=JW=collabora.co.uk=sebastian.reichel@kernel.org>
Date: Fri, 6 Jul 2018 15:58:31 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCH v5 2/6] power: reset: qcom-pon: Add Qcom PON driver
Message-ID: <20180706135831.eernik77yvxts2r3@earth.universe>
References: <20180628150850.15358-1-vkoul@kernel.org>
 <20180628150850.15358-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ncwu3dd6n6scj4rx"
Content-Disposition: inline
In-Reply-To: <20180628150850.15358-3-vkoul@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--ncwu3dd6n6scj4rx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 28, 2018 at 08:38:46PM +0530, Vinod Koul wrote:
> Add support Qualcomm PM8xxx PON which is responsible for reboot
> mode support.
>=20
> Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Thanks, queued to power-supply-next.

-- Sebastian

>  drivers/power/reset/Kconfig    | 11 +++++
>  drivers/power/reset/Makefile   |  1 +
>  drivers/power/reset/qcom-pon.c | 91 ++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 103 insertions(+)
>  create mode 100644 drivers/power/reset/qcom-pon.c
>=20
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index df58fc878b3e..6533aa560aa1 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -104,6 +104,17 @@ config POWER_RESET_MSM
>  	help
>  	  Power off and restart support for Qualcomm boards.
> =20
> +config POWER_RESET_QCOM_PON
> +	tristate "Qualcomm power-on driver"
> +	depends on ARCH_QCOM
> +	depends on MFD_SPMI_PMIC
> +	select REBOOT_MODE
> +	help
> +	  Power On support for Qualcomm boards.
> +	  If you have a Qualcomm platform and need support for
> +	  power-on and reboot reason, Say Y.
> +	  If unsure, Say N.
> +
>  config POWER_RESET_OCELOT_RESET
>  	bool "Microsemi Ocelot reset driver"
>  	depends on MSCC_OCELOT || COMPILE_TEST
> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
> index 7778c7485cf1..0aebee954ac1 100644
> --- a/drivers/power/reset/Makefile
> +++ b/drivers/power/reset/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_POWER_RESET_GPIO) +=3D gpio-poweroff.o
>  obj-$(CONFIG_POWER_RESET_GPIO_RESTART) +=3D gpio-restart.o
>  obj-$(CONFIG_POWER_RESET_HISI) +=3D hisi-reboot.o
>  obj-$(CONFIG_POWER_RESET_MSM) +=3D msm-poweroff.o
> +obj-$(CONFIG_POWER_RESET_QCOM_PON) +=3D qcom-pon.o
>  obj-$(CONFIG_POWER_RESET_OCELOT_RESET) +=3D ocelot-reset.o
>  obj-$(CONFIG_POWER_RESET_PIIX4_POWEROFF) +=3D piix4-poweroff.o
>  obj-$(CONFIG_POWER_RESET_LTC2952) +=3D ltc2952-poweroff.o
> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-po=
n.c
> new file mode 100644
> index 000000000000..0c4caaa7e88f
> --- /dev/null
> +++ b/drivers/power/reset/qcom-pon.c
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2017-18 Linaro Limited
> +
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/reboot.h>
> +#include <linux/reboot-mode.h>
> +#include <linux/regmap.h>
> +
> +#define PON_SOFT_RB_SPARE		0x8f
> +
> +struct pm8916_pon {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	u32 baseaddr;
> +	struct reboot_mode_driver reboot_mode;
> +};
> +
> +static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
> +				    unsigned int magic)
> +{
> +	struct pm8916_pon *pon =3D container_of
> +			(reboot, struct pm8916_pon, reboot_mode);
> +	int ret;
> +
> +	ret =3D regmap_update_bits(pon->regmap,
> +				 pon->baseaddr + PON_SOFT_RB_SPARE,
> +				 0xfc, magic << 2);
> +	if (ret < 0)
> +		dev_err(pon->dev, "update reboot mode bits failed\n");
> +
> +	return ret;
> +}
> +
> +static int pm8916_pon_probe(struct platform_device *pdev)
> +{
> +	struct pm8916_pon *pon;
> +	int error;
> +
> +	pon =3D devm_kzalloc(&pdev->dev, sizeof(*pon), GFP_KERNEL);
> +	if (!pon)
> +		return -ENOMEM;
> +
> +	pon->dev =3D &pdev->dev;
> +
> +	pon->regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!pon->regmap) {
> +		dev_err(&pdev->dev, "failed to locate regmap\n");
> +		return -ENODEV;
> +	}
> +
> +	error =3D of_property_read_u32(pdev->dev.of_node, "reg",
> +				     &pon->baseaddr);
> +	if (error)
> +		return error;
> +
> +	pon->reboot_mode.dev =3D &pdev->dev;
> +	pon->reboot_mode.write =3D pm8916_reboot_mode_write;
> +	error =3D devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
> +	if (error) {
> +		dev_err(&pdev->dev, "can't register reboot mode\n");
> +		return error;
> +	}
> +
> +	platform_set_drvdata(pdev, pon);
> +
> +	return devm_of_platform_populate(&pdev->dev);
> +}
> +
> +static const struct of_device_id pm8916_pon_id_table[] =3D {
> +	{ .compatible =3D "qcom,pm8916-pon" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, pm8916_pon_id_table);
> +
> +static struct platform_driver pm8916_pon_driver =3D {
> +	.probe =3D pm8916_pon_probe,
> +	.driver =3D {
> +		.name =3D "pm8916-pon",
> +		.of_match_table =3D of_match_ptr(pm8916_pon_id_table),
> +	},
> +};
> +module_platform_driver(pm8916_pon_driver);
> +
> +MODULE_DESCRIPTION("pm8916 Power On driver");
> +MODULE_LICENSE("GPL v2");
> --=20
> 2.14.4
>=20

--ncwu3dd6n6scj4rx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAls/dYcACgkQ2O7X88g7
+pqumg//a1O3wRUn5uez0MOMzZp134Sg2+l4jl9bf5n3lI8NzbKtrnnWD0Q7y0tP
KwTZntzO/wPqysz9s6Ab3wSkNFz085TgqSQ01oYswPMqhV2JUWw4J2YNKAxcdX+5
6YiDqEbo2qMGnvuFmeGiO/Xelw+5Y+rQeuoQvqJYUty2h4OaHwalzuJzVuBeAciM
KICfGgNxh9WiLJ7D9H1T02Fm2LZUDli0EXN/3UA8OtiYjaJEn9d2YQVPa6HVeGro
sW5wgbYGy4y5/OLX1WQtp/K+1MrDUhH4IhpkFZuc6LrtByqFyEX3AUM01V+er1Mo
D6kQb0ODnVcVHForT6S4aZa2Hfy7Dj8H37ES0yMihtdiOk66MAF4zcIh5Kh2mzhu
sDaMhU4S5tRYXHl1esqTW+pwXSerTwyGTX2CgiZ1cTEDAdMOoS1STa5aRZduARL8
FhO0xriRQGs/yjs6KhmiIaF/c2fq6EQ0CYROrO9WmZk4c1xmUdpL6I37swk1wgrQ
CVwZClkPnqa0tlq7K2vk7sLlZnvxg2iu9b6tQr72sT3Iu1aKN2Vd/iaGlly1HhDV
JM0LAK+xpKAnc5rSrKn8Rsa+ggkdfCIL+RO9UXZLvgpAhDJFmba3TOhlZ7CXAcOQ
QY2eGEtMBivstUmHY3ZBpF6lMXLK7/Q/YTAhT8mEtjEg4PTcM44=
=Xrsv
-----END PGP SIGNATURE-----

--ncwu3dd6n6scj4rx--
