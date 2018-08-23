From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: dmaengine: add DT binding for UniPhier
 MIO DMAC
Date: Thu, 23 Aug 2018 08:21:37 -0500
Message-ID: <CAL_Jsq+ppQP9icJVhpUYGj_JCyxudi0Z4=+mKiBueMKZftrQ7A@mail.gmail.com>
References: <1534843809-4137-1-git-send-email-yamada.masahiro@socionext.com>
 <1534843809-4137-2-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNASr=rf_foQ7PDTNS440rx3TLuY_TBagfQ-gCHxXpFB2vw@mail.gmail.com>
 <CAJe_ZhdZbUa2njAvSazGzv+7UgG+QHCTS+-Y-Ckqze+pMf9KQA@mail.gmail.com>
 <CAK7LNAT3MufLZhFB8HDnch09WUdEcLyDCU05dTYroOwWYcx=pQ@mail.gmail.com> <CAJe_ZheNp9t0DNQjmiQKMyZsbHBjMxqV87mE_3nQ1N_RS9znYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJe_ZheNp9t0DNQjmiQKMyZsbHBjMxqV87mE_3nQ1N_RS9znYQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Vinod <vkoul@kernel.org>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 23, 2018 at 12:38 AM Jassi Brar <jaswinder.singh@linaro.org> wrote:
>
> On 23 August 2018 at 10:48, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> > Hi Jassi,
> >
> >
> > 2018-08-21 19:44 GMT+09:00 Jassi Brar <jaswinder.singh@linaro.org>:
> >> On 21 August 2018 at 15:17, Masahiro Yamada
> >> <yamada.masahiro@socionext.com> wrote:
> >>> (+CC Rob, DT, LKML)
> >>>
> >>> I forgot to CC this to DT community...
> >>>
> >>>
> >>> 2018-08-21 18:30 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> >>>> The MIO DMAC (Media IO DMA Controller) is used in UniPhier LD4,
> >>>> Pro4, and sLD8 SoCs.
> >>>>
> >>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >>>> ---
> >>>>
> >>>>  .../devicetree/bindings/dma/uniphier-mio-dmac.txt  | 28 ++++++++++++++++++++++
> >>>>  1 file changed, 28 insertions(+)
> >>>>  create mode 100644 Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt b/Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt
> >>>> new file mode 100644
> >>>> index 0000000..a9e969e
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt
> >>>> @@ -0,0 +1,28 @@
> >>>> +UniPhier Media IO DMA controller
> >>>> +
> >>>> +This works as an external DMA engine for SD/eMMC controllers etc.
> >>>> +found in UniPhier LD4, Pro4, sLD8 SoCs.
> >>>> +
> >>>> +Required properties:
> >>>> +- compatible: should be "socionext,uniphier-mio-dmac".
> >>>> +- reg: offset and length of the register set for the device.
> >>>> +- interrupts: a list of interrupt specifiers associated with the DMA channels.
> >>>> +- clocks: a single clock specifier
> >>>> +- #dma-cells: should be <1>. The single cell represents the channel number.
> >>>> +- dma-channels: specify the number of the DMA channels. This should match to
> >>>> +  the number of tuples in the interrupts property.
> >>>> +
> >> Can we not infer the number of channels from interrupt tuples? After
> >> all the driver assumes they are same.
> >
> >
> > It would be possible to count the number of tuples
> > in "interrupts".
> >
> >
> >
> > I know of_irq_count(), but I do not see any driver
> > in drivers/dma/ that calls it.
> >
> >
> > I guess the reason is that of_irq_count() is not exported,
> > so tristate drivers like this cannot use it.
> >
> >
> > I checked Documentation/devicetree/bindings/dma/,
> > and some controllers specify _redundant_ dma-channels property.
> >
> > fsl-mxs-dma.txt
> > renesas,rcar-dmac.txt
> > renesas,usb-dmac.txt
> >
> :) I am not sure "because others are doing it" is a good reason to
> introduce redundancy.
>
>
> > I also see counter-implementation.
> >
> >
> > bcm2835-dma.c hard-codes the number of channels in the driver.
> > tegra210-adma.c associates nr_channels with compatible string.
> >
> >
> >
> > I will wait for comments from the maintainers.
> >
> > If desired, I will export of_irq_count()
> > and use it from my driver.
> >
> If you don't want to leave too much footprint, you could do
>
>   count = 0;
>   while (of_irq_parse_one(dev, count, &irq) == 0) count++
>
> of_irq_parse_one() is already exported.

Yes, but we really don't more users and drivers shouldn't be using it.
Grepping DT functions and when the only users are pretty much powerpc,
that's a good indication not to use the function.

And you don't want to use of_irq_count either. platform_irq_count is
what should be used here. It's already exported.

Rob
