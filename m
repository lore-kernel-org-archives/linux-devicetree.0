From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] mtd: grab a reference to the MTD of_node before
 registering it
Date: Thu, 12 Nov 2015 09:51:20 +0100
Message-ID: <20151112095120.5ae32efd@bbrezillon>
References: <1447287964-63309-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447287964-63309-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 11 Nov 2015 16:26:04 -0800
Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> We now stick the device node representing the current MTD (if any) into
> sysfs, so let's make sure we have a reference to it before doing that.
> 
> Suggested-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Looks good to me,

Reviewed-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

> ---
>  drivers/mtd/mtdcore.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index a91cee90aef9..c393a1155376 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -32,6 +32,7 @@
>  #include <linux/err.h>
>  #include <linux/ioctl.h>
>  #include <linux/init.h>
> +#include <linux/of.h>
>  #include <linux/proc_fs.h>
>  #include <linux/idr.h>
>  #include <linux/backing-dev.h>
> @@ -454,6 +455,7 @@ int add_mtd_device(struct mtd_info *mtd)
>  	mtd->dev.devt = MTD_DEVT(i);
>  	dev_set_name(&mtd->dev, "mtd%d", i);
>  	dev_set_drvdata(&mtd->dev, mtd);
> +	of_node_get(mtd_get_of_node(mtd));
>  	error = device_register(&mtd->dev);
>  	if (error)
>  		goto fail_added;
> @@ -476,6 +478,7 @@ int add_mtd_device(struct mtd_info *mtd)
>  	return 0;
>  
>  fail_added:
> +	of_node_put(mtd_get_of_node(mtd));
>  	idr_remove(&mtd_idr, i);
>  fail_locked:
>  	mutex_unlock(&mtd_table_mutex);
> @@ -517,6 +520,7 @@ int del_mtd_device(struct mtd_info *mtd)
>  		device_unregister(&mtd->dev);
>  
>  		idr_remove(&mtd_idr, mtd->index);
> +		of_node_put(mtd_get_of_node(mtd));
>  
>  		module_put(THIS_MODULE);
>  		ret = 0;



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
