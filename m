From: Andrea Merello <andrea.merello@gmail.com>
Subject: Re: [PATCH v4 3/7] dt-bindings: dmaengine: xilinx_dma: add optional
 xlnx,sg-length-width property
Date: Wed, 29 Aug 2018 10:14:12 +0200
Message-ID: <CAN8YU5P3beS3uxaOMAkMzL_Jb9Nb97MARKKkW0pMKgGicwy3EA@mail.gmail.com>
References: <20180802141012.19970-1-andrea.merello@gmail.com>
 <20180802141012.19970-3-andrea.merello@gmail.com> <20180827053103.GU2388@vkoul-mobl>
Reply-To: andrea.merello@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180827053103.GU2388@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod <vkoul@kernel.org>
Cc: dan.j.williams@intel.com, michal.simek@xilinx.com, appana.durga.rao@xilinx.com, dmaengine@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 27, 2018 at 7:31 AM Vinod <vkoul@kernel.org> wrote:
>
> On 02-08-18, 16:10, Andrea Merello wrote:
> > The width of the "length register" cannot be autodetected, and it is now
> > specified with a DT property. Add DOC for it.
>
> Add Documentation for it...

OK

> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
> > Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
> > Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
> > ---
> > Changes in v2:
> >       - change property name
> >       - property is now optional
> >       - cc DT maintainer
> > Changes in v3:
> >       - reword
> >       - cc DT maintainerS and ML
> > Changes in v4:
> >       - specify the unit, the valid range and the default value
> > ---
> >  Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> > index a2b8bfaec43c..aec4a41a03ae 100644
> > --- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> > +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> > @@ -41,6 +41,10 @@ Optional properties:
> >  - xlnx,include-sg: Tells configured for Scatter-mode in
> >       the hardware.
> >  Optional properties for AXI DMA:
> > +- xlnx,sg-length-width: Should be set to the width in bits of the length
> > +     register as configured in h/w. Takes values {8...26}. If the property
> > +     is missing or invalid then the default value 23 is used. This is the
> > +     maximum value that is supported by all IP versions.
> >  - xlnx,mcdma: Tells whether configured for multi-channel mode in the hardware.
> >  Optional properties for VDMA:
> >  - xlnx,flush-fsync: Tells which channel to Flush on Frame sync.
> > --
> > 2.17.1
>
> --
> ~Vinod
