From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH 2/8 v2] Documentation: bindings: k3dma: Add binding for dma-avail-chan
Date: Fri, 4 Jan 2019 20:39:34 -0800
Message-ID: <CALAqxLUZ=6_tELtZPEjYwV+BNNBcZj4Z=dq9UyrRXuPhs_uGUw@mail.gmail.com>
References: <1546635388-13795-1-git-send-email-john.stultz@linaro.org>
 <1546635388-13795-3-git-send-email-john.stultz@linaro.org> <20190105040030.GF2477@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190105040030.GF2477@Mani-XPS-13-9360>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tanglei Han <hantanglei@huawei.com>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Ryan Grachek <ryan@edited.us>, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 4, 2019 at 8:00 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Hi John,
>
> On Fri, Jan 04, 2019 at 12:56:22PM -0800, John Stultz wrote:
> > Some dma channels can be reserved for secure mode or other
> > hardware on the SoC, so provide a binding for a bitmask
> > listing the available channels for the kernel to use.
> >
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Tanglei Han <hantanglei@huawei.com>
> > Cc: Zhuangluan Su <suzhuangluan@hisilicon.com>
> > Cc: Ryan Grachek <ryan@edited.us>
> > Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Cc: dmaengine@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/dma/k3dma.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/k3dma.txt b/Documentation/devicetree/bindings/dma/k3dma.txt
> > index 10a2f15..1c466c1 100644
> > --- a/Documentation/devicetree/bindings/dma/k3dma.txt
> > +++ b/Documentation/devicetree/bindings/dma/k3dma.txt
> > @@ -14,6 +14,9 @@ Required properties:
> >               have specific request line
> >  - clocks: clock required
> >
> > +Optional properties:
> > +- dma-avail-chan: Bitmask of available physical channels
> > +
>
> This property looks too generic. Since this is specific to HiSi SoCs,
> this could be "hisi-dma-avail-chan"?

I'm fine to change it, but I'm not sure I fully understand the
rational. Can you help me understand?
Are device node-binding names supposed to have global scope? I assumed
the node property names are basically scoped to the entry?
Further, having some dma channels be reserved doesn't seem to be too
unique a concept, so I'm not sure what we gain long term by prefixing
it?

thanks
-john
