Return-Path: <SRS0=f43A=H6=gmail.com=mats.dev.list@kernel.org>
Subject: Re: [PATCH v5 05/14] usb: typec: add API to get typec basic port
 power and data config
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
 <1525307094-27402-6-git-send-email-jun.li@nxp.com>
From: Mats Karrman <mats.dev.list@gmail.com>
Message-ID: <c28a8352-e960-449b-e7c1-7965d340536e@gmail.com>
Date: Fri, 11 May 2018 21:55:31 +0200
MIME-Version: 1.0
In-Reply-To: <1525307094-27402-6-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Li Jun <jun.li@nxp.com>, robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, gsomlo@gmail.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Hi Li Jun,

On 2018-05-03 02:24, Li Jun wrote:

> This patch adds 3 APIs to get the typec port power and data type,
> and preferred power role by its name string.
>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>   drivers/usb/typec/class.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++
>   include/linux/usb/typec.h |  3 +++
>   2 files changed, 55 insertions(+)
>
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 53df10d..5981e18 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -9,6 +9,7 @@
>   #include <linux/device.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
> +#include <linux/property.h>
>   #include <linux/slab.h>
>   #include <linux/usb/typec.h>
>   #include <linux/usb/typec_mux.h>
> @@ -802,6 +803,12 @@ static const char * const typec_port_types[] = {
>   	[TYPEC_PORT_DRP] = "dual",
>   };
>   
> +static const char * const typec_data_types[] = {
> +	[TYPEC_PORT_DFP] = "host",
> +	[TYPEC_PORT_UFP] = "device",
> +	[TYPEC_PORT_DRD] = "dual",
> +};
> +
>   static const char * const typec_port_types_drp[] = {
>   	[TYPEC_PORT_SRC] = "dual [source] sink",
>   	[TYPEC_PORT_SNK] = "dual source [sink]",
> @@ -1252,6 +1259,51 @@ void typec_set_pwr_opmode(struct typec_port *port,
>   }
>   EXPORT_SYMBOL_GPL(typec_set_pwr_opmode);
>   
> +/**
> + * typec_find_power_type - Get the typec port power type

Why is this function called typec_find_power_type() and not typec_find_port_type()?
It's called port_type in sysfs, having different names just adds confusion.
(Otherwise I agree power_type is a better name but...)

> + * @name: port type string
> + *
> + * This routine is used to find the typec_port_type by its string name.
> + *
> + * Returns typec_port_type if success, otherwise negative error code.
> + */
> +int typec_find_power_type(const char *name)
> +{
> +	return match_string(typec_port_types, ARRAY_SIZE(typec_port_types),
> +			    name);
> +}
> +EXPORT_SYMBOL_GPL(typec_find_power_type);
> +
> +/**
> + * typec_find_preferred_role - Find the typec drp port preferred power role

Why typec_find_preferred_role()? Could be used for any power_role so
why not typec_find_power_role()?

BR // Mats

> + * @name: power role string
> + *
> + * This routine is used to find the typec_role by its string name of
> + * preferred power role(Try.SRC or Try.SNK).
> + *
> + * Returns typec_role if success, otherwise negative error code.
> + */
> +int typec_find_preferred_role(const char *name)
> +{
> +	return match_string(typec_roles, ARRAY_SIZE(typec_roles), name);
> +}
> +EXPORT_SYMBOL_GPL(typec_find_preferred_role);
> +
> +/**
> + * typec_find_data_type - Get the typec port data capability
> + * @name: data type string
> + *
> + * This routine is used to find the typec_port_data by its string name.
> + *
> + * Returns typec_port_data if success, otherwise negative error code.
> + */
> +int typec_find_data_type(const char *name)
> +{
> +	return match_string(typec_data_types, ARRAY_SIZE(typec_data_types),
> +			    name);
> +}
> +EXPORT_SYMBOL_GPL(typec_find_data_type);
> +
>   /* ------------------------------------------ */
>   /* API for Multiplexer/DeMultiplexer Switches */
>   
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 672b39b..00c93e7 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -267,4 +267,7 @@ int typec_set_orientation(struct typec_port *port,
>   			  enum typec_orientation orientation);
>   int typec_set_mode(struct typec_port *port, int mode);
>   
> +int typec_find_power_type(const char *name);
> +int typec_find_preferred_role(const char *name);
> +int typec_find_data_type(const char *name);
>   #endif /* __LINUX_USB_TYPEC_H */
>
