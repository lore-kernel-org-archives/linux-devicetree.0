From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: milbeaut-m10v-hdmac: Add Socionext
 Milbeaut HDMAC bindings
Date: Tue, 9 Jul 2019 23:12:03 -0500
Message-ID: <CABb+yY3OsAh3xgX8_vvA7A7mU+FkEj__BQs9CxMvf=eYxRYXyw@mail.gmail.com>
References: <20190613005109.1867-1-jassisinghbrar@gmail.com>
 <20190613005237.1996-1-jassisinghbrar@gmail.com> <20190709143437.GA30850@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190709143437.GA30850@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: dmaengine@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, vkoul@kernel.org, Mark Rutland <mark.rutland@arm.com>, orito.takao@socionext.com, Masami Hiramatsu <masami.hiramatsu@linaro.org>, kasai.kazuhiro@socionext.com, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 9, 2019 at 9:34 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jun 12, 2019 at 07:52:37PM -0500, jassisinghbrar@gmail.com wrote:
> > From: Jassi Brar <jaswinder.singh@linaro.org>
> >
> > Document the devicetree bindings for Socionext Milbeaut HDMAC
> > controller. Controller has upto 8 floating channels, that need
> > a predefined slave-id to work from a set of slaves.
> >
> > Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
> > ---
> >  .../bindings/dma/milbeaut-m10v-hdmac.txt           | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt
> >
> > diff --git a/Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt b/Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt
> > new file mode 100644
> > index 000000000000..a104fcb9e73d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt
> > @@ -0,0 +1,51 @@
> > +* Milbeaut AHB DMA Controller
> > +
> > +Milbeaut AHB DMA controller has transfer capability bellow.
> > + - memory to memory transfer
> > + - device to memory transfer
> > + - memory to device transfer
> > +
> > +Required property:
> > +- compatible:       Should be  "socionext,milbeaut-m10v-hdmac"
> > +- reg:              Should contain DMA registers location and length.
> > +- interrupts:       Should contain all of the per-channel DMA interrupts.
>
> How many?
>
Each channel has an IRQ line. And the number of channels is
configurable. So instead of having some explicit property like
'dma-channels', we infer that from the number of irqs registered.

> > +- #dma-cells:       Should be 1. Specify the ID of the slave.
> > +- clocks:           Phandle to the clock used by the HDMAC module.
> > +
> > +
> > +Example:
> > +
> > +     hdmac1: hdmac@1e110000 {
>
> dma-controller@...
>
OK

> > +             compatible = "socionext,milbeaut-m10v-hdmac";
> > +             reg = <0x1e110000 0x10000>;
> > +             interrupts = <0 132 4>,
> > +                          <0 133 4>,
> > +                          <0 134 4>,
> > +                          <0 135 4>,
> > +                          <0 136 4>,
> > +                          <0 137 4>,
> > +                          <0 138 4>,
> > +                          <0 139 4>;
> > +             #dma-cells = <1>;
> > +             clocks = <&dummy_clk>;
> > +     };
> > +
> > +* DMA client
> > +
> > +Clients have to specify the DMA requests with phandles in a list.
>
> Nothing specific to this binding here and the client side is already
> documented, so drop this section.
>
OK.

Thanks
