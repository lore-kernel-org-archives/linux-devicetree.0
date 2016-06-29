From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: RE: [PATCH v10 2/2] dmaengine: Add Xilinx zynqmp dma engine driver
 support
Date: Wed, 29 Jun 2016 03:59:26 +0000
Message-ID: <03CA77BA8AF6F1469AEDFBDA1322A7B74A18FC92@XAP-PVEXMBX02.xlnx.xilinx.com>
References: <20160607070841.GJ16910@localhost>
 <C246CAC1457055469EF09E3A7AC4E11A4A5B4FA9@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20160613055012.GC16910@localhost>
 <C246CAC1457055469EF09E3A7AC4E11A4A5B6441@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20160615165004.GC16910@localhost>
 <C246CAC1457055469EF09E3A7AC4E11A4A5B6CAD@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20160621154103.GA16910@localhost>
 <03CA77BA8AF6F1469AEDFBDA1322A7B74A18BAE8@XAP-PVEXMBX02.xlnx.xilinx.com>
 <20160621163854.GF16910@localhost>
 <03CA77BA8AF6F1469AEDFBDA1322A7B74A18BB82@XAP-PVEXMBX02.xlnx.xilinx.com>
 <20160628041441.GQ22564@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160628041441.GQ22564@localhost>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, Anirudha Sarangi <anirudh@xilinx.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Srikanth Vemula <svemula@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "luis@debethencourt.com" <luis@debethencourt.com>, "galak@codeaurora.org" <galak@codeaurora.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, Appana Durga Kedareswara Rao <appanad@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, laurent.pinchar
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Vinod Koul [mailto:vinod.koul@intel.com]
> Sent: Tuesday, June 28, 2016 9:45 AM
> To: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> Cc: Appana Durga Kedareswara Rao <appanad@xilinx.com>;
> robh+dt@kernel.org; pawel.moll@arm.com; mark.rutland@arm.com;
> ijc+devicetree@hellion.org.uk; galak@codeaurora.org; Michal Simek
> <michals@xilinx.com>; Soren Brinkmann <sorenb@xilinx.com>;
> dan.j.williams@intel.com; moritz.fischer@ettus.com;
> laurent.pinchart@ideasonboard.com; luis@debethencourt.com; Srikanth
> Vemula <svemula@xilinx.com>; Anirudha Sarangi <anirudh@xilinx.com>;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; dmaengine@vger.kernel.org
> Subject: Re: [PATCH v10 2/2] dmaengine: Add Xilinx zynqmp dma engine
> driver support
> 
> On Tue, Jun 21, 2016 at 05:29:42PM +0000, Punnaiah Choudary Kalluri wrote:
> >
> > Ok agree with you for the scenario that I have mentioned above.
> >
> > Other simple dma mode feature that I missed to explain is configuring the
> > Dma descriptors. It provides a register interface for configuring the dma
> transaction.
> > So, no need to maintain the descriptors in memory and it will be useful for
> the system
> > that are in crunch of memory.
> 
> And why are these not coming out in the first place, which makes me think it
> is fishy!
> 
> Do you mean programming DMA descriptors to hardware and you can use
> registers instead of memory?
> 

Yes.

> >
> > How do you want us to handle this case?
> >
> 
> > > Okay I am convince now this is not right approach. Please remove this
> > > custom interface and then implement slave for required slave scenarios!
> > >
> >
> > Assume controller is having 8 channels and four of them are used for slave
> > Dma and others are for memcpy.
> > Controller didn't have the per channel priority control but providing the
> rate control
> > Mechanism.
> 
> How does the use of few for memcpy and few for slave change things? IMO
> it
> doesn't, you program the channel accordingly
> 
> >
> > So, I need some interface for configuring the rate control per channel at
> run time irrespective
> > Of whether the channel is allocated for slave dma or memcpy dma.
> 
> why?
> 

This is to prioritize the channel over other channels at runtime.
Also, if the slave device doesn't have a flow control implemented,
Then rate control is one mechanism for controlling the transactions 
Between the source and destination.

> > Is it wrong having the configurable dma parameters for dma memcpy
> operation? We are exposing the
> > Hw capabilities to the user for better dma transaction management.
> 
> For memcpy yes. Memcpy is a generic case where people do not do driver
> specific stuff. So I tend ot push back on that..
> 

Ok. Then we will consider using slave dma if the memcpy requires custom
Settings (the settings might be for debug purpose or there is real hw design
that mandates changes in default optimized settings).

> For slave, existing APIs allow you to program the additional parameters..
> FWIW, rate control is a generic parameter which if you justify enough can be
> added to dma_slave_config
> 

As said above, rate control will be helpful for the controller that doesn't have 
Per channel priority option and also cases where slave device/controller that
Doesn't have Flow control implemented.

Thanks,
Punnaiah

> Thanks
> --
> ~Vinod
