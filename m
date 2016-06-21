From: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Subject: RE: [PATCH 2/4] dmaengine: vdma: Add support for mulit-channel dma
 mode
Date: Tue, 21 Jun 2016 16:02:05 +0000
Message-ID: <C246CAC1457055469EF09E3A7AC4E11A4A5B8248@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1465549954-30220-1-git-send-email-appanad@xilinx.com>
 <1465549954-30220-3-git-send-email-appanad@xilinx.com>
 <20160621155502.GB16910@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160621155502.GB16910@localhost>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "luis@debethencourt.com" <luis@debethencourt.com>, "galak@codeaurora.org" <galak@codeaurora.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

	Thanks for the review...

> 
> On Fri, Jun 10, 2016 at 02:42:32PM +0530, Kedareswara rao Appana wrote:
> > This patch adds support for AXI DMA multi-channel dma mode
> > Multichannel mode enables DMA to connect to multiple masters And
> > slaves on the streaming side.
> > In Multichannel mode AXI DMA supports 2D transfers.
> 
> Funny formatting!

Will fix in next version...

> 
> Can you elobrate what you meant by Multichannel mode? This patch seems to
> do two things, one is to add interleaved dma support and something else. Can
> you explain the latter part?

AXI DMA has two Stream interfaces (Memory to Stream MM2S and Stream to Memory S2MM)
In Multi-Channel dma mode each stream interface can be configured up to 16 channels.
In Multi-channel DMA mode IP supports only interleaved transfers (2-D transfers).

> 
> >  /**
> > + * struct xilinx_mcdma_config - DMA Multi channel configuration
> > +structure
> > + * @tdest: Channel to operate on
> > + * @tid:   Channel configuration
> > + * @tuser: Tuser configuration
> > + * @ax_user: ax_user value
> > + * @ax_cache: ax_cache value
> > + */
> > +struct xilinx_mcdma_config {
> > +	u8 tdest;
> > +	u8 tid;
> > +	u8 tuser;
> > +	u8 ax_user;
> > +	u8 ax_cache;
> 
> can you describe these in details, what do these do, what are the values to be
> programmed?

As said above In Multi-Channel Mode each Stream interface can be 
Configured up to 16 channels each channel is differentiated based on the tdest and tid values.

tdest:
TDEST provides routing information for the data stream.
TDEST values are static for the entire packet.

tid:
Provides a stream identifier. TID values are static for entire packet.
TID values provided in the TX descriptor field are presented on
TID signals of the streaming side.

tuser:
Sideband signals used for user-defined information.
TUSER values are static for entire packet. TUSER values provided in the TX
Descriptor field are presented on TUSER signals of streaming side.

ax_user: 
Sideband signals used for user-defined information
ARUSER values and their interpretations are user-defined

ax_cache:
Cache type this signal provides additional information about the cacheable
Characteristics of the transfer.

In the above parameters tdest and tid are mandatory to differentiate b/w different channels
Other parameters are optional please let me know if you don't want me to 
Include other optional parameters will remove in the next version.

Regards,
Kedar.

> 
> --
> ~Vinod
