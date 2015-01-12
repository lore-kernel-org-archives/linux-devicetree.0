From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v6 1/2] mtd: hisilicon: add a new NAND controller driver for hisilicon hip04 Soc
Date: Mon, 12 Jan 2015 09:21:05 +0100
Message-ID: <5265608.Ut8IQVYZc5@wuerfel>
References: <1421047734-30818-1-git-send-email-wangzhou1@hisilicon.com> <1421047734-30818-2-git-send-email-wangzhou1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421047734-30818-2-git-send-email-wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, caizhiyong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, yubingxu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 12 January 2015 15:28:53 Zhou Wang wrote:
> Signed-off-by: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> ---

I haven't looked at earlier versions, but it looks very good to
me overall. Just add a patch description above please.

One tiny detail:

> +static const struct of_device_id nfc_id_table[] = {
> +	{ .compatible = "hisilicon,504-nfc" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, nfc_id_table);
> +
> +static struct platform_driver hisi_nfc_driver = {
> +	.driver = {
> +		.name  = "hisi_nand",
> +		.of_match_table = of_match_ptr(nfc_id_table),
> +		.pm = &hisi_nfc_pm_ops,
> +	},
> +	.probe		= hisi_nfc_probe,
> +	.remove		= hisi_nfc_remove,
> +};

Remove the of_match_ptr() macro here to avoid a warning when
CONFIG_OF is not set.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
