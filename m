From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: phy: Add support for HiSilicon's
 hi3660 USB PHY
Date: Tue, 19 Feb 2019 11:55:31 +0800
Message-ID: <5ee91d42-ab9d-1bd2-d39e-8af4d69a5c19@huawei.com>
References: <20190218112310.17860-1-chenyu56@huawei.com>
 <20190218112310.17860-2-chenyu56@huawei.com> <20190218201824.GA23724@bogus>
 <a944cd27-f7d5-eece-1ef5-c7dc5dbc311b@huawei.com>
 <1550545405.2210.30.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550545405.2210.30.camel@mhfsdcap03>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: liuyu712@hisilicon.com, Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Mark Rutland <mark.rutland@arm.com>, Binghui Wang <wangbinghui@hisilicon.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 2019/2/19 11:03, Chunfeng Yun wrote:
>>>> +
>>>> +Example:
>>>> +	usb-phy {
>>>> +		compatible = "hisilicon,hi3660-usb-phy";
>>>> +		#phy-cells = <0>;
>>>> +		hisilicon,pericrg-syscon = <&crg_ctrl>;
>>>> +		hisilicon,pctrl-syscon = <&pctrl>;
>>>> +		hisilicon,usb3-otg-bc-syscon = <&usb3_otg_bc>;
>>>
>>> Are most of the registers within one of these blocks? If so, make this 
>>> node a child of that node.
>> I met a problem when I made this node a child of the syscon node,
>> the driver "phy-hi3660-usb3" was not probed.
>> Do you have any idea about how to make it probed when it is a child node?
> call of_platform_populate() in parent node's driver,
> but I don't know whether it's a standard way
Yes, this function is used in dwc3 driver to probe the child node.
But I think it is not a good way to modify the syscon driver.
>>>
>>>> +		hisilicon,eye-diagram-param = <0x22466e4>;
>>>> +	};
>>>> -- 
>>>> 2.15.0-rc2
>>>>

Thanks
Yu Chen
