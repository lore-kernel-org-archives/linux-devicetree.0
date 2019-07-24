From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH v3 2/2] mailbox: introduce ARM SMC based mailbox
Date: Wed, 24 Jul 2019 03:06:36 +0000
Message-ID: <AM0PR04MB448115B329F1207A802BF24988C60@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1563184103-8493-1-git-send-email-peng.fan@nxp.com>
 <1563184103-8493-3-git-send-email-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563184103-8493-3-git-send-email-peng.fan@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi All,

> Subject: [PATCH v3 2/2] mailbox: introduce ARM SMC based mailbox

Any comments with this patch?

>=20
> From: Peng Fan <peng.fan@nxp.com>
>=20
> This mailbox driver implements a mailbox which signals transmitted data v=
ia
> an ARM smc (secure monitor call) instruction. The mailbox receiver is
> implemented in firmware and can synchronously return data when it returns
> execution to the non-secure world again.
> An asynchronous receive path is not implemented.
> This allows the usage of a mailbox to trigger firmware actions on SoCs wh=
ich
> either don't have a separate management processor or on which such a core
> is not available. A user of this mailbox could be the SCP interface.
>=20
> Modified from Andre Przywara's v2 patch
> https://lore.kernel.org/patchwork/patch/812999/
>=20
> Cc: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>=20
> V3:
>  Drop interrupt.
>  Introduce transports for mem/reg usage.
>  Add chan-id for mem usage.
>=20
> V2:
>  Add interrupts notification support.
>=20
>  drivers/mailbox/Kconfig           |   7 ++
>  drivers/mailbox/Makefile          |   2 +
>  drivers/mailbox/arm-smc-mailbox.c | 215
> ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 224 insertions(+)
>  create mode 100644 drivers/mailbox/arm-smc-mailbox.c
>=20
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig index
> 595542bfae85..c3bd0f1ddcd8 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -15,6 +15,13 @@ config ARM_MHU
>  	  The controller has 3 mailbox channels, the last of which can be
>  	  used in Secure mode only.
>=20
> +config ARM_SMC_MBOX
> +	tristate "Generic ARM smc mailbox"
> +	depends on OF && HAVE_ARM_SMCCC
> +	help
> +	  Generic mailbox driver which uses ARM smc calls to call into
> +	  firmware for triggering mailboxes.
> +
>  config IMX_MBOX
>  	tristate "i.MX Mailbox"
>  	depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile index
> c22fad6f696b..93918a84c91b 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -7,6 +7,8 @@ obj-$(CONFIG_MAILBOX_TEST)	+=3D mailbox-test.o
>=20
>  obj-$(CONFIG_ARM_MHU)	+=3D arm_mhu.o
>=20
> +obj-$(CONFIG_ARM_SMC_MBOX)	+=3D arm-smc-mailbox.o
> +
>  obj-$(CONFIG_IMX_MBOX)	+=3D imx-mailbox.o
>=20
>  obj-$(CONFIG_ARMADA_37XX_RWTM_MBOX)	+=3D
> armada-37xx-rwtm-mailbox.o
> diff --git a/drivers/mailbox/arm-smc-mailbox.c
> b/drivers/mailbox/arm-smc-mailbox.c
> new file mode 100644
> index 000000000000..76a2ae11ee4d
> --- /dev/null
> +++ b/drivers/mailbox/arm-smc-mailbox.c
> @@ -0,0 +1,215 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2016,2017 ARM Ltd.
> + * Copyright 2019 NXP
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/interrupt.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#define ARM_SMC_MBOX_MEM_TRANS	BIT(0)
> +
> +struct arm_smc_chan_data {
> +	u32 function_id;
> +	u32 chan_id;
> +	u32 flags;
> +};
> +
> +struct arm_smccc_mbox_cmd {
> +	unsigned long a0, a1, a2, a3, a4, a5, a6, a7; };
> +
> +typedef unsigned long (smc_mbox_fn)(unsigned long, unsigned long,
> +				    unsigned long, unsigned long,
> +				    unsigned long, unsigned long,
> +				    unsigned long, unsigned long);
> +static smc_mbox_fn *invoke_smc_mbox_fn;
> +
> +static int arm_smc_send_data(struct mbox_chan *link, void *data) {
> +	struct arm_smc_chan_data *chan_data =3D link->con_priv;
> +	struct arm_smccc_mbox_cmd *cmd =3D data;
> +	unsigned long ret;
> +	u32 function_id;
> +	u32 chan_id;
> +
> +	if (chan_data->flags & ARM_SMC_MBOX_MEM_TRANS) {
> +		if (chan_data->function_id !=3D UINT_MAX)
> +			function_id =3D chan_data->function_id;
> +		else
> +			function_id =3D cmd->a0;
> +		chan_id =3D chan_data->chan_id;
> +		ret =3D invoke_smc_mbox_fn(function_id, chan_id, 0, 0, 0, 0,
> +					 0, 0);
> +	} else {
> +		ret =3D invoke_smc_mbox_fn(cmd->a0, cmd->a1, cmd->a2, cmd->a3,
> +					 cmd->a4, cmd->a5, cmd->a6, cmd->a7);
> +	}
> +
> +	mbox_chan_received_data(link, (void *)ret);
> +
> +	return 0;
> +}
> +
> +static unsigned long __invoke_fn_hvc(unsigned long function_id,
> +				     unsigned long arg0, unsigned long arg1,
> +				     unsigned long arg2, unsigned long arg3,
> +				     unsigned long arg4, unsigned long arg5,
> +				     unsigned long arg6)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_hvc(function_id, arg0, arg1, arg2, arg3, arg4,
> +		      arg5, arg6, &res);
> +	return res.a0;
> +}
> +
> +static unsigned long __invoke_fn_smc(unsigned long function_id,
> +				     unsigned long arg0, unsigned long arg1,
> +				     unsigned long arg2, unsigned long arg3,
> +				     unsigned long arg4, unsigned long arg5,
> +				     unsigned long arg6)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(function_id, arg0, arg1, arg2, arg3, arg4,
> +		      arg5, arg6, &res);
> +	return res.a0;
> +}
> +
> +static const struct mbox_chan_ops arm_smc_mbox_chan_ops =3D {
> +	.send_data	=3D arm_smc_send_data,
> +};
> +
> +static int arm_smc_mbox_probe(struct platform_device *pdev) {
> +	struct device *dev =3D &pdev->dev;
> +	struct mbox_controller *mbox;
> +	struct arm_smc_chan_data *chan_data;
> +	const char *method;
> +	bool mem_trans =3D false;
> +	int ret, i;
> +	u32 val;
> +
> +	if (!of_property_read_u32(dev->of_node, "arm,num-chans", &val)) {
> +		if (!val) {
> +			dev_err(dev, "invalid arm,num-chans value %u\n", val);
> +			return -EINVAL;
> +		}
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	if (!of_property_read_string(dev->of_node, "transports", &method)) {
> +		if (!strcmp("mem", method)) {
> +			mem_trans =3D true;
> +		} else if (!strcmp("reg", method)) {
> +			mem_trans =3D false;
> +		} else {
> +			dev_warn(dev, "invalid \"transports\" property: %s\n",
> +				 method);
> +
> +			return -EINVAL;
> +		}
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	if (!of_property_read_string(dev->of_node, "method", &method)) {
> +		if (!strcmp("hvc", method)) {
> +			invoke_smc_mbox_fn =3D __invoke_fn_hvc;
> +		} else if (!strcmp("smc", method)) {
> +			invoke_smc_mbox_fn =3D __invoke_fn_smc;
> +		} else {
> +			dev_warn(dev, "invalid \"method\" property: %s\n",
> +				 method);
> +
> +			return -EINVAL;
> +		}
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	mbox =3D devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> +	if (!mbox)
> +		return -ENOMEM;
> +
> +	mbox->num_chans =3D val;
> +	mbox->chans =3D devm_kcalloc(dev, mbox->num_chans,
> sizeof(*mbox->chans),
> +				   GFP_KERNEL);
> +	if (!mbox->chans)
> +		return -ENOMEM;
> +
> +	chan_data =3D devm_kcalloc(dev, mbox->num_chans, sizeof(*chan_data),
> +				 GFP_KERNEL);
> +	if (!chan_data)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < mbox->num_chans; i++) {
> +		u32 function_id;
> +
> +		ret =3D of_property_read_u32_index(dev->of_node,
> +						 "arm,func-ids", i,
> +						 &function_id);
> +		if (ret)
> +			chan_data[i].function_id =3D UINT_MAX;
> +
> +		else
> +			chan_data[i].function_id =3D function_id;
> +
> +		chan_data[i].chan_id =3D i;
> +
> +		if (mem_trans)
> +			chan_data[i].flags |=3D ARM_SMC_MBOX_MEM_TRANS;
> +		mbox->chans[i].con_priv =3D &chan_data[i];
> +	}
> +
> +	mbox->txdone_poll =3D false;
> +	mbox->txdone_irq =3D false;
> +	mbox->ops =3D &arm_smc_mbox_chan_ops;
> +	mbox->dev =3D dev;
> +
> +	platform_set_drvdata(pdev, mbox);
> +
> +	ret =3D devm_mbox_controller_register(dev, mbox);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(dev, "ARM SMC mailbox enabled with %d chan%s.\n",
> +		 mbox->num_chans, mbox->num_chans =3D=3D 1 ? "" : "s");
> +
> +	return ret;
> +}
> +
> +static int arm_smc_mbox_remove(struct platform_device *pdev) {
> +	struct mbox_controller *mbox =3D platform_get_drvdata(pdev);
> +
> +	mbox_controller_unregister(mbox);
> +	return 0;
> +}
> +
> +static const struct of_device_id arm_smc_mbox_of_match[] =3D {
> +	{ .compatible =3D "arm,smc-mbox", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, arm_smc_mbox_of_match);
> +
> +static struct platform_driver arm_smc_mbox_driver =3D {
> +	.driver =3D {
> +		.name =3D "arm-smc-mbox",
> +		.of_match_table =3D arm_smc_mbox_of_match,
> +	},
> +	.probe		=3D arm_smc_mbox_probe,
> +	.remove		=3D arm_smc_mbox_remove,
> +};
> +module_platform_driver(arm_smc_mbox_driver);
> +
> +MODULE_AUTHOR("Andre Przywara <andre.przywara@arm.com>");
> +MODULE_DESCRIPTION("Generic ARM smc mailbox driver");
> +MODULE_LICENSE("GPL v2");

Thanks,
Peng.

> --
> 2.16.4
