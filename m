From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 04/16] drivers/fsi: Add fsi master definition
Date: Wed, 7 Dec 2016 10:06:10 +0100
Message-ID: <20161207090610.GB14742@kroah.com>
References: <1481076574-54711-1-git-send-email-christopher.lee.bostic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1481076574-54711-1-git-send-email-christopher.lee.bostic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Bostic <christopher.lee.bostic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 06, 2016 at 08:09:30PM -0600, Chris Bostic wrote:
> From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
> 
> Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/fsi/fsi-core.c   | 20 ++++++++++++++++++++
>  drivers/fsi/fsi-master.h | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+)
>  create mode 100644 drivers/fsi/fsi-master.h
> 
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 3d55bd5..ce9428d 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -17,6 +17,26 @@
>  #include <linux/fsi.h>
>  #include <linux/module.h>
>  
> +#include "fsi-master.h"
> +
> +static atomic_t master_idx = ATOMIC_INIT(-1);

You don't really want/need an atomic variable, please use the simple ida
interface instead.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
