From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 2/3] mfd: qcom-rpm: Driver for the Qualcomm RPM
Date: Thu, 21 Aug 2014 14:22:04 +0100
Message-ID: <20140821132204.GH4266@lee--X1>
References: <1407796988-25872-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1407796988-25872-3-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1407796988-25872-3-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Andy Gross <agross@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@linaro.org>, Kumar Gala <galak@codeaurora.org>, Josh Cartwright <joshc@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 11 Aug 2014, Bjorn Andersson wrote:

> Driver for the Resource Power Manager (RPM) found in Qualcomm 8660, 8=
960
> and 8064 based devices. The driver exposes resources that child drive=
rs
> can operate on; to implementing regulator, clock and bus frequency
> drivers.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>  drivers/mfd/Kconfig          |  15 ++
>  drivers/mfd/Makefile         |   1 +
>  drivers/mfd/qcom_rpm.c       | 596 +++++++++++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/qcom_rpm.h |  12 +
>  4 files changed, 624 insertions(+)
>  create mode 100644 drivers/mfd/qcom_rpm.c
>  create mode 100644 include/linux/mfd/qcom_rpm.h
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6cc4b6a..7a8584a 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -524,6 +524,21 @@ config MFD_PM8921_CORE
>  	  Say M here if you want to include support for PM8921 chip as a mo=
dule.
>  	  This will build a module called "pm8921-core".
> =20
> +config MFD_QCOM_RPM
> +	tristate "Qualcomm Resource Power Manager (RPM)"
> +	depends on ARCH_QCOM && OF
> +	select MFD_SYSCON
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  Resource Power Manager system found in the Qualcomm 8660, 8960 an=
d
> +	  8064 based devices.
> +
> +	  This is required to access many regulators, clocks and bus
> +	  frequencies controlled by the RPM on these devices.
> +
> +	  Say M here if you want to include support for the Qualcomm RPM as=
 a
