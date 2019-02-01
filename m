From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: dmaengine: Add one new cell to present
 hardware slave id
Date: Fri, 1 Feb 2019 19:53:42 +0800
Message-ID: <CAMz4ku+PR4bHtcPu2uT2f974+FWJVi8Tp3WzmuqE1TS-M-QawQ@mail.gmail.com>
References: <a9718ae1e97a5911f47874fe23c00ef297d7fed8.1548158832.git.baolin.wang@linaro.org>
 <CAK8P3a2zkhrZLMi5KZ5=fGJCt85dad3_pZC0o7GqcwJkk4es9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a2zkhrZLMi5KZ5=fGJCt85dad3_pZC0o7GqcwJkk4es9w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Orson Zhai <orsonzhai@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, Dan Williams <dan.j.williams@intel.com>, DTML <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dmaengine@vger.kernel.org, eric.long@unisoc.com, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,
On Thu, 31 Jan 2019 at 00:52, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Jan 22, 2019 at 2:21 PM Baolin Wang <baolin.wang@linaro.org> wrote:
> >
> > The DMA engine clients can trigger DMA engine automatically by setting
> > the corresponding hardware slave id for the DMA engine. Thus add one
> > cell to present the hardware slave id for DMA clients.
> >
> > Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/dma/sprd-dma.txt |   12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/sprd-dma.txt b/Documentation/devicetree/bindings/dma/sprd-dma.txt
> > index 7a10fea..7812cf0 100644
> > --- a/Documentation/devicetree/bindings/dma/sprd-dma.txt
> > +++ b/Documentation/devicetree/bindings/dma/sprd-dma.txt
> > @@ -6,8 +6,8 @@ Required properties:
> >  - compatible: Should be "sprd,sc9860-dma".
> >  - reg: Should contain DMA registers location and length.
> >  - interrupts: Should contain one interrupt shared by all channel.
> > -- #dma-cells: must be <1>. Used to represent the number of integer
> > -       cells in the dmas property of client device.
> > +- #dma-cells: must be <2>. Used to represent the channel id and slave id
> > +       of integer cells in the dmas property of client device.
> >  - #dma-channels : Number of DMA channels supported. Should be 32.
> >  - clock-names: Should contain the clock of the DMA controller.
> >  - clocks: Should contain a clock specifier for each entry in clock-names.
> > @@ -28,14 +28,16 @@ apdma: dma-controller@20100000 {
> >
> >  Client:
> >  DMA clients connected to the Spreadtrum DMA controller must use the format
> > -described in the dma.txt file, using a two-cell specifier for each channel.
> > -The two cells in order are:
> > +described in the dma.txt file, using a three-cell specifier for each channel.
> > +The three cells in order are:
> >  1. A phandle pointing to the DMA controller.
> >  2. The channel id.
> > +3. The hardware slave id which is used for clients to trigger DMA engine
> > +automatically.
>
> I notice that this is an incompatible binding change. Is that necessary?
> If the current code works, I'd suggest allowing both #dma-cells=<2>
> and <3>, and then implementing both in the driver.

Yes, this is necessary.

Yes, current code can work, but the problem is that the DMA clients
must add one property (something like "sprd,slave-id") to specify the
slave id. So considering this, we want to change the dma-cells to 2,
including dma channel and dma slave id, which can avoid introducing
some similar properties for DMA clients.

Now there are no DMA clients in mainline for Spreadtrum platform, and
we want to upstream our first DMA clients: SPI controller. So no other
drivers need to change when we changing dma cells. Thanks.

-- 
Baolin Wang
Best Regards
