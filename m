From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: Fix __of_device_is_available check
Date: Thu, 16 Jan 2014 17:30:27 +0000
Message-ID: <20140116173027.E887FC40973@trevor.secretlab.ca>
References: <1389582448-7489-1-git-send-email-Li.Xiubo@freescale.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389582448-7489-1-git-send-email-Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 13 Jan 2014 11:07:28 +0800, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> From IEEE 1275, there defined a standard 'status' property indicating the
> operational status of one device. The 'status' property has four possible
> values: 'okay/ok', 'disabled', 'fail' and 'fail-xxx'.
> 
> If it is absent, that means the status of the device is unknown or okay.
> 
> The __of_device_is_available checks the state of the 'status' property of
> a device. If the property is absent or set to 'okay/ok', it returns 1.
> Otherwise it returns 0.
> 
> While in __of_device_is_available:
>  >	status = of_get_property(device, "status", &statlen);
>  >	if (status == NULL)
>  >		return 1;
> The status value returned from 'of_get_property()' will be NULL in two cases:
> Firstly: the 'device' value (device node) is NULL.
> Secondly: the 'status' property is actaully not exist.
> 
> If the device node is NULL, the __of_device_is_available will return true,
> that will mean the absent state of the 'status' property.
> 
> So this add the device node check before checking the 'status' property's
> state, and if the device node is not exist, 0 will be returned.
> 
> Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Applied, thanks

g.

> ---
>  drivers/of/base.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index f807d0e..ba195fb 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -415,6 +415,9 @@ static int __of_device_is_available(const struct device_node *device)
>  	const char *status;
>  	int statlen;
>  
> +	if (!device)
> +		return 0;
> +
>  	status = __of_get_property(device, "status", &statlen);
>  	if (status == NULL)
>  		return 1;
> -- 
> 1.8.4
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
