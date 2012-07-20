From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [patch] driver-core: dev_to_node() should handle NULL pointers
Date: Fri, 20 Jul 2012 08:00:42 -0700
Message-ID: <20120720150042.GA1996@kroah.com>
References: <20120720065622.GA11710@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120720065622.GA11710@elgon.mountain>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 20, 2012 at 09:56:23AM +0300, Dan Carpenter wrote:
> What prompted this patch is that in dma_pool_create() we call
> dev_to_node() before checking whether "dev" is NULL.  It looks like
> there are places which call dma_pool_create() with a NULL pointer.  An
> example is in drivers/usb/gadget/amd5536udc.c.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static checker fix.
> 
> diff --git a/include/linux/device.h b/include/linux/device.h
> index aa7b3b4..c80e7a8d 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -714,7 +714,9 @@ int dev_set_name(struct device *dev, const char *name, ...);
>  #ifdef CONFIG_NUMA
>  static inline int dev_to_node(struct device *dev)
>  {
> -	return dev->numa_node;
> +	if (dev)
> +		return dev->numa_node;
> +	return -1;

What happens if this function returns -1?  Can the callers properly
handle this?

thanks,

greg k-h
