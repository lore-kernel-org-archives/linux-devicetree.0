From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] dma: Add Freescale eDMA engine driver support
Date: Mon, 23 Sep 2013 09:55:49 +0530
Message-ID: <20130923042549.GC17188@intel.com>
References: <1378374799-16357-1-git-send-email-b35083@freescale.com>
 <20130917045359.GN17188@intel.com>
 <B56CDBE15CE27145A4B77D2D24263E85223E21@039-SN1MPN1-003.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <B56CDBE15CE27145A4B77D2D24263E85223E21-TcFNo7jSaXOLgTCmFNXF2K4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lu Jingchang-B35083 <B35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "djbw-b10kYP2dOMg@public.gmane.org" <djbw-b10kYP2dOMg@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 17, 2013 at 08:08:46AM +0000, Lu Jingchang-B35083 wrote:
> > > +	case DMA_PAUSE:
> > > +		if (fsl_chan->edesc)
> > > +			fsl_edma_disable_request(fsl_chan);
> > racy here too...
> It only set the channel HW register, no list is handled, 
> is lock needed here? Thanks!
well thats the point while you are terminating the current trasnaction can
complete and then start another one. You want to try and prevent these case
also. Here you are neither locking the HW access nor the the list, so its juts
waiting to crash!

~Vinod
-- 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
