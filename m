Return-Path: <SRS0=FLQs=P6=gmail.com=robertshearman@kernel.org>
Subject: Re: [PATCH 1/2] i2c: mux: pca954x: change the default to deselect
 after each transfer
References: <20190121164742.35718-1-robertshearman@gmail.com>
 <9b484cde-c20c-2078-9a55-eab27b56ef36@axentia.se>
From: Robert Shearman <robertshearman@gmail.com>
Message-ID: <66870ca6-4789-57d9-ce30-2beb96efb86b@gmail.com>
Date: Tue, 22 Jan 2019 10:17:43 +0000
MIME-Version: 1.0
In-Reply-To: <9b484cde-c20c-2078-9a55-eab27b56ef36@axentia.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
To: Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Robert Shearman <robert.shearman@att.com>
List-ID: <devicetree@vger.kernel.org>

Hi Peter,

On 22/01/2019 08:41, Peter Rosin wrote:
> Hi Robert,
> 
> Thanks, for your patches.
> 
> On 2019-01-21 17:47, Robert Shearman wrote:
>> From: Robert Shearman <robert.shearman@att.com>
>>
>> The behaviour, by default, to not deselect after each transfer is
>> not safe/correct when there is a device with an address that conflicts
>> with another device either on the parent bus, or on another pca954x
>> mux on the same parent bus.
> 
> Right. The current way might not be the safest, but the way I see it,
> this ship has sailed a long time ago. It might take quite a while
> before someone reports a regression, but when that happens and we
> need to revisit or even revert this, things will get ugly.
> 
> Also, doubling or even tripling the I2C traffic (most I2C xfers
> are small) for unsuspecting users with more normal I2C setups
> (w/o multiple muxes) just to accommodate the more complexes cases
> is arguably not the correct balance.

Ok, thanks for considering the changes. Would a device-level sysfs 
toggle or module parameter approach be more acceptable?

The use case where we are hitting this issue is on an x86_64 ACPI 
platform where we desire to use a general purpose kernel, so the 
existing devicetree and platform data toggle approaches are not ideal 
for us.

> 
>> Therefore, default to the least surprising mode, where the mux
>> channels are deselected after each transaction, which is safe in the
>> face of one or more devices hanging off the mux with addresses that
>> conflict with other devices on different muxes, or on the parent
> 
> Side note, and not that it matters since it's a NACK anyway, but
> having an address conflict with the parent bus is not allowed and is
> just bad hardware design that simply cannot work reliably, if at all.

Yes, good point.

Thanks,
Rob
