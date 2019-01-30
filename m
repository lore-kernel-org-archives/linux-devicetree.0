From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH V2 2/4] dt-bindings: irq: imx-irqsteer: add multi output
 interrupts support
Date: Wed, 30 Jan 2019 21:33:47 +0800
Message-ID: <CAA+hA=QCYzjqDx1ELSu4dbrwy8JNr4TUr8N1fzKunjT13KEvYA@mail.gmail.com>
References: <1548853196-11447-1-git-send-email-aisheng.dong@nxp.com>
 <1548853196-11447-3-git-send-email-aisheng.dong@nxp.com> <1548854330.6869.22.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548854330.6869.22.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 30, 2019 at 9:21 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Am Mittwoch, den 30.01.2019, 13:05 +0000 schrieb Aisheng Dong:
> > One irqsteer channel can support up to 8 output interrupts.
> >
> > > Cc: Marc Zyngier <marc.zyngier@arm.com>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> > ChangeLog:
> > v1->v2:
> >  * remove one unnecessary note.
> > ---
> >  .../devicetree/bindings/interrupt-controller/fsl,irqsteer.txt        | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> > index 6d0a41b..984ab92 100644
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
>
> Typos here, should be: "specified sequentially"
>

Nice catch. Will update in new version.
Thanks

Regards
Dong Aisheng

> > +  from output 0 to 7.
> >  - clocks: Should contain one clock for entry in clock-names
> >    see Documentation/devicetree/bindings/clock/clock-bindings.txt
> >  - clock-names:
