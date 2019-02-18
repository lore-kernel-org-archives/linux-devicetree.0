From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/3] dt-bindings: dmaengine: Add one new cell to present
 hardware slave id
Date: Mon, 18 Feb 2019 11:31:32 +0100
Message-ID: <CAK8P3a1Zq6XjymG3sAaHGeNRxU5UXPfJPbi0A9s47cTVK7vC3g@mail.gmail.com>
References: <a9718ae1e97a5911f47874fe23c00ef297d7fed8.1548158832.git.baolin.wang@linaro.org>
 <CAK8P3a2zkhrZLMi5KZ5=fGJCt85dad3_pZC0o7GqcwJkk4es9w@mail.gmail.com>
 <CAMz4ku+PR4bHtcPu2uT2f974+FWJVi8Tp3WzmuqE1TS-M-QawQ@mail.gmail.com> <CAMz4kuLEut0LqZ4bSAGJDufE8xHr6DgZ3Z1RCLQ10q_k6MUesw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMz4kuLEut0LqZ4bSAGJDufE8xHr6DgZ3Z1RCLQ10q_k6MUesw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Orson Zhai <orsonzhai@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, Dan Williams <dan.j.williams@intel.com>, DTML <devicetree@vger.kernel.org>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dmaengine@vger.kernel.org, eric.long@unisoc.com, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 12, 2019 at 9:25 AM Baolin Wang <baolin.wang@linaro.org> wrote:
> On Fri, 1 Feb 2019 at 19:53, Baolin Wang <baolin.wang@linaro.org> wrote:
> > On Thu, 31 Jan 2019 at 00:52, Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Tue, Jan 22, 2019 at 2:21 PM Baolin Wang <baolin.wang@linaro.org> wrote:
> > > >
> > > >  Client:
> > > >  DMA clients connected to the Spreadtrum DMA controller must use the format
> > > > -described in the dma.txt file, using a two-cell specifier for each channel.
> > > > -The two cells in order are:
> > > > +described in the dma.txt file, using a three-cell specifier for each channel.
> > > > +The three cells in order are:
> > > >  1. A phandle pointing to the DMA controller.
> > > >  2. The channel id.
> > > > +3. The hardware slave id which is used for clients to trigger DMA engine
> > > > +automatically.
> > >
> > > I notice that this is an incompatible binding change. Is that necessary?
> > > If the current code works, I'd suggest allowing both #dma-cells=<2>
> > > and <3>, and then implementing both in the driver.
> >
> > Yes, this is necessary.
> >
> > Yes, current code can work, but the problem is that the DMA clients
> > must add one property (something like "sprd,slave-id") to specify the
> > slave id. So considering this, we want to change the dma-cells to 2,
> > including dma channel and dma slave id, which can avoid introducing
> > some similar properties for DMA clients.
> >
> > Now there are no DMA clients in mainline for Spreadtrum platform, and
> > we want to upstream our first DMA clients: SPI controller. So no other
> > drivers need to change when we changing dma cells. Thanks.
>
> Do you have any other concerns about this patch set? If not, I think
> Vinod can apply this patch set. Thanks.

Sorry for the late reply. Yes, this makes sense since there are no
existing users then. For the DT changes going through the dmaengine
tree

Acked-by: Arnd Bergmann <arnd@arndb.de>

One more question, to make sure we don't need to edit it again:
Why do you need both a 'channel id' and a 'slave id' here? Is this
a strict hardware requirement for your DMA engine? In many
other designs, only a DMA request line number needs to
be described, and I think this would correspond to what you
call the 'hardware slave id' in your documentation.

Does each request line here correspond to a fixed channel
id as well, or can a channel be shared between multiple
slave devices?

      Arnd
