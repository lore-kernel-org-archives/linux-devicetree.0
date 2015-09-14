From: chenfeng <puck.chen@hisilicon.com>
Subject: Re: [PATCH V2 3/3] reset: hi6220: Reset driver for hisilicon hi6220
 SoC
Date: Mon, 14 Sep 2015 10:02:00 +0800
Message-ID: <55F62A98.7000205@hisilicon.com>
References: <1441959518-178696-1-git-send-email-puck.chen@hisilicon.com>
 <1441959518-178696-3-git-send-email-puck.chen@hisilicon.com>
 <2464506.5Jp1Wg3qfc@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2464506.5Jp1Wg3qfc@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@foxmail.com, xuyiping@hisilicon.com, bintian.wang@huawei.com, devicetree@vger.kernel.org, dan.zhao@hisilicon.com, suzhuangluan@hisilicon.com, w.f@huawei.com
List-Id: devicetree@vger.kernel.org



On 2015/9/11 16:41, Arnd Bergmann wrote:
> On Friday 11 September 2015 16:18:38 Chen Feng wrote:
>> +static int __init hi6220_reset_init(void)
>> +{
>> +	int ret;
>> +	struct device_node *np;
>> +	struct hi6220_reset_data *data;
>> +
>> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	np = of_find_compatible_node(NULL, NULL, "hisilicon,hi6220_reset_ctl");
>> +	if (!np) {
>> +		ret = -ENXIO;
>> +		goto err_alloc;
>> +	}
> 
> Why is this not a platform driver?
> 
OK,I will change this to a platform driver.

>> +	if (IS_ENABLED(CONFIG_RESET_CONTROLLER))
>> +		reset_controller_register(&data->rc_dev);
>> +
>> +	return 0;
> 
> The Kconfig symbol already depends on RESET_CONTROLLER, so
> the IS_ENABLED() check looks redundant.
> 
Yes,agree with you.
> 	Arnd
> 
> .
> 
