From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] dma: Add Xilinx AXI Video Direct Memory Access Engine driver support
Date: Mon, 20 Jan 2014 19:41:07 +0100
Message-ID: <201401201941.07633.arnd@arndb.de>
References: <1389894803-4147-1-git-send-email-sthokal@xilinx.com> <201401201239.47665.arnd@arndb.de> <CA+mB=1+mrWAzBCxdMEji2MDRzHajmnxuWtz7iu96ML0DuAB3RQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+mB=1+mrWAzBCxdMEji2MDRzHajmnxuWtz7iu96ML0DuAB3RQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 20 January 2014, Srikanth Thokala wrote:
> >
> >> > * data width should be a property of the slave driver that is configured
> >> >   through dma_slave_config(), unless you can have dma engines that only
> >> >   support certain a width.
> >>
> >> Yes, this VDMA engine soft IP support only certain widths, which is
> >> configurable during IP synthesis.
> >
> > But what is this property used for in that case? Surely you can't
> > connect a slave device to a dmaengine if the bus width doesn't match.
> > You probably have a point here, but I don't understand it yet.
> 
> There is a Data-Realignment Engine (DRE) in the IP which is only available for
> data width setting of 64-bits and less.  So, we use the data-width DT parameter
> to verify this condition and we update alignment shift accordingly.

Ok, I have to admit I didn't understand all of that, but you clearly
know what you are talking about here, so I assume you are correct.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
