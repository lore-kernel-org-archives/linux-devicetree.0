Return-Path: <SRS0=yY7i=JN=gmail.com=groeck7@kernel.org>
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v8 07/14] staging: typec: tcpci: remove unused
 tcpci_tcpc_config
References: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
 <1530056732-9640-8-git-send-email-jun.li@nxp.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <0447bae6-cb16-ecb4-5c01-a4a46b161b66@roeck-us.net>
Date: Tue, 26 Jun 2018 17:31:17 -0700
MIME-Version: 1.0
In-Reply-To: <1530056732-9640-8-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Li Jun <jun.li@nxp.com>, robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com
Cc: a.hajda@samsung.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On 06/26/2018 04:45 PM, Li Jun wrote:
> Since we will use config settings via device properties, so
> remove the hard code tcpci_tcpc_config.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/staging/typec/tcpci.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
> index e59547a..076498a 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -464,17 +464,10 @@ static const struct regmap_config tcpci_regmap_config = {
>   	.max_register = 0x7F, /* 0x80 .. 0xFF are vendor defined */
>   };
>   
> -static const struct tcpc_config tcpci_tcpc_config = {
> -	.type = TYPEC_PORT_DFP,
> -	.default_role = TYPEC_SINK,
> -};
> -
>   static int tcpci_parse_config(struct tcpci *tcpci)
>   {
>   	tcpci->controls_vbus = true; /* XXX */
>   
> -	/* TODO: Populate struct tcpc_config from ACPI/device-tree */
> -	tcpci->tcpc.config = &tcpci_tcpc_config;
>   	tcpci->tcpc.fwnode = device_get_named_child_node(tcpci->dev,
>   							 "connector");
>   	if (!tcpci->tcpc.fwnode) {
> 
