From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 3/3] reset: hi6220: Reset driver for hisilicon hi6220 SoC
Date: Fri, 11 Sep 2015 10:41:24 +0200
Message-ID: <2464506.5Jp1Wg3qfc@wuerfel>
References: <1441959518-178696-1-git-send-email-puck.chen@hisilicon.com> <1441959518-178696-3-git-send-email-puck.chen@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441959518-178696-3-git-send-email-puck.chen@hisilicon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen Feng <puck.chen@hisilicon.com>
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@foxmail.com, xuyiping@hisilicon.com, bintian.wang@huawei.com, devicetree@vger.kernel.org, dan.zhao@hisilicon.com, suzhuangluan@hisilicon.com, w.f@huawei.com
List-Id: devicetree@vger.kernel.org

On Friday 11 September 2015 16:18:38 Chen Feng wrote:
> +static int __init hi6220_reset_init(void)
> +{
> +	int ret;
> +	struct device_node *np;
> +	struct hi6220_reset_data *data;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	np = of_find_compatible_node(NULL, NULL, "hisilicon,hi6220_reset_ctl");
> +	if (!np) {
> +		ret = -ENXIO;
> +		goto err_alloc;
> +	}

Why is this not a platform driver?

> +	if (IS_ENABLED(CONFIG_RESET_CONTROLLER))
> +		reset_controller_register(&data->rc_dev);
> +
> +	return 0;

The Kconfig symbol already depends on RESET_CONTROLLER, so
the IS_ENABLED() check looks redundant.

	Arnd
