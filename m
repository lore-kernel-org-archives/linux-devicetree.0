From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 01/30] usb: dwc2: Deprecate g-use-dma binding
Date: Tue, 8 Nov 2016 09:48:03 -0800
Message-ID: <6e90b835-73b1-3970-24a4-eab72381b469@synopsys.com>
References: <cover.1478558343.git.johnyoun@synopsys.com>
 <e99e9d8df77884671f94734109a1a8d76a0222c1.1478558343.git.johnyoun@synopsys.com>
 <87wpgeibdh.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87wpgeibdh.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/8/2016 1:12 AM, Felipe Balbi wrote:
> 
> Hi,
> 
> John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
>> Add a vendor prefix and make the name more consistent by renaming it to
>> "snps,gadget-dma-enable".
>>
>> Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/usb/dwc2.txt | 5 ++++-
>>  arch/arm/boot/dts/rk3036.dtsi                  | 2 +-
>>  arch/arm/boot/dts/rk3288.dtsi                  | 2 +-
>>  arch/arm/boot/dts/rk3xxx.dtsi                  | 2 +-
>>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi      | 2 +-
>>  arch/arm64/boot/dts/rockchip/rk3368.dtsi       | 2 +-
>>  drivers/usb/dwc2/params.c                      | 9 ++++++++-
>>  drivers/usb/dwc2/pci.c                         | 2 +-
>>  8 files changed, 18 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
>> index 9472111..389a461 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
>> @@ -26,11 +26,14 @@ Refer to phy/phy-bindings.txt for generic phy consumer properties
>>  - dr_mode: shall be one of "host", "peripheral" and "otg"
>>    Refer to usb/generic.txt
>>  - snps,host-dma-disable: disable host DMA mode.
>> -- g-use-dma: enable dma usage in gadget driver.
>> +- snps,gadget-dma-enable: enable gadget DMA mode.
> 
> I don't see why you even have this binding. Looking through the code,
> you have:
> 
> #define GHWCFG2_SLAVE_ONLY_ARCH			0
> #define GHWCFG2_EXT_DMA_ARCH			1
> #define GHWCFG2_INT_DMA_ARCH			2
> 
> void dwc2_set_param_dma_enable(struct dwc2_hsotg *hsotg, int val)
> {
> 	int valid = 1;
> 
> 	if (val > 0 && hsotg->hw_params.arch == GHWCFG2_SLAVE_ONLY_ARCH)
> 		valid = 0;
> 	if (val < 0)
> 		valid = 0;
> 
> 	if (!valid) {
> 		if (val >= 0)
> 			dev_err(hsotg->dev,
> 				"%d invalid for dma_enable parameter. Check HW configuration.\n",
> 				val);
> 		val = hsotg->hw_params.arch != GHWCFG2_SLAVE_ONLY_ARCH;
> 		dev_dbg(hsotg->dev, "Setting dma_enable to %d\n", val);
> 	}
> 
> 	hsotg->core_params->dma_enable = val;
> }
> 
> which seems to hint that DMA support is discoverable. If there is DMA,
> why would disable it?
> 

Yes that's the case and I would prefer to make it discoverable and
enabled by default.

But the legacy behavior has always been like this because DMA was
never fully implemented in the gadget driver and it was an opt-in
feature. Periodic support was only added recently.

What do you think about enabling it by default now? I think most
platforms already use DMA.

We would still need a "disable" binding for IP validation purposes at
least.

Regards,
John
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
