From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: irq: add binding for Freescale IRQSTEER multiplexer
Date: Fri, 26 Oct 2018 11:29:36 -0500
Message-ID: <CAL_Jsq+f+TyeuStN4NLrq1E_xMS8_QqUW1jfami0+NnUChRKLA@mail.gmail.com>
References: <20181016164218.3736-1-l.stach@pengutronix.de> <20181025143504.GA9673@bogus>
 <1540570298.2245.13.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540570298.2245.13.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, patchwork-lst@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Fri, Oct 26, 2018 at 11:11 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Hi Rob,
>
> Am Donnerstag, den 25.10.2018, 09:35 -0500 schrieb Rob Herring:
> > On Tue, Oct 16, 2018 at 06:42:17PM +0200, Lucas Stach wrote:
> > > This adds the DT binding for the Freescale IRQSTEER interrupt
> > > multiplexer found in the i.MX8 familiy SoCs.
> > >
> > > > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > ---
> > >  .../interrupt-controller/fsl,irqsteer.txt     | 39 +++++++++++++++++++
> > >  1 file changed, 39 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> > > new file mode 100644
> > > index 000000000000..ed2b18165591
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
> > > @@ -0,0 +1,39 @@
> > > +Freescale IRQSTEER Interrupt multiplexer
> > > +
> > > +Required properties:
> > > +
> > > +- compatible: should be:
> > > > > +       - "fsl,imx8m-irqsteer"
> > > > > +       - "fsl,imx-irqsteer"
> > > +- reg: Physical base address and size of registers.
> > > +- interrupts: Should contain the parent interrupt line used to multiplex the
> > > +  input interrupts.
> > > +- clocks: Should contain one clock for entry in clock-names
> > > +  see Documentation/devicetree/bindings/clock/clock-bindings.txt
> > > +- clock-names:
> > > +   - "ipg": main logic clock
> > > +- interrupt-controller: Identifies the node as an interrupt controller.
> > > +- #interrupt-cells: Specifies the number of cells needed to encode an
> > > +  interrupt source. The value must be 2.
> > > +
> > > +Optional properties:
> > > +- fsl,channel: Number of channels managed by this controller. Each channel
> > > +  contains up to 32 interrupt sources. If absent defaults to 1.
> >
> > What's a channel? Why isn't this implied by the compatible?
>
> The documentation calls the mux outputs a channel. Basically the
> irqsteer IP block can mux up to 512 input interrupts onto up to 8
> output interrupt lines (just noticed that the 32 in the description is
> wrong and should be 64).

Then shouldn't you have up to 8 int specifiers in 'interrupts' property?

> So the channel count defines the number of input IRQs in steps of 64
> and the output IRQs in steps of 1. The register layout/offsets don't
> change with different number of channels, as those are always laid out
> as if the controller supported the maximum count of 8 channels. It's
> just the actual implemented number of registers that change.

So do you actually need to know how many channels? We don't typically
put into DT what interrupt lines are actually connected. We assume the
interrupt connections in DT are correct.

Also, if 'interrupts' listed all the muxed output connections, then
you could get the same information from there.

Rob