> +	  module. This will build a module called "qcom_rpm".
> +
>  config MFD_RDC321X
>  	tristate "RDC R-321x southbridge"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 8afedba..fce4a7d 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -153,6 +153,7 @@ obj-$(CONFIG_MFD_SI476X_CORE)	+=3D si476x-core.o
>  obj-$(CONFIG_MFD_CS5535)	+=3D cs5535-mfd.o
>  obj-$(CONFIG_MFD_OMAP_USB_HOST)	+=3D omap-usb-host.o omap-usb-tll.o
>  obj-$(CONFIG_MFD_PM8921_CORE) 	+=3D pm8921-core.o ssbi.o
> +obj-$(CONFIG_MFD_QCOM_RPM)	+=3D qcom_rpm.o
>  obj-$(CONFIG_TPS65911_COMPARATOR)	+=3D tps65911-comparator.o
>  obj-$(CONFIG_MFD_TPS65090)	+=3D tps65090.o
>  obj-$(CONFIG_MFD_AAT2870_CORE)	+=3D aat2870-core.o
> diff --git a/drivers/mfd/qcom_rpm.c b/drivers/mfd/qcom_rpm.c
> new file mode 100644
> index 0000000..7cc0513
> --- /dev/null
> +++ b/drivers/mfd/qcom_rpm.c
> @@ -0,0 +1,596 @@
> +/*
> + * Copyright (c) 2014, Sony Mobile Communications AB.
> + * Copyright (c) 2013, The Linux Foundation. All rights reserved.
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

[...]

> +static const struct qcom_rpm_data msm8660_template =3D {
> +	.version =3D -1,

-1?

> +	.resource_table =3D msm8660_rpm_resource_table,
> +	.n_resources =3D ARRAY_SIZE(msm8660_rpm_resource_table),
> +};

[...]

> +struct qcom_rpm *dev_get_qcom_rpm(struct device *dev)
> +{
> +	return dev_get_drvdata(dev);
> +}
> +EXPORT_SYMBOL(dev_get_qcom_rpm);

No need for this at all.  Use dev_get_drvdata() direct instead.

[...]

> +static int qcom_rpm_probe(struct platform_device *pdev)
> +{
> +	const struct of_device_id *match;
> +	struct device_node *syscon_np;
> +	struct resource *res;
> +	struct qcom_rpm *rpm;
> +	u32 fw_version[3];
> +	int irq_wakeup;
> +	int irq_ack;
> +	int irq_err;
> +	int ret;
> +
> +	rpm =3D devm_kzalloc(&pdev->dev, sizeof(*rpm), GFP_KERNEL);
> +	if (!rpm) {
> +		dev_err(&pdev->dev, "Can't allocate qcom_rpm\n");

No need for error messages on OOM.

> +		return -ENOMEM;
> +	}

'\n' here.

> +	rpm->dev =3D &pdev->dev;
> +	mutex_init(&rpm->lock);
> +	init_completion(&rpm->ack);
> +
> +	irq_ack =3D platform_get_irq_byname(pdev, "ack");
> +	if (irq_ack < 0) {
> +		dev_err(&pdev->dev, "required ack interrupt missing\n");
> +		return irq_ack;
> +	}
> +
> +	irq_err =3D platform_get_irq_byname(pdev, "err");
> +	if (irq_err < 0) {
> +		dev_err(&pdev->dev, "required err interrupt missing\n");
> +		return irq_err;
> +	}
> +
> +	irq_wakeup =3D platform_get_irq_byname(pdev, "wakeup");
> +	if (irq_wakeup < 0) {
> +		dev_err(&pdev->dev, "required wakeup interrupt missing\n");
> +		return irq_wakeup;
> +	}
> +
> +	match =3D of_match_device(qcom_rpm_of_match, &pdev->dev);
> +	rpm->data =3D match->data;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	rpm->status_regs =3D devm_ioremap_resource(&pdev->dev, res);
> +	rpm->ctrl_regs =3D rpm->status_regs + 0x400;
> +	rpm->req_regs =3D rpm->status_regs + 0x600;
> +	if (IS_ERR(rpm->status_regs))
> +		return PTR_ERR(rpm->status_regs);

You should probably do this _before_ using it above.

> +	syscon_np =3D of_parse_phandle(pdev->dev.of_node, "qcom,ipc", 0);
> +	if (!syscon_np) {
> +		dev_err(&pdev->dev, "no qcom,ipc node\n");
> +		return -ENODEV;
> +	}
> +
> +	rpm->ipc_regmap =3D syscon_node_to_regmap(syscon_np);
> +	if (IS_ERR(rpm->ipc_regmap))
> +		return PTR_ERR(rpm->ipc_regmap);
> +
> +	ret =3D of_property_read_u32_index(pdev->dev.of_node, "qcom,ipc", 1=
,
> +					 &rpm->ipc_offset);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "no offset in qcom,ipc\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D of_property_read_u32_index(pdev->dev.of_node, "qcom,ipc", 2=
,
> +					 &rpm->ipc_bit);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "no bit in qcom,ipc\n");
> +		return -EINVAL;
> +	}
> +
> +	dev_set_drvdata(&pdev->dev, rpm);
> +
> +	fw_version[0] =3D readl(RPM_STATUS_REG(rpm, 0));
> +	fw_version[1] =3D readl(RPM_STATUS_REG(rpm, 1));
> +	fw_version[2] =3D readl(RPM_STATUS_REG(rpm, 2));
> +	if (fw_version[0] !=3D rpm->data->version) {
> +		dev_err(&pdev->dev,
> +			"RPM version %u.%u.%u incompatible with driver version %u",
> +			fw_version[0],
> +			fw_version[1],
> +			fw_version[2],
> +			rpm->data->version);
> +		return -EFAULT;
> +	}
> +
> +	dev_info(&pdev->dev, "RPM firmware %u.%u.%u\n", fw_version[0],
> +							fw_version[1],
> +							fw_version[2]);
> +
> +	writel(fw_version[0], RPM_CTRL_REG(rpm, 0));
> +	writel(fw_version[1], RPM_CTRL_REG(rpm, 1));
> +	writel(fw_version[2], RPM_CTRL_REG(rpm, 2));

A comment documenting what this is doing would be helpful here.

> +	ret =3D devm_request_irq(&pdev->dev,
> +			       irq_ack,
> +			       qcom_rpm_ack_interrupt,
> +			       IRQF_TRIGGER_RISING | IRQF_NO_SUSPEND,
> +			       "qcom_rpm_ack",
> +			       rpm);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to request ack interrupt\n");
> +		return ret;
> +	}
> +
> +	ret =3D irq_set_irq_wake(irq_ack, 1);
> +	if (ret)
> +		dev_warn(&pdev->dev, "failed to mark ack irq as wakeup\n");
> +
> +	ret =3D devm_request_irq(&pdev->dev,
> +			       irq_err,
> +			       qcom_rpm_err_interrupt,
> +			       IRQF_TRIGGER_RISING,
> +			       "qcom_rpm_err",
> +			       rpm);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to request err interrupt\n");
> +		return ret;
> +	}
> +
> +	ret =3D devm_request_irq(&pdev->dev,
> +			       irq_wakeup,
> +			       qcom_rpm_wakeup_interrupt,
> +			       IRQF_TRIGGER_RISING,
> +			       "qcom_rpm_wakeup",
> +			       rpm);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to request wakeup interrupt\n");
> +		return ret;
> +	}
> +
> +	ret =3D irq_set_irq_wake(irq_wakeup, 1);
> +	if (ret)
> +		dev_warn(&pdev->dev, "failed to mark wakeup irq as wakeup\n");
> +
> +	return of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->d=
ev);
> +}
> +
> +static int qcom_rpm_remove_child(struct device *dev, void *unused)
> +{
> +	platform_device_unregister(to_platform_device(dev));
> +	return 0;
> +}
> +
> +static int qcom_rpm_remove(struct platform_device *pdev)
> +{
> +	device_for_each_child(&pdev->dev, NULL, qcom_rpm_remove_child);

of_platform_depopulate()?

> +	return 0;
> +}
> +
> +static struct platform_driver qcom_rpm_driver =3D {
> +	.probe =3D qcom_rpm_probe,
> +	.remove =3D qcom_rpm_remove,
> +	.driver  =3D {
> +		.name  =3D "qcom_rpm",
> +		.owner =3D THIS_MODULE,

Remove this line, it's taken care of for you.

> +		.of_match_table =3D qcom_rpm_of_match,
> +	},
> +};
> +
> +static int __init qcom_rpm_init(void)
> +{
> +	return platform_driver_register(&qcom_rpm_driver);
> +}
> +arch_initcall(qcom_rpm_init);
> +
> +static void __exit qcom_rpm_exit(void)
> +{
> +	platform_driver_unregister(&qcom_rpm_driver);
> +}
> +module_exit(qcom_rpm_exit)
> +
> +MODULE_DESCRIPTION("Qualcomm Resource Power Manager driver");
> +MODULE_LICENSE("GPL v2");

No one authored this driver?

> diff --git a/include/linux/mfd/qcom_rpm.h b/include/linux/mfd/qcom_rp=
m.h
> new file mode 100644
> index 0000000..a52bc37
> --- /dev/null
> +++ b/include/linux/mfd/qcom_rpm.h
> @@ -0,0 +1,12 @@
> +#ifndef __QCOM_RPM_H__
> +#define __QCOM_RPM_H__
> +
> +#include <linux/types.h>
> +
> +struct device;
> +struct qcom_rpm;
> +
> +struct qcom_rpm *dev_get_qcom_rpm(struct device *dev);
> +int qcom_rpm_write(struct qcom_rpm *rpm, int resource, u32 *buf, siz=
e_t count);
> +
> +#endif

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
