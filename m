Return-Path: <SRS0=3bjE=I5=linux.intel.com=heikki.krogerus@kernel.org>
Date: Mon, 11 Jun 2018 16:15:09 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v6 14/15] staging: typec: tcpci: Only touch target bit
 when enable vconn
Message-ID: <20180611131509.GR17155@kuha.fi.intel.com>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
 <1527475967-15201-15-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527475967-15201-15-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, linux@roeck-us.net, cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Mon, May 28, 2018 at 10:52:46AM +0800, Li Jun wrote:
> We need regmap_update_bits to avoid touch any other bits when
> enable or disable vconn.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/staging/typec/tcpci.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
> index 11c2d37..ac6b418 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -218,12 +218,9 @@ static int tcpci_set_vconn(struct tcpc_dev *tcpc, bool enable)
>  			return ret;
>  	}
>  
> -	ret = regmap_write(tcpci->regmap, TCPC_POWER_CTRL,
> -			   enable ? TCPC_POWER_CTRL_VCONN_ENABLE : 0);
> -	if (ret < 0)
> -		return ret;
> -
> -	return 0;
> +	return regmap_update_bits(tcpci->regmap, TCPC_POWER_CTRL,
> +				TCPC_POWER_CTRL_VCONN_ENABLE,
> +				enable ? TCPC_POWER_CTRL_VCONN_ENABLE : 0);
>  }
>  
>  static int tcpci_set_roles(struct tcpc_dev *tcpc, bool attached,

Thanks,

-- 
heikki
