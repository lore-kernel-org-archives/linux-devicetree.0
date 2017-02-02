From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] virtio: Try to untangle DMA coherency
Date: Thu, 2 Feb 2017 11:26:15 +0000
Message-ID: <20170202112614.GB30577@arm.com>
References: <8a6494f6409c20b4609cd6bdcdd751f68b5c0564.1485951731.git.robin.murphy@arm.com>
 <20170201195732-mutt-send-email-mst@kernel.org>
 <20170201182659.GM8177@arm.com>
 <20170201210648-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170201210648-mutt-send-email-mst-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael S. Tsirkin" <mst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, jasowang-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 01, 2017 at 09:19:22PM +0200, Michael S. Tsirkin wrote:
> On Wed, Feb 01, 2017 at 06:27:09PM +0000, Will Deacon wrote:
> > On Wed, Feb 01, 2017 at 08:09:21PM +0200, Michael S. Tsirkin wrote:
> > > I'd like to do that instead. It's fastboot doing the unreasonable thing
> > > here and deviating from what every other legacy device without exception
> > > did for years. If this means fastboot will need to update to virtio 1,
> > > all the better.
> > 
> > The problem still exists with virtio 1, unless we require that the
> > "dma-coherent" property is set/unset correctly when VIRTIO_F_IOMMU_PLATFORM
> > is advertised by the device (which is what I suggested in my reply).
> 
> I'm not ignoring that, but I need to understand that part a bit better.
> I'll reply to that patch in a day or two after looking at how _CCA is
> supposed to work.

Thanks. I do think that whatever solution we come up with for virtio 1
should influence what we do for legacy.

> > We can't detect the fastmodel,
> 
> Surely, it puts a hardware id somewhere? I think you mean
> fastmodel isn't always affected, right?

I don't think there's a hardware ID. The thing is, the fastmodel is a
toolkit for building all sorts of platforms: you can chop and change
the CPUs, the peripherals, the memory, the interrupt controller, the
interconnect etc. Pretty much everything can be customised. So, for
any fastmodel configuration that places virtio upstream of the SMMU
(which is common, because virtio is one of the few DMA-capable peripherals
that the fastmodel supports), we need to do something special.

> I'd like to see basically
> 
> if (fastmodel)
> 	a pile of special work-arounds
> else
> 	not less hacky but more common virtio work-arounds
> 
> :)
> 
> And then I can apply whatever comes from @arm.com and not
> worry about breaking actual hardware.

What we could do is call iommu_group_get(&vdev->dev) for legacy
devices if CONFIG_ARM64. If that returns non-NULL, then we know that
the device is upstream of an SMMU, which means it must be the fastmodel.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
