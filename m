From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V3 2/4] dt-bindings: irq: imx-irqsteer: add multi output
 interrupts support
Date: Wed, 20 Feb 2019 06:37:47 +0000
Message-ID: <AM6PR04MB421536C38BF72B8739485304807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
References: <1548921464-28917-1-git-send-email-aisheng.dong@nxp.com>
 <1548921464-28917-3-git-send-email-aisheng.dong@nxp.com>
 <23f5f2f0-79b8-b9f7-9f46-972966563596@arm.com> <20190213222952.GA4814@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213222952.GA4814@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Thursday, February 14, 2019 6:30 AM
> On Mon, Feb 11, 2019 at 03:34:23PM +0000, Marc Zyngier wrote:
> > On 31/01/2019 08:03, Aisheng Dong wrote:
> > > One irqsteer channel can support up to 8 output interrupts.
> > >
> > > Cc: Marc Zyngier <marc.zyngier@arm.com>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > ---
> > > ChangeLog:
> > > v2->v3:
> > >  * fix a typo
> > > v1->v2:
> > >  * remove one unnecessary note.
> > > ---
> > >  .../devicetree/bindings/interrupt-controller/fsl,irqsteer.txt       =
 | 5
> +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqstee
> > > r.txt
> > > b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqstee
> > > r.txt
> > > index 6d0a41b..582991c 100644
> > > ---
> > > a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqstee
> > > r.txt
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irq
> > > +++ steer.txt
> > > @@ -6,8 +6,9 @@ Required properties:
> > >  	- "fsl,imx8m-irqsteer"
> > >  	- "fsl,imx-irqsteer"
> > >  - reg: Physical base address and size of registers.
> > > -- interrupts: Should contain the parent interrupt line used to
> > > multiplex the
> > > -  input interrupts.
> > > +- interrupts: Should contain the up to 8 parent interrupt lines
> > > +used to
> > > +  multiplex the input interrupts. They should be specified
> > > +sequentially
> > > +  from output 0 to 7.
> > >  - clocks: Should contain one clock for entry in clock-names
> > >    see Documentation/devicetree/bindings/clock/clock-bindings.txt
> > >  - clock-names:
> > >
> >
> > I'd like an Ack from a DT person, as this is a change to an existing
> > binding.
>=20
> It's fine as long as old kernels ignore extra entries and new kernels sti=
ll support
> a single entry. Otherwise, it needs a explanation.

Yes, it's like that. No compatibility break.

Regards
Dong Aisheng
>=20
> Rob
