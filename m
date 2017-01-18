From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Export of_node_ktype
Date: Wed, 18 Jan 2017 12:30:20 -0800
Message-ID: <587FD05C.5030206@gmail.com>
References: <20170118093733.32152-1-alexander.sverdlin@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170118093733.32152-1-alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Alexander,

On 01/18/17 01:37, Alexander Sverdlin wrote:
> This is necessary for of_node_init() to work in the modules.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  drivers/of/base.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index d4bea3c797d6..2eb4dea62b84 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -106,6 +106,7 @@ static void of_node_release(struct kobject *kobj)
>  struct kobj_type of_node_ktype = {
>  	.release = of_node_release,
>  };
> +EXPORT_SYMBOL_GPL(of_node_ktype);
>  
>  static ssize_t of_node_property_read(struct file *filp, struct kobject *kobj,
>  				struct bin_attribute *bin_attr, char *buf,
> 

Why does your module need to call of_node_init() directly?

Thanks,

Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
