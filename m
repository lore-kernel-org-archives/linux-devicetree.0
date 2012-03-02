From: "Cousson, Benoit" <b-cousson-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] devicetree: Add empty of_platform_populate() for
 !CONFIG_OF_ADDRESS (sparc)
Date: Fri, 2 Mar 2012 22:20:16 +0100
Message-ID: <4F513990.1030401@ti.com>
References: <1330121218-10442-1-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1330121218-10442-1-git-send-email-grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

In fact this patch is not working for build without CONFIG_OF like x86.

On 2/24/2012 11:06 PM, Grant Likely wrote:
> --- a/include/linux/of_platform.h
> +++ b/include/linux/of_platform.h
> @@ -81,7 +81,7 @@ extern struct platform_device *of_device_alloc(struct device_node *np,
>   					 struct device *parent);
>   extern struct platform_device *of_find_device_by_node(struct device_node *np);
>
> -#if !defined(CONFIG_SPARC) /* SPARC has its own device registration method */
> +#ifdef CONFIG_OF_ADDRESS /* device reg helpers depend on OF_ADDRESS */
>   /* Platform devices and busses creation */
>   extern struct platform_device *of_platform_device_create(struct device_node *np,
>   						   const char *bus_id,
> @@ -94,7 +94,15 @@ extern int of_platform_populate(struct device_node *root,
>   				const struct of_device_id *matches,
>   				const struct of_dev_auxdata *lookup,
>   				struct device *parent);
> -#endif /* !CONFIG_SPARC */
> +#else
> +static inline int of_platform_populate(struct device_node *root,
> +					const struct of_device_id *matches,
> +					const struct of_dev_auxdata *lookup,
> +					struct device *parent)
> +{
> +	return -ENODEV;
> +}
> +#endif /* !CONFIG_OF_ADDRESS */
>
>   #endif /* CONFIG_OF_DEVICE */

Because if CONFIG_OF_DEVICE is not defined, then the stub for 
of_platform_populate will not be defined either. It should exist for any 
config without CONFIG_OF.

Building twl4030 for x86 is actually broken.

Regards,
Benoit
