From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v3 10/12] hikey960: Support usb functionality of Hikey960
Date: Mon, 4 Mar 2019 09:55:37 +0800
Message-ID: <2708b188-d318-6758-a5fd-8573559b2e70@huawei.com>
References: <20190302090505.65542-1-chenyu56@huawei.com>
 <20190302090505.65542-11-chenyu56@huawei.com>
 <1551664069.2210.64.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551664069.2210.64.camel@mhfsdcap03>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: liuyu712@hisilicon.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Binghui Wang <wangbinghui@hisilicon.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Hi Chunfeng Yun,

On 2019/3/4 9:47, Chunfeng Yun wrote:

>> +
>> +	hisi_hikey_usb->role_sw = usb_role_switch_get(dev);
>> +	if (!hisi_hikey_usb->role_sw)
>> +		return -EPROBE_DEFER;
> Here return EPROBE_DEFFER means the related device_connection is
> registered after this probe is called, right?
> if not, use IS_ERR_OR_NULL then return PTR_ERR is enough
Yes, the driver which register the usb_role_switch may finish probe after
this driver is probed for the first time.
>> +	else if (IS_ERR(hisi_hikey_usb->role_sw))
>> +		return PTR_ERR(hisi_hikey_usb->role_sw);
>> +
>> +	ret = usb_role_switch_register_notifier(hisi_hikey_usb->role_sw,
>> +			&hisi_hikey_usb->nb);
>> +	if (ret) {
>> +		usb_role_switch_put(hisi_hikey_usb->role_sw);
>> +		return ret;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, hisi_hikey_usb);
>> +
>> +	return 0;
>> +}
>> +

> 
> 
> .
> 
