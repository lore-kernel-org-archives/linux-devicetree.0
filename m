Return-Path: <SRS0=3bjE=I5=linux.intel.com=heikki.krogerus@kernel.org>
Date: Mon, 11 Jun 2018 15:33:35 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v6 07/15] staging: typec: tcpci: remove unused
 tcpci_tcpc_config
Message-ID: <20180611123335.GM17155@kuha.fi.intel.com>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
 <1527475967-15201-8-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527475967-15201-8-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, linux@roeck-us.net, cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Mon, May 28, 2018 at 10:52:39AM +0800, Li Jun wrote:
> Since we will use config settings via device properties, so
> remove the hard code tcpci_tcpc_config.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/staging/typec/tcpci.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
> index e59547a..076498a 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -464,17 +464,10 @@ static const struct regmap_config tcpci_regmap_config = {
>  	.max_register = 0x7F, /* 0x80 .. 0xFF are vendor defined */
>  };
>  
> -static const struct tcpc_config tcpci_tcpc_config = {
> -	.type = TYPEC_PORT_DFP,
> -	.default_role = TYPEC_SINK,
> -};
> -
>  static int tcpci_parse_config(struct tcpci *tcpci)
>  {
>  	tcpci->controls_vbus = true; /* XXX */
>  
> -	/* TODO: Populate struct tcpc_config from ACPI/device-tree */
> -	tcpci->tcpc.config = &tcpci_tcpc_config;
>  	tcpci->tcpc.fwnode = device_get_named_child_node(tcpci->dev,
>  							 "connector");
>  	if (!tcpci->tcpc.fwnode) {
> -- 
> 2.7.4

-- 
heikki
