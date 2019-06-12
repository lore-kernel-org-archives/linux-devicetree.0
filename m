From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH V2 2/2] mailbox: introduce ARM SMC based mailbox
Date: Wed, 12 Jun 2019 12:59:04 +0000
Message-ID: <AM0PR04MB4481617CD1DFA9C01470B38E88EC0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190603083005.4304-1-peng.fan@nxp.com>
 <20190603083005.4304-3-peng.fan@nxp.com>
 <866db682-785a-e0a6-b394-bb65c7a694c6@gmail.com>
 <20190606142056.68272dc0@donnerap.cambridge.arm.com>
 <AM0PR04MB448168C72F1D40C1B9BEB1F788130@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM0PR04MB448168C72F1D40C1B9BEB1F788130@AM0PR04MB4481.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "van.freenix@gmail.com" <van.freenix@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Andre,

> Subject: RE: [PATCH V2 2/2] mailbox: introduce ARM SMC based mailbox
>=20
> Hi Andre,
> > Subject: Re: [PATCH V2 2/2] mailbox: introduce ARM SMC based mailbox
> >
> > On Mon, 3 Jun 2019 09:32:42 -0700
> > Florian Fainelli <f.fainelli@gmail.com> wrote:
> >
> > Hi,
> >
> > > On 6/3/19 1:30 AM, peng.fan@nxp.com wrote:
> > > > From: Peng Fan <peng.fan@nxp.com>
> > > >
> > > > This mailbox driver implements a mailbox which signals transmitted
> > > > data via an ARM smc (secure monitor call) instruction. The mailbox
> > > > receiver is implemented in firmware and can synchronously return
> > > > data when it returns execution to the non-secure world again.
> > > > An asynchronous receive path is not implemented.
> > > > This allows the usage of a mailbox to trigger firmware actions on
> > > > SoCs which either don't have a separate management processor or on
> > > > which such a core is not available. A user of this mailbox could
> > > > be the SCP interface.
> > > >
> > > > Modified from Andre Przywara's v2 patch
> > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
F
> > > > lo
> > > >
> >
> re.kernel.org%2Fpatchwork%2Fpatch%2F812999%2F&amp;data=3D02%7C01%
> > 7Cpen
> > > >
> >
> g.fan%40nxp.com%7C15c4180b8fe5405d3de808d6ea81d5f1%7C686ea1d3bc
> > 2b4c6
> > > >
> > fa92cd99c5c301635%7C0%7C0%7C636954240720601454&amp;sdata=3D1Cp
> > WSgTH7lF
> > > > cBKxJnLeIDw%2FDAQJJO%2FVypV1LUU1BRQA%3D&amp;reserved=3D0
> > > >
> > > > Cc: Andre Przywara <andre.przywara@arm.com>
> > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > ---
> > >
> > > [snip]
> > >
> > > +#define ARM_SMC_MBOX_USB_IRQ	BIT(1)
> > >
> > > That flag appears unused.
> > >
> > > > +static int arm_smc_mbox_probe(struct platform_device *pdev) {
> > > > +	struct device *dev =3D &pdev->dev;
> > > > +	struct mbox_controller *mbox;
> > > > +	struct arm_smc_chan_data *chan_data;
> > > > +	const char *method;
> > > > +	bool use_hvc =3D false;
> > > > +	int ret, irq_count, i;
> > > > +	u32 val;
> > > > +
> > > > +	if (!of_property_read_u32(dev->of_node, "arm,num-chans", &val)) {
> > > > +		if (val < 1 || val > INT_MAX) {
> > > > +			dev_err(dev, "invalid arm,num-chans value %u
> > of %pOFn\n", val,
> > > > +pdev->dev.of_node);
> >
> > Isn't the of_node parameter redundant, because dev_err() already takes
> > care of that?
>=20
> I'll remove that.
>=20
> >
> > > > +			return -EINVAL;
> > > > +		}
> > > > +	}
> > >
> > > Should not the upper bound check be done against UINT_MAX since val
> > > is an unsigned int?
> >
> > But wouldn't that be somewhat pointless, given that val is a u32? So I
> > guess we could just condense this down to:
> > ...
> > 		if (!val) {
> > ...
>=20
> make sense.
>=20
> >
> > > > +
> > > > +	irq_count =3D platform_irq_count(pdev);
> > > > +	if (irq_count =3D=3D -EPROBE_DEFER)
> > > > +		return irq_count;
> > > > +
> > > > +	if (irq_count && irq_count !=3D val) {
> > > > +		dev_err(dev, "Interrupts not match num-chans\n");
> > >
> > > Interrupts property does not match \"arm,num-chans\" would be more
> > correct.
> >
> > Given that interrupts are optional, do we have to rely on this?
>=20
> If there is interrupt property, the interrupts should match channel count=
s.
>=20
> Do we actually
> > need one interrupt per channel?
>=20
> I thought about this, provide one interrupt for all channels.
> But there is no good way to let interrupt handlers know which channel
> triggers the interrupt. So I use one interrupt per channel.
>=20
> >
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	if (!of_property_read_string(dev->of_node, "method", &method)) {
> > > > +		if (!strcmp("hvc", method)) {
> > > > +			use_hvc =3D true;
> > > > +		} else if (!strcmp("smc", method)) {
> > > > +			use_hvc =3D false;
> > > > +		} else {
> > > > +			dev_warn(dev, "invalid \"method\" property: %s\n",
> > > > +				 method);
> > > > +
> > > > +			return -EINVAL;
> > > > +		}
> > >
> > > Having at least one method specified does not seem to be checked
> > > later on in the code, so if I omitted to specify that property, we
> > > would still register the mailbox and default to use "smc" since the
> > > ARM_SMC_MBOX_USE_HVC flag would not be set, would not we want to
> > make
> > > sure that we do have in fact a valid method specified given the
> > > binding documents that property as mandatory?
> > >
> > > [snip]
> > >
> > > > +	mbox->txdone_poll =3D false;
> > > > +	mbox->txdone_irq =3D false;
> > > > +	mbox->ops =3D &arm_smc_mbox_chan_ops;
> > > > +	mbox->dev =3D dev;
> > > > +
> > > > +	ret =3D mbox_controller_register(mbox);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	platform_set_drvdata(pdev, mbox);
> > >
> > > I would move this above mbox_controller_register() that way there is
> > > no room for race conditions in case another part of the driver
> > > expects to have pdev->dev.drvdata set before the mbox controller is
> registered.
> > > Since you use devm_* functions for everything, you may even remove
> > > that call.
> > >
> > > [snip]
> > >
> > > > +#ifndef _LINUX_ARM_SMC_MAILBOX_H_ #define
> > > > +_LINUX_ARM_SMC_MAILBOX_H_
> > > > +
> > > > +struct arm_smccc_mbox_cmd {
> > > > +	unsigned long a0, a1, a2, a3, a4, a5, a6, a7; };
> > >
> > > Do you expect this to be used by other in-kernel users? If so, it
> > > might be good to document how a0 can have a special meaning and be
> > > used as a substitute for the function_id?
> >
> > I don't think we should really expose this outside of the driver. From
> > a mailbox point of view this is just the payload, transported according=
 to the
> SMCCC.
> > Also using "long" here sounds somewhat troublesome.

Long on ARM64 is 64bit, and 32bit on ARM32, so I use long.
Do you forsee any issues?

> >
> > Also, looking at the SMCCC, I only see six parameters in addition to
> > the function identifier. Shall we reflect this here?

a0 is used as function id, not no arm,func-ids provided in dts. a1-a7 are
also passed to smc.
If arm,func-ids is provided, a0 will be omitted just for consistency as abo=
ve.

You mean write comments in the code for it?

Thanks,
Peng.

>=20
> I could move it to driver code. Jassi, do you have any comments?
>=20
> Thanks,
> Peng.
>=20
> >
> > Cheers,
> > Andre.
