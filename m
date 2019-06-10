From: Andre Przywara <andre.przywara@foss.arm.com>
Subject: Re: [PATCH V2 2/2] mailbox: introduce ARM SMC based mailbox
Date: Mon, 10 Jun 2019 11:00:33 +0100
Message-ID: <20190610110033.28d21d21@donnerap.cambridge.arm.com>
References: <20190603083005.4304-1-peng.fan@nxp.com>
        <20190603083005.4304-3-peng.fan@nxp.com>
        <866db682-785a-e0a6-b394-bb65c7a694c6@gmail.com>
        <20190606142056.68272dc0@donnerap.cambridge.arm.com>
        <AM0PR04MB448168C72F1D40C1B9BEB1F788130@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM0PR04MB448168C72F1D40C1B9BEB1F788130@AM0PR04MB4481.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "van.freenix@gmail.com" <van.freenix@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, 10 Jun 2019 01:32:49 +0000
Peng Fan <peng.fan@nxp.com> wrote:

Hi Peng,

[ ... ]

> > > > +
> > > > +	irq_count = platform_irq_count(pdev);
> > > > +	if (irq_count == -EPROBE_DEFER)
> > > > +		return irq_count;
> > > > +
> > > > +	if (irq_count && irq_count != val) {
> > > > +		dev_err(dev, "Interrupts not match num-chans\n");  
> > >
> > > Interrupts property does not match \"arm,num-chans\" would be more  
> > correct.
> > 
> > Given that interrupts are optional, do we have to rely on this?   
> 
> If there is interrupt property, the interrupts should match channel counts.
> 
> Do we actually
> > need one interrupt per channel?  
> 
> I thought about this, provide one interrupt for all channels.
> But there is no good way to let interrupt handlers know which
> channel triggers the interrupt. So I use one interrupt per channel.

Yeah, I was wondering about this as well. Seems like we need this indeed.
Just sounds wasteful, but I guess we don't expect many channels anyway,
normally.

Cheers,
Andre.
