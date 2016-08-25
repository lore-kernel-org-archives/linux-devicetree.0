From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [RESEND PATCH 3/4] usb: dwc2: assert phy reset when waking up in
 rk3288 platform
Date: Thu, 25 Aug 2016 11:23:45 -0700
Message-ID: <f6bbd88b-5d80-c30d-36c1-5b95763ae4bb@synopsys.com>
References: <4c931176-a09a-546c-d2b6-ea74028c78a2@cogentembedded.com>
 <1471807905-11323-1-git-send-email-ayaka@soulik.info>
 <49d2baf7-5f81-fc20-a805-f7a378d67a5e@synopsys.com>
 <76f0ffdb-a3c6-f1e6-8177-b254ff5badaa@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <76f0ffdb-a3c6-f1e6-8177-b254ff5badaa-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Randy Li <randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kishon-l0cyMroinI0@public.gmane.org" <kishon-l0cyMroinI0@public.gmane.org>, "linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 8/24/2016 1:54 AM, Randy Li wrote:
> 
> 
> On 08/24/2016 04:46 AM, John Youn wrote:
>> On 8/21/2016 12:32 PM, Randy Li wrote:
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
>>> Signed-off-by: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
>>> ---
>>>  drivers/usb/dwc2/core_intr.c | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
>>> index d85c5c9..f57c48a 100644
>>> --- a/drivers/usb/dwc2/core_intr.c
>>> +++ b/drivers/usb/dwc2/core_intr.c
>>> @@ -345,6 +345,7 @@ static void dwc2_handle_session_req_intr(struct dwc2_hsotg *hsotg)
>>>  static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>>>  {
>>>  	int ret;
>>> +	struct device_node *np = hsotg->dev->of_node;
>>>
>>>  	/* Clear interrupt */
>>>  	dwc2_writel(GINTSTS_WKUPINT, hsotg->regs + GINTSTS);
>>> @@ -379,6 +380,16 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>>>  			/* Restart the Phy Clock */
>>>  			pcgcctl &= ~PCGCTL_STOPPCLK;
>>>  			dwc2_writel(pcgcctl, hsotg->regs + PCGCTL);
>>> +
>>> +			/*
>>> +			 * It is a quirk in Rockchip RK3288, causing by
>>> +			 * a hardware bug. This will propagate out and
>>> +			 * eventually we'll re-enumerate the device.
>>> +			 * Not great but the best we can do
>>
>> Remove the trailing whitespaces in this comment.
>>
>> Run scripts/checkpatch.pl to catch these.
> I see.
>>
>>> +			 */
>>> +			if (of_device_is_compatible(np, "rockchip,rk3288-usb"))
>>> +				hsotg->phy->ops->reset(hsotg->phy);
>>> +
>>
>> You should probably check for NULL before calling the reset()
>> callback.
> Sure.
>>
>> Also, I'd rather see a generic quirk property that you set for your
>> platform.
>>
>> Something like "phy_reset_on_wakeup_quirk".
> But Rob Herring want me to implied by the SoC specific compatible 
> string. I agree with him. It is certainly bug in RK3288 platform.
> It is no found no the other platform.

Ok, I missed that before.

Based on the drivers I'm familiar with (like dwc3), you would typically add a
"quirk" anyways.

Felipe,

Do you have some policy or preference on this?

Regards,
John
