From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH RFC 1/3] drivers: base: support cpu cache information
 interface to userspace via sysfs
Date: Wed, 8 Jan 2014 12:26:13 -0800
Message-ID: <20140108202613.GD8417@kroah.com>
References: <1389209168-17189-1-git-send-email-sudeep.holla@arm.com>
 <1389209168-17189-2-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389209168-17189-2-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ashok Raj <ashok.raj-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 08, 2014 at 07:26:06PM +0000, Sudeep Holla wrote:
> From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> 
> This patch adds initial support for providing processor cache information
> to userspace through sysfs interface. This is based on x86 implementation
> and hence the interface is intended to be fully compatible.
> 
> A per-cpu array of cache information maintained is used mainly for
> sysfs-related book keeping.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  drivers/base/Makefile     |   2 +-
>  drivers/base/cacheinfo.c  | 296 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/cacheinfo.h |  43 +++++++
>  3 files changed, 340 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/base/cacheinfo.c
>  create mode 100644 include/linux/cacheinfo.h

You are creating sysfs files, yet you didn't add Documentation/ABI/
information, which is required.  Please fix that.

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
