From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 3/3] mwifiex: parse host wakeup configuration from device tree
Date: Mon, 08 Feb 2016 13:12:31 +0100
Message-ID: <2675319.xbIeWCdnho@wuerfel>
References: <1454926528-17480-1-git-send-email-akarwar@marvell.com> <1454926528-17480-3-git-send-email-akarwar@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454926528-17480-3-git-send-email-akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 08 February 2016 02:15:28 Amitkumar Karwar wrote:
> @@ -30,6 +84,44 @@ static int mwifiex_plt_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_PM_SLEEP
> +static int mwifiex_plt_suspend(struct device *dev)
> +{
> +	struct mwifiex_wake_dev *ctx = dev_get_drvdata(dev);
> +	int ret;
> +
...
> +static const struct dev_pm_ops mwifiex_plt_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(mwifiex_plt_suspend, mwifiex_plt_resume)
> +};
> +#endif /* CONFIG_PM_SLEEP */
> +
>  static const struct of_device_id mwifiex_dt_match[] = {
>  	{
>  		.compatible = "marvell,mwifiex",
> @@ -45,6 +137,9 @@ static struct platform_driver mwifiex_platform_driver = {
>  	.driver = {
>  		.name	= "mwifiex_plt",
>  		.of_match_table = mwifiex_dt_match,
> +#ifdef CONFIG_PM_SLEEP
> +		.pm             = &mwifiex_plt_pm_ops,
> +#endif
>  	}
>  };

Just remove the #ifdef here, and mark the functions as __maybe_unused.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
