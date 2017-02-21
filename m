From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
 Driver
Date: Tue, 21 Feb 2017 15:57:23 +0100
Message-ID: <a44c2244-bdb3-ebc3-cfd2-271d3dabe011@skidata.com>
References: <1486714767-25930-1-git-send-email-richard.leitner@skidata.com>
 <20170216023004.25dwzy7ppxdoasfz@rob-hp-laptop>
 <31fd459f-aed3-9d4a-2a63-651131216542@g0hl1n.net>
 <CAL_JsqJ=ViO+QnTiZXSL7zyO7xu_+f7C4aSkfA7VmqiU92EeHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJ=ViO+QnTiZXSL7zyO7xu_+f7C4aSkfA7VmqiU92EeHg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/21/2017 03:37 PM, Rob Herring wrote:
> On Thu, Feb 16, 2017 at 12:36 AM, Richard Leitner <me-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org> wrote:
>> On 02/16/2017 03:30 AM, Rob Herring wrote:
>>>
>>> On Fri, Feb 10, 2017 at 09:19:27AM +0100, Richard Leitner wrote:
>>>>
>>>> This patch adds a driver for configuration of the Microchip USB251xB/xBi
>>>> USB 2.0 hub controller series with USB 2.0 upstream connectivity, SMBus
>>>> configuration interface and two to four USB 2.0 downstream ports.
>>>>
>>>> Furthermore add myself as a maintainer for this driver.
>>>>
>>>> The datasheet can be found at the manufacturers website, see [1]. All
>>>> device-tree exposed configuration features have been tested on a i.MX6
>>>> platform with a USB2512B hub.
>>>>
>>>> [1] http://ww1.microchip.com/downloads/en/DeviceDoc/00001692C.pdf
>>>>
>>>> Signed-off-by: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
>>>> ---
>>>> CHANGES v5:
>>>
>>>
>>> V5 and the first I see it?
>>
>>
>> Just double-checked it, you (robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org) were on CC since v1.
> 
> Indeed. You just sent new versions faster than I get to them. New
> versions puts you at the back of my queue. Sending out 5 versions in a
> week is a lot.

Ooh. I'm sorry. It was just that I got feedback quite fast and had the
time to implement the changes.

BTW: I already sent a patch fixing most of your issues. Please just
ignore that, as not everything is fixed in there already. I'll send an
improved version end of this week.

> 
> [...]
> 
>>>> +
>>>> +Optional properties :
>>>> + - reg : I2C address on the selected bus (default is <0x2C>)
>>>
>>>
>>> Why is this optional?
>>
>>
>> Due to the fact the address is hardcoded insinde the chip I thought we could
>> set it to 0x2C by default if reg is not given.
> 
> That's true for pretty much every I2C chip.
> 
>> Should it be required?
> 
> Yes. The only time it would not be present is the I2C bus is not
> physically connected. In that case though, this should be a child of
> the USB host node.

Ok.

[...]

>>>
>>>> + - compound-device : indicated the hub is part of a compound device
>>>> + - port-mapping-mode : enable port mapping mode
>>>> + - string-support : enable string descriptor support (required for
>>>> manufacturer,
>>>> +       product and serial string configuration)
>>>> + - non-removable-ports : Should specify the ports which have a
>>>> non-removable
>>>> +       device connected.
>>>> + - sp-disabled-ports : Specifies the ports which will be self-power
>>>> disabled
>>>> + - bp-disabled-ports : Specifies the ports which will be bus-power
>>>> disabled
>>>> + - max-sp-power : Specifies the maximum current the hub consumes from an
>>>> +       upstream port when operating as self-powered hub including the
>>>> power
>>>> +       consumption of a permanently attached peripheral if the hub is
>>>> +       configured as a compound device. The value is given in mA in a 0
>>>> - 500
>>>> +       range (default is 2).
>>>> + - max-bp-power : Specifies the maximum current the hub consumes from an
>>>> +       upstream port when operating as bus-powered hub including the
>>>> power
>>>> +       consumption of a permanently attached peripheral if the hub is
>>>> +       configured as a compound device. The value is given in mA in a 0
>>>> - 500
>>>> +       range (default is 100).
>>>> + - max-sp-current : Specifies the maximum current the hub consumes from
>>>> an
>>>> +       upstream port when operating as self-powered hub EXCLUDING the
>>>> power
>>>> +       consumption of a permanently attached peripheral if the hub is
>>>> +       configured as a compound device. The value is given in mA in a 0
>>>> - 500
>>>> +       range (default is 2).
>>>> + - max-bp-current : Specifies the maximum current the hub consumes from
>>>> an
>>>> +       upstream port when operating as bus-powered hub EXCLUDING the
>>>> power
>>>> +       consumption of a permanently attached peripheral if the hub is
>>>> +       configured as a compound device. The value is given in mA in a 0
>>>> - 500
>>>> +       range (default is 100).
>>>> + - power-on-time : Specifies the time it takes from the time the host
>>>> initiates
>>>> +       the power-on sequence to a port until the port has adequate
>>>> power. The
>>>> +       value is given in ms in a 0 - 510 range (default is 100ms).
>>>
>>>
>>> Various properties need unit suffixes (see property-units.txt) and
>>> either be common properties or need vendor prefixes.
>>
>>
>> Ok. What exactly do you mean with common properties? I don't think it's the
>> endianness settings described in common-properties.txt, is it?
> 
> No, not common-properties.txt (maybe that needs another name). Simply
> documented in a common location that multiple device bindings can
> share. So things that would be common to USB devices or USB hubs in
> particular.
> 
> Looking through the list again, probably just the ones corresponding
> to USB descriptors should be common.

Ok. But aren't for example "power-on-time" or "disabled-ports" also
properties (most) hubs share and should therefore be common?

> 
>> Is "microchip," fine as vendor prefix?
> 
> Yes, if that's the correct string for Microchip.

Ok.

> 
>>> This is a lot of properties. Are you really finding a need for all of
>>> them? Is this to handle h/w designers too cheap to put down the EEPROM?
>>> Maybe better to just define an eeprom property in the format the h/w
>>> expects.
>>
>>
>> I need about 15 of these properties. I just exposed them all to dt because I
>> thought they could be useful for somebody.
>>
>> Yes, these are a subset of the settings which can be configured via an
>> external EEPROM (By strapping some pins of the hub you can select if it
>> loads its configuration from an EEPROM or receives it via SMBus).
>>
>> My first thought was also to define only a byte array in dt, but IMHO these
>> options are much more readable and convenient for everybody. I'd also be
>> fine with removing the properties I don't need from dt. But that may lead to
>> future patches where somebody needs some of the options not already exposed
>> to dt.
> 
> Okay. It's really a judgement call. If this is most of the settings,
> then it's fine. If it was only a fraction of them, then maybe we'd
> want to do just a byte array. Sounds like it is the former.

In fact there are 6 more parameters available according to the
datasheet. So how should I proceed here? Remove the one's I'm not using
at the moment, leave them as they are or add the missing 6 too?

Thank you for your feedback!

regards,
Richard L
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
