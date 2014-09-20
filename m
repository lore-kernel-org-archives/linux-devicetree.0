From: Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] bcma: register bcma as device tree driver
Date: Sat, 20 Sep 2014 21:10:08 +0530
Message-ID: <541D9FD8.4000404@gmail.com>
References: <1411218125-32670-1-git-send-email-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411218125-32670-1-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Saturday 20 September 2014 06:32 PM, Hauke Mehrtens wrote:
> This driver is used by the bcm53xx ARM SoC code. Now it is possible to
> give the address of the chipcommon core in device tree and bcma will
> search for all the other cores.

(...)

> +
> +static const struct of_device_id bcma_host_soc_of_match[] = {
> +	{ .compatible = "brcm,bus-axi", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, bcma_host_soc_of_match);
> +
> +static struct platform_driver bcma_host_soc_driver = {
> +	.driver = {
> +		.name = "bcma-host-soc",
> +		.owner = THIS_MODULE,

This field updated automatically...

> +		.of_match_table = bcma_host_soc_of_match,
> +	},
> +	.probe		= bcma_host_soc_probe,
> +	.remove		= bcma_host_soc_remove,
> +};
> +
> +int __init bcma_host_soc_register_driver(void)
> +{
> +	return platform_driver_register(&bcma_host_soc_driver);
> +}
> +
> +void __exit bcma_host_soc_unregister_driver(void)
> +{
> +	platform_driver_unregister(&bcma_host_soc_driver);
> +}
> +#endif /* CONFIG_OF */

Why dont you use module_platform_driver(...)...?

-- 
Regards,
Varka Bhadram.

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
