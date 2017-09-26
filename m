From: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 01/12] usb: typec: add API to get port type and preferred
 role
Date: Tue, 26 Sep 2017 11:02:31 +0300
Message-ID: <20170926080231.GB14296@kuha.fi.intel.com>
References: <1506386727-16370-1-git-send-email-jun.li@nxp.com>
 <1506386727-16370-2-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1506386727-16370-2-git-send-email-jun.li-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org, peter.chen-3arQi8VN3Tc@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Sep 26, 2017 at 08:45:16AM +0800, Li Jun wrote:
> This patch add 2 APIs to get port type and preferred role from firmware
> description.
> 
> Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
> ---
>  drivers/usb/typec/typec.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb/typec.h |  2 ++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/usb/typec/typec.c b/drivers/usb/typec/typec.c
> index 24e355b..0c77cc4 100644
> --- a/drivers/usb/typec/typec.c
> +++ b/drivers/usb/typec/typec.c
> @@ -12,6 +12,7 @@
>  #include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>

Not needed.

>  #include <linux/slab.h>
>  #include <linux/usb/typec.h>
>  
> @@ -1249,6 +1250,50 @@ void typec_set_pwr_opmode(struct typec_port *port,
>  }
>  EXPORT_SYMBOL_GPL(typec_set_pwr_opmode);
>  
> +/**
> + * typec_get_port_type - Get the typec port type
> + * @dev: Device to get the property of
> + *
> + * This routine is used by typec hardware driver to read property port type
> + * from the device firmware description.
> + *
> + * Returns typec_port_type if success, otherwise negative error code.
> + */
> +int typec_get_port_type(struct device *dev)
> +{
> +	const char *type_str;
> +	int ret;
> +
> +	ret = device_property_read_string(dev, "port-type", &type_str);
> +	if (ret < 0)
> +		return ret;
> +
> +	return match_string(typec_port_types, ARRAY_SIZE(typec_port_types),
> +								 type_str);
> +}
> +EXPORT_SYMBOL_GPL(typec_get_port_type);
> +
> +/**
> + * typec_get_power_role - Get the typec preferred role
> + * @dev: Device to get the property of
> + *
> + * This routine is used by typec hardware driver to read property default role
> + * from the device firmware description.
> + *
> + * Returns typec_role if success, otherwise negative error code.
> + */
> +int typec_get_power_role(struct device *dev)
> +{
> +	const char *power_str;
> +	int ret;
> +
> +	ret = device_property_read_string(dev, "default-role", &power_str);
> +	if (ret < 0)
> +		return ret;
> +
> +	return match_string(typec_roles, ARRAY_SIZE(typec_roles), power_str);
> +}
> +EXPORT_SYMBOL_GPL(typec_get_power_role);
>  /* --------------------------------------- */
>  
>  /**
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index ffe7487..bfac685 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -243,5 +243,7 @@ void typec_set_data_role(struct typec_port *port, enum typec_data_role role);
>  void typec_set_pwr_role(struct typec_port *port, enum typec_role role);
>  void typec_set_vconn_role(struct typec_port *port, enum typec_role role);
>  void typec_set_pwr_opmode(struct typec_port *port, enum typec_pwr_opmode mode);
> +int typec_get_port_type(struct device *dev);
> +int typec_get_power_role(struct device *dev);
>  
>  #endif /* __LINUX_USB_TYPEC_H */
> -- 
> 2.6.6

Thanks,

-- 
heikki
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
