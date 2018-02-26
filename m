Return-Path: <SRS0=dGFV=FU=linux.intel.com=heikki.krogerus@kernel.org>
Date: Mon, 26 Feb 2018 15:19:12 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2 01/12] usb: typec: add API to get port type and
 preferred role
Message-ID: <20180226131912.GB25535@kuha.fi.intel.com>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
 <1519645759-12701-2-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519645759-12701-2-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, linux@roeck-us.net, a.hajda@samsung.com, mark.rutland@arm.com, yueyao@google.com, peter.chen@nxp.com, garsilva@embeddedor.com, o_leveque@orange.fr, shufan_lee@richtek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 26, 2018 at 07:49:08PM +0800, Li Jun wrote:
> This patch add 2 APIs to get port type and preferred role from firmware
> description.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> 
> ---
> change for v2
> - Change the 2 APIs name and input para to be device_node pointer.

Why?

You are only dealing with device properties here, so please move back
to using the unified device property API.

>  drivers/usb/typec/typec.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb/typec.h |  2 ++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/usb/typec/typec.c b/drivers/usb/typec/typec.c
> index 735726c..e7b2802 100644
> --- a/drivers/usb/typec/typec.c
> +++ b/drivers/usb/typec/typec.c
> @@ -9,6 +9,7 @@
>  #include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>

No need for that.

>  #include <linux/slab.h>
>  #include <linux/usb/typec.h>
>  
> @@ -1246,6 +1247,51 @@ void typec_set_pwr_opmode(struct typec_port *port,
>  }
>  EXPORT_SYMBOL_GPL(typec_set_pwr_opmode);
>  
> +/**
> + * typec_of_get_port_type - Get the typec port type
> + * @np: device node from which the property value is to be read.
> + *
> + * This routine is used by typec hardware driver to read property port type
> + * from the device firmware description.
> + *
> + * Returns typec_port_type if success, otherwise negative error code.
> + */
> +int typec_of_get_port_type(struct device_node *np)

int typec_get_port_type(struct device *dev)

I would expect you to have the function like that even if you really
were calling of_* functions in it so we would not need to change the
API later once support for ACPI or some other type of FW interface is
added. But as said, that will not be the case, and you need to use
device_property_* functions instead.

> +{
> +	const char *type_str;
> +	int ret;
> +
> +	ret = of_property_read_string(np, "port-type", &type_str);

ret = device_property_read_string(dev, "port-type", &type_str);

> +	if (ret < 0)
> +		return ret;
> +
> +	return match_string(typec_port_types, ARRAY_SIZE(typec_port_types),
> +								 type_str);
> +}
> +EXPORT_SYMBOL_GPL(typec_get_port_type);

Note that you are still exporting the old function name, but that's
fine. Just change the function name back to the original.

> +/**
> + * typec_of_get_preferred_role - Get the typec preferred role
> + * @np: device node from which the property value is to be read.
> + *
> + * This routine is used by typec hardware driver to read property default role
> + * from the device firmware description.
> + *
> + * Returns typec_role if success, otherwise negative error code.
> + */
> +int typec_of_get_preferred_role(struct device_node *np)

int typec_get_preferred_role(struct device dev)

> +{
> +	const char *power_str;
> +	int ret;
> +
> +	ret = of_property_read_string(np, "default-role", &power_str);

ret = device_property_read_string(dev, "default-role", &type_str);

> +	if (ret < 0)
> +		return ret;
> +
> +	return match_string(typec_roles, ARRAY_SIZE(typec_roles), power_str);
> +}
> +EXPORT_SYMBOL_GPL(typec_get_preferred_role);
> +
>  /* --------------------------------------- */

Thanks,

-- 
heikki
