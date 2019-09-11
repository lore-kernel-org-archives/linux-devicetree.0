From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH v5 2/2] mailbox: introduce ARM SMC based mailbox
Date: Wed, 11 Sep 2019 05:58:09 +0000
Message-ID: <AM0PR04MB4481D4A3AB97C57C1403458D88B10@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1567004515-3567-1-git-send-email-peng.fan@nxp.com>
        <1567004515-3567-3-git-send-email-peng.fan@nxp.com>
 <20190909164216.0abe640b@donnerap.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190909164216.0abe640b@donnerap.cambridge.arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Andre,

> Subject: Re: [PATCH v5 2/2] mailbox: introduce ARM SMC based mailbox
>=20
> On Wed, 28 Aug 2019 03:03:02 +0000
> Peng Fan <peng.fan@nxp.com> wrote:
>=20
> Hi,
>=20
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > This mailbox driver implements a mailbox which signals transmitted
> > data via an ARM smc (secure monitor call) instruction. The mailbox
> > receiver is implemented in firmware and can synchronously return data
> > when it returns execution to the non-secure world again.
> > An asynchronous receive path is not implemented.
> > This allows the usage of a mailbox to trigger firmware actions on SoCs
> > which either don't have a separate management processor or on which
> > such a core is not available. A user of this mailbox could be the SCP
> > interface.
> >
> > Modified from Andre Przywara's v2 patch
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e
> > .kernel.org%2Fpatchwork%2Fpatch%2F812999%2F&amp;data=3D02%7C01%7
> Cpeng.fa
> >
> n%40nxp.com%7Cce8d04bcbdea4de6a77a08d7353c4e35%7C686ea1d3bc2b
> 4c6fa92cd
> >
> 99c5c301635%7C0%7C0%7C637036405476727893&amp;sdata=3Dy5%2FI%2B
> w%2FPOypEh
> > zh6gWdXAGMGnl677B7gDZsX%2F5zfAQw%3D&amp;reserved=3D0
> >
> > Cc: Andre Przywara <andre.przywara@arm.com>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/mailbox/Kconfig           |   7 ++
> >  drivers/mailbox/Makefile          |   2 +
> >  drivers/mailbox/arm-smc-mailbox.c | 215
> > ++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 224 insertions(+)
> >  create mode 100644 drivers/mailbox/arm-smc-mailbox.c
> >
> > diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig index
> > ab4eb750bbdd..7707ee26251a 100644
> > --- a/drivers/mailbox/Kconfig
> > +++ b/drivers/mailbox/Kconfig
> > @@ -16,6 +16,13 @@ config ARM_MHU
> >  	  The controller has 3 mailbox channels, the last of which can be
> >  	  used in Secure mode only.
> >
> > +config ARM_SMC_MBOX
> > +	tristate "Generic ARM smc mailbox"
> > +	depends on OF && HAVE_ARM_SMCCC
> > +	help
> > +	  Generic mailbox driver which uses ARM smc calls to call into
> > +	  firmware for triggering mailboxes.
> > +
> >  config IMX_MBOX
> >  	tristate "i.MX Mailbox"
> >  	depends on ARCH_MXC || COMPILE_TEST
> > diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile index
> > c22fad6f696b..93918a84c91b 100644
> > --- a/drivers/mailbox/Makefile
> > +++ b/drivers/mailbox/Makefile
> > @@ -7,6 +7,8 @@ obj-$(CONFIG_MAILBOX_TEST)	+=3D mailbox-test.o
> >
> >  obj-$(CONFIG_ARM_MHU)	+=3D arm_mhu.o
> >
> > +obj-$(CONFIG_ARM_SMC_MBOX)	+=3D arm-smc-mailbox.o
> > +
> >  obj-$(CONFIG_IMX_MBOX)	+=3D imx-mailbox.o
> >
> >  obj-$(CONFIG_ARMADA_37XX_RWTM_MBOX)	+=3D
> armada-37xx-rwtm-mailbox.o
> > diff --git a/drivers/mailbox/arm-smc-mailbox.c
> > b/drivers/mailbox/arm-smc-mailbox.c
> > new file mode 100644
> > index 000000000000..76a2ae11ee4d
> > --- /dev/null
> > +++ b/drivers/mailbox/arm-smc-mailbox.c
> > @@ -0,0 +1,215 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2016,2017 ARM Ltd.
> > + * Copyright 2019 NXP
> > + */
> > +
> > +#include <linux/arm-smccc.h>
> > +#include <linux/device.h>
> > +#include <linux/kernel.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/mailbox_controller.h> #include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define ARM_SMC_MBOX_MEM_TRANS	BIT(0)
> > +
> > +struct arm_smc_chan_data {
> > +	u32 function_id;
> > +	u32 chan_id;
> > +	u32 flags;
> > +};
> > +
> > +struct arm_smccc_mbox_cmd {
> > +	unsigned long a0, a1, a2, a3, a4, a5, a6, a7;
>=20
> I think this is one or even two registers too long?
> The SMCCC speaks of the function ID in x0/r0 and six arguments, with a
> "client ID" being an optional seventh argument. Looking at the descriptio=
n
> there I believe we cannot use the client ID here for this purpose, as thi=
s is
> supposed to be set by a hypervisor before passing on an SMC to EL3 firmwa=
re.
> KVM does not allow passing on SMCs in this way.

I'll drop a7.

>=20
> Also, while using "long" in here seems to make sense from the mailbox and
> SMC point of view, aliasing this to the mailbox client provided data seem=
s
> dangerous to me, as this exposes the difference between arm32 and arm64
> to the client. I think this is not what we want, the client should not be
> architecture specific.

I see.

>=20
> > +};
> > +
> > +typedef unsigned long (smc_mbox_fn)(unsigned long, unsigned long,
> > +				    unsigned long, unsigned long,
> > +				    unsigned long, unsigned long,
> > +				    unsigned long, unsigned long); static smc_mbox_fn
> > +*invoke_smc_mbox_fn;
> > +
> > +static int arm_smc_send_data(struct mbox_chan *link, void *data) {
> > +	struct arm_smc_chan_data *chan_data =3D link->con_priv;
> > +	struct arm_smccc_mbox_cmd *cmd =3D data;
> > +	unsigned long ret;
> > +	u32 function_id;
> > +	u32 chan_id;
> > +
> > +	if (chan_data->flags & ARM_SMC_MBOX_MEM_TRANS) {
> > +		if (chan_data->function_id !=3D UINT_MAX)
> > +			function_id =3D chan_data->function_id;
> > +		else
> > +			function_id =3D cmd->a0;
>=20
> This is somewhat surprising, dangerous and undocumented. We should *not*
> allow mailbox clients to specify the function ID. They could end up using=
 PSCI
> function IDs, for instance, that sounds especially scary if a client driv=
er allows
> userland to set parameters of some sort.

So the func id should not be an optional property in dts?
The check here is to not make func id an optional property and allow client=
 driver
pass function id.

> The function ID is presumably allocated and fixed in the firmware, so it =
should
> not be dynamic. Any dynamic properties should be done within a function I=
D
> on the protocol level, by using r1/x1, for instance.
>=20
> > +		chan_id =3D chan_data->chan_id;
>=20
> Why is this here? Where is this documented? Isn't this redundant with
> function ID? Or is this meant to be a replacement for it when a client pr=
ovided
> function ID is used (which is not desired, as mentioned above)?

This will be dropped after move to per channel as a controller.

>=20
> > +		ret =3D invoke_smc_mbox_fn(function_id, chan_id, 0, 0, 0, 0,
> > +					 0, 0);
> > +	} else {
> > +		ret =3D invoke_smc_mbox_fn(cmd->a0, cmd->a1, cmd->a2, cmd->a3,
> > +					 cmd->a4, cmd->a5, cmd->a6, cmd->a7);
> > +	}
>=20
> As mentioned in my reply to the binding patch, I don't see this is necess=
ary.
> Instead of ignoring the client provided data, we should just always pass =
it on.
> If clients and protocols don't use them, the client could zero it as well=
, letting
> the firmware side ignore it.

Per Jassi's comments, arm,func-id is an optional property.

So I would change to like below:
+       if (func_id)
+               function_id =3D chan_data->function_id;
+       else
+               function_id =3D cmd->a0;
+
+       if (data)
+               ret =3D invoke_smc_mbox_fn(function_id, cmd->args[1], cmd->=
args[2], cmd->args[3], cmd->args[4], cmd->args[5], cmd->args[6]);
+       else
+               ret =3D invoke_smc_mbox_fn(function_id, 0, 0, 0, 0, 0, 0);

And need a check if no data from client and no func_id, need return -EINVAL=
 to client.

How do you think?

>=20
> Also this underlines the problem with using "long" above: For 32-bit and =
64-bit
> kernels the layout would be different.
> I think the size of each argument should be determined by the calling
> convention class (bit 30) of the function ID.
> The client doesn't know about that one (it's a controller/firmware proper=
ty),
> so this driver here should split up the stream of data according to SMC64=
 vs.
