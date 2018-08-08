From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 6/8] dt-bindings: interrupt-controller: RISC-V PLIC documentation
Date: Wed, 8 Aug 2018 10:15:58 -0600
Message-ID: <CAL_JsqKgawQA5V2W1e9QFb_Ri+Aka-08WizeSD9kdxyBdcwpEQ@mail.gmail.com>
References: <20180804082319.5711-1-hch@lst.de> <20180804082319.5711-7-hch@lst.de>
 <CAL_JsqKKCPhb1um_+68ya0ng_v2tSb5O+-8RQPqx7Od3sJ4FuA@mail.gmail.com> <20180808150448.GA31785@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180808150448.GA31785@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@sifive.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Anup Patel <anup@brainfault.org>, atish.patra@wdc.com, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 8, 2018 at 8:59 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Aug 08, 2018 at 08:29:50AM -0600, Rob Herring wrote:
> > Version numbers on the individual patches would be nice...
>
> We've never done these in the subsystems I'm involved with.  Too
> much clutter in the subject lines for information that is easily
> deductable.

Unfortunately not in Gmail which doesn't thread properly. But
patchwork also provides the version tag which I use to sort my
reviews.

> > > +Example:
> > > +
> > > +       plic: interrupt-controller@c000000 {
> > > +               #address-cells = <0>;
> > > +               #interrupt-cells = <1>;
> > > +               compatible = "riscv,plic0";
> > > +               interrupt-controller;
> > > +               interrupts-extended = <
> > > +                       &cpu0-intc 11
> > > +                       &cpu1-intc 11 &cpu1-intc 9
> > > +                       &cpu2-intc 11 &cpu2-intc 9
> > > +                       &cpu3-intc 11 &cpu3-intc 9
> > > +                       &cpu4-intc 11 &cpu4-intc 9>;
> >
> > I'm confused why this is still here if you are dropping the cpu intc binding?
>
> We need some parent that identifies the core (hart in RISC-V terminology).
> The way the code now works is that it just walks up the parent chain
> until it finds a CPU node, so it either accepts the legacy intc node
> inbetween, or it accepts the cpu node directly as the intc node is pointless.
>
> I guess for the documentation we should instead just point to the
> "riscv" cpu nodes instead?

That's not valid and dtc will tell you that. 'interrupts' (via
interrupt-parent) or 'interrupts-extended' has to point to an
'interrupt-controller' node. I guess you could make the cpu nodes
interrupt-controllers. That's a bit strange, but I can't think of a
reason why that wouldn't work.

Just because the cpu-intc is not made to be an irqchip in the kernel
doesn't mean it can't still be represented as an interrupt-controller
in DT. It shouldn't be designed just around how some OS happens to
implement things.

> > I also noticed the cpu binding refers to "riscv,cpu-intc" as well.
> > That needs to be fixed too if there's a change.
>
> Only in the examples.  I'd be fine with dropping them, but let's keep
> that separate from the interrupt support.

You need to sort out how this is all tied together and works because
right now you are supporting 2 ways and one is undocumented and the
other is invalid. Changing things later is only going to be more
painful.

Rob
