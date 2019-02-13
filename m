From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 2/4] dt-bindings: irq: imx-irqsteer: add multi output
 interrupts support
Date: Wed, 13 Feb 2019 16:29:52 -0600
Message-ID: <20190213222952.GA4814@bogus>
References: <1548921464-28917-1-git-send-email-aisheng.dong@nxp.com>
 <1548921464-28917-3-git-send-email-aisheng.dong@nxp.com>
 <23f5f2f0-79b8-b9f7-9f46-972966563596@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <23f5f2f0-79b8-b9f7-9f46-972966563596@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 11, 2019 at 03:34:23PM +0000, Marc Zyngier wrote:
> On 31/01/2019 08:03, Aisheng Dong wrote:
> > One irqsteer channel can support up to 8 output interrupts.
> > 
> > Cc: Marc Zyngier <marc.zyngier@arm.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> > ChangeLog:
> > v2->v3:
> >  * fix a typo
> > v1->v2:
> >  * remove one unnecessary note.
> > ---
> >  .../devicetree/bindings/interrupt-controller/fsl,irqsteer.txt        | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> > index 6d0a41b..582991c 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> > @@ -6,8 +6,9 @@ Required properties:
> >  	- "fsl,imx8m-irqsteer"
> >  	- "fsl,imx-irqsteer"
> >  - reg: Physical base address and size of registers.
> > -- interrupts: Should contain the parent interrupt line used to multiplex the
> > -  input interrupts.
> > +- interrupts: Should contain the up to 8 parent interrupt lines used to
> > +  multiplex the input interrupts. They should be specified sequentially
> > +  from output 0 to 7.
> >  - clocks: Should contain one clock for entry in clock-names
> >    see Documentation/devicetree/bindings/clock/clock-bindings.txt
> >  - clock-names:
> > 
> 
> I'd like an Ack from a DT person, as this is a change to an existing
> binding.

It's fine as long as old kernels ignore extra entries and new kernels 
still support a single entry. Otherwise, it needs a explanation.

Rob
