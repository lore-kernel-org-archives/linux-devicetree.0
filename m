From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 10/22] usb: gadget: configfs: init and add
 usb_otg_descriptor for usb configurations
Date: Tue, 16 Jun 2015 16:08:25 +0800
Message-ID: <20150616080824.GB10574@shlinux2>
References: <1434437532-23678-1-git-send-email-jun.li@freescale.com>
 <1434437532-23678-11-git-send-email-jun.li@freescale.com>
 <20150616105827.10961583@rockdesk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150616105827.10961583@rockdesk>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 16, 2015 at 10:58:27AM +0300, Roger Quadros wrote:
> 
> On Tue, 16 Jun 2015 14:52:00 +0800
> Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> > Use usb_otg_descriptor_add to allocate and initialize usb_otg_descriptor,
> > add it for each usb configurations, free it while composite unbind.
> > 
> > Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  drivers/usb/gadget/configfs.c | 34 +++++++++++++++++++++++++---------
> >  1 file changed, 25 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> > index 0495c94..773b746 100644
> > --- a/drivers/usb/gadget/configfs.c
> > +++ b/drivers/usb/gadget/configfs.c
> > @@ -41,6 +41,8 @@ int check_user_usb_string(const char *name,
> >  #define MAX_NAME_LEN	40
> >  #define MAX_USB_STRING_LANGS 2
> >  
> > +static const struct usb_descriptor_header *otg_desc[2];
> > +
> >  struct gadget_info {
> >  	struct config_group group;
> >  	struct config_group functions_group;
> > @@ -55,9 +57,6 @@ struct gadget_info {
> >  	struct list_head available_func;
> >  
> >  	const char *udc_name;
> > -#ifdef CONFIG_USB_OTG
> > -	struct usb_otg_descriptor otg;
> > -#endif
> >  	struct usb_composite_driver composite;
> >  	struct usb_composite_dev cdev;
> >  	bool use_os_desc;
> > @@ -1376,6 +1375,24 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
> >  		memcpy(cdev->qw_sign, gi->qw_sign, OS_STRING_QW_SIGN_LEN);
> >  	}
> >  
> > +	if (gadget_is_otg(gadget) && !otg_desc[0]) {
> > +		struct usb_descriptor_header *usb_desc;
> > +		unsigned length;
> > +
> > +		if (gadget->otg_rev >= 0x0200)
> > +			length = sizeof(struct usb_otg20_descriptor);
> > +		else
> > +			length = sizeof(struct usb_otg_descriptor);
> > +		usb_desc = kzalloc(length, GFP_KERNEL);
> > +		if (!usb_desc) {
> > +			ret = -ENOMEM;
> > +			goto err_comp_cleanup;
> > +		}
> 
> This code seems to be common across all gadgets.
> Can we have usb_otg_descriptor_alloc() that takes care of allocating the
> right size based on descriptor version?
> 
> Then we can have
> 		usb_desc = usb_otg_descriptor_alloc(gadget);
> 		if (IS_ERR(usb_desc)) {
> 			ret = PTR_ERR(usb_desc);
> 			goto err_comp_cleanup;
> 		}
> 

That's better, I will update in next version.

Li Jun
> > +		usb_otg_descriptor_init(gadget, usb_desc);
> > +		otg_desc[0] = usb_desc;
> > +		otg_desc[1] = NULL;
> > +	}
> > +
> >  	/* Go through all configs, attach all functions */
> >  	list_for_each_entry(c, &gi->cdev.configs, list) {
> >  		struct config_usb_cfg *cfg;
> > @@ -1383,6 +1400,9 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
> >  		struct usb_function *tmp;
> >  		struct gadget_config_name *cn;
> >  
> > +		if (gadget_is_otg(gadget))
> > +			c->descriptors = otg_desc;
> > +
> >  		cfg = container_of(c, struct config_usb_cfg, c);
> >  		if (!list_empty(&cfg->string_list)) {
> >  			i = 0;
> > @@ -1437,6 +1457,8 @@ static void configfs_composite_unbind(struct usb_gadget *gadget)
> >  	cdev = get_gadget_data(gadget);
> >  	gi = container_of(cdev, struct gadget_info, cdev);
> >  
> > +	kfree(otg_desc[0]);
> > +	otg_desc[0] = NULL;
> >  	purge_configs_funcs(gi);
> >  	composite_dev_cleanup(cdev);
> >  	usb_ep_autoconfig_reset(cdev->gadget);
> > @@ -1510,12 +1532,6 @@ static struct config_group *gadgets_make(
> >  	if (!gi->composite.gadget_driver.function)
> >  		goto err;
> >  
> > -#ifdef CONFIG_USB_OTG
> > -	gi->otg.bLength = sizeof(struct usb_otg_descriptor);
> > -	gi->otg.bDescriptorType = USB_DT_OTG;
> > -	gi->otg.bmAttributes = USB_OTG_SRP | USB_OTG_HNP;
> > -#endif
> > -
> >  	config_group_init_type_name(&gi->group, name,
> >  				&gadget_root_type);
> >  	return &gi->group;
> 
> cheers,
> -roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
