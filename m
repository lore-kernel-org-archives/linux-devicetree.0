Return-Path: <SRS0=yY7i=JN=gmail.com=groeck7@kernel.org>
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v8 08/14] staging: typec: tcpci: use IS_ERR() instead of
 PTR_ERR_OR_ZERO()
References: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
 <1530056732-9640-9-git-send-email-jun.li@nxp.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <45af1751-aba2-975b-ea7f-1ab984872b11@roeck-us.net>
Date: Tue, 26 Jun 2018 17:32:32 -0700
MIME-Version: 1.0
In-Reply-To: <1530056732-9640-9-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Li Jun <jun.li@nxp.com>, robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com
Cc: a.hajda@samsung.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On 06/26/2018 04:45 PM, Li Jun wrote:
> As tcpm_register_port() and tcpci_register_port() never return
> NULL and NULL is not a success in this case, use IS_ERR() to check
> the return value of both.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/staging/typec/tcpci.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
> index 076498a..b63f147 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -509,7 +509,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
>   		return ERR_PTR(err);
>   
>   	tcpci->port = tcpm_register_port(tcpci->dev, &tcpci->tcpc);
> -	if (PTR_ERR_OR_ZERO(tcpci->port))
> +	if (IS_ERR(tcpci->port))
>   		return ERR_CAST(tcpci->port);
>   
>   	return tcpci;
> @@ -551,7 +551,7 @@ static int tcpci_probe(struct i2c_client *client,
>   		return err;
>   
>   	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
> -	if (PTR_ERR_OR_ZERO(chip->tcpci))
> +	if (IS_ERR(chip->tcpci))
>   		return PTR_ERR(chip->tcpci);
>   
>   	i2c_set_clientdata(client, chip);
> 
