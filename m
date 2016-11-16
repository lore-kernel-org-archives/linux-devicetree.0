From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 0/4] DW DMAC: update device tree
Date: Wed, 16 Nov 2016 17:18:58 +0200
Message-ID: <1479309538.24056.49.camel@linux.intel.com>
References: <1479304615-11360-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479304615-11360-1-git-send-email-Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2016-11-16 at 16:56 +0300, Eugeniy Paltsev wrote:
> It wasn't possible to enable some features like
> memory-to-memory transfers or multi block transfers via DT.
> It is fixed by these patches.
> 
>  * Rename is_private to is-private as ordered by DT policy.
>  (just for cleanup) The change leaves the support for the 
>  old format.
> 
>  * Add is-memcpu property, so it is possible to
>  enable memory-to-memory transfers support via DT.
> 
>  * Add hw-llp property, so it is possible to enable
>  hardware multi block transfers support via DT.
> 
>  * Update DW DMAC device tree documentation.

I have few comments I posted. Besides that don't forget about current
users of the DT properties you standardized (by naming). Better you
convert them at the same time. Older DT (blobs) are being still
supported.

Otherwise looks okay after you address all my comments and maybe others
will do some. The DT people ACK is a must before this goes somewhere.

Also, please keep Cc list as small as possible. For example I'm not sure
Viresh has time to look at them, but he might keep an eye on the
dmaengine mailing list. Same about Dan.

> 
> Eugeniy Paltsev (4):
>   DW DMAC: rename is_private property as ordered by DT policy
>   DW DMAC: add is-memcpu property to device tree
>   DW DMAC: add hw-llp property to device tree
>   Update device tree Synopsys DW DMAC documentation
> 
>  Documentation/devicetree/bindings/dma/snps-dma.txt | 10 ++++++++--
>  drivers/dma/dw/core.c                              |  2 +-
>  drivers/dma/dw/platform.c                          | 10 ++++++++++
>  include/linux/platform_data/dma-dw.h               |  4 ++--
>  4 files changed, 21 insertions(+), 5 deletions(-)
> 

-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
