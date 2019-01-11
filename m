From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH 2/8 v3] Documentation: bindings: k3dma: Add binding for hisi-dma-avail-chan
Date: Fri, 11 Jan 2019 13:30:35 -0800
Message-ID: <CALAqxLVzh8ZrXQPSEsvrTXocqmF2z4hMFHH48a29VybYM=QyFg@mail.gmail.com>
References: <1547141652-8660-1-git-send-email-john.stultz@linaro.org>
 <1547141652-8660-3-git-send-email-john.stultz@linaro.org> <CAL_Jsq+2dYaCzLSr8n4W=ftSjgmKJaUqwQ4S7qv7ZAaR2A-5XQ@mail.gmail.com>
 <CAL_JsqJLm_tDakS10gch8K_3F+mHrzR3isw8Tm=D-R118D1sYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJLm_tDakS10gch8K_3F+mHrzR3isw8Tm=D-R118D1sYQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tanglei Han <hantanglei@huawei.com>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Ryan Grachek <ryan@edited.us>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 11, 2019 at 12:04 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, Jan 11, 2019 at 1:58 PM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Thu, Jan 10, 2019 at 11:34 AM John Stultz <john.stultz@linaro.org> wrote:
> > >
> > > Some dma channels can be reserved for secure mode or other
> > > hardware on the SoC, so provide a binding for a bitmask
> > > listing the available channels for the kernel to use.
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
> > > ---
> > >  Documentation/devicetree/bindings/dma/k3dma.txt | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/dma/k3dma.txt b/Documentation/devicetree/bindings/dma/k3dma.txt
> > > index 10a2f15..38825d4 100644
> > > --- a/Documentation/devicetree/bindings/dma/k3dma.txt
> > > +++ b/Documentation/devicetree/bindings/dma/k3dma.txt
> > > @@ -14,6 +14,9 @@ Required properties:
> > >                 have specific request line
> > >  - clocks: clock required
> > >
> > > +Optional properties:
> > > +- hisi-dma-avail-chan: Bitmask of available physical channels
> >
> > Not quite right. Should be: hisilicon,dma-avail-chan
>
> Actually, we already have the same case elsewhere with
> 'brcm,dma-channel-mask'. Maybe there are others. So make the property
> common (i.e. documented in dma.txt) and called 'dma-channel-mask'.

Ok. I'll rework it for that then.

> Whether or not the dmaengine handles this or not is irrelevant to
> whether the binding is common or not. I have no say over OS design
> decisions.

Ok. I'll keep it in the driver for now unless otherwise directed.

Thanks so much for the review!
-john
