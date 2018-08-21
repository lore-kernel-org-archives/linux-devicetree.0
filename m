From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: dmaengine: add DT binding for UniPhier
 MIO DMAC
Date: Tue, 21 Aug 2018 14:09:20 -0500
Message-ID: <CAL_JsqJwXKx3MKE-8GuHqnJZ-047GxhHUB5LpW3O8j58OsAKuA@mail.gmail.com>
References: <1534843809-4137-1-git-send-email-yamada.masahiro@socionext.com>
 <1534843809-4137-2-git-send-email-yamada.masahiro@socionext.com> <CAK7LNASr=rf_foQ7PDTNS440rx3TLuY_TBagfQ-gCHxXpFB2vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNASr=rf_foQ7PDTNS440rx3TLuY_TBagfQ-gCHxXpFB2vw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Vinod <vkoul@kernel.org>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 21, 2018 at 4:48 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> (+CC Rob, DT, LKML)
>
> I forgot to CC this to DT community...

You really need to resend so that patchwork will pick it up and I'll
see it for sure.

>
>
> 2018-08-21 18:30 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> > The MIO DMAC (Media IO DMA Controller) is used in UniPhier LD4,
> > Pro4, and sLD8 SoCs.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  .../devicetree/bindings/dma/uniphier-mio-dmac.txt  | 28 ++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt
> >
> > diff --git a/Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt b/Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt
> > new file mode 100644
> > index 0000000..a9e969e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt
> > @@ -0,0 +1,28 @@
> > +UniPhier Media IO DMA controller
> > +
> > +This works as an external DMA engine for SD/eMMC controllers etc.
> > +found in UniPhier LD4, Pro4, sLD8 SoCs.
> > +
> > +Required properties:
> > +- compatible: should be "socionext,uniphier-mio-dmac".
> > +- reg: offset and length of the register set for the device.
> > +- interrupts: a list of interrupt specifiers associated with the DMA channels.
> > +- clocks: a single clock specifier
> > +- #dma-cells: should be <1>. The single cell represents the channel number.
> > +- dma-channels: specify the number of the DMA channels. This should match to
> > +  the number of tuples in the interrupts property.
> > +
> > +Example:
> > +       dmac: dmac@5a000000 {

dma-controller@...

> > +               compatible = "socionext,uniphier-mio-dmac";
> > +               reg = <0x5a000000 0x1000>;
> > +               interrupts = <0 68 4>, <0 68 4>, <0 69 4>, <0 70 4>,
> > +                            <0 71 4>, <0 72 4>, <0 73 4>, <0 74 4>;
> > +               clocks = <&mio_clk 7>;
> > +               #dma-cells = <1>;
> > +               dma-channels = <8>;
> > +       };
> > +
> > +Note:
> > +In the example above, "interrupts = <0 68 4>, <0 68 4>, ..." is not a typo.
> > +The first two channels share a single interrupt line.
> > --
> > 2.7.4
> >
>
>
>
> --
> Best Regards
> Masahiro Yamada
