From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [RFC PATCH 2/3] mailbox: Hisilicon: add mailbox driver
Date: Tue, 04 Aug 2015 10:30:24 +0200
Message-ID: <1438677024.8734.24.camel@tiscali.nl>
References: <1438564390-28111-1-git-send-email-leo.yan@linaro.org>
	 <1438564390-28111-3-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438564390-28111-3-git-send-email-leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jian Zhang <zhangjian001-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Zhenwei Wang <Zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Haoju Mo <mohaoju-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Dan Zhao <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, kongfei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Guangyue Zeng <zengguangyue-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

(This RFC was part of this mornings catch of my crude mail filter. So,
for what it's worth, what follows are a few random comments for the few
things I'm able to spot.)

On ma, 2015-08-03 at 09:13 +0800, Leo Yan wrote:
> --- /dev/null
> +++ b/drivers/mailbox/hisilicon/Kconfig

> +config HISI_MBOX
> +	bool "Hisilicon's Mailbox"
> +	depends on ARCH_HISI || OF

ARCH_HISI is available on either ARM64 or ARM. ARM64 selects OF. On ARM
ARCH_HISI depends on ARCH_MULTIV7 which depends on ARCH_MULTIPLATFORM.
That selects USE_OF which on its turn selects OF.

So, HISI_MBOX implies OF, correct?

> +	help
> +	  Support for mailbox drivers on Hisilicon series of SoCs.
> +
> +config HI6220_MBOX
> +	tristate "Hi6220 Mailbox Controller"
> +	depends on HISI_MBOX
> +	help
> +	  An implementation of the hi6220 mailbox. It is used to send message
> +	  between application processors and MCU. Say Y here if you want to build
> +	  the Hi6220 mailbox controller driver.

> --- /dev/null
> +++ b/drivers/mailbox/hisilicon/common.c

> +int hisi_mbox_register(struct hisi_mbox_hw *mbox_hw)
> +{
> +	[...]
> +
> +	mbox->chan = devm_kzalloc(dev,
> +		mbox_hw->chan_num * sizeof(struct mbox_chan), GFP_KERNEL);
> +	if (!mbox)

	if (!mbox->chan)

> +		return -ENOMEM;
> +
> +	[...]
> +}

> --- /dev/null
> +++ b/drivers/mailbox/hisilicon/hi6220-mailbox.c

> +static struct platform_driver hi6220_mbox_driver = {
> +	.driver = {
> +		[...]
> +		.of_match_table = of_match_ptr(hi6220_mbox_of_match),

of_match_ptr(x) becomes NULL when CONFIG_OF is not defined. But I think
CONFIG_OF will always be defined, see above. So of_match_ptr() isn't per
se needed.

> +	},
> +	[...]
> +};

> +static int __init hi6220_mbox_init(void)
> +{
> +	return platform_driver_register(&hi6220_mbox_driver);
> +}
> +module_init(hi6220_mbox_init);
> +
> +static void __exit hi6220_mbox_exit(void)
> +{
> +	platform_driver_unregister(&hi6220_mbox_driver);
> +}
> +module_exit(hi6220_mbox_exit);

This could be flattened into one line:
    module_platform_driver(hi6220_mbox_driver);

Thanks,


Paul Bolle
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
