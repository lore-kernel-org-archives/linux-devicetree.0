From: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 2/2] arm/xen: Don't use xen DMA ops when the device is
 protected by an IOMMU
Date: Mon, 24 Feb 2014 07:16:36 -0800
Message-ID: <20140224151636.GA13489@kroah.com>
References: <1392913301-25524-1-git-send-email-julien.grall@linaro.org>
 <1392914159.32657.18.camel@kazak.uk.xensource.com>
 <alpine.DEB.2.02.1402241214570.4471@kaball.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1402241214570.4471-7Z66fg9igcxYtxbxJUhB2Dgeux46jI+i@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
Cc: Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 24, 2014 at 12:19:11PM +0000, Stefano Stabellini wrote:
> CC'ing Greg.
> 
> On Thu, 20 Feb 2014, Ian Campbell wrote:
> > On Thu, 2014-02-20 at 16:21 +0000, Julien Grall wrote:
> > > Only Xen is able to know if a device can safely avoid to use xen-swiotlb.
> > > This patch introduce a new property "protected-devices" for the hypervisor
> > > node which list device which the IOMMU are been correctly programmed by Xen.
> > > 
> > > During Linux boot, Xen specific code will create an hash table which
> > > contains all these devices. The hash table will be used in need_xen_dma_ops
> > > to check if the Xen DMA ops needs to be used for the current device.
> > 
> > Is it out of the question to find a field within struct device itself to
> > store this e.g. in struct device_dma_parameters perhaps and avoid the
> > need for a hashtable lookup.
> > 
> > device->iommu_group might be another option, if we can create our own
> > group?
> 
> I agree that a field in struct device would be ideal.
> Greg, get_maintainer.pl points at you as main maintainer of device.h, do
> you have an opinion on this?

I need a whole lot more context here please.  With a patch would be even
better so that I know exactly what you are referring to...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
