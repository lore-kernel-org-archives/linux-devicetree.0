From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: milbeaut-m10v-hdmac: Add Socionext
 Milbeaut HDMAC bindings
Date: Wed, 4 Sep 2019 01:18:48 -0500
Message-ID: <CABb+yY1RT2TuUyuU2C+m6w=AOVzXkuG7cOwbWsccywxU7HwkQg@mail.gmail.com>
References: <20190818051647.17475-1-jassisinghbrar@gmail.com>
 <20190818051754.17548-1-jassisinghbrar@gmail.com> <20190904055037.GC2672@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904055037.GC2672@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 4, 2019 at 12:51 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 18-08-19, 00:17, jassisinghbrar@gmail.com wrote:
> > From: Jassi Brar <jaswinder.singh@linaro.org>
> >
> > Document the devicetree bindings for Socionext Milbeaut HDMAC
> > controller. Controller has upto 8 floating channels, that need
> > a predefined slave-id to work from a set of slaves.
> >
> > Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
> > ---
> >  .../bindings/dma/milbeaut-m10v-hdmac.txt      | 32 +++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt
> >
> > diff --git a/Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt b/Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt
> > new file mode 100644
> > index 000000000000..f0960724f1c7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt
> > @@ -0,0 +1,32 @@
> > +* Milbeaut AHB DMA Controller
> > +
> > +Milbeaut AHB DMA controller has transfer capability bellow.
>
> s/bellow/below:
>
> > + - device to memory transfer
> > + - memory to device transfer
> > +
> > +Required property:
> > +- compatible:       Should be  "socionext,milbeaut-m10v-hdmac"
> > +- reg:              Should contain DMA registers location and length.
> > +- interrupts:       Should contain all of the per-channel DMA interrupts.
> > +                     Number of channels is configurable - 2, 4 or 8, so
> > +                     the number of interrupts specfied should be {2,4,8}.
>
> s/specfied/specified
>
Hi Vinod,
  Do you want me to spin yet another revision for the two types in text?

thnx
