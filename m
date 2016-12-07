From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 14/16] drivers/fsi: Add master unscan
Date: Wed, 7 Dec 2016 10:31:24 +0100
Message-ID: <20161207093124.GD14742@kroah.com>
References: <1481069677-53660-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1481069677-53660-15-git-send-email-christopher.lee.bostic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1481069677-53660-15-git-send-email-christopher.lee.bostic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Bostic <christopher.lee.bostic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 06, 2016 at 06:14:35PM -0600, Chris Bostic wrote:
> From: Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> 
> Allow a master to undo a previous scan.  Should a master scan a bus
> twice it will need to ensure it doesn't double register any
> previously detected device.
> 
> Signed-off-by: Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/fsi/fsi-core.c   | 36 +++++++++++++++++++++++++++++++++++-
>  drivers/fsi/fsi-master.h |  2 ++
>  include/linux/fsi.h      |  1 +
>  3 files changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index a28434b..8ccfe50 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -41,6 +41,8 @@
>  static atomic_t master_idx = ATOMIC_INIT(-1);
>  
>  struct fsi_slave {
> +	struct list_head	list_link;	/* Master's list of slaves */
> +	struct list_head	my_engines;
>  	struct device		dev;
>  	struct fsi_master	*master;
>  	int			link;
> @@ -196,6 +198,8 @@ static int fsi_slave_scan(struct fsi_slave *slave)
>  	uint32_t conf;
>  	int rc, i;
>  
> +	INIT_LIST_HEAD(&slave->my_engines);
> +
>  	/*
>  	 * scan engines
>  	 *
> @@ -264,7 +268,9 @@ static int fsi_slave_scan(struct fsi_slave *slave)
>  			if (rc) {
>  				dev_warn(&slave->dev, "add failed: %d\n", rc);
>  				put_device(&dev->dev);
> +				continue;
>  			}
> +			list_add(&dev->link, &slave->my_engines);
>  		}
>  
>  		engine_addr += slots * engine_page_size;
> @@ -357,7 +363,7 @@ static int fsi_slave_init(struct fsi_master *master,
>  		put_device(&slave->dev);
>  		return rc;
>  	}
> -
> +	list_add(&slave->list_link, &master->my_slaves);
>  	fsi_slave_scan(slave);
>  	return 0;
>  }
> @@ -388,6 +394,11 @@ static int fsi_master_scan(struct fsi_master *master)
>  	int link, slave_id, rc;
>  	uint32_t smode;
>  
> +	if (!master->slave_list) {
> +		INIT_LIST_HEAD(&master->my_slaves);
> +		master->slave_list = true;
> +	}
> +
>  	for (link = 0; link < master->n_links; link++) {
>  		rc = fsi_master_link_enable(master, link);
>  		if (rc) {
> @@ -423,9 +434,31 @@ static int fsi_master_scan(struct fsi_master *master)
>  	return 0;
>  }
>  
> +static void fsi_master_unscan(struct fsi_master *master)
> +{
> +	struct fsi_slave *slave, *slave_tmp;
> +	struct fsi_device *fsi_dev, *fsi_dev_tmp;
> +
> +	if (!master->slave_list)
> +		return;
> +
> +	list_for_each_entry_safe(slave, slave_tmp, &master->my_slaves,
> +							list_link) {
> +		list_del(&slave->list_link);
> +		list_for_each_entry_safe(fsi_dev, fsi_dev_tmp,
> +					&slave->my_engines, link) {
> +			list_del(&fsi_dev->link);
> +			put_device(&fsi_dev->dev);
> +		}
> +		device_unregister(&slave->dev);
> +	}
> +	master->slave_list = false;
> +}
> +
>  int fsi_master_register(struct fsi_master *master)
>  {
>  	master->idx = atomic_inc_return(&master_idx);
> +	master->slave_list = false;
>  	get_device(master->dev);
>  	fsi_master_scan(master);
>  	return 0;
> @@ -434,6 +467,7 @@ int fsi_master_register(struct fsi_master *master)
>  
>  void fsi_master_unregister(struct fsi_master *master)
>  {
> +	fsi_master_unscan(master);
>  	put_device(master->dev);
>  }
>  EXPORT_SYMBOL_GPL(fsi_master_unregister);
> diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
> index 56aad0e..454af2b 100644
> --- a/drivers/fsi/fsi-master.h
> +++ b/drivers/fsi/fsi-master.h
> @@ -20,6 +20,8 @@
>  #include <linux/device.h>
>  
>  struct fsi_master {
> +	struct list_head my_slaves;
> +	bool		slave_list;
>  	struct device	*dev;
>  	int		idx;
>  	int		n_links;
> diff --git a/include/linux/fsi.h b/include/linux/fsi.h
> index 66bce48..924502b 100644
> --- a/include/linux/fsi.h
> +++ b/include/linux/fsi.h
> @@ -18,6 +18,7 @@
>  #include <linux/device.h>
>  
>  struct fsi_device {
> +	struct list_head	link;	/* for slave's list */

Can't you use the device list on the bus instead?  Putting a device on
multiple lists gets tricky very quickly :(

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
