From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 3/4] usb: dwc2: assert phy reset when waking up in
 rk3288 platform
Date: Tue, 6 Sep 2016 11:54:16 -0700
Message-ID: <ba3e8239-6909-9de1-9cc5-f7ae80825f58@synopsys.com>
References: <1472939729-15187-1-git-send-email-ayaka@soulik.info>
 <1472939729-15187-4-git-send-email-ayaka@soulik.info>
 <57CE50A2.7080502@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <57CE50A2.7080502-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 9/5/2016 10:15 PM, Kishon Vijay Abraham I wrote:
> Hi,
> 
> On Sunday 04 September 2016 03:25 AM, Randy Li wrote:
>> On the rk3288 USB host-only port (the one that's not the OTG-enabled
>> port) the PHY can get into a bad state when a wakeup is asserted (not
>> just a wakeup from full system suspend but also a wakeup from
>> autosuspend).
>>
>> We can get the PHY out of its bad state by asserting its "port reset",
>> but unfortunately that seems to assert a reset onto the USB bus so it
>> could confuse things if we don't actually deenumerate / reenumerate the
>> device.
>>
>> We can also get the PHY out of its bad state by fully resetting it using
>> the reset from the CRU (clock reset unit) in chip, which does a more full
>> reset.  The CRU-based reset appears to actually cause devices on the bus
>> to be removed and reinserted, which fixes the problem (albeit in a hacky
>> way).
>>
>> It's unfortunate that we need to do a full re-enumeration of devices at
>> wakeup time, but this is better than alternative of letting the bus get
>> wedged.
>>
>> Signed-off-by: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
>> ---
>>  drivers/usb/dwc2/core_intr.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
>> index d85c5c9..08485b7 100644
>> --- a/drivers/usb/dwc2/core_intr.c
>> +++ b/drivers/usb/dwc2/core_intr.c
>> @@ -345,6 +345,7 @@ static void dwc2_handle_session_req_intr(struct dwc2_hsotg *hsotg)
>>  static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>>  {
>>  	int ret;
>> +	struct device_node *np = hsotg->dev->of_node;
>>  
>>  	/* Clear interrupt */
>>  	dwc2_writel(GINTSTS_WKUPINT, hsotg->regs + GINTSTS);
>> @@ -379,6 +380,17 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>>  			/* Restart the Phy Clock */
>>  			pcgcctl &= ~PCGCTL_STOPPCLK;
>>  			dwc2_writel(pcgcctl, hsotg->regs + PCGCTL);
>> +
>> +			/*
>> +			 * It is a quirk in Rockchip RK3288, causing by
>> +			 * a hardware bug. This will propagate out and
>> +			 * eventually we'll re-enumerate the device. 
>> +			 * Not great but the best we can do 
>> +			 */
>> +			if (of_device_is_compatible(np, "rockchip,rk3288-usb")
>> +					&& (NULL != hsotg->phy->ops->reset))
>> +				hsotg->phy->ops->reset(hsotg->phy);
> 
> never call the phy ops directly from the controller driver. It has to be
> protected as well.

It looks like we should be calling an API function instead, correct?

Similar to the wrappers for the other ops.

Regards,
John
