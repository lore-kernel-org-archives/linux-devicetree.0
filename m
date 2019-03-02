From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v2 08/10] hikey960: Support usb functionality of Hikey960
Date: Sat, 2 Mar 2019 09:02:51 +0800
Message-ID: <414a5760-8283-92c6-fab8-88c15194c798@huawei.com>
References: <20190218112310.17860-1-chenyu56@huawei.com>
 <20190218112310.17860-9-chenyu56@huawei.com>
 <1550544615.2210.27.camel@mhfsdcap03>
 <c02407b4-1825-83f5-2aff-dd41ae16e2ab@huawei.com>
 <1550820738.2210.39.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550820738.2210.39.camel@mhfsdcap03>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: liuyu712@hisilicon.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Binghui Wang <wangbinghui@hisilicon.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Hi Chunfeng Yun,

On 2019/2/22 15:32, Chunfeng Yun wrote:
> On Tue, 2019-02-19 at 11:20 +0800, Chen Yu wrote:
>> Hi,
>>
>> On 2019/2/19 10:50, Chunfeng Yun wrote:
>>>> +	if (ret)
>>>> +		hisi_hikey_usb->typec_vbus_enable_val = 1;
>>>> +
>>>> +	hisi_hikey_usb->typec_vbus = devm_gpiod_get(dev, "typec-vbus",
>>>> +			hisi_hikey_usb->typec_vbus_enable_val ?
>>>> +			GPIOD_OUT_LOW : GPIOD_OUT_HIGH);
>>>> +	if (!hisi_hikey_usb->typec_vbus)
>>>> +		return -ENOENT;
>>>> +	else if (IS_ERR(hisi_hikey_usb->typec_vbus))
>>>> +		return PTR_ERR(hisi_hikey_usb->typec_vbus);
>>>> +
>>>> +	gpiod_direction_output(hisi_hikey_usb->typec_vbus,
>>>> +			!hisi_hikey_usb->typec_vbus_enable_val);
>>> maybe a simple way if use fixed regulator?
>>>
>> The hardware of the Hikey960 board has been fixed, and the type-c
>> port can act as UFP. So it is better to close the vbus when Hikey960
>> connect to host(e.g PC).
> I guess you misunderstand what I mean?
> Please refer to bindings/regulator/fixed-regulator.txt
> If you control vbus by gpio, you can use fixed-regulator, it will be
> easy to make compatible with other cases, think about using a LDO to
> control vbus
Sorry for misunderstanding the fixed-regulator and thanks for your advice!
I have read bindings/regulator/fixed-regulator.txt and I think it is enough
to use gpiod API right now.
>>>> +
>>>> +	hisi_hikey_usb->otg_switch = devm_gpiod_get(dev, "otg-switch", GPIOD_IN);
>>>> +	if (!hisi_hikey_usb->otg_switch)
>>>> +		return -ENOENT;
>>>> +	else if (IS_ERR(hisi_hikey_usb->otg_switch))
>>>> +		return PTR_ERR(hisi_hikey_usb->otg_switch);
>>>> +
>>>> +	gpiod_direction_output(hisi_hikey_usb->otg_switch, USB_SWITCH_TO_HUB);
>>>> +
>>>> +	/* hub-vdd33-en is optional */
>>>> +	hisi_hikey_usb->hub_vbus = devm_gpiod_get(dev, "hub-vdd33-en",
>>>> +			GPIOD_OUT_LOW);
>>>> +	if (IS_ERR(hisi_hikey_usb->hub_vbus))
>>>> +		return PTR_ERR(hisi_hikey_usb->hub_vbus);
>>>> +
>>>> +	gpiod_direction_output(hisi_hikey_usb->hub_vbus, HUB_VBUS_POWER_ON);
>>> ditto
>>>> +
>>>> +	hisi_hikey_usb->role_sw = usb_role_switch_get(dev);
>>>> +	if (!hisi_hikey_usb->role_sw)
>>>> +		return -EPROBE_DEFER;
>>>> +	else if (IS_ERR(hisi_hikey_usb->role_sw))
>>>> +		return PTR_ERR(hisi_hikey_usb->role_sw);
>>>> +
>>
>> Thanks
>> Yu Chen
>>
> 

Thanks
Yu Chen
