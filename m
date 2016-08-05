From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 10/11] soc: ti: knav_qmss_queue: use of_property_read_bool
Date: Fri, 5 Aug 2016 13:47:25 +0100
Message-ID: <c010a500-87ce-19ad-0109-f57eba3c6981@arm.com>
References: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr>
 <1470387411-15879-11-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470387411-15879-11-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Julia,

On 05/08/16 09:56, Julia Lawall wrote:
> Use of_property_read_bool to check for the existence of a property.

This caught my eye since Rob told me off for doing the same recently[1].

> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression e1,e2;
> statement S2,S1;
> @@
> -       if (of_get_property(e1,e2,NULL))
> +       if (of_property_read_bool(e1,e2))
>         S1 else S2
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> 
> ---
>  drivers/soc/ti/knav_qmss_queue.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
> index b73e353..56b5d7c 100644
> --- a/drivers/soc/ti/knav_qmss_queue.c
> +++ b/drivers/soc/ti/knav_qmss_queue.c
> @@ -1240,7 +1240,7 @@ static int knav_setup_queue_range(struct knav_device *kdev,
>  	if (of_get_property(node, "qalloc-by-id", NULL))

According to the binding, "qalloc-by-id" _is_ a boolean property, so
this one really does deserve to be of_property_read_bool()...

>  		range->flags |= RANGE_RESERVED;
>  
> -	if (of_get_property(node, "accumulator", NULL)) {
> +	if (of_property_read_bool(node, "accumulator")) {

...whereas "accumulator" must have a value, so this isn't technically
appropriate. In general, most of these "if the property exists, read the
property and do stuff" checks are probably a sign of code that could be
simplified by refactoring the "do stuff" step to just specifically
handle the "read the property" step returning -EINVAL when it's not present.

Robin.

[1]:https://www.mail-archive.com/iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org/msg13375.html

>  		ret = knav_init_acc_range(kdev, node, range);
>  		if (ret < 0) {
>  			devm_kfree(dev, range);
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
