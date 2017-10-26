From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH 1/2] hwmon: (jc42) optionally try to disable the SMBUS
 timeout
Date: Thu, 26 Oct 2017 08:44:37 +0200
Message-ID: <0086a4ec-af2f-9303-610c-0de96b75ebd7@axentia.se>
References: <20171013092705.7038-1-peda@axentia.se>
 <20171013092705.7038-2-peda@axentia.se>
 <554a4494-14c9-7743-898c-5f83e3de227d@roeck-us.net>
 <2d1bf447-489f-9e15-3b1e-d2f4a2c1dcfe@axentia.se>
 <20171013203527.GA14166@roeck-us.net>
 <20171017221606.c7zlfq4fe7r24ajb@rob-hp-laptop>
 <56488899-825f-b4ea-8b5e-fff1f775db8f@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56488899-825f-b4ea-8b5e-fff1f775db8f-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-10-18 04:38, Guenter Roeck wrote:
> On 10/17/2017 03:16 PM, Rob Herring wrote:
>> On Fri, Oct 13, 2017 at 01:35:27PM -0700, Guenter Roeck wrote:
>>> On Fri, Oct 13, 2017 at 04:26:57PM +0200, Peter Rosin wrote:
>>>> On 2017-10-13 15:50, Guenter Roeck wrote:
>>>>> On 10/13/2017 02:27 AM, Peter Rosin wrote:
>>>>>> With a nxp,se97 chip on an atmel sama5d31 board, the I2C adapter driver
>>>>>> is not always capable of avoiding the 25-35 ms timeout as specified by
>>>>>> the SMBUS protocol. This may cause silent corruption of the last bit of
>>>>>> any transfer, e.g. a one is read instead of a zero if the sensor chip
>>>>>> times out. This also affects the eeprom half of the nxp-se97 chip, where
>>>>>> this silent corruption was originally noticed. Other I2C adapters probably
>>>>>> suffer similar issues, e.g. bit-banging comes to mind as risky...
>>>>>>
>>>>>> The SMBUS register in the nxp chip is not a standard Jedec register, but
>>>>>> it is not special to the nxp chips either, at least the atmel chips
>>>>>> have the same mechanism. Therefore, do not special case this on the
>>>>>> manufacturer, it is opt-in via the device property anyway.
>>>>>>
>>>>>> Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
>>>>>> ---
>>>>>>    Documentation/devicetree/bindings/hwmon/jc42.txt |  4 ++++
>>>>>>    drivers/hwmon/jc42.c                             | 20 ++++++++++++++++++++
>>>>>>    2 files changed, 24 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/hwmon/jc42.txt b/Documentation/devicetree/bindings/hwmon/jc42.txt
>>>>>> index 07a250498fbb..f569db58f64a 100644
>>>>>> --- a/Documentation/devicetree/bindings/hwmon/jc42.txt
>>>>>> +++ b/Documentation/devicetree/bindings/hwmon/jc42.txt
>>>>>> @@ -34,6 +34,10 @@ Required properties:
>>>>>>    
>>>>>>    - reg: I2C address
>>>>>>    
>>>>>> +Optional properties:
>>>>>> +- smbus-timeout-disable: When set, the smbus timeout function will be disabled.
>>>>>> +			 This is not supported on all chips.
>>
>> Is this only for jc24 devices or could be any smbus device?
>>
> 
> SMBus timeout is a standard SMBus functionality, so I would say any. It is by
> default enabled on an SMBus device (actually it is not just enabled, it is
> mandatory). The ability to disable it comes handy if a SMBus chip is connected
> to an I2C controller which does not (or not necessarily) follow SMBus rules.
> 
> I had seen that problem myself with MAX6697, and STTS751 (and its driver) also
> supports it.

So, is the approach with an optional smbus-timeout-disable property documented
in .../bindings/hwmon/jc42.txt good-to-go or should it be documented in some
common SMBus client-device file? I don't fine any such beast, so I'm unsure
how to proceed in that case.

Cheers,
Peter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
