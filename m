From: zhangfei <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 4/4] phy: add phy-hi6220-usb
Date: Fri, 20 Feb 2015 18:27:27 +0800
Message-ID: <54E70C0F.1030601@linaro.org>
References: <1423726646-30336-1-git-send-email-zhangfei.gao@linaro.org> <1423726646-30336-5-git-send-email-zhangfei.gao@linaro.org> <54E4249C.9050404@ti.com> <54E426B5.4070206@linaro.org> <20150218143546.GD3651@saruman.tx.rr.com> <54E6A4E9.4030401@linaro.org> <20150220043805.GA22128@saruman.tx.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150220043805.GA22128-HgARHv6XitJaoMGHk7MhZQC/G2K4zDHf@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "dan . zhao" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wangbinghui <wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 02/20/2015 12:38 PM, Felipe Balbi wrote:
> On Fri, Feb 20, 2015 at 11:07:21AM +0800, zhangfei wrote:
>> Hi, Balbi
>>
>> On 02/18/2015 10:35 PM, Felipe Balbi wrote:
>>> On Wed, Feb 18, 2015 at 01:44:21PM +0800, zhangfei wrote:
>>>> Hi, Kishon
>>>>
>>>> On 02/18/2015 01:35 PM, Kishon Vijay Abraham I wrote:
>>>>> Hi,
>>>>>
>>>>> On Thursday 12 February 2015 01:07 PM, Zhangfei Gao wrote:
>>>>>> Add usb phy controller for hi6220 platform
>>>>>>
>>>>>> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>>>> ---
>>>>>>   drivers/phy/Kconfig          |   9 ++
>>>>>>   drivers/phy/Makefile         |   1 +
>>>>>>   drivers/phy/phy-hi6220-usb.c | 306
>>>>>> +++++++++++++++++++++++++++++++++++++++++++
>>>>>>   3 files changed, 316 insertions(+)
>>>>>>   create mode 100644 drivers/phy/phy-hi6220-usb.c
>>>>>
>>>>> why is this driver in drivers/phy when it doesn't use the generic PHY
>>>>> framework at all?
>>>>>
>>>>
>>>> Balbi recommended "new drivers only on drivers/phy/", including usb
>>>> phy.
>>>
>>> but it should use the API too. It's not only about a directory, you need
>>> to use the new API.
>>>
>>>> So Move drivers/usb/phy/phy-hi6220-usb.c to
>>>> drivers/phy/phy-hi6220-usb.c, required by Balbi.
>>>
>>> you're reading what I stated the way you like.
>>
>> Sorry for my bad understanding.
>>
>> Still not clear about the otg_set_peripheral, which is required in
>> phy-hi6220-usb.c
>>
>> 1. drivers/usb/dwc2/gadget.c use
>> otg_set_peripheral(hsotg->uphy->otg, &hsotg->gadget);
>>
>> 2. include/linux/phy/phy.h
>> struct phy do not have member otg, while struct usb_phy has.
>>
>> Could you give more hints?
>
> your set_peripheral doesn't do anything, just holds a pointer. Might as
> well not implement it. I'll review your driver more fully tomorrow.
>
> There a few things which must be changed.
>

Thanks in advance.

We need this call back set_peripheral setting otg->gadget, which used in 
usb_gadget_connect/disconnect(otg->gadget).

The workable method test here is not provide phy-names = "usb2-phy";
Then dwc2 will still use hsotg->uphy instead of hsotg->phy.
Though devm_phy_create is used in phy-hi6220-usb.c, phy_ops is not used 
in fact.

Thanks

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
