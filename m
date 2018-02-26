Return-Path: <SRS0=dGFV=FU=linux.intel.com=heikki.krogerus@kernel.org>
Date: Mon, 26 Feb 2018 16:06:04 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2 03/12] staging: typec: tcpci: support port config
 passed via dt
Message-ID: <20180226140604.GD25535@kuha.fi.intel.com>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
 <1519645759-12701-4-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519645759-12701-4-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, linux@roeck-us.net, a.hajda@samsung.com, mark.rutland@arm.com, yueyao@google.com, peter.chen@nxp.com, garsilva@embeddedor.com, o_leveque@orange.fr, shufan_lee@richtek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Hi,

On Mon, Feb 26, 2018 at 07:49:10PM +0800, Li Jun wrote:
> User can define the typec port properties in tcpci node to setup
> the port config.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
> Changes for v2:
> - Use infra APIs to get sink and source config.
> - Improve the error message.
> 
>  drivers/staging/typec/tcpci.c | 70 ++++++++++++++++++++++++++++++++++++++-----
>  include/linux/usb/tcpm.h      |  6 ++--
>  2 files changed, 66 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
> index b6abaf7..be6ed16 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -426,17 +426,73 @@ static const struct regmap_config tcpci_regmap_config = {
>  	.max_register = 0x7F, /* 0x80 .. 0xFF are vendor defined */
>  };
>  
> -static const struct tcpc_config tcpci_tcpc_config = {
> -	.type = TYPEC_PORT_DFP,
> -	.default_role = TYPEC_SINK,
> -};
> -
> +/* Populate struct tcpc_config from device-tree */
>  static int tcpci_parse_config(struct tcpci *tcpci)
>  {
> +	struct tcpc_config *tcfg;
> +	struct device_node *child;
> +	int ret = -EINVAL;
> +
>  	tcpci->controls_vbus = true; /* XXX */
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
> +	child = of_get_child_by_name(tcpci->dev->of_node, "connector");
> +	if (!child) {
> +		dev_err(tcpci->dev, "failed to get connector node.\n");
> +		return -EINVAL;
> +	}

Why do you need separate child node for the connector? You will always
have only one connector per tcpc, i.e. the tcpci already represents the
connector and all its capabilities.


Thanks,

-- 
heikki
