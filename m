From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 07/12] typec: tcpm: add starting value for drp toggling
Date: Tue, 26 Sep 2017 06:42:48 -0700
Message-ID: <ceae0f45-5d14-8e7f-3258-aa2e28fcf9bc@roeck-us.net>
References: <1506386727-16370-1-git-send-email-jun.li@nxp.com>
 <1506386727-16370-8-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506386727-16370-8-git-send-email-jun.li-3arQi8VN3Tc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org, peter.chen-3arQi8VN3Tc@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/25/2017 05:45 PM, Li Jun wrote:
> As DRP port autonomously toggles the Rp/Rd need a start value to
> begin with, so add one parameter for it in tcpm_start_drp_toggling.
> 

It does have a starting value. The patch changes the starting value to TYPEC_CC_RD
(from currently one of the RP states) when entering the SNK_UNATTACHED state.
Please provide a matching description.

> Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
> ---
>   drivers/usb/typec/tcpm.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
> index 8483d3e..38a6223 100644
> --- a/drivers/usb/typec/tcpm.c
> +++ b/drivers/usb/typec/tcpm.c
> @@ -1839,15 +1839,15 @@ static int tcpm_set_charge(struct tcpm_port *port, bool charge)
>   	return 0;
>   }
>   
> -static bool tcpm_start_drp_toggling(struct tcpm_port *port)
> +static bool tcpm_start_drp_toggling(struct tcpm_port *port,
> +				    enum typec_cc_status cc)
>   {
>   	int ret;
>   
>   	if (port->tcpc->start_drp_toggling &&
>   	    port->port_type == TYPEC_PORT_DRP) {
>   		tcpm_log_force(port, "Start DRP toggling");
> -		ret = port->tcpc->start_drp_toggling(port->tcpc,
> -						     tcpm_rp_cc(port));
> +		ret = port->tcpc->start_drp_toggling(port->tcpc, cc);
>   		if (!ret)
>   			return true;
>   	}
> @@ -2156,7 +2156,7 @@ static void run_state_machine(struct tcpm_port *port)
>   		if (!port->non_pd_role_swap)
>   			tcpm_swap_complete(port, -ENOTCONN);
>   		tcpm_src_detach(port);
> -		if (tcpm_start_drp_toggling(port)) {
> +		if (tcpm_start_drp_toggling(port, tcpm_rp_cc(port))) {
>   			tcpm_set_state(port, DRP_TOGGLING, 0);
>   			break;
>   		}
> @@ -2328,7 +2328,7 @@ static void run_state_machine(struct tcpm_port *port)
>   		if (!port->non_pd_role_swap)
>   			tcpm_swap_complete(port, -ENOTCONN);
>   		tcpm_snk_detach(port);
> -		if (tcpm_start_drp_toggling(port)) {
> +		if (tcpm_start_drp_toggling(port, TYPEC_CC_RD)) {
>   			tcpm_set_state(port, DRP_TOGGLING, 0);
>   			break;
>   		}
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
