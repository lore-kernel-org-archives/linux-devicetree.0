From: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH V2 2/2] dt-bindings: interrupt-controller: Update csky
 mpintc
Date: Mon, 21 Jan 2019 22:55:24 +0800
Message-ID: <20190121145524.GA5283@guoren-Inspiron-7460>
References: <1547830371-22122-1-git-send-email-guoren@kernel.org>
 <1547830371-22122-2-git-send-email-guoren@kernel.org>
 <CAL_JsqKjQK-qViMm55EiP5hXjfr04++5vBTAXCEa6yg9u1qCaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKjQK-qViMm55EiP5hXjfr04++5vBTAXCEa6yg9u1qCaQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Guo Ren <ren_guo@c-sky.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 08:12:15AM -0600, Rob Herring wrote:
> On Fri, Jan 18, 2019 at 10:53 AM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <ren_guo@c-sky.com>
> >
> > Add trigger type and priority setting for csky,mpintc.
> >
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > ---
> >  .../bindings/interrupt-controller/csky,mpintc.txt  | 33 +++++++++++++++++++---
> >  1 file changed, 29 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
> > index ab921f1..badbd38 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
> > @@ -6,11 +6,18 @@ C-SKY Multi-processors Interrupt Controller is designed for ck807/ck810/ck860
> >  SMP soc, and it also could be used in non-SMP system.
> >
> >  Interrupt number definition:
> > -
> >    0-15  : software irq, and we use 15 as our IPI_IRQ.
> >   16-31  : private  irq, and we use 16 as the co-processor timer.
> >   31-1024: common irq for soc ip.
> >
> > +Interrupt triger mode:
> > + IRQ_TYPE_LEVEL_HIGH (default)
> > + IRQ_TYPE_LEVEL_LOW
> > + IRQ_TYPE_EDGE_RISING
> > + IRQ_TYPE_EDGE_FALLING
> > +
> > +Interrupt priority range: 0-255
> > +
> >  =============================
> >  intc node bindings definition
> >  =============================
> > @@ -26,15 +33,33 @@ intc node bindings definition
> >         - #interrupt-cells
> >                 Usage: required
> >                 Value type: <u32>
> > -               Definition: must be <1>
> > +               Definition: could be <1> or <2> or <3>
> 
> For a given controller, '#interrupt-cells' shouldn't really be
> variable. If there are different capabilities, then you should have
> different compatible strings.
Ok, I'll Define it to <3>, see my next version of patch.

<irqnum trigger_type priority>

Best Regards
 Guo Ren
