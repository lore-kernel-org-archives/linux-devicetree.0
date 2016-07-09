From: Appana Durga Kedareswara Rao <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v12 2/2] dmaengine: Add Xilinx zynqmp dma engine driver
 support
Date: Sat, 9 Jul 2016 08:36:05 +0000
Message-ID: <C246CAC1457055469EF09E3A7AC4E11A4A5BC756@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1467373026-27768-1-git-send-email-appanad@xilinx.com>
 <1467373026-27768-2-git-send-email-appanad@xilinx.com>
 <20160708055328.GP12591@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160708055328.GP12591@localhost>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org" <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, "laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org" <luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org>, Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

	Thanks for the review...

> > +
> > +	chan->is_dmacoherent =  of_property_read_bool(node, "dma-
> coherent");
> > +	zdev->chan = chan;
> > +	tasklet_init(&chan->tasklet, zynqmp_dma_do_tasklet, (ulong)chan);
> 
> where is this killed?

This is killed in the zynqmp_dma_chan_remove() API.

> 
> > +	spin_lock_init(&chan->lock);
> > +	INIT_LIST_HEAD(&chan->active_list);
> > +	INIT_LIST_HEAD(&chan->pending_list);
> > +	INIT_LIST_HEAD(&chan->done_list);
> > +	INIT_LIST_HEAD(&chan->free_list);
> > +	zynqmp_dma_init(chan);
> > +	chan->irq = platform_get_irq(pdev, 0);
> > +	if (chan->irq < 0)
> > +		return -ENXIO;
> > +	err = devm_request_irq(&pdev->dev, chan->irq,
> zynqmp_dma_irq_handler, 0,
> > +			       "zynqmp-dma", chan);
> 
> this needs to be freed/diabled in remove, dont see that

It is freed in the zynqmp_dma_chan_remove() API.

Regards,
Kedar.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
