From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/8 v4] Documentation: bindings: dma: Add binding for
 dma-channel-mask
Date: Sun, 20 Jan 2019 16:36:42 +0530
Message-ID: <20190120110642.GT4635@vkoul-mobl>
References: <1547658629-25378-1-git-send-email-john.stultz@linaro.org>
 <1547658629-25378-3-git-send-email-john.stultz@linaro.org>
 <20190117170829.GJ5283@Mani-XPS-13-9360>
 <CALAqxLXc4dE=65MYR5M_jA-uKeGjsN0CL+JjDYbZUTyi+mKUTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALAqxLXc4dE=65MYR5M_jA-uKeGjsN0CL+JjDYbZUTyi+mKUTA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tanglei Han <hantanglei@huawei.com>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Ryan Grachek <ryan@edited.us>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 17-01-19, 09:43, John Stultz wrote:
> On Thu, Jan 17, 2019 at 9:08 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Wed, Jan 16, 2019 at 09:10:23AM -0800, John Stultz wrote:
> > > Some dma channels can be reserved for secure mode or other
> > > hardware on the SoC, so provide a binding for a bitmask
> > > listing the available channels for the kernel to use.
> > >
> > > This follows the pre-existing bcm,dma-channel-mask binding.
> > >
> > > Cc: Vinod Koul <vkoul@kernel.org>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > Cc: Tanglei Han <hantanglei@huawei.com>
> > > Cc: Zhuangluan Su <suzhuangluan@hisilicon.com>
> > > Cc: Ryan Grachek <ryan@edited.us>
> > > Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > Cc: dmaengine@vger.kernel.org
> > > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > > ---
> > > v3: Renamed to hisi-dma-avail-chan
> > > v4: Reworked to generic dma-channel-mask
> > > ---
> > >  Documentation/devicetree/bindings/dma/dma.txt | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/dma/dma.txt b/Documentation/devicetree/bindings/dma/dma.txt
> > > index 6312fb0..eeb4e4d 100644
> > > --- a/Documentation/devicetree/bindings/dma/dma.txt
> > > +++ b/Documentation/devicetree/bindings/dma/dma.txt
> > > @@ -16,6 +16,9 @@ Optional properties:
> > >  - dma-channels:      Number of DMA channels supported by the controller.
> > >  - dma-requests:      Number of DMA request signals supported by the
> > >                       controller.
> > > +- dma-channel-mask:  Bitmask of available DMA channels in ascending order
> > > +                     that are not reserved by firmware and are available to
> > > +                     the kernel. i.e. first channel corresponds to LSB.
> >
> > A general assumption is, "dma-channel-mask" refers to the bit fields of
> > the channels which needs to be masked. But here, it refers to the channels
> > which are available. Doesn't it contradict?
> 
> Hrm. So while I can sort of understand the common usage of "mask" as
> to "hide", thus the desire to have a bitfield mean "the channels we
> hide" or "don't use", but in my experience bitmasking is more commonly
> used to keep only a portion of the the bits, so from that perspective
> its more intuitive that a mask be the channels we keep to use. So I'm
> not sure if your suggestion makes it more clear.
> 
> But I'm not very particular here, so I'll defer to others on this.

Given the context and documentation which explicitly says it is bitmask
of available channels, i think we are fine :)

-- 
~Vinod
