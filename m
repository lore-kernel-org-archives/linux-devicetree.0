From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v10 2/2] dmaengine: Add Xilinx zynqmp dma engine driver
 support
Date: Tue, 28 Jun 2016 09:44:41 +0530
Message-ID: <20160628041441.GQ22564@localhost>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <03CA77BA8AF6F1469AEDFBDA1322A7B74A18BB82-4lKfpRxZ5ekkx2a1wsGfbYg+Gb3gawCHQz34XiSyOiE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Appana Durga Kedareswara Rao <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org" <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, "laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org" <luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org>, Srikanth Vemula <svemula-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Anirudha Sarangi <anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TaqPxH82wqD4g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 21, 2016 at 05:29:42PM +0000, Punnaiah Choudary Kalluri wrote:
> 
> Ok agree with you for the scenario that I have mentioned above.
> 
> Other simple dma mode feature that I missed to explain is configuring the 
> Dma descriptors. It provides a register interface for configuring the dma transaction.
> So, no need to maintain the descriptors in memory and it will be useful for the system 
> that are in crunch of memory.  

And why are these not coming out in the first place, which makes me think it
is fishy!

Do you mean programming DMA descriptors to hardware and you can use
registers instead of memory?

> 
> How do you want us to handle this case?
> 

> > Okay I am convince now this is not right approach. Please remove this
> > custom interface and then implement slave for required slave scenarios!
> >
> 
> Assume controller is having 8 channels and four of them are used for slave
> Dma and others are for memcpy.
> Controller didn't have the per channel priority control but providing the rate control
> Mechanism. 

How does the use of few for memcpy and few for slave change things? IMO it
doesn't, you program the channel accordingly

> 
> So, I need some interface for configuring the rate control per channel at run time irrespective
> Of whether the channel is allocated for slave dma or memcpy dma.

why?

> Is it wrong having the configurable dma parameters for dma memcpy operation? We are exposing the
> Hw capabilities to the user for better dma transaction management.

For memcpy yes. Memcpy is a generic case where people do not do driver
specific stuff. So I tend ot push back on that..

For slave, existing APIs allow you to program the additional parameters..
FWIW, rate control is a generic parameter which if you justify enough can be
added to dma_slave_config

Thanks
-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
