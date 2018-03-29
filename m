From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v4 07/13] staging: typec: tcpci: register port before
 request irq
Date: Thu, 29 Mar 2018 13:52:12 +0300
Message-ID: <20180329105212.lp5oydu4uejeo4h4@mwanda>
References: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
 <1522253178-32414-8-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1522253178-32414-8-git-send-email-jun.li@nxp.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Li Jun <jun.li@nxp.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, heikki.krogerus@linux.intel.com, peter.chen@nxp.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, a.hajda@samsung.com, robh+dt@kernel.org, linux-imx@nxp.com, linux@roeck-us.net, shufan_lee@richtek.com
List-Id: devicetree@vger.kernel.org

On Thu, Mar 29, 2018 at 12:06:12AM +0800, Li Jun wrote:
> With that we can clear any pending events and the port is registered
> so driver can be ready to handle typec events once we request irq.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>

These sign offs aren't clear.

Sign offs mean that you handled the patch but didn't include any of
SCO's copyrighted UNIX code into it.  Normally they're in the order of
who touched the code.  So Peter touched the code first.  Should he get
authorship credit?  How did he touch the code first if he didn't write
the code?  It doesn't make sense.

> ---
>  drivers/staging/typec/tcpci.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
> index 4f7ad10..9e0014b 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -537,25 +537,26 @@ static int tcpci_probe(struct i2c_client *client,
>  	if (IS_ERR(chip->data.regmap))
>  		return PTR_ERR(chip->data.regmap);
>  
> +	i2c_set_clientdata(client, chip);
> +
>  	/* Disable chip interrupts before requesting irq */
>  	err = regmap_raw_write(chip->data.regmap, TCPC_ALERT_MASK, &val,
>  			       sizeof(u16));
>  	if (err < 0)
>  		return err;
>  
> +	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
> +	if (PTR_ERR_OR_ZERO(chip->tcpci))
> +		return PTR_ERR(chip->tcpci);

When a function returns both error pointers and NULL that means that
NULL is a secial case of success.  Like for example:

	p->my_feature = get_optional_feature();

If it returns NULL that means the optional feature isn't there, but it's
fine because it's optional.  But if it returns an error pointer that
means the feature is there but the hardware is buggy or something so
we shouldn't continue.

If you return PTR_ERR(NULL) that means success.

I don't think this code makes sense just from looking at it and also
when I checked tcpci_register_port() doesn't return NULL.



> +
>  	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
>  					_tcpci_irq,
>  					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
>  					dev_name(&client->dev), chip);
>  	if (err < 0)
> -		return err;
> +		tcpci_unregister_port(chip->tcpci);

Can you put the "return err;" back, because that's better style.  It's
better to keep the error path and success path separate if you can.

	if (err < 0) {
		tcpci_unregister_port(chip->tcpci);
		return err;
	}

	return 0;


regards,
dan carpenter
