Return-Path: <SRS0=3bjE=I5=linux.intel.com=heikki.krogerus@kernel.org>
Date: Mon, 11 Jun 2018 15:34:44 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v6 08/15] staging: typec: tcpci: use IS_ERR() instead of
 PTR_ERR_OR_ZERO()
Message-ID: <20180611123444.GN17155@kuha.fi.intel.com>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
 <1527475967-15201-9-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527475967-15201-9-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, linux@roeck-us.net, cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Mon, May 28, 2018 at 10:52:40AM +0800, Li Jun wrote:
> As tcpm_register_port() and tcpci_register_port() never return
> NULL and NULL is not a success in this case, use IS_ERR() to check
> the return value of both.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/staging/typec/tcpci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
> index 076498a..b63f147 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -509,7 +509,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
>  		return ERR_PTR(err);
>  
>  	tcpci->port = tcpm_register_port(tcpci->dev, &tcpci->tcpc);
> -	if (PTR_ERR_OR_ZERO(tcpci->port))
> +	if (IS_ERR(tcpci->port))
>  		return ERR_CAST(tcpci->port);
>  
>  	return tcpci;
> @@ -551,7 +551,7 @@ static int tcpci_probe(struct i2c_client *client,
>  		return err;
>  
>  	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
> -	if (PTR_ERR_OR_ZERO(chip->tcpci))
> +	if (IS_ERR(chip->tcpci))
>  		return PTR_ERR(chip->tcpci);
>  
>  	i2c_set_clientdata(client, chip);

Thanks,

-- 
heikki
