Return-Path: <SRS0=3bjE=I5=linux.intel.com=heikki.krogerus@kernel.org>
Date: Mon, 11 Jun 2018 15:28:55 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v6 11/15] typec: tcpm: add starting value for drp toggling
Message-ID: <20180611122855.GJ17155@kuha.fi.intel.com>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
 <1527475967-15201-12-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527475967-15201-12-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, linux@roeck-us.net, cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Mon, May 28, 2018 at 10:52:43AM +0800, Li Jun wrote:
> As DRP port autonomously toggles the Rp/Rd need a start value to
> begin with, so add one parameter for it in tcpm_start_drp_toggling.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
> index aa17cd5..d885bff 100644
> --- a/drivers/usb/typec/tcpm.c
> +++ b/drivers/usb/typec/tcpm.c
> @@ -2436,15 +2436,15 @@ static int tcpm_set_charge(struct tcpm_port *port, bool charge)
>  	return 0;
>  }
>  
> -static bool tcpm_start_drp_toggling(struct tcpm_port *port)
> +static bool tcpm_start_drp_toggling(struct tcpm_port *port,
> +				    enum typec_cc_status cc)
>  {
>  	int ret;
>  
>  	if (port->tcpc->start_drp_toggling &&
>  	    port->port_type == TYPEC_PORT_DRP) {
>  		tcpm_log_force(port, "Start DRP toggling");
> -		ret = port->tcpc->start_drp_toggling(port->tcpc,
> -						     tcpm_rp_cc(port));
> +		ret = port->tcpc->start_drp_toggling(port->tcpc, cc);
>  		if (!ret)
>  			return true;
>  	}
> @@ -2752,7 +2752,7 @@ static void run_state_machine(struct tcpm_port *port)
>  		if (!port->non_pd_role_swap)
>  			tcpm_swap_complete(port, -ENOTCONN);
>  		tcpm_src_detach(port);
> -		if (tcpm_start_drp_toggling(port)) {
> +		if (tcpm_start_drp_toggling(port, tcpm_rp_cc(port))) {
>  			tcpm_set_state(port, DRP_TOGGLING, 0);
>  			break;
>  		}
> @@ -2927,7 +2927,7 @@ static void run_state_machine(struct tcpm_port *port)
>  			tcpm_swap_complete(port, -ENOTCONN);
>  		tcpm_pps_complete(port, -ENOTCONN);
>  		tcpm_snk_detach(port);
> -		if (tcpm_start_drp_toggling(port)) {
> +		if (tcpm_start_drp_toggling(port, TYPEC_CC_RD)) {
>  			tcpm_set_state(port, DRP_TOGGLING, 0);
>  			break;
>  		}
> -- 
> 2.7.4

-- 
heikki
