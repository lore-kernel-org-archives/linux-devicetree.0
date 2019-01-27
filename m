From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: irq: imx-irqsteer: add multi output
 interrupts support
Date: Sun, 27 Jan 2019 22:05:23 +0800
Message-ID: <CAA+hA=QsbQ7k-5aXyWCM+Fss5nc7yr5=CRC3Uo+5r67Da5Pg6g@mail.gmail.com>
References: <1547797668-30342-1-git-send-email-aisheng.dong@nxp.com>
 <1547797668-30342-3-git-send-email-aisheng.dong@nxp.com> <1548413169.28802.43.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548413169.28802.43.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 25, 2019 at 6:47 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Am Freitag, den 18.01.2019, 07:53 +0000 schrieb Aisheng Dong:
> > One irqsteer channel can support up to 8 output interrupts.
> >
> > > Cc: Marc Zyngier <marc.zyngier@arm.com>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> >  .../devicetree/bindings/interrupt-controller/fsl,irqsteer.txt        | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> > index eaabcda..beeed4a 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> > @@ -6,8 +6,9 @@ Required properties:
> > >     - "fsl,imx8m-irqsteer"
> > >     - "fsl,imx-irqsteer"
> >  - reg: Physical base address and size of registers.
> > -- interrupts: Should contain the parent interrupt line used to multiplex the
> > -  input interrupts.
> > +- interrupts: Should contain the up to 8 parent interrupt lines used to
> > +  multiplex the input interrupts. They should be sepcified seqencially
> > +  from output 0 to 7. NOTE at least one output interrupt has to be specified.
>
> I don't think the note clarifies anything. Given that the thing is a
> irq multiplexer I don't think anyone expects that you could get away
> with no output irq.
>

Sound reasonable to me.
I will remove the note and keep other as it is.

Regards
Dong Aisheng
