Return-Path: <SRS0=3bjE=I5=linux.intel.com=heikki.krogerus@kernel.org>
Date: Mon, 11 Jun 2018 16:14:33 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v6 13/15] staging: typec: tcpci: keep the disconnected cc
 line open
Message-ID: <20180611131433.GQ17155@kuha.fi.intel.com>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
 <1527475967-15201-14-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527475967-15201-14-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, linux@roeck-us.net, cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Mon, May 28, 2018 at 10:52:45AM +0800, Li Jun wrote:
> While set polarity, we should keep the disconnected cc line to be
> open.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/staging/typec/tcpci.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
> index 4d3b0ae..11c2d37 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -185,15 +185,25 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
>  			      enum typec_cc_polarity polarity)
>  {
>  	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> +	unsigned int reg;
>  	int ret;
>  
> -	ret = regmap_write(tcpci->regmap, TCPC_TCPC_CTRL,
> -			   (polarity == TYPEC_POLARITY_CC2) ?
> -			   TCPC_TCPC_CTRL_ORIENTATION : 0);
> +	/* Keep the disconnect cc line open */
> +	ret = regmap_read(tcpci->regmap, TCPC_ROLE_CTRL, &reg);
>  	if (ret < 0)
>  		return ret;
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
>  }
>  
>  static int tcpci_set_vconn(struct tcpc_dev *tcpc, bool enable)

Thanks,

-- 
heikki
