From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 06/12] staging: typec: tcpci: enable vbus detection
Date: Tue, 26 Sep 2017 06:37:04 -0700
Message-ID: <6cbb9cb2-206d-64e3-9e91-77edce855fdd@roeck-us.net>
References: <1506386727-16370-1-git-send-email-jun.li@nxp.com>
 <1506386727-16370-7-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506386727-16370-7-git-send-email-jun.li-3arQi8VN3Tc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org, peter.chen-3arQi8VN3Tc@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/25/2017 05:45 PM, Li Jun wrote:
> TCPCI implementation may need SW to enable VBUS detection to generate
> power status events.
> 
> Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
> ---
>   drivers/staging/typec/tcpci.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
> index 6d608b4..851d026 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -313,6 +313,26 @@ static int tcpci_pd_transmit(struct tcpc_dev *tcpc,
>   	return 0;
>   }
>   
> +static int tcpci_vbus_detect(struct tcpc_dev *tcpc, bool enable)
> +{
> +	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> +	int ret;
> +
> +	if (enable) {
> +		ret = regmap_write(tcpci->regmap, TCPC_COMMAND,
> +				   TCPC_CMD_ENABLE_VBUS_DETECT);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		ret = regmap_write(tcpci->regmap, TCPC_COMMAND,
> +				   TCPC_CMD_DISABLE_VBUS_DETECT);
> +		if (ret < 0)
> +			return ret;
> +	}

This could be simplified to something like

         u8 cmd = enabled ? TCPC_CMD_ENABLE_VBUS_DETECT : TCPC_CMD_DISABLE_VBUS_DETECT;

	return regmap_write(tcpci->regmap, TCPC_COMMAND, cmd);

though the question is why not just add a function named tcpci_vbus_detect_enable()
since it is never disabled, at least not in this patch.

> +
> +	return 0;
> +}
> +
>   static int tcpci_init(struct tcpc_dev *tcpc)
>   {
>   	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> @@ -344,6 +364,9 @@ static int tcpci_init(struct tcpc_dev *tcpc)
>   	if (ret < 0)
>   		return ret;
>   
> +	/* Enable Vbus detection */
> +	tcpci_vbus_detect(tcpc, true);
> +
>   	reg = TCPC_ALERT_TX_SUCCESS | TCPC_ALERT_TX_FAILED |
>   		TCPC_ALERT_TX_DISCARDED | TCPC_ALERT_RX_STATUS |
>   		TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_CC_STATUS;
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
