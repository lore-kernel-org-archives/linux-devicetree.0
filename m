From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH V2 2/2] mailbox: introduce ARM SMC based mailbox
Date: Mon, 10 Jun 2019 01:32:49 +0000
Message-ID: <AM0PR04MB448168C72F1D40C1B9BEB1F788130@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190603083005.4304-1-peng.fan@nxp.com>
 <20190603083005.4304-3-peng.fan@nxp.com>
 <866db682-785a-e0a6-b394-bb65c7a694c6@gmail.com>
 <20190606142056.68272dc0@donnerap.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190606142056.68272dc0@donnerap.cambridge.arm.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andre Przywara <andre.przywara@arm.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "van.freenix@gmail.com" <van.freenix@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Andre,
> Subject: Re: [PATCH V2 2/2] mailbox: introduce ARM SMC based mailbox
> 
> On Mon, 3 Jun 2019 09:32:42 -0700
> Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
> Hi,
> 
> > On 6/3/19 1:30 AM, peng.fan@nxp.com wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > This mailbox driver implements a mailbox which signals transmitted
> > > data via an ARM smc (secure monitor call) instruction. The mailbox
> > > receiver is implemented in firmware and can synchronously return
> > > data when it returns execution to the non-secure world again.
> > > An asynchronous receive path is not implemented.
> > > This allows the usage of a mailbox to trigger firmware actions on
> > > SoCs which either don't have a separate management processor or on
> > > which such a core is not available. A user of this mailbox could be
> > > the SCP interface.
> > >
> > > Modified from Andre Przywara's v2 patch
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flo
> > >
> re.kernel.org%2Fpatchwork%2Fpatch%2F812999%2F&amp;data=02%7C01%
> 7Cpen
> > >
> g.fan%40nxp.com%7C15c4180b8fe5405d3de808d6ea81d5f1%7C686ea1d3bc
> 2b4c6
> > >
> fa92cd99c5c301635%7C0%7C0%7C636954240720601454&amp;sdata=1Cp
> WSgTH7lF
> > > cBKxJnLeIDw%2FDAQJJO%2FVypV1LUU1BRQA%3D&amp;reserved=0
> > >
> > > Cc: Andre Przywara <andre.przywara@arm.com>
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> >
> > [snip]
> >
> > +#define ARM_SMC_MBOX_USB_IRQ	BIT(1)
> >
> > That flag appears unused.
> >
> > > +static int arm_smc_mbox_probe(struct platform_device *pdev) {
> > > +	struct device *dev = &pdev->dev;
> > > +	struct mbox_controller *mbox;
> > > +	struct arm_smc_chan_data *chan_data;
> > > +	const char *method;
> > > +	bool use_hvc = false;
> > > +	int ret, irq_count, i;
> > > +	u32 val;
> > > +
> > > +	if (!of_property_read_u32(dev->of_node, "arm,num-chans", &val)) {
> > > +		if (val < 1 || val > INT_MAX) {
> > > +			dev_err(dev, "invalid arm,num-chans value %u
> of %pOFn\n", val,
> > > +pdev->dev.of_node);
> 
> Isn't the of_node parameter redundant, because dev_err() already takes care
> of that?

I'll remove that.

> 
> > > +			return -EINVAL;
> > > +		}
> > > +	}
> >
> > Should not the upper bound check be done against UINT_MAX since val is
> > an unsigned int?
> 
> But wouldn't that be somewhat pointless, given that val is a u32? So I guess
> we could just condense this down to:
> ...
> 		if (!val) {
> ...

make sense.

> 
> > > +
> > > +	irq_count = platform_irq_count(pdev);
> > > +	if (irq_count == -EPROBE_DEFER)
> > > +		return irq_count;
> > > +
> > > +	if (irq_count && irq_count != val) {
> > > +		dev_err(dev, "Interrupts not match num-chans\n");
> >
> > Interrupts property does not match \"arm,num-chans\" would be more
> correct.
> 
> Given that interrupts are optional, do we have to rely on this? 

If there is interrupt property, the interrupts should match channel counts.

Do we actually
> need one interrupt per channel?

I thought about this, provide one interrupt for all channels.
But there is no good way to let interrupt handlers know which
channel triggers the interrupt. So I use one interrupt per channel.

> 
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (!of_property_read_string(dev->of_node, "method", &method)) {
> > > +		if (!strcmp("hvc", method)) {
> > > +			use_hvc = true;
> > > +		} else if (!strcmp("smc", method)) {
> > > +			use_hvc = false;
> > > +		} else {
> > > +			dev_warn(dev, "invalid \"method\" property: %s\n",
> > > +				 method);
> > > +
> > > +			return -EINVAL;
> > > +		}
> >
> > Having at least one method specified does not seem to be checked later
> > on in the code, so if I omitted to specify that property, we would
> > still register the mailbox and default to use "smc" since the
> > ARM_SMC_MBOX_USE_HVC flag would not be set, would not we want to
> make
> > sure that we do have in fact a valid method specified given the
> > binding documents that property as mandatory?
> >
> > [snip]
> >
> > > +	mbox->txdone_poll = false;
> > > +	mbox->txdone_irq = false;
> > > +	mbox->ops = &arm_smc_mbox_chan_ops;
> > > +	mbox->dev = dev;
> > > +
> > > +	ret = mbox_controller_register(mbox);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	platform_set_drvdata(pdev, mbox);
> >
> > I would move this above mbox_controller_register() that way there is
> > no room for race conditions in case another part of the driver expects
> > to have pdev->dev.drvdata set before the mbox controller is registered.
> > Since you use devm_* functions for everything, you may even remove
> > that call.
> >
> > [snip]
> >
> > > +#ifndef _LINUX_ARM_SMC_MAILBOX_H_
> > > +#define _LINUX_ARM_SMC_MAILBOX_H_
> > > +
> > > +struct arm_smccc_mbox_cmd {
> > > +	unsigned long a0, a1, a2, a3, a4, a5, a6, a7; };
> >
> > Do you expect this to be used by other in-kernel users? If so, it
> > might be good to document how a0 can have a special meaning and be
> > used as a substitute for the function_id?
> 
> I don't think we should really expose this outside of the driver. From a mailbox
> point of view this is just the payload, transported according to the SMCCC.
> Also using "long" here sounds somewhat troublesome.
> 
> Also, looking at the SMCCC, I only see six parameters in addition to the
> function identifier. Shall we reflect this here?

I could move it to driver code. Jassi, do you have any comments?

Thanks,
Peng.

> 
> Cheers,
> Andre.
