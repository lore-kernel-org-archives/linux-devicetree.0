From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 15/16] mtd: mtdcore: fix initcall level
Date: Tue, 1 Sep 2015 14:19:38 -0700
Message-ID: <20150901211938.GJ81844@google.com>
References: <1440592108-3740-1-git-send-email-holler@ahsoftware.de>
 <1440592108-3740-16-git-send-email-holler@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440592108-3740-16-git-send-email-holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russel King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Alexander,

No judgment here for the rest of this series, but for this patch:

On Wed, Aug 26, 2015 at 02:28:27PM +0200, Alexander Holler wrote:
> The mtd-core has to be initialized before other dependent mtd-drivers,
> otherwise a crash might occur.
> 
> Currently mtd_init() is called in the initcall-level device, which is the
> same level where most mtd-drivers will end up. By luck this seemed to have
> been called most of the time before other mtd-drivers without having been
> explicitly enforced.

I can't really speak for the original authors, but it does not appear to
be entirely "by luck." Link order was one of the de facto ways to get
this ordering (though it's not really a great one), and mtdcore was
always linked first within the drivers/mtd/ directory structure.

But that's just background, I think this is worth fixing anyway. It
could, for instance, become a problem if drivers are located outside
drivers/mtd/; I see random board files in arch/ that register with MTD,
and I'm actually not sure how they have never tripped on this.

> But if mtd_init() is not called before a dependent
> driver, a null-pointer exception might occur (e.g. because the mtd device
> class isn't registered).
> 
> To fix this, mtd-init() is moved to the initcall-level fs (right before
> the standard initcall level device).

Is there a good reason we shouldn't just make this a subsys_initcall()?
That would match the naming better, and it mirrors what, e.g.,
block/genhd uses. It would also allow flexibility if there are other
current/future use cases that might need to sit between the subsystem
and the drivers.

> Signed-off-by: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
> ---
>  drivers/mtd/mtdcore.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 8bbbb75..fa8e6452 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1303,7 +1303,7 @@ static void __exit cleanup_mtd(void)
>  	bdi_destroy(&mtd_bdi);
>  }
>  
> -module_init(init_mtd);
> +fs_initcall_sync(init_mtd);

Why the *_sync() version? init_mtd() is very simple and doesn't have any
multithreading issues to handle.

>  module_exit(cleanup_mtd);
>  
>  MODULE_LICENSE("GPL");
> -- 
> 2.1.0
> 

Regards,
Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
