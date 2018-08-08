From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 6/8] dt-bindings: interrupt-controller: RISC-V PLIC
        documentation
Date: Wed, 8 Aug 2018 17:04:48 +0200
Message-ID: <20180808150448.GA31785@lst.de>
References: <20180804082319.5711-1-hch@lst.de> <20180804082319.5711-7-hch@lst.de> <CAL_JsqKKCPhb1um_+68ya0ng_v2tSb5O+-8RQPqx7Od3sJ4FuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKKCPhb1um_+68ya0ng_v2tSb5O+-8RQPqx7Od3sJ4FuA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@sifive.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Anup Patel <anup@brainfault.org>, atish.patra@wdc.com, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 08, 2018 at 08:29:50AM -0600, Rob Herring wrote:
> Version numbers on the individual patches would be nice...

We've never done these in the subsystems I'm involved with.  Too
much clutter in the subject lines for information that is easily
deductable.

> > +Example:
> > +
> > +       plic: interrupt-controller@c000000 {
> > +               #address-cells = <0>;
> > +               #interrupt-cells = <1>;
> > +               compatible = "riscv,plic0";
> > +               interrupt-controller;
> > +               interrupts-extended = <
> > +                       &cpu0-intc 11
> > +                       &cpu1-intc 11 &cpu1-intc 9
> > +                       &cpu2-intc 11 &cpu2-intc 9
> > +                       &cpu3-intc 11 &cpu3-intc 9
> > +                       &cpu4-intc 11 &cpu4-intc 9>;
> 
> I'm confused why this is still here if you are dropping the cpu intc binding?

We need some parent that identifies the core (hart in RISC-V terminology).
The way the code now works is that it just walks up the parent chain
until it finds a CPU node, so it either accepts the legacy intc node
inbetween, or it accepts the cpu node directly as the intc node is pointless.

I guess for the documentation we should instead just point to the
"riscv" cpu nodes instead?

> I also noticed the cpu binding refers to "riscv,cpu-intc" as well.
> That needs to be fixed too if there's a change.

Only in the examples.  I'd be fine with dropping them, but let's keep
that separate from the interrupt support.
