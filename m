From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v2 07/10] usb: dwc3: Registering a role switch in the DRD
 code.
Date: Tue, 19 Feb 2019 11:37:33 +0800
Message-ID: <39e822a2-54fb-f4ac-4471-ed8312acf53e@huawei.com>
References: <20190218112310.17860-1-chenyu56@huawei.com>
 <20190218112310.17860-8-chenyu56@huawei.com>
 <CAKgpwJXgiJYkpTxddwLFJRSvadcCw7fMbd=d510NFkyRSKaswA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKgpwJXgiJYkpTxddwLFJRSvadcCw7fMbd=d510NFkyRSKaswA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jun Li <lijun.kernel@gmail.com>
Cc: liuyu712@hisilicon.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Li Jun <jun.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 2019/2/19 10:57, Jun Li wrote:
>>
>> +static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role role)
>> +{
>> +       u32 mode;
>> +
>> +       switch (role) {
>> +       case USB_ROLE_HOST:
>> +               mode = DWC3_GCTL_PRTCAP_HOST;
>> +               break;
>> +       case USB_ROLE_DEVICE:
>> +               mode = DWC3_GCTL_PRTCAP_DEVICE;
>> +               break;
>> +       default:
>> +               mode = DWC3_GCTL_PRTCAP_HOST;
> 
> I'd propose let dwc3 stay at device mode at default case.
> 
Setting mode to DWC3_GCTL_PRTCAP_HOST at default case due to the
requirement of Hikey960 board. When there is no cable connected to
type-C port, dwc3 should be set to HOST mode and the hub on the
Hikey960 will be power on.
Here is the details of the Hikey960:
	https://www.96boards.org/documentation/consumer/hikey/hikey960/hardware-docs/hardware-user-manual.md.html

But I will check the code to see if it is possible to make dwc3
set to device mode at default case.

>> +               break;
>> +       };
>> +
>> +       dwc3_set_mode(dev_get_drvdata(dev), mode);
>> +       return 0;
>> +}
>> +
>> +static enum usb_role dwc3_usb_role_switch_get(struct device *dev)
>> +{
>> +       struct dwc3 *dwc = dev_get_drvdata(dev);
>> +       unsigned long flags;
>> +       enum usb_role role;
>> +
>> +       spin_lock_irqsave(&dwc->lock, flags);
>> +       role = dwc->current_otg_role;
>> +       spin_unlock_irqrestore(&dwc->lock, flags);
>> +
>> +       return role;
>> +}
>> +
>>  int dwc3_drd_init(struct dwc3 *dwc)
>>  {
>> +       struct usb_role_switch_desc dwc3_role_switch = {0};
>>         int ret, irq;
>>
>>         dwc->edev = dwc3_get_extcon(dwc);
>> @@ -522,6 +556,15 @@ int dwc3_drd_init(struct dwc3 *dwc)
>>                 dwc3_set_mode(dwc, DWC3_GCTL_PRTCAP_OTG);
>>         }
>>
>> +       dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
>> +       dwc3_role_switch.set = dwc3_usb_role_switch_set;
>> +       dwc3_role_switch.get = dwc3_usb_role_switch_get;
>> +       dwc->role_sw = usb_role_switch_register(dwc->dev, &dwc3_role_switch);
>> +       if (ret) {
>> +               dwc3_drd_exit(dwc);
>> +               return PTR_ERR(dwc->role_sw);
>> +       }
>> +
> 
> My understanding is, if you use usb role switch, you don't need either edev or
> OTG block event, so this should be like:
> 
> if (device_property_read_bool(dwc->dev, "usb-role-switch")) {
>            usb role switch register;
> } else if (edev) {
> ...
> } else {
> ...
> }
Yes. Thanks!

> 
> Jun
>>         return 0;
>>  }
>>
>> @@ -557,4 +600,6 @@ void dwc3_drd_exit(struct dwc3 *dwc)
>>
>>         if (!dwc->edev)
>>                 free_irq(dwc->otg_irq, dwc);
>> +
>> +       usb_role_switch_unregister(dwc->role_sw);
>>  }
>> --
>> 2.15.0-rc2
>>
> 
> .
> 

Thanks
Yu Chen
