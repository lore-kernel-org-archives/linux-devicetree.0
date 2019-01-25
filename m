From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 4/4] irq: imx: irqsteer: add multi output interrupts
 support
Date: Fri, 25 Jan 2019 11:42:36 +0100
Message-ID: <1548412956.28802.41.camel@pengutronix.de>
References: <1547797668-30342-1-git-send-email-aisheng.dong@nxp.com>
         <1547797668-30342-5-git-send-email-aisheng.dong@nxp.com>
         <1547801609.2626.5.camel@pengutronix.de>
         <AM0PR04MB42111D634F28492434AA9309809C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
         <1547806960.2626.9.camel@pengutronix.de>
         <AM0PR04MB42111FE266342A2C2EAECC3580980@AM0PR04MB4211.eurprd04.prod.outlook.com>
         <1548154758.2465.20.camel@pengutronix.de>
         <AM0PR04MB4211B9003857795EBC79541480980@AM0PR04MB4211.eurprd04.prod.outlook.com>
         <1548161549.2465.24.camel@pengutronix.de>
         <AM0PR04MB42114F3D625CC48343EA427080980@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM0PR04MB42114F3D625CC48343EA427080980@AM0PR04MB4211.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aisheng Dong <aisheng.dong@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

Hi,

Am Dienstag, den 22.01.2019, 13:17 +0000 schrieb Aisheng Dong:
> > > > From: Lucas Stach [mailto:l.stach@pengutronix.de]
> > Sent: Tuesday, January 22, 2019 8:52 PM
> > > > To: Aisheng Dong <aisheng.dong@nxp.com>; linux-kernel@vger.kernel.org
> > > > > > Cc: linux-arm-kernel@lists.infradead.org; shawnguo@kernel.org; dl-linux-imx
> > > > > > > > <linux-imx@nxp.com>; robh+dt@kernel.org; devicetree@vger.kernel.org;
> > > > tglx@linutronix.de; Marc Zyngier <marc.zyngier@arm.com>
> > Subject: Re: [PATCH 4/4] irq: imx: irqsteer: add multi output interrupts support
> > 
> > Am Dienstag, den 22.01.2019, 12:03 +0000 schrieb Aisheng Dong:
> > > > > > From: Lucas Stach [mailto:l.stach@pengutronix.de]
> > > > 
> > > > Sent: Tuesday, January 22, 2019 6:59 PM
> > > > 
> > > > Am Dienstag, den 22.01.2019, 10:39 +0000 schrieb Aisheng Dong:
> > > > > > > > From: Lucas Stach [mailto:l.stach@pengutronix.de]
> > > > > > 
> > > > > > Sent: Friday, January 18, 2019 6:23 PM
> > > > > 
> > > > > [...]
> > > > > > > > This has been discussed when upstreaming the driver. The
> > > > > > > > controller may support multiple output IRQs, but only one
> > > > > > > > them is actually used depending on the CHANCTRL config.
> > > > > > > > There is no use in hooking up all the output IRQs in DT, if
> > > > > > > > only one of them is actually used. Some of the outputs may
> > > > > > > > not even be visible to the Linux system, but may belong to a
> > > > > > > > Cortex M4 subsystem. All of those configurations can be
> > > > > > > > described in DT by changing the upstream interrupt and
> > > > > > > > "fsl,channel" in a
> > > > > > 
> > > > > > coherent way.
> > > > > > > > 
> > > > > > > > Please correct me if my understanding is totally wrong.
> > > > > > > 
> > > > > > > I'm afraid your understanding of CHAN seems wrong.
> > > > > > > (Binding doc of that property needs change as well).
> > > > > > > 
> > > > > > > On QXP DC SS, the IRQSTEER supports 512 interrupts with 8
> > > > > > > interrupt output Conntected to GIC.
> > > > > > > The current driver does not support it as it assumes only one
> > > > > > > interrupt
> > > > > > 
> > > > > > output used.
> > > > > > 
> > > > > > Okay, so let's take a step back. The description in the QXP RM
> > > > > > is actually better than what I've seen until now. Still it's
> > > > > > totally confusing that
> > > > 
> > > > the "channel"
> > > > > > terminology used with different meanings in docs. Let's try to
> > > > > > avoid this as much as possible.
> > > > > > 
> > > > > > So to get things straight: Each irqsteer controller has a number
> > > > > > of IRQ
> > > > 
> > > > groups.
> > > > > > All the input IRQs of one group are ORed together to form on output
> > 
> > IRQ.
> > > > > > Depending on the SoC integration, a group can contain 32 or
> > > > > > 64 IRQs, where DCSS irqsteer on MX8M and the big 512 input
> > > > > > controllers on QXP and QM both use 64 IRQs per group. You are
> > > > > > claiming that the smaller controllers on both QXP am QM have
> > > > > > only 32
> > > > 
> > > > IRQs per group, right?
> > > > > > 
> > > > > > So the only change that is needed is that the driver needs to
> > > > > > know the number of input IRQs per group, with a default of 64 to
> > > > > > not break DT
> > > > 
> > > > compatibility.
> > > > > > 
> > > > > 
> > > > > Not exactly.
> > > > > from HW point of view , there're two parameters during IRQSTEER
> > > > 
> > > > integration.
> > > > > For example,
> > > > > DC in QXP:
> > > > > > > > > > > > > > > > > parameter  IRQCHAN		=  1;
> > 
> > 	//Number of IRQ Channels/Slots
> > > > > > > parameter  NINT32		=  8;	//Number of interrupts in
> > 
> > multiple
> > > > 
> > > > of 32
> > > > 
> > > > If this is always in multiples of 32, the only change we need to
> > > > make to the driver is to fix DT binding and interpretation of the
> > > > "fsl,irq-groups" property to be in multiples of 32.
> > > > 
> > > > This means i.MX8MQ DCSS irqsteer would need to change to 2
> > > > irq-groups, but as this isn't used upstream yet we can still do this
> > > > change without breaking too much stuff and I would rather correct
> > > > this now than keeping a DT binding around that doesn't match the HW.
> > > > 
> > > 
> > > We want to avoid using of irq-groups as it's wrong.
> > > Stick to HW parameters, only channel number and interrupts number should
> > 
> > be used.
> > 
> > The fsl,irq-groups property is exactly your NINT32 parameter above. I just
> > wrongly assumed that it's always in multiples of 64, as that's what the
> > i.MX8MQ DCSS irqsteer module looks like. We should fix this and be done with
> > it.
> > 
> 
> No, not exactly the same thing. Using group will confuse people that the group is 32.
> However, internally Group is fixed 64 interrupts although it may not use all the
> 64 interrupts. E.g. 32 interrupts.
> See CHn_MINTDIS register which is also defined fixed to 64.
> 
> The two HW parameter for integration is already very clear. We should use interrupts
> Number for the channel. Not group. 

Okay, I see that the name irq-groups is confusing for you. But then I
find the -per-chan naming confusing.

So given that we seem to agree to split each channel into it's own DT
node, there is no need to name the property "something-per-chan", as
it's implied by the split DT nodes that all properties in one node are
referencing a channel.

May I suggest to name the property "fsl,num-irqs"?

Regards,
Lucas
