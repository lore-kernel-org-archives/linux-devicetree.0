From: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Subject: RE: [PATCH 2/4] dmaengine: vdma: Add support for mulit-channel dma
 mode
Date: Tue, 28 Jun 2016 05:55:58 +0000
Message-ID: <C246CAC1457055469EF09E3A7AC4E11A4A5B9B9E@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1465549954-30220-1-git-send-email-appanad@xilinx.com>
 <1465549954-30220-3-git-send-email-appanad@xilinx.com>
 <20160621155502.GB16910@localhost>
 <C246CAC1457055469EF09E3A7AC4E11A4A5B8248@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20160621163340.GE16910@localhost>
 <C246CAC1457055469EF09E3A7AC4E11A4A5B84A9@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20160628043459.GR22564@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160628043459.GR22564@localhost>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "luis@debethencourt.com" <luis@debethencourt.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

	Thanks for the review...

> > > > > >  /**
> > > > > > + * struct xilinx_mcdma_config - DMA Multi channel
> > > > > > +configuration structure
> > > > > > + * @tdest: Channel to operate on
> > > > > > + * @tid:   Channel configuration
> > > > > > + * @tuser: Tuser configuration
> > > > > > + * @ax_user: ax_user value
> > > > > > + * @ax_cache: ax_cache value
> > > > > > + */
> > > > > > +struct xilinx_mcdma_config {
> > > > > > +	u8 tdest;
> > > > > > +	u8 tid;
> > > > > > +	u8 tuser;
> > > > > > +	u8 ax_user;
> > > > > > +	u8 ax_cache;
> > > > >
> > > > > can you describe these in details, what do these do, what are
> > > > > the values to be programmed?
> > > >
> > > > As said above In Multi-Channel Mode each Stream interface can be
> > > > Configured up to 16 channels each channel is differentiated based
> > > > on the tdest
> > > and tid values.
> > >
> > > Then why are you not registering 16 channels for this? That should
> > > give you channel to operate on!
> >
> > The number of channels are configurable.
> > We are registering number of Channels that h/w configured for.
> >
> > Will fix in the next version. Will remove this config.
> > And based on the channel type will configure the h/w.
> 
> Looking at this you should redesign!
> 
> The vchan was designed to operate on 'virtual' channels. The hardware channels
> can be independent of that.
> 
> Your IP seems to be a good fit for that approach. Do not link the two and
> separate them. User can have a virtual channel. In your driver, you can manage
> hardware channels...

Fixed it in the v2 and posted the v2 series.
Please go thought it...

> 
> >
> > >
> > > >
> > > > tdest:
> > > > TDEST provides routing information for the data stream.
> > >
> > > pls elobrate
> >
> > Need to configure this with the channel number that We would like to
> > transfer data.
> 
> This should be internal to driver...

Fixed it in the v2 and posted the v2 series.
Please go thought it...

Regards,
Kedar.

> 
> --
> ~Vinod
