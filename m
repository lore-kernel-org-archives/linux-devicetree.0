From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [linux-nfc] [PATCH v2 5/9] NFC: nfcmrvl: add i2c driver
Date: Wed, 21 Oct 2015 08:00:47 +0200
Message-ID: <20151021060047.GH11271@zurbaran.home>
References: <1443443594-14353-1-git-send-email-cuissard@marvell.com>
 <1443443594-14353-6-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443443594-14353-6-git-send-email-cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Vincent,

On Mon, Sep 28, 2015 at 02:33:10PM +0200, Vincent Cuissard wrote:
> +#ifdef CONFIG_OF
Technically you don't need that as all of_* APIs are safe if CONFIG_OF_*
are not defined.


> +static int nfcmrvl_i2c_parse_dt(struct device_node *node,
> +				struct nfcmrvl_platform_data *pdata)
> +{
> +	int ret;
> +
> +	ret = nfcmrvl_parse_dt(node, pdata);
> +	if (ret < 0) {
> +		pr_err("Failed to get generic entries\n");
> +		return ret;
> +	}
> +
> +	if (of_find_property(node, "i2c-int-falling", NULL))
> +		pdata->irq_polarity = IRQF_TRIGGER_FALLING;
> +	else
> +		pdata->irq_polarity = IRQF_TRIGGER_RISING;
> +
> +	ret = irq_of_parse_and_map(node, 0);
> +	if (ret < 0) {
> +		pr_err("Unable to get irq, error: %d\n", ret);
> +		return ret;
> +	}
> +	pdata->irq = ret;
> +
> +	return 0;
> +}
> +
> +#else
> +
> +static int nfcmrvl_i2c_parse_dt(struct device_node *node,
> +				struct nfcmrvl_platform_data *pdata)
> +{
> +	return -ENODEV;
> +}
> +
> +#endif


> diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
> index bd8db3d..1104fa3 100644
> --- a/drivers/nfc/nfcmrvl/main.c
> +++ b/drivers/nfc/nfcmrvl/main.c
> @@ -33,6 +33,9 @@ static int nfcmrvl_nci_open(struct nci_dev *ndev)
>  	if (test_and_set_bit(NFCMRVL_NCI_RUNNING, &priv->flags))
>  		return 0;
>  
> +	/* Reset possible fault of previous session */
> +	clear_bit(NFCMRVL_PHY_ERROR, &priv->flags);
> +
How is that related to this i2c driver ?

>  	err = priv->if_ops->nci_open(priv);
>  
>  	if (err)
> @@ -221,10 +224,8 @@ EXPORT_SYMBOL_GPL(nfcmrvl_nci_recv_frame);
>  
>  void nfcmrvl_chip_reset(struct nfcmrvl_private *priv)
>  {
> -	/*
> -	 * This function does not take care if someone is using the device.
> -	 * To be improved.
> -	 */
> +	/* Reset possible fault of previous session */
> +	clear_bit(NFCMRVL_PHY_ERROR, &priv->flags);
Ditto.

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
