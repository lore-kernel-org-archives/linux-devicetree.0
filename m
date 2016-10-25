From: John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v9 1/2] usb: dwc2: assert phy reset when waking up in
 rk3288 platform
Date: Mon, 24 Oct 2016 18:30:57 -0700
Message-ID: <9a5d53a8-6c64-804a-0b47-7d7f24e9aa88@synopsys.com>
References: <1476988627-14953-1-git-send-email-ayaka@soulik.info>
 <1476988627-14953-2-git-send-email-ayaka@soulik.info>
 <4ee5817d-0076-9974-8b0e-182a0241e1f5@synopsys.com>
 <922d7f12-a520-7c07-bc4c-887321177c6d@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <922d7f12-a520-7c07-bc4c-887321177c6d@soulik.info>
Sender: linux-kernel-owner@vger.kernel.org
To: ayaka <ayaka@soulik.info>, John Youn <John.Youn@synopsys.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "kishon@ti.com" <kishon@ti.com>
Cc: "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "heiko@sntech.de" <heiko@sntech.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "randy.li@rock-chips.com" <randy.li@rock-chips.com>
List-Id: devicetree@vger.kernel.org

On 10/23/2016 2:33 AM, ayaka wrote:
> 
> 
> On 10/22/2016 03:27 AM, John Youn wrote:
>> On 10/20/2016 11:38 AM, Randy Li wrote:
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
>>>   drivers/usb/dwc2/core.h      |  1 +
>>>   drivers/usb/dwc2/core_intr.c | 11 +++++++++++
>>>   drivers/usb/dwc2/platform.c  |  9 +++++++++
>>>   3 files changed, 21 insertions(+)
>>>
>>> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
>>> index 2a21a04..e91ddbc 100644
>>> --- a/drivers/usb/dwc2/core.h
>>> +++ b/drivers/usb/dwc2/core.h
>>> @@ -859,6 +859,7 @@ struct dwc2_hsotg {
>>>   	unsigned int ll_hw_enabled:1;
>>>   
>>>   	struct phy *phy;
>>> +	struct work_struct phy_rst_work;
>>>   	struct usb_phy *uphy;
>>>   	struct dwc2_hsotg_plat *plat;
>>>   	struct regulator_bulk_data supplies[ARRAY_SIZE(dwc2_hsotg_supply_names)];
>>> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
>>> index d85c5c9..c3d2168 100644
>>> --- a/drivers/usb/dwc2/core_intr.c
>>> +++ b/drivers/usb/dwc2/core_intr.c
>>> @@ -345,6 +345,7 @@ static void dwc2_handle_session_req_intr(struct dwc2_hsotg *hsotg)
>>>   static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>>>   {
>>>   	int ret;
>>> +	struct device_node *np = hsotg->dev->of_node;
>>>   
>>>   	/* Clear interrupt */
>>>   	dwc2_writel(GINTSTS_WKUPINT, hsotg->regs + GINTSTS);
>>> @@ -379,6 +380,16 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>>>   			/* Restart the Phy Clock */
>>>   			pcgcctl &= ~PCGCTL_STOPPCLK;
>>>   			dwc2_writel(pcgcctl, hsotg->regs + PCGCTL);
>>> +
>>> +			/*
>>> +			 * It is a quirk in Rockchip RK3288, causing by
>>> +			 * a hardware bug. This will propagate out and
>>> +			 * eventually we'll re-enumerate the device.
>>> +			 * Not great but the best we can do
>>> +			 */
>>> +			if (of_device_is_compatible(np, "rockchip,rk3288-usb"))
>>> +				schedule_work(&hsotg->phy_rst_work);
>>> +
>>>   			mod_timer(&hsotg->wkp_timer,
>>>   				  jiffies + msecs_to_jiffies(71));
>>>   		} else {
>>> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
>>> index 8e1728b..65953cf 100644
>>> --- a/drivers/usb/dwc2/platform.c
>>> +++ b/drivers/usb/dwc2/platform.c
>>> @@ -366,6 +366,14 @@ int dwc2_lowlevel_hw_disable(struct dwc2_hsotg *hsotg)
>>>   	return ret;
>>>   }
>>>   
>>> +/* Only used to reset usb phy at interrupter runtime */
>>> +static void dwc2_reset_phy_work(struct work_struct *data)
>>> +{
>>> +	struct dwc2_hsotg *hsotg = container_of(data, struct dwc2_hsotg,
>>> +			phy_rst_work);
>>> +	phy_reset(hsotg->phy);
>>> +}
>>> +
>>>   static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
>>>   {
>>>   	int i, ret;
>>> @@ -410,6 +418,7 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
>>>   			return ret;
>>>   		}
>>>   	}
>>> +	INIT_WORK(&hsotg->phy_rst_work, dwc2_reset_phy_work);
>>>   
>>>   	if (!hsotg->phy) {
>>>   		hsotg->uphy = devm_usb_get_phy(hsotg->dev, USB_PHY_TYPE_USB2);
>>>
>> Hi Randy,
>>
>> This fails compile if CONFIG_GENERIC_PHY is disabled. I think you need
>> to make a fix to your phy_reset patch first.
> In the last time, cac18ecb6f44b11bc303d7afbae3887b27938fa4 have not been 
> merged, I though the
> [PATCH v8 1/3] phy: Add reset callback for not generic phy have been 
> merged before that. when the rebase abandon it.
> Should re-send that patch? As the mainline have not been affected, could 
> you arrange a squash for it?

Hi Randy,

Can you resend the fix to Kishon?

The phy_reset patch landed in 4.9-rc so I think he should take the fix
for the next -rc. After that we can send the dwc2 change through
Felipe.

Regards,
John
