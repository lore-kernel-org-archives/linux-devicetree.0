From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH 4/4] irq: imx: irqsteer: add multi output interrupts
 support
Date: Sun, 27 Jan 2019 18:38:29 +0800
Message-ID: <CAA+hA=TmBBTaNtmWFEX62LViwPKsBTvv-jWcwU7a7K7yh=JhYQ@mail.gmail.com>
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
 <1548412956.28802.41.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548412956.28802.41.camel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Lucas,

[...]

> > > The fsl,irq-groups property is exactly your NINT32 parameter above. I just
> > > wrongly assumed that it's always in multiples of 64, as that's what the
> > > i.MX8MQ DCSS irqsteer module looks like. We should fix this and be done with
> > > it.
> > >
> >
> > No, not exactly the same thing. Using group will confuse people that the group is 32.
> > However, internally Group is fixed 64 interrupts although it may not use all the
> > 64 interrupts. E.g. 32 interrupts.
> > See CHn_MINTDIS register which is also defined fixed to 64.
> >
> > The two HW parameter for integration is already very clear. We should use interrupts
> > Number for the channel. Not group.
>
> Okay, I see that the name irq-groups is confusing for you. But then I
> find the -per-chan naming confusing.
>
> So given that we seem to agree to split each channel into it's own DT
> node, there is no need to name the property "something-per-chan", as
> it's implied by the split DT nodes that all properties in one node are
> referencing a channel.
>

Double checked with IP module owner by looking into the RTL code,
writes to CHANnCTL registers have no effect.
This register is reserved and the doc will be updated.
Verified on both MX8QXP and MX8MQ.

All channels are isolated and have independent programming model.
So it will be okay to define them separately in device tree.

> May I suggest to name the property "fsl,num-irqs"?

Sounds good to me.

Regards
Dong Aisheng

>
> Regards,
> Lucas
>
