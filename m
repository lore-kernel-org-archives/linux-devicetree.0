From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 10/22] usb: gadget: configfs: init and add
 usb_otg_descriptor for usb configurations
Date: Tue, 9 Jun 2015 16:33:11 +0300
Message-ID: <20150609163311.2b364444@rockdesk>
References: <1433775737-9816-1-git-send-email-jun.li@freescale.com>
	<1433775737-9816-11-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433775737-9816-11-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Mon, 8 Jun 2015 23:02:05 +0800
Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> Use usb_otg_descriptor_add to allocate and initialize usb_otg_descriptor,
> add it for each usb configurations, free it while composite unbind.
> 
> Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  drivers/usb/gadget/configfs.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 0495c94..bf3e625 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -41,6 +41,8 @@ int check_user_usb_string(const char *name,
>  #define MAX_NAME_LEN	40
>  #define MAX_USB_STRING_LANGS 2
>  
> +static const struct usb_descriptor_header *otg_desc[2];
> +
>  struct gadget_info {
>  	struct config_group group;
>  	struct config_group functions_group;
> @@ -55,9 +57,6 @@ struct gadget_info {
>  	struct list_head available_func;
>  
>  	const char *udc_name;
> -#ifdef CONFIG_USB_OTG
> -	struct usb_otg_descriptor otg;
> -#endif
>  	struct usb_composite_driver composite;
>  	struct usb_composite_dev cdev;
>  	bool use_os_desc;
> @@ -1376,6 +1375,16 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
>  		memcpy(cdev->qw_sign, gi->qw_sign, OS_STRING_QW_SIGN_LEN);
>  	}
>  
> +	if (gadget_is_otg(gadget) && !otg_desc[0]) {
> +		otg_desc[0] = (struct usb_descriptor_header *)
> +				usb_otg_descriptor_add(gi->cdev.gadget);
> +		if (!otg_desc[0]) {
> +			ret = -ENOMEM;
> +			goto err_comp_cleanup;
> +		}
> +		otg_desc[1] = NULL;

If you use static allocation for otg_desc this code simplifies to
		usb_otg_descriptor_add(gi->cdev.gadget, &otg_desc[0]);

assuming we have already allocated for otg_desc like so

static struct usb_otg_descriptor otg_descriptor;	/* configured at runtime */
static const struct usb_descriptor_header *otg_desc[] = {
        (struct usb_descriptor_header *) &otg_descriptor,
        NULL,
};


> +	}
> +
>  	/* Go through all configs, attach all functions */
>  	list_for_each_entry(c, &gi->cdev.configs, list) {
>  		struct config_usb_cfg *cfg;
> @@ -1383,6 +1392,9 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
>  		struct usb_function *tmp;
>  		struct gadget_config_name *cn;
>  
> +		if (gadget_is_otg(gadget))
> +			c->descriptors = otg_desc;
> +
>  		cfg = container_of(c, struct config_usb_cfg, c);
>  		if (!list_empty(&cfg->string_list)) {
>  			i = 0;
> @@ -1437,6 +1449,8 @@ static void configfs_composite_unbind(struct usb_gadget *gadget)
>  	cdev = get_gadget_data(gadget);
>  	gi = container_of(cdev, struct gadget_info, cdev);
>  
> +	kfree(otg_desc[0]);
> +	otg_desc[0] = NULL;
>  	purge_configs_funcs(gi);
>  	composite_dev_cleanup(cdev);
>  	usb_ep_autoconfig_reset(cdev->gadget);
> @@ -1510,12 +1524,6 @@ static struct config_group *gadgets_make(
>  	if (!gi->composite.gadget_driver.function)
>  		goto err;
>  
> -#ifdef CONFIG_USB_OTG
> -	gi->otg.bLength = sizeof(struct usb_otg_descriptor);
> -	gi->otg.bDescriptorType = USB_DT_OTG;
> -	gi->otg.bmAttributes = USB_OTG_SRP | USB_OTG_HNP;
> -#endif
> -
>  	config_group_init_type_name(&gi->group, name,
>  				&gadget_root_type);
>  	return &gi->group;

cheers,
-roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
