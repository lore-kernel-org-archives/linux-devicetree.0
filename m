From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v9 REBASE 6/9] USB: notify phy when root hub port connect
 change
Date: Mon, 9 Jul 2012 09:57:57 -0700
Message-ID: <20120709165757.GA6024@kroah.com>
References: <1341673008-29808-1-git-send-email-richard.zhao@freescale.com>
 <1341673008-29808-7-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1341673008-29808-7-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 07, 2012 at 10:56:45PM +0800, Richard Zhao wrote:
> Phy may need to change settings when port connect change.
> 
> Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Tested-by: Subodh Nijsure <snijsure-4jo+YWezP1RWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/usb/core/hub.c |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 4cc8dc9..2ba9d84 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -20,6 +20,7 @@
>  #include <linux/usb.h>
>  #include <linux/usbdevice_fs.h>
>  #include <linux/usb/hcd.h>
> +#include <linux/usb/otg.h>
>  #include <linux/usb/quirks.h>
>  #include <linux/kthread.h>
>  #include <linux/mutex.h>
> @@ -4037,6 +4038,13 @@ static void hub_port_connect_change(struct usb_hub *hub, int port1,
>  		}
>  	}
>  
> +	if (unlikely(hcd->phy && !hdev->parent)) {

Why is this "unlikely"?  And why mark it as such, is this a "fast path"
that needs the compiler to know this hint to optimize things here?

Please don't use likely() or unlikely() except in places it really is
needed, _and_ you have measured the difference.  Have you done so in
this place?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
