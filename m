From: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Subject: RE: [RESEND PATCH v4 1/3] dmaengine: vdma: Add config structure to
 differentiate dmas
Date: Thu, 12 May 2016 16:09:32 +0000
Message-ID: <C246CAC1457055469EF09E3A7AC4E11A4A5812A5@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1463046228-21651-1-git-send-email-appanad@xilinx.com>
 <1463046228-21651-2-git-send-email-appanad@xilinx.com>
 <20160512160950.GF2274@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160512160950.GF2274@localhost>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "luis@debethencourt.com" <luis@debethencourt.com>, Srikanth Vemula <svemula@xilinx.com>, Anirudha Sarangi <anirudh@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.ker>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

> On Thu, May 12, 2016 at 03:13:46PM +0530, Kedareswara rao Appana wrote:
> > This patch adds config structure in the driver to differentiate AXI
> > DMA's and to add more features(clock support etc..) to these DMA's.
> >
> > Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
> > ---
> >  drivers/dma/xilinx/xilinx_vdma.c | 83
> > ++++++++++++++++++++++++----------------
> >  1 file changed, 51 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/dma/xilinx/xilinx_vdma.c
> > b/drivers/dma/xilinx/xilinx_vdma.c
> > index 626939b..1d50e05 100644
> > --- a/drivers/dma/xilinx/xilinx_vdma.c
> > +++ b/drivers/dma/xilinx/xilinx_vdma.c
> > @@ -342,6 +342,10 @@ struct xilinx_dma_chan {
> >  	void (*start_transfer)(struct xilinx_dma_chan *chan);  };
> >
> > +struct dma_config {
> 
> xilinx_dma_config ?

Ok will fix in the next version...

> 
> This makes reader believe that thismight be coething related to dmaengine core
> 
> >  static const struct of_device_id xilinx_dma_of_ids[] = {
> > -	{ .compatible = "xlnx,axi-dma-1.00.a",
> > -	  .data = (void *)XDMA_TYPE_AXIDMA },
> > -	{ .compatible = "xlnx,axi-cdma-1.00.a",
> > -	  .data = (void *)XDMA_TYPE_CDMA },
> > -	{ .compatible = "xlnx,axi-vdma-1.00.a",
> > -	  .data = (void *)XDMA_TYPE_VDMA },
> > +	{ .compatible = "xlnx,axi-dma-1.00.a", .data = &axidma_config },
> > +	{ .compatible = "xlnx,axi-cdma-1.00.a", .data = &axicdma_config },
> > +	{ .compatible = "xlnx,axi-vdma-1.00.a", .data = &axivdma_config },
> 
> why do we want a struct for this and not pass XDMA_TYPE_xxx as .data

In the next patch of this series added clock configuration in the config structure.
As the number clocks for each of the IP varies and the clocks are configurable
That's why added a separate config struct instead of XDMA_TYPE...

Regards,
Kedar.

> 
> --
> ~Vinod
