From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/8 v2] Documentation: bindings: k3dma: Add binding for
 dma-avail-chan
Date: Sat, 5 Jan 2019 19:16:10 +0530
Message-ID: <20190105134610.GX13372@vkoul-mobl.Dlink>
References: <1546635388-13795-1-git-send-email-john.stultz@linaro.org>
 <1546635388-13795-3-git-send-email-john.stultz@linaro.org>
 <20190105040030.GF2477@Mani-XPS-13-9360>
 <CALAqxLUZ=6_tELtZPEjYwV+BNNBcZj4Z=dq9UyrRXuPhs_uGUw@mail.gmail.com>
 <20190105045320.GA3761@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190105045320.GA3761@Mani-XPS-13-9360>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tanglei Han <hantanglei@huawei.com>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Ryan Grachek <ryan@edited.us>, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 05-01-19, 10:23, Manivannan Sadhasivam wrote:
> On Fri, Jan 04, 2019 at 08:39:34PM -0800, John Stultz wrote:
> > On Fri, Jan 4, 2019 at 8:00 PM Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org> wrote:
> > >
> > > Hi John,
> > >
> > > On Fri, Jan 04, 2019 at 12:56:22PM -0800, John Stultz wrote:
> > > > Some dma channels can be reserved for secure mode or other
> > > > hardware on the SoC, so provide a binding for a bitmask
> > > > listing the available channels for the kernel to use.
> > > >
> > > > Cc: Vinod Koul <vkoul@kernel.org>
> > > > Cc: Rob Herring <robh+dt@kernel.org>
> > > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > > Cc: Tanglei Han <hantanglei@huawei.com>
> > > > Cc: Zhuangluan Su <suzhuangluan@hisilicon.com>
> > > > Cc: Ryan Grachek <ryan@edited.us>
> > > > Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > Cc: dmaengine@vger.kernel.org
> > > > Cc: devicetree@vger.kernel.org
> > > > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/dma/k3dma.txt | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/dma/k3dma.txt b/Documentation/devicetree/bindings/dma/k3dma.txt
> > > > index 10a2f15..1c466c1 100644
> > > > --- a/Documentation/devicetree/bindings/dma/k3dma.txt
> > > > +++ b/Documentation/devicetree/bindings/dma/k3dma.txt
> > > > @@ -14,6 +14,9 @@ Required properties:
> > > >               have specific request line
> > > >  - clocks: clock required
> > > >
> > > > +Optional properties:
> > > > +- dma-avail-chan: Bitmask of available physical channels
> > > > +
> > >
> > > This property looks too generic. Since this is specific to HiSi SoCs,
> > > this could be "hisi-dma-avail-chan"?
> > 
> > I'm fine to change it, but I'm not sure I fully understand the
> > rational. Can you help me understand?
> > Are device node-binding names supposed to have global scope? I assumed
> > the node property names are basically scoped to the entry?
> 
> IIUC properties documented in subsystem binding (dma.txt in this case)
> will have global scope. Those which are not documented in this binding
> are specific to vendor IPs and should be prefixed with the vendor
> prefix (hisi in this case).
> 
> > Further, having some dma channels be reserved doesn't seem to be too
> > unique a concept, so I'm not sure what we gain long term by prefixing
> > it?
> > 
> 
> Right, but this brings up the point of having this functionality in
> generic DMA engine so that the DMA controller drivers need not handle.
> So either we should move this available channel check to DMA Engine
> and document the property in dma.txt so that other IPs can also use it
> or keep the functionality in K3 driver and use HiSi prefix for the
> property.
> 
> But I'd like to hear Vinod/Rob's opinion on this!

So there are two parts, first is if this new property of using 'some'
channels of controller is generic enough, the answer is unfortunately
yes, so we should move this to dma.txt as a generic property

But I don't agree the dmaengine core should handle it, we may add
helpers, but controllers registers N channels and they would do so, core
should not do filtering

-- 
~Vinod
