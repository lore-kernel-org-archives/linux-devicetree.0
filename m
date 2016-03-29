From: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Subject: RE: [PATCH v2 3/6] Documentation: DT: vdma: update binding doc for
 AXI DMA
Date: Tue, 29 Mar 2016 05:48:54 +0000
Message-ID: <C246CAC1457055469EF09E3A7AC4E11A4A570B5F@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1459101966-9932-1-git-send-email-appanad@xilinx.com>
 <20160328205255.GA12237@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160328205255.GA12237@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, Anurag Kumar Vulisha <anuragku@xilinx.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "luis@debethencourt.com" <luis@debethencourt.com>, Srikanth Vemula <svemula@xilinx.com>, Anirudha Sarangi <anirudh@xilinx.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel@list
List-Id: devicetree@vger.kernel.org

Hi Rob,

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Tuesday, March 29, 2016 2:23 AM
> To: Appana Durga Kedareswara Rao
> Cc: pawel.moll@arm.com; mark.rutland@arm.com;
> ijc+devicetree@hellion.org.uk; galak@codeaurora.org; Michal Simek; Soren
> Brinkmann; vinod.koul@intel.com; dan.j.williams@intel.com; Anurag Kumar
> Vulisha; Appana Durga Kedareswara Rao; moritz.fischer@ettus.com;
> laurent.pinchart@ideasonboard.com; luis@debethencourt.com; Srikanth
> Vemula; Anirudha Sarangi; dmaengine@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v2 3/6] Documentation: DT: vdma: update binding doc for
> AXI DMA
> 
> On Sun, Mar 27, 2016 at 11:36:05PM +0530, Kedareswara rao Appana wrote:
> > This patch updates the device-tree binding doc for adding support for
> > AXI DMA.
> >
> > Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
> > ---
> > Changes for v2:
> > ---> Modified commit message as suggested by Vinod.
> > ---> Moved the patch to forward in the series as suggested by vinod.
> >
> >  .../devicetree/bindings/dma/xilinx/xilinx_vdma.txt | 22
> > +++++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> > b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> > index a86737c..5841421 100644
> > --- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> > +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> > @@ -3,8 +3,13 @@ It can be configured to have one channel or two
> > channels. If configured  as two channels, one is to transmit to the
> > video device and another is  to receive from the video device.
> >
> > +Xilinx AXI DMA engine, it does transfers between memory and AXI4
> > +stream target devices. It can be configured to have one channel or two
> channels.
> > +If configured as two channels, one is to transmit to the device and
> > +another is to receive from the device.
> > +
> >  Required properties:
> > -- compatible: Should be "xlnx,axi-vdma-1.00.a"
> > +- compatible: Should be "xlnx,axi-vdma-1.00.a" or "xlnx,axi-dma-1.00.a"
> 
> Why the new compatible string? This is 2 different IP blocks? If so, is there really
> much shared?

The support for the AXI DMA IP also added to the existing VDMA Linux driver
In this series of patches.

> 
> >  - #dma-cells: Should be <1>, see "dmas" property below
> >  - reg: Should contain VDMA registers location and length.
> >  - xlnx,num-fstores: Should be the number of framebuffers as configured in
> h/w.
> > @@ -59,6 +64,21 @@ axi_vdma_0: axivdma@40030000 {
> >  	} ;
> >  } ;
> >
> > +axi_dma_0: axidma@40400000 {
> 
> dma@40400000

Ok will fix in the next version 

Thanks,
Kedar.

> 
> > +	compatible = "xlnx,axi-dma-1.00.a";
> > +	#dma-cells = <1>;
> > +	reg = < 0x40400000 0x10000 >;
> > +	dma-channel@40400000 {
> > +		compatible = "xlnx,axi-dma-mm2s-channel";
> > +		interrupts = < 0 59 4 >;
> > +		xlnx,datawidth = <0x40>;
> > +	} ;
> > +	dma-channel@40400030 {
> > +		compatible = "xlnx,axi-dma-s2mm-channel";
> > +		interrupts = < 0 58 4 >;
> > +		xlnx,datawidth = <0x40>;
> > +	} ;
> > +} ;
> >
> >  * DMA client
> >
> > --
> > 2.1.2
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
