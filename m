From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V5 2/3] dt-bindings: interrupt-controller: C-SKY APB intc
Date: Mon, 17 Sep 2018 07:23:36 -0700
Message-ID: <CAL_JsqJOoek+P+NR_jEfPJD1JLC4U-x_hmJL=vjvMU5JWxjVeA@mail.gmail.com>
References: <a70337117db84f6e1091d0b3fc28acb691ac9b35.1537087118.git.ren_guo@c-sky.com>
 <162f7f98697cd9d806a1a843c6177bb943ea2b33.1537087118.git.ren_guo@c-sky.com>
 <20180917062336.GA20555@bogus> <20180917083623.GA1069@guoren>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180917083623.GA1069@guoren>
Sender: linux-kernel-owner@vger.kernel.org
To: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 17, 2018 at 1:36 AM Guo Ren <ren_guo@c-sky.com> wrote:
>
> On Mon, Sep 17, 2018 at 02:23:36AM -0400, Rob Herring wrote:
> > On Sun, Sep 16, 2018 at 04:50:03PM +0800, Guo Ren wrote:
> > > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> >
> > Needs a commit description.
> >
> > > ---
> > >  .../interrupt-controller/csky,apb-intc.txt         | 70 ++++++++++++++++++++++
> > >  1 file changed, 70 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.txt
> > > new file mode 100644
> > > index 0000000..be7c3d1
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/csky,apb-intc.txt
> > > @@ -0,0 +1,70 @@
> > > +==============================
> > > +C-SKY APB Interrupt Controller
> > > +==============================
> > > +
> > > +C-SKY APB Interrupt Controller is a simple soc interrupt controller
> > > +on the apb bus and we only use it as root irq controller.
> > > +
> > > + - csky,apb-intc is used in a lot of csky fpgas and socs, it support 64 irq nums.
> > > + - csky,dual-apb-intc consists of 2 apb-intc and 128 irq nums supported.
> > > + - csky,gx6605s-intc is gx6605s soc internal irq interrupt controller, 64 irq nums.
> >
> > Is there a relationship between csky,gx6605s-intc and csky,apb-intc?
> They all use pending register to get irq num and use enable register to
> mask/unmask.
>
> > > +        - support-pulse-signal:
> > > +                Usage: select
> > > +           Description: to support pulse signal flag
> >
> > What is this for?
> This is a level-triger interrupt controller at first, but we want it
> to support pulse signal. It means that when the pulse signal coming,
> the pending register will hold signals without clear the IFR reg.
>
> Some C-SKY cpu's socs need this feature to support pulse interrupt
> signal.

So an edge triggered interrupt. We have a way to support that on a per
interrupt basis with a 2nd cell (which you should consider if you may
need anyways). But this is a global setting for all interrupts the
interrupt controller serves? If so, it's fine, but does need a vendor
prefix.

Rob
