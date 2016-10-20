From: Randy Li <randy.li@rock-chips.com>
Subject: Re: [PATCH v8 2/3] usb: dwc2: assert phy reset when waking up in
 rk3288 platform
Date: Thu, 20 Oct 2016 08:50:40 +0800
Message-ID: <458d5e4f-95ad-22f5-02ec-bb39c4e69ad9@rock-chips.com>
References: <1474743019-1050-1-git-send-email-ayaka@soulik.info>
 <1474743019-1050-3-git-send-email-ayaka@soulik.info>
 <CAFLEztRLJbMj-ttGBsCWCMW=+0N3bbMQ0c4YcgDyvUDYs1SSkA@mail.gmail.com>
 <d8f43ae4-bfca-ce37-772d-a61b77f5493a@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d8f43ae4-bfca-ce37-772d-a61b77f5493a@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Youn <John.Youn@synopsys.com>, =?UTF-8?B?6ZmI6LGq?= <jacobchen110@gmail.com>, Randy Li <ayaka@soulik.info>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "kishon@ti.com" <kishon@ti.com>, "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org



On 10/20/2016 06:58 AM, John Youn wrote:
> On 10/15/2016 8:07 AM, 陈豪 wrote:
>> 2016-09-25 2:50 GMT+08:00 Randy Li <ayaka@soulik.info>:
>>> On the rk3288 USB host-only port (the one that's not the OTG-enabled
>>> port) the PHY can get into a bad state when a wakeup is asserted (not
>>> just a wakeup from full system suspend but also a wakeup from
>>> autosuspend).
>>>
>>> We can get the PHY out of its bad state by asserting its "port reset",
>>> but unfortunately that seems to assert a reset onto the USB bus so it
>>> could confuse things if we don't actually deenumerate / reenumerate the
>>> device.
>>>
>>> We can also get the PHY out of its bad state by fully resetting it using
>>> the reset from the CRU (clock reset unit) in chip, which does a more full
>>> reset.  The CRU-based reset appears to actually cause devices on the bus
>>> to be removed and reinserted, which fixes the problem (albeit in a hacky
>>> way).
>>>
>>> It's unfortunate that we need to do a full re-enumeration of devices at
>>> wakeup time, but this is better than alternative of letting the bus get
>>> wedged.
>>>
>>> Signed-off-by: Randy Li <ayaka@soulik.info>
>>> ---
>>>  drivers/usb/dwc2/core_intr.c | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
>>> index d85c5c9..af27edc 100644
>>> --- a/drivers/usb/dwc2/core_intr.c
>>> +++ b/drivers/usb/dwc2/core_intr.c
>>> @@ -345,6 +345,7 @@ static void dwc2_handle_session_req_intr(struct dwc2_hsotg *hsotg)
>>>  static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>>>  {
>>>         int ret;
>>> +       struct device_node *np = hsotg->dev->of_node;
>>>
>>>         /* Clear interrupt */
>>>         dwc2_writel(GINTSTS_WKUPINT, hsotg->regs + GINTSTS);
>>> @@ -379,6 +380,16 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>>>                         /* Restart the Phy Clock */
>>>                         pcgcctl &= ~PCGCTL_STOPPCLK;
>>>                         dwc2_writel(pcgcctl, hsotg->regs + PCGCTL);
>>> +
>>> +                       /*
>>> +                        * It is a quirk in Rockchip RK3288, causing by
>>> +                        * a hardware bug. This will propagate out and
>>> +                        * eventually we'll re-enumerate the device.
>>> +                        * Not great but the best we can do.
>>> +                        */
>>> +                       if (of_device_is_compatible(np, "rockchip,rk3288-usb"))
>>> +                               phy_reset(hsotg->phy);
>>
>> It will call mutex_lock in phy_reset.
>>
>>
>>> +
>>>                         mod_timer(&hsotg->wkp_timer,
>>>                                   jiffies + msecs_to_jiffies(71));
>>>                 } else {
>>> --
>>> 2.7.4
>>>
>>
>> What is the status of this patch？
>> Sleeping calls(phy_reset ==> mutex) shouldn't be used in irq handler.
>> Randy will correct that？
>>
>
> Yes, that's right, I missed that.
>
> It will have to be fixed.
I am still thinking a method to instead it.
>
> Regards,
> John
>
>

-- 
Randy Li
The third produce department
===========================================================================
This email message, including any attachments, is for the sole
use of the intended recipient(s) and may contain confidential and
privileged information. Any unauthorized review, use, disclosure or
distribution is prohibited. If you are not the intended recipient, please
contact the sender by reply e-mail and destroy all copies of the original
message. [Fuzhou Rockchip Electronics, INC. China mainland]
===========================================================================
