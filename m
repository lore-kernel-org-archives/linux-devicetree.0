From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH v3 4/5] pinctrl: mcp23s08: configure irq polarity using
 irq data
Date: Tue, 21 Nov 2017 22:46:29 +0800
Message-ID: <c191a9d6-3ebb-e95b-7342-aa18598ddf2b@electromag.com.au>
References: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
 <1511252491-79952-5-git-send-email-preid@electromag.com.au>
 <20171121133434.tuvxtrrbabjk4zeg@earth>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171121133434.tuvxtrrbabjk4zeg@earth>
Content-Language: en-AU
Sender: linux-gpio-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

G'day Sebastian,

On 21/11/2017 21:34, Sebastian Reichel wrote:
> Hi,
> 
> On Tue, Nov 21, 2017 at 04:21:30PM +0800, Phil Reid wrote:
>> The irq polarity is already encoded in the irq config. Use that to
>> determine the polarity for the mcp32s08 irq output instead of the
>> custom microchip,irq-active-high property.
>>
>> Signed-off-by: Phil Reid <preid@electromag.com.au>
>> ---
> 
> I don't like, that we use the flags for configuring the host
> interrupt input and the mcp23xxx interrupt output. Usually
> when the interrupt line has an inverter on it, board DTS files
> just toggle the interrupts polarity. This will not work with
> this patch applied. We would need to explicitly add an inverter
> in the interrupt line, which is completely different to how its
> implemented everywhere else (I know at least some Tegra devices
> have implicit inverters on interrupt lines).
> 
> In case this is really wanted, this patch and the first patch
> should be merged to avoid temporarily exposing the splitted
> logic.
> 
Thanks for looking at the series.

Yes I understand where your coming from. And that's exactly what I
was trying to do in v2. I have 2 of these devices with open drain output
that is feed to an inverter. So active low output from devices and irq
consumer is active high input.

However Linux wasn't a fan of the property and wanted it gone.
He suggested we need a "inverter" device to allow for that in the
device tree. I haven't got my head around how to do that thou.

And if someone is relying on that implicit behaviour are we allowed
to break things? Probably ok with this one as it's currently not possible
due to code patch 1 removes.

If we need to model the invert to get the patches accepted I look into that.
I don't actually need it for my system as I can set open-drain with overrides
the active-high control on this device, while have active high irq consumer.
:)


> 
>>   drivers/pinctrl/pinctrl-mcp23s08.c | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
>> index 8ff9b77..6b3f810 100644
>> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
>> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
>> @@ -773,6 +773,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>>   	bool mirror = false;
>>   	bool irq_active_high = false;
>>   	bool open_drain = false;
>> +	u32 irq_trig;
>>   
>>   	mutex_init(&mcp->lock);
>>   
>> @@ -863,9 +864,13 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>>   	mcp->irq_controller =
>>   		device_property_read_bool(dev, "interrupt-controller");
>>   	if (mcp->irq && mcp->irq_controller) {
>> -		irq_active_high =
>> -			device_property_read_bool(dev,
>> -					      "microchip,irq-active-high");
>> +		if (device_property_present(dev, "microchip,irq-active-high"))
>> +			dev_warn(dev,
>> +				 "microchip,irq-active-high is deprecated\n");
>> +
>> +		irq_trig = irqd_get_trigger_type(irq_get_irq_data(mcp->irq));
>> +		if (irq_trig == IRQF_TRIGGER_HIGH)
>> +			irq_active_high = true;
>>   
>>   		mirror = device_property_read_bool(dev, "microchip,irq-mirror");
>>   		open_drain = device_property_read_bool(dev, "drive-open-drain");
>> -- 
>> 1.8.3.1
>>


-- 
Regards
Phil Reid

ElectroMagnetic Imaging Technology Pty Ltd
Development of Geophysical Instrumentation & Software
www.electromag.com.au

3 The Avenue, Midland WA 6056, AUSTRALIA
Ph: +61 8 9250 8100
Fax: +61 8 9250 7100
Email: preid@electromag.com.au
