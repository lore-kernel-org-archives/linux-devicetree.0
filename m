From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dma: mv_xor_v2: new driver
Date: Wed, 15 Jun 2016 22:11:31 +0530
Message-ID: <20160615164131.GB16910@localhost>
References: <1455523083-25506-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160222032730.GU19598@localhost>
 <20160615160837.64377829@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160615160837.64377829-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 15, 2016 at 04:08:37PM +0200, Thomas Petazzoni wrote:
 
> > > +			(xor_dev->desc_size * desq_ptr));
> > > +
> > > +	memcpy(dest_hw_desc, &sw_desc->hw_desc, xor_dev->desc_size);
> > > +
> > > +	/* update the DMA Engine with the new descriptor */
> > > +	mv_xor_v2_add_desc_to_desq(xor_dev, 1);
> > > +
> > > +	/* unlock enqueue DESCQ */
> > > +	spin_unlock_bh(&xor_dev->push_lock);  
> > 
> > and if IIUC, you are pushing this to HW as well, that is not quite right if
> > thats the case. We need to do this in issue_pending
> 
> This is probably the only thing that I have not changed. The mv_xor
> driver is already using the same strategy, and enqueuing in
> issue_pending() would force us to add the request to a temporary linked
> list, which would be dequeued in issue_pending(). This is quite a bit
> of additional processing, while pushing the new requests directly to
> the engine works fine.

Well that is wrong! And patch is welcome for mv_xor as well :)

The DMAengine API mandates that we should submit a descriptor to a queue and
then push them by invoking issue_pending.

The users are also expected to follow this

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
