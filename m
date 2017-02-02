From: "Michael S. Tsirkin" <mst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] virtio: Try to untangle DMA coherency
Date: Thu, 2 Feb 2017 18:45:41 +0200
Message-ID: <20170202184443-mutt-send-email-mst@kernel.org>
References: <8a6494f6409c20b4609cd6bdcdd751f68b5c0564.1485951731.git.robin.murphy@arm.com>
 <20170201195732-mutt-send-email-mst@kernel.org>
 <20170201182659.GM8177@arm.com>
 <20170201210648-mutt-send-email-mst@kernel.org>
 <20170202112614.GB30577@arm.com>
 <bb041fbe-3fde-0dc1-ae28-cca5acfe9dc5@arm.com>
 <20170202182224-mutt-send-email-mst@kernel.org>
 <20170202164049.GI13839@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170202164049.GI13839-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, jasowang-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 02, 2017 at 04:40:49PM +0000, Will Deacon wrote:
> On Thu, Feb 02, 2017 at 06:30:28PM +0200, Michael S. Tsirkin wrote:
> > I am inclined to say, for 4.10 let's revert
> > c7070619f3408d9a0dffbed9149e6f00479cf43b since what it fixes is not a
> > regression in 4.10.
> 
> No complaints there, as long as we can keep working to fix this for 4.11
> and onwards. You'll also need to cc stable on the revert.
> 
> > So I think we can defer the fix to 4.11.
> > I think we still want f7f6634d23830ff74335734fbdb28ea109c1f349
> > for hosts with virtio 1 support.
> > 
> > All this will hopefully push hosts to just implement virtio 1.
> > For mmio the changes are very small: several new registers,
> > that's all. You want this for proper 64 bit dma mask anyway.
> 
> As I've said, virtio 1 will have exactly the same issue unless we start
> requiring firmware to advertise dma-coherent/_CCA for virtio-mmio
> devices correctly.
> 
> Will

I mostly agree with that, just didn't have time to read up on _CCA yet.

-- 
MST
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
