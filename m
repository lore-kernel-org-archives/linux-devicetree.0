From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 04/12] staging: typec: tcpci: support port config passed
 via dt
Date: Tue, 26 Sep 2017 06:32:56 -0700
Message-ID: <bb854ecf-fad7-2c2a-1972-5c4cabb970f2@roeck-us.net>
References: <1506386727-16370-1-git-send-email-jun.li@nxp.com>
 <1506386727-16370-5-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506386727-16370-5-git-send-email-jun.li-3arQi8VN3Tc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org, peter.chen-3arQi8VN3Tc@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/25/2017 05:45 PM, Li Jun wrote:
> User can define the typec port properties in tcpci node to setup
> the port config.
> 
> Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
> ---
>   drivers/staging/typec/tcpci.c | 89 +++++++++++++++++++++++++++++++++++++++----
>   include/linux/usb/tcpm.h      |  6 +--
>   2 files changed, 85 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
> index 4636804..0119453 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -425,17 +425,92 @@ static const struct regmap_config tcpci_regmap_config = {
>   	.max_register = 0x7F, /* 0x80 .. 0xFF are vendor defined */
>   };
>   
> -static const struct tcpc_config tcpci_tcpc_config = {
> -	.type = TYPEC_PORT_DFP,
> -	.default_role = TYPEC_SINK,
> -};
> -
> +/* Populate struct tcpc_config from device-tree */
>   static int tcpci_parse_config(struct tcpci *tcpci)
>   {
> +	struct tcpc_config *tcfg;
> +	int ret = -EINVAL;
> +
>   	tcpci->controls_vbus = true; /* XXX */
>   
> -	/* TODO: Populate struct tcpc_config from ACPI/device-tree */
> -	tcpci->tcpc.config = &tcpci_tcpc_config;
> +	tcpci->tcpc.config = devm_kzalloc(tcpci->dev, sizeof(*tcfg),
> +					  GFP_KERNEL);
> +	if (!tcpci->tcpc.config)
> +		return -ENOMEM;
> +
> +	tcfg = tcpci->tcpc.config;
> +
> +	/* Get port-type */
> +	ret = typec_get_port_type(tcpci->dev);
> +	if (ret < 0) {
> +		dev_err(tcpci->dev, "typec port type is NOT correct!\n");

Are all those exclamation marks necessary ?

> +		return ret;
> +	}
> +	tcfg->type = ret;
> +
> +	if (tcfg->type == TYPEC_PORT_UFP)
> +		goto sink;
> +
> +	/* Get source PDO */
> +	tcfg->nr_src_pdo = device_property_read_u32_array(tcpci->dev,
> +						"src-pdos", NULL, 0);

I personally prefer continuation line alignment to '(', but that is up to Greg to decide.

> +	if (tcfg->nr_src_pdo <= 0) {
> +		dev_err(tcpci->dev, "typec source pdo is missing!\n");
> +		return -EINVAL;
> +	}
> +
> +	tcfg->src_pdo = devm_kzalloc(tcpci->dev,
> +		sizeof(*tcfg->src_pdo) * tcfg->nr_src_pdo, GFP_KERNEL);

devm_kcalloc

> +	if (!tcfg->src_pdo)
> +		return -ENOMEM;
> +
> +	ret = device_property_read_u32_array(tcpci->dev, "src-pdos",
> +				tcfg->src_pdo, tcfg->nr_src_pdo);
> +	if (ret) {
> +		dev_err(tcpci->dev, "Failed to read src pdo!\n");
> +		return -EINVAL;
> +	}
> +
> +	if (tcfg->type == TYPEC_PORT_DFP)
> +		return 0;
> +
> +	/* Get the preferred power role for drp */
> +	ret = typec_get_power_role(tcpci->dev);

Maybe this should be named typec_get_preferred_role(). The generic function
names are a bit misleading; they suggest they would return the current role,
and don't indicate that the data is from device properties.
I am also not sure about the mix of using typec infra functions and
direct device_property calls.

> +	if (ret < 0) {
> +		dev_err(tcpci->dev, "typec preferred role is wrong!\n");

Wrong or missing ?

> +		return ret;
> +	}
> +	tcfg->default_role = ret;
> +sink:
> +	/* Get sink power capability */
> +	tcfg->nr_snk_pdo = device_property_read_u32_array(tcpci->dev,
> +						"snk-pdos", NULL, 0);
> +	if (tcfg->nr_snk_pdo <= 0) {
> +		dev_err(tcpci->dev, "typec sink pdo is missing!\n");
> +		return -EINVAL;
> +	}
> +
> +	tcfg->snk_pdo = devm_kzalloc(tcpci->dev,
> +		sizeof(*tcfg->snk_pdo) * tcfg->nr_snk_pdo, GFP_KERNEL);
> +	if (!tcfg->snk_pdo)
> +		return -ENOMEM;
> +
> +	ret = device_property_read_u32_array(tcpci->dev, "snk-pdos",
> +				tcfg->snk_pdo, tcfg->nr_snk_pdo);
> +	if (ret) {
> +		dev_err(tcpci->dev, "Failed to read sink pdo!\n");

There is a mix of "Failed to read" and "missing" messages. What is the difference ?

> +		return -EINVAL;
> +	}
> +
> +	if (device_property_read_u32(tcpci->dev, "max-snk-mv",
> +				     &tcfg->max_snk_mv) ||
> +		device_property_read_u32(tcpci->dev, "max-snk-ma",
> +					 &tcfg->max_snk_ma) ||
> +		device_property_read_u32(tcpci->dev, "op-snk-mw",
> +					 &tcfg->operating_snk_mw)) {
> +		dev_err(tcpci->dev, "Failed to read sink capability!\n");
> +		return -EINVAL;
> +	}
>   
>   	return 0;
>   }
> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
> index 073197f..a67cf77 100644
> --- a/include/linux/usb/tcpm.h
> +++ b/include/linux/usb/tcpm.h
> @@ -76,10 +76,10 @@ enum tcpm_transmit_type {
>    * @alt_modes:	List of supported alternate modes
>    */
>   struct tcpc_config {
> -	const u32 *src_pdo;
> +	u32 *src_pdo;
>   	unsigned int nr_src_pdo;
>   
> -	const u32 *snk_pdo;
> +	u32 *snk_pdo;
>   	unsigned int nr_snk_pdo;
>   
>   	const u32 *snk_vdo;
> @@ -154,7 +154,7 @@ struct tcpc_mux_dev {
>    * @mux:	Pointer to multiplexer data
>    */
>   struct tcpc_dev {
> -	const struct tcpc_config *config;
> +	struct tcpc_config *config;
>   
>   	int (*init)(struct tcpc_dev *dev);
>   	int (*get_vbus)(struct tcpc_dev *dev);
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