> SMC32.
> Does that make sense?

Got it. Check the bit30 to decide use r[] or use x[] for SMCCC.

>=20
> > +
> > +	mbox_chan_received_data(link, (void *)ret);
>=20
> Not a mailbox expert, but shouldn't we mark the TX operation as complete
> here? Clearly by returning from the SMC the firmware has received the
> request.
> Whether the requested action has completed, is a protocol / mailbox clien=
t
> question.

I do not see any API to mark TX completed. My understanding is send_data
return value means complete finished.

>=20
> > +
> > +	return 0;
> > +}
> > +
> > +static unsigned long __invoke_fn_hvc(unsigned long function_id,
> > +				     unsigned long arg0, unsigned long arg1,
> > +				     unsigned long arg2, unsigned long arg3,
> > +				     unsigned long arg4, unsigned long arg5,
> > +				     unsigned long arg6)
> > +{
> > +	struct arm_smccc_res res;
> > +
> > +	arm_smccc_hvc(function_id, arg0, arg1, arg2, arg3, arg4,
> > +		      arg5, arg6, &res);
> > +	return res.a0;
> > +}
> > +
> > +static unsigned long __invoke_fn_smc(unsigned long function_id,
> > +				     unsigned long arg0, unsigned long arg1,
> > +				     unsigned long arg2, unsigned long arg3,
> > +				     unsigned long arg4, unsigned long arg5,
> > +				     unsigned long arg6)
> > +{
> > +	struct arm_smccc_res res;
> > +
> > +	arm_smccc_smc(function_id, arg0, arg1, arg2, arg3, arg4,
> > +		      arg5, arg6, &res);
> > +	return res.a0;
> > +}
> > +
> > +static const struct mbox_chan_ops arm_smc_mbox_chan_ops =3D {
> > +	.send_data	=3D arm_smc_send_data,
> > +};
> > +
> > +static int arm_smc_mbox_probe(struct platform_device *pdev) {
> > +	struct device *dev =3D &pdev->dev;
> > +	struct mbox_controller *mbox;
> > +	struct arm_smc_chan_data *chan_data;
> > +	const char *method;
> > +	bool mem_trans =3D false;
> > +	int ret, i;
> > +	u32 val;
> > +
> > +	if (!of_property_read_u32(dev->of_node, "arm,num-chans", &val)) {
> > +		if (!val) {
> > +			dev_err(dev, "invalid arm,num-chans value %u\n", val);
> > +			return -EINVAL;
> > +		}
> > +	} else {
> > +		return -EINVAL;
> > +	}
>=20
> As mentioned, this property should be removed, ...

Yes.

>=20
> > +
> > +	if (!of_property_read_string(dev->of_node, "transports", &method)) {
> > +		if (!strcmp("mem", method)) {
> > +			mem_trans =3D true;
> > +		} else if (!strcmp("reg", method)) {
> > +			mem_trans =3D false;
> > +		} else {
> > +			dev_warn(dev, "invalid \"transports\" property: %s\n",
> > +				 method);
> > +
> > +			return -EINVAL;
> > +		}
> > +	} else {
> > +		return -EINVAL;
> > +	}
>=20
> ... and this one as well.

Yes.

>=20
> > +
> > +	if (!of_property_read_string(dev->of_node, "method", &method)) {
> > +		if (!strcmp("hvc", method)) {
> > +			invoke_smc_mbox_fn =3D __invoke_fn_hvc;
> > +		} else if (!strcmp("smc", method)) {
> > +			invoke_smc_mbox_fn =3D __invoke_fn_smc;
> > +		} else {
> > +			dev_warn(dev, "invalid \"method\" property: %s\n",
> > +				 method);
>=20
> Just a nit, but if this is fatal for the driver, it should be dev_err().

Yes.

>=20
> > +
> > +			return -EINVAL;
> > +		}
> > +	} else {
> > +		return -EINVAL;
> > +	}
> > +
> > +	mbox =3D devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> > +	if (!mbox)
> > +		return -ENOMEM;
> > +
> > +	mbox->num_chans =3D val;
>=20
> This could be replaced with:
> 	mbox->num_chans =3D
> of_property_count_elems_of_size(dev_of_node(dev),
>                                      "arm,func-ids", sizeof(u32));
>=20
> > +	mbox->chans =3D devm_kcalloc(dev, mbox->num_chans,
> sizeof(*mbox->chans),
> > +				   GFP_KERNEL);
> > +	if (!mbox->chans)
> > +		return -ENOMEM;
> > +
> > +	chan_data =3D devm_kcalloc(dev, mbox->num_chans, sizeof(*chan_data),
> > +				 GFP_KERNEL);
> > +	if (!chan_data)
> > +		return -ENOMEM;
> > +
> > +	for (i =3D 0; i < mbox->num_chans; i++) {
> > +		u32 function_id;
> > +
> > +		ret =3D of_property_read_u32_index(dev->of_node,
> > +						 "arm,func-ids", i,
> > +						 &function_id);
> > +		if (ret)
> > +			chan_data[i].function_id =3D UINT_MAX;
> > +
> > +		else
> > +			chan_data[i].function_id =3D function_id;
>=20
> As mentioned above, this should go. Any non-0 return value should stop th=
e
> driver probing.

But if the func-id as an optional property, we need use the value from clie=
nt
driver.

Thanks,
Peng.
>=20
> Cheers,
> Andre.
>=20
> > +
> > +		chan_data[i].chan_id =3D i;
> > +
> > +		if (mem_trans)
> > +			chan_data[i].flags |=3D ARM_SMC_MBOX_MEM_TRANS;
> > +		mbox->chans[i].con_priv =3D &chan_data[i];
> > +	}
> > +
> > +	mbox->txdone_poll =3D false;
> > +	mbox->txdone_irq =3D false;
> > +	mbox->ops =3D &arm_smc_mbox_chan_ops;
> > +	mbox->dev =3D dev;
> > +
> > +	platform_set_drvdata(pdev, mbox);
> > +
> > +	ret =3D devm_mbox_controller_register(dev, mbox);
> > +	if (ret)
> > +		return ret;
> > +
> > +	dev_info(dev, "ARM SMC mailbox enabled with %d chan%s.\n",
> > +		 mbox->num_chans, mbox->num_chans =3D=3D 1 ? "" : "s");
> > +
> > +	return ret;
> > +}
> > +
> > +static int arm_smc_mbox_remove(struct platform_device *pdev) {
> > +	struct mbox_controller *mbox =3D platform_get_drvdata(pdev);
> > +
> > +	mbox_controller_unregister(mbox);
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id arm_smc_mbox_of_match[] =3D {
> > +	{ .compatible =3D "arm,smc-mbox", },
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, arm_smc_mbox_of_match);
> > +
> > +static struct platform_driver arm_smc_mbox_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "arm-smc-mbox",
> > +		.of_match_table =3D arm_smc_mbox_of_match,
> > +	},
> > +	.probe		=3D arm_smc_mbox_probe,
> > +	.remove		=3D arm_smc_mbox_remove,
> > +};
> > +module_platform_driver(arm_smc_mbox_driver);
> > +
> > +MODULE_AUTHOR("Andre Przywara <andre.przywara@arm.com>");
> > +MODULE_DESCRIPTION("Generic ARM smc mailbox driver");
> > +MODULE_LICENSE("GPL v2");
