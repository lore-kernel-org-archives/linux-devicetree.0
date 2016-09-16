From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] of/platform: Initialise dev->fwnode appropriately
Date: Fri, 16 Sep 2016 13:07:14 +0100
Message-ID: <a3974505-7b0e-e1a8-bf84-ee5f62047662@arm.com>
References: <38259ab3716da072fab37f06d034329244491c13.1473865096.git.robin.murphy@arm.com>
 <20160915133657.GB14424@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160915133657.GB14424@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, yisen.zhuang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, salil.mehta-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 15/09/16 14:36, Rob Herring wrote:
> On Wed, Sep 14, 2016 at 04:01:24PM +0100, Robin Murphy wrote:
>> Whilst we're some of the way towards a universal firmware property
>> interface, drivers which deal with both OF and ACPI probing end up
>> having to do things like this:
>>
>>     dev->of_node ? &dev->of_node->fwnode : dev->fwnode
>>
>> This seems unnecessary, when the OF code could instead simply fill in
>> the device's fwnode when binding the of_node, and let the drivers use
>> dev->fwnode either way. Let's give it a go and see what falls out.
>>
>> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
>> ---
>>  drivers/of/platform.c | 2 ++
>>  1 file changed, 2 insertions(+)
> 
> I've applied this, but what about non-platform devices such as i2c?

I was indeed wondering that, coming from the perspective of DMA/IOMMU
configuration which doesn't really apply beyond the PCI and platform
buses. More generally, at this point it's largely for the benefit of
subsystems which need to chuck around firmware data for other devices
that don't exist yet (or at all), which maybe is just the DMA and IRQ
layers.

I guess beyond that it comes down to auditing the intersection between
callers of the property API and OF-probed buses, then killing the
dev_fwnode() helper in property.c and making sure nothing else breaks.
The possible alternative would be pushing this right down into
device_initialize(), but that seems a bit wrong.

Thanks,
Robin.

> 
> Rob
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
