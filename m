Return-Path: <SRS0=yY7i=JN=gmail.com=groeck7@kernel.org>
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v8 04/14] usb: typec: add fwnode to tcpc
References: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
 <1530056732-9640-5-git-send-email-jun.li@nxp.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <d0f3c5a4-36e3-b375-8eec-b6e7555e31f4@roeck-us.net>
Date: Tue, 26 Jun 2018 17:30:47 -0700
MIME-Version: 1.0
In-Reply-To: <1530056732-9640-5-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Li Jun <jun.li@nxp.com>, robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com
Cc: a.hajda@samsung.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On 06/26/2018 04:45 PM, Li Jun wrote:
> Add fwnode handle to get the fwnode so we can get typec configs
> it contains.
> 
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/staging/typec/tcpci.c | 7 +++++++
>   drivers/usb/typec/tcpm.c      | 1 +
>   include/linux/usb/tcpm.h      | 2 ++
>   3 files changed, 10 insertions(+)
> 
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
> index dd29288..e59547a 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -10,6 +10,7 @@
>   #include <linux/module.h>
>   #include <linux/i2c.h>
>   #include <linux/interrupt.h>
> +#include <linux/property.h>
>   #include <linux/regmap.h>
>   #include <linux/usb/pd.h>
>   #include <linux/usb/tcpm.h>
> @@ -474,6 +475,12 @@ static int tcpci_parse_config(struct tcpci *tcpci)
>   
>   	/* TODO: Populate struct tcpc_config from ACPI/device-tree */
>   	tcpci->tcpc.config = &tcpci_tcpc_config;
> +	tcpci->tcpc.fwnode = device_get_named_child_node(tcpci->dev,
> +							 "connector");
> +	if (!tcpci->tcpc.fwnode) {
> +		dev_err(tcpci->dev, "Can't find connector node.\n");
> +		return -EINVAL;
> +	}
>   
>   	return 0;
>   }
> diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
> index 8a201dd..d22b37b 100644
> --- a/drivers/usb/typec/tcpm.c
> +++ b/drivers/usb/typec/tcpm.c
> @@ -4576,6 +4576,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>   	else
>   		port->try_role = TYPEC_NO_PREFERRED_ROLE;
>   
> +	port->typec_caps.fwnode = tcpc->fwnode;
>   	port->typec_caps.prefer_role = tcpc->config->default_role;
>   	port->typec_caps.type = tcpc->config->type;
>   	port->typec_caps.data = tcpc->config->data;
> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
> index b231b93..193920a 100644
> --- a/include/linux/usb/tcpm.h
> +++ b/include/linux/usb/tcpm.h
> @@ -110,6 +110,7 @@ enum tcpc_mux_mode {
>   /**
>    * struct tcpc_dev - Port configuration and callback functions
>    * @config:	Pointer to port configuration
> + * @fwnode:	Pointer to port fwnode
>    * @get_vbus:	Called to read current VBUS state
>    * @get_current_limit:
>    *		Optional; called by the tcpm core when configured as a snk
> @@ -138,6 +139,7 @@ enum tcpc_mux_mode {
>    */
>   struct tcpc_dev {
>   	const struct tcpc_config *config;
> +	struct fwnode_handle *fwnode;
>   
>   	int (*init)(struct tcpc_dev *dev);
>   	int (*get_vbus)(struct tcpc_dev *dev);
> 
