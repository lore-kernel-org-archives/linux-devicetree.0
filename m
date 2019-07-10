From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: milbeaut-m10v-hdmac: Add Socionext
 Milbeaut HDMAC bindings
Date: Wed, 10 Jul 2019 07:48:40 -0600
Message-ID: <CAL_JsqKB2tw8NFYgO09RHvYBKJ8uVCktYH36wiPWi0wvH758Eg@mail.gmail.com>
References: <20190613005109.1867-1-jassisinghbrar@gmail.com>
 <20190613005237.1996-1-jassisinghbrar@gmail.com> <20190709143437.GA30850@bogus>
 <CABb+yY3OsAh3xgX8_vvA7A7mU+FkEj__BQs9CxMvf=eYxRYXyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABb+yY3OsAh3xgX8_vvA7A7mU+FkEj__BQs9CxMvf=eYxRYXyw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vinod <vkoul@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Takao Orito <orito.takao@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 9, 2019 at 10:12 PM Jassi Brar <jassisinghbrar@gmail.com> wrote:
>
> On Tue, Jul 9, 2019 at 9:34 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Jun 12, 2019 at 07:52:37PM -0500, jassisinghbrar@gmail.com wrote:
> > > From: Jassi Brar <jaswinder.singh@linaro.org>
> > >
> > > Document the devicetree bindings for Socionext Milbeaut HDMAC
> > > controller. Controller has upto 8 floating channels, that need
> > > a predefined slave-id to work from a set of slaves.
> > >
> > > Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
> > > ---
> > >  .../bindings/dma/milbeaut-m10v-hdmac.txt           | 54 +++++++++++++++++++
> > >  1 file changed, 54 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt b/Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt
> > > new file mode 100644
> > > index 000000000000..a104fcb9e73d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt
> > > @@ -0,0 +1,51 @@
> > > +* Milbeaut AHB DMA Controller
> > > +
> > > +Milbeaut AHB DMA controller has transfer capability bellow.
> > > + - memory to memory transfer
> > > + - device to memory transfer
> > > + - memory to device transfer
> > > +
> > > +Required property:
> > > +- compatible:       Should be  "socionext,milbeaut-m10v-hdmac"
> > > +- reg:              Should contain DMA registers location and length.
> > > +- interrupts:       Should contain all of the per-channel DMA interrupts.
> >
> > How many?
> >
> Each channel has an IRQ line. And the number of channels is
> configurable. So instead of having some explicit property like
> 'dma-channels', we infer that from the number of irqs registered.

Yes, I get that. There's still a range that's valid and you need to
define those constraints. If there's a variable number of channels,
then that implies different SoCs which should also mean different
compatible strings.

Rob
