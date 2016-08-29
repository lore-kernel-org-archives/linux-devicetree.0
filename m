From: John Youn <John.Youn@synopsys.com>
Subject: Re: [RESEND PATCH 3/4] usb: dwc2: assert phy reset when waking up in
 rk3288 platform
Date: Mon, 29 Aug 2016 11:24:49 -0700
Message-ID: <ea25555d-7b94-ad53-4380-4e8d4a50dcce@synopsys.com>
References: <4c931176-a09a-546c-d2b6-ea74028c78a2@cogentembedded.com>
 <1471807905-11323-1-git-send-email-ayaka@soulik.info>
 <49d2baf7-5f81-fc20-a805-f7a378d67a5e@synopsys.com>
 <76f0ffdb-a3c6-f1e6-8177-b254ff5badaa@rock-chips.com>
 <f6bbd88b-5d80-c30d-36c1-5b95763ae4bb@synopsys.com>
 <87fupodnd8.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87fupodnd8.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>, John Youn <John.Youn@synopsys.com>, Randy Li <randy.li@rock-chips.com>, Randy Li <ayaka@soulik.info>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "heiko@sntech.de" <heiko@sntech.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "eddie.cai@rock-chips.com" <eddie.cai@rock-chips.com>, "kishon@ti.com" <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

On 8/29/2016 12:51 AM, Felipe Balbi wrote:
> 
> Hi,
> 
> John Youn <John.Youn@synopsys.com> writes:
> 
> [...]
> 
>>>>> +			 */
>>>>> +			if (of_device_is_compatible(np, "rockchip,rk3288-usb"))
>>>>> +				hsotg->phy->ops->reset(hsotg->phy);
>>>>> +
>>>>
>>>> You should probably check for NULL before calling the reset()
>>>> callback.
>>> Sure.
>>>>
>>>> Also, I'd rather see a generic quirk property that you set for your
>>>> platform.
>>>>
>>>> Something like "phy_reset_on_wakeup_quirk".
>>> But Rob Herring want me to implied by the SoC specific compatible 
>>> string. I agree with him. It is certainly bug in RK3288 platform.
>>> It is no found no the other platform.
>>
>> Ok, I missed that before.
>>
>> Based on the drivers I'm familiar with (like dwc3), you would
>> typically add a "quirk" anyways.
>>
>> Felipe,
>>
>> Do you have some policy or preference on this?
> 
> if it's not a dwc2-generic feature, then let's do it via compatible
> flag, sure. What we don't want is for things like:
> 
> if (is_compatible('synopsys') || is_compatible('rockchip') ||
> 	is_compatible('foobar') ... )
> 
> For that, we'd be better of adding a generic quirk flag which several
> can use.
> 

Alright sounds reasonable.

Randy, could you respin with the other feedback? There's no need to
add a quirk.

Regards,
John
