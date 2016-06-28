From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] dmaengine: vdma: Add support for mulit-channel dma
 mode
Date: Tue, 28 Jun 2016 10:04:59 +0530
Message-ID: <20160628043459.GR22564@localhost>
References: <1465549954-30220-1-git-send-email-appanad@xilinx.com>
 <1465549954-30220-3-git-send-email-appanad@xilinx.com>
 <20160621155502.GB16910@localhost>
 <C246CAC1457055469EF09E3A7AC4E11A4A5B8248@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20160621163340.GE16910@localhost>
 <C246CAC1457055469EF09E3A7AC4E11A4A5B84A9@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <C246CAC1457055469EF09E3A7AC4E11A4A5B84A9-4lKfpRxZ5enZMOc0yg5rMog+Gb3gawCHQz34XiSyOiE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Appana Durga Kedareswara Rao <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org" <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, "laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org" <luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 22, 2016 at 07:04:28AM +0000, Appana Durga Kedareswara Rao wrote:
> > > >
> > > > Can you elobrate what you meant by Multichannel mode? This patch
> > > > seems to do two things, one is to add interleaved dma support and
> > > > something else. Can you explain the latter part?
> > >
> > > AXI DMA has two Stream interfaces (Memory to Stream MM2S and Stream to
> > > Memory S2MM)
> > 
> > what is a stream in this context?
> 
> Stream means I/O transfer (Memory to I/O and I/O to Memory).
> Sorry if I confused you.
> 
> > 
> > > In Multi-Channel dma mode each stream interface can be configured up to 16
> > channels.
> > > In Multi-channel DMA mode IP supports only interleaved transfers (2-D
> > transfers).
> > 
> > 
> > >
> > > >
> > > > >  /**
> > > > > + * struct xilinx_mcdma_config - DMA Multi channel configuration
> > > > > +structure
> > > > > + * @tdest: Channel to operate on
> > > > > + * @tid:   Channel configuration
> > > > > + * @tuser: Tuser configuration
> > > > > + * @ax_user: ax_user value
> > > > > + * @ax_cache: ax_cache value
> > > > > + */
> > > > > +struct xilinx_mcdma_config {
> > > > > +	u8 tdest;
> > > > > +	u8 tid;
> > > > > +	u8 tuser;
> > > > > +	u8 ax_user;
> > > > > +	u8 ax_cache;
> > > >
> > > > can you describe these in details, what do these do, what are the
> > > > values to be programmed?
> > >
> > > As said above In Multi-Channel Mode each Stream interface can be
> > > Configured up to 16 channels each channel is differentiated based on the tdest
> > and tid values.
> > 
> > Then why are you not registering 16 channels for this? That should give you
> > channel to operate on!
> 
> The number of channels are configurable.
> We are registering number of Channels that h/w configured for.
> 
> Will fix in the next version. Will remove this config.
> And based on the channel type will configure the h/w.

Looking at this you should redesign!

The vchan was designed to operate on 'virtual' channels. The hardware
channels can be independent of that.

Your IP seems to be a good fit for that approach. Do not link the two and
separate them. User can have a virtual channel. In your driver, you can
manage hardware channels...

> 
> > 
> > >
> > > tdest:
> > > TDEST provides routing information for the data stream.
> > 
> > pls elobrate
> 
> Need to configure this with the channel number that
> We would like to transfer data.

This should be internal to driver...

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
