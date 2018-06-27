Return-Path: <SRS0=yY7i=JN=gmail.com=groeck7@kernel.org>
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v8 12/14] staging: typec: tcpci: keep the disconnected cc
 line open
References: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
 <1530056732-9640-13-git-send-email-jun.li@nxp.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <a47fe716-ae9f-b14c-8d6a-d01264ce11f9@roeck-us.net>
Date: Tue, 26 Jun 2018 17:37:30 -0700
MIME-Version: 1.0
In-Reply-To: <1530056732-9640-13-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Li Jun <jun.li@nxp.com>, robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com
Cc: a.hajda@samsung.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On 06/26/2018 04:45 PM, Li Jun wrote:
> While set polarity, we should keep the disconnected cc line to be
> open.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/staging/typec/tcpci.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
> index 4d3b0ae..11c2d37 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -185,15 +185,25 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
>   			      enum typec_cc_polarity polarity)
>   {
>   	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> +	unsigned int reg;
>   	int ret;
>   
> -	ret = regmap_write(tcpci->regmap, TCPC_TCPC_CTRL,
> -			   (polarity == TYPEC_POLARITY_CC2) ?
> -			   TCPC_TCPC_CTRL_ORIENTATION : 0);
> +	/* Keep the disconnect cc line open */
> +	ret = regmap_read(tcpci->regmap, TCPC_ROLE_CTRL, &reg);
>   	if (ret < 0)
>   		return ret;
>   
> -	return 0;
> +	if (polarity == TYPEC_POLARITY_CC2)
> +		reg |= TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC1_SHIFT;
> +	else
> +		reg |= TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC2_SHIFT;
> +	ret = regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	return regmap_write(tcpci->regmap, TCPC_TCPC_CTRL,
> +			   (polarity == TYPEC_POLARITY_CC2) ?
> +			   TCPC_TCPC_CTRL_ORIENTATION : 0);
>   }
>   
>   static int tcpci_set_vconn(struct tcpc_dev *tcpc, bool enable)
> 
