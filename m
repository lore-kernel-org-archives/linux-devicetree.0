Return-Path: <SRS0=3bjE=I5=linux.intel.com=heikki.krogerus@kernel.org>
Date: Mon, 11 Jun 2018 15:36:03 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v6 10/15] staging: typec: tcpci: enable vbus detection
Message-ID: <20180611123603.GP17155@kuha.fi.intel.com>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
 <1527475967-15201-11-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527475967-15201-11-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, linux@roeck-us.net, cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Mon, May 28, 2018 at 10:52:42AM +0800, Li Jun wrote:
> TCPCI implementation may need SW to enable VBUS detection to generate
> power status events.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Li Jun <jun.li@nxp.com>

FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/staging/typec/tcpci.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
> index 3b35fce..4d3b0ae 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -373,6 +373,12 @@ static int tcpci_init(struct tcpc_dev *tcpc)
>  	if (ret < 0)
>  		return ret;
>  
> +	/* Enable Vbus detection */
> +	ret = regmap_write(tcpci->regmap, TCPC_COMMAND,
> +			   TCPC_CMD_ENABLE_VBUS_DETECT);
> +	if (ret < 0)
> +		return ret;
> +
>  	reg = TCPC_ALERT_TX_SUCCESS | TCPC_ALERT_TX_FAILED |
>  		TCPC_ALERT_TX_DISCARDED | TCPC_ALERT_RX_STATUS |
>  		TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_CC_STATUS;

Thanks,

-- 
heikki
