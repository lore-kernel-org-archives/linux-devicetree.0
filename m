Return-Path: <SRS0=yY7i=JN=gmail.com=groeck7@kernel.org>
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v8 09/14] staging: typec: tcpci: register port before
 request irq
References: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
 <1530056732-9640-10-git-send-email-jun.li@nxp.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <e9102994-836a-f146-4355-5217f7a8a0e3@roeck-us.net>
Date: Tue, 26 Jun 2018 17:33:25 -0700
MIME-Version: 1.0
In-Reply-To: <1530056732-9640-10-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Li Jun <jun.li@nxp.com>, robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com
Cc: a.hajda@samsung.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On 06/26/2018 04:45 PM, Li Jun wrote:
> From: Peter Chen <peter.chen@nxp.com>
> 
> With that we can clear any pending events and the port is registered
> so driver can be ready to handle typec events once we request irq.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/staging/typec/tcpci.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
> index b63f147..3b35fce 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -537,24 +537,27 @@ static int tcpci_probe(struct i2c_client *client,
>   	if (IS_ERR(chip->data.regmap))
>   		return PTR_ERR(chip->data.regmap);
>   
> +	i2c_set_clientdata(client, chip);
> +
>   	/* Disable chip interrupts before requesting irq */
>   	err = regmap_raw_write(chip->data.regmap, TCPC_ALERT_MASK, &val,
>   			       sizeof(u16));
>   	if (err < 0)
>   		return err;
>   
> +	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
> +	if (IS_ERR(chip->tcpci))
> +		return PTR_ERR(chip->tcpci);
> +
>   	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
>   					_tcpci_irq,
>   					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
>   					dev_name(&client->dev), chip);
> -	if (err < 0)
> +	if (err < 0) {
> +		tcpci_unregister_port(chip->tcpci);
>   		return err;
> +	}
>   
> -	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
> -	if (IS_ERR(chip->tcpci))
> -		return PTR_ERR(chip->tcpci);
> -
> -	i2c_set_clientdata(client, chip);
>   	return 0;
>   }
>   
> 
