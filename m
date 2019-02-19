From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v2 08/10] hikey960: Support usb functionality of Hikey960
Date: Tue, 19 Feb 2019 11:20:07 +0800
Message-ID: <c02407b4-1825-83f5-2aff-dd41ae16e2ab@huawei.com>
References: <20190218112310.17860-1-chenyu56@huawei.com>
 <20190218112310.17860-9-chenyu56@huawei.com>
 <1550544615.2210.27.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550544615.2210.27.camel@mhfsdcap03>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: liuyu712@hisilicon.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Binghui Wang <wangbinghui@hisilicon.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 2019/2/19 10:50, Chunfeng Yun wrote:
>> +	if (ret)
>> +		hisi_hikey_usb->typec_vbus_enable_val = 1;
>> +
>> +	hisi_hikey_usb->typec_vbus = devm_gpiod_get(dev, "typec-vbus",
>> +			hisi_hikey_usb->typec_vbus_enable_val ?
>> +			GPIOD_OUT_LOW : GPIOD_OUT_HIGH);
>> +	if (!hisi_hikey_usb->typec_vbus)
>> +		return -ENOENT;
>> +	else if (IS_ERR(hisi_hikey_usb->typec_vbus))
>> +		return PTR_ERR(hisi_hikey_usb->typec_vbus);
>> +
>> +	gpiod_direction_output(hisi_hikey_usb->typec_vbus,
>> +			!hisi_hikey_usb->typec_vbus_enable_val);
> maybe a simple way if use fixed regulator?
> 
The hardware of the Hikey960 board has been fixed, and the type-c
port can act as UFP. So it is better to close the vbus when Hikey960
connect to host(e.g PC).
>> +
>> +	hisi_hikey_usb->otg_switch = devm_gpiod_get(dev, "otg-switch", GPIOD_IN);
>> +	if (!hisi_hikey_usb->otg_switch)
>> +		return -ENOENT;
>> +	else if (IS_ERR(hisi_hikey_usb->otg_switch))
>> +		return PTR_ERR(hisi_hikey_usb->otg_switch);
>> +
>> +	gpiod_direction_output(hisi_hikey_usb->otg_switch, USB_SWITCH_TO_HUB);
>> +
>> +	/* hub-vdd33-en is optional */
>> +	hisi_hikey_usb->hub_vbus = devm_gpiod_get(dev, "hub-vdd33-en",
>> +			GPIOD_OUT_LOW);
>> +	if (IS_ERR(hisi_hikey_usb->hub_vbus))
>> +		return PTR_ERR(hisi_hikey_usb->hub_vbus);
>> +
>> +	gpiod_direction_output(hisi_hikey_usb->hub_vbus, HUB_VBUS_POWER_ON);
> ditto
>> +
>> +	hisi_hikey_usb->role_sw = usb_role_switch_get(dev);
>> +	if (!hisi_hikey_usb->role_sw)
>> +		return -EPROBE_DEFER;
>> +	else if (IS_ERR(hisi_hikey_usb->role_sw))
>> +		return PTR_ERR(hisi_hikey_usb->role_sw);
>> +

Thanks
Yu Chen
