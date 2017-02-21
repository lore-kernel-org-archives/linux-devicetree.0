From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller Driver
Date: Tue, 21 Feb 2017 08:37:15 -0600
Message-ID: <CAL_JsqJ=ViO+QnTiZXSL7zyO7xu_+f7C4aSkfA7VmqiU92EeHg@mail.gmail.com>
References: <1486714767-25930-1-git-send-email-richard.leitner@skidata.com>
 <20170216023004.25dwzy7ppxdoasfz@rob-hp-laptop> <31fd459f-aed3-9d4a-2a63-651131216542@g0hl1n.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <31fd459f-aed3-9d4a-2a63-651131216542-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Leitner <me-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>
Cc: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 16, 2017 at 12:36 AM, Richard Leitner <me-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org> wrote:
> On 02/16/2017 03:30 AM, Rob Herring wrote:
>>
>> On Fri, Feb 10, 2017 at 09:19:27AM +0100, Richard Leitner wrote:
>>>
>>> This patch adds a driver for configuration of the Microchip USB251xB/xBi
>>> USB 2.0 hub controller series with USB 2.0 upstream connectivity, SMBus
>>> configuration interface and two to four USB 2.0 downstream ports.
>>>
>>> Furthermore add myself as a maintainer for this driver.
>>>
>>> The datasheet can be found at the manufacturers website, see [1]. All
>>> device-tree exposed configuration features have been tested on a i.MX6
>>> platform with a USB2512B hub.
>>>
>>> [1] http://ww1.microchip.com/downloads/en/DeviceDoc/00001692C.pdf
>>>
>>> Signed-off-by: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>> CHANGES v5:
>>
>>
>> V5 and the first I see it?
>
>
> Just double-checked it, you (robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org) were on CC since v1.

Indeed. You just sent new versions faster than I get to them. New
versions puts you at the back of my queue. Sending out 5 versions in a
week is a lot.

[...]

>>> +
>>> +Optional properties :
>>> + - reg : I2C address on the selected bus (default is <0x2C>)
>>
>>
>> Why is this optional?
>
>
> Due to the fact the address is hardcoded insinde the chip I thought we could
> set it to 0x2C by default if reg is not given.

That's true for pretty much every I2C chip.

> Should it be required?

Yes. The only time it would not be present is the I2C bus is not
physically connected. In that case though, this should be a child of
the USB host node.

>>> + - skip-config : Skip Hub configuration, but only send the USB-Attach
>>> command
>>> + - vendor-id : USB Vendor ID of the hub (16 bit, default is 0x0424)
>>> + - product-id : USB Product ID of the hub (16 bit, default depends on
>>> type)
>>
>>
>> These are to set the ids or need to match what they are set too?
>
>
> These are to set the VID/PID of the Hub.
>
>>
>>> + - device-id : USB Device ID of the hub (16 bit, default is 0x0bb3)
>>> + - language-id : USB Language ID (16 bit, default is 0x0000)
>>> + - manufacturer : USB Manufacturer string (max 31 characters long)
>>> + - product : USB Product string (max 31 characters long)
>>> + - serial : USB Serial string (max 31 characters long)
>>> + - {bus,self}-powered : selects between self- and bus-powered operation
>>> (default
>>> +       is self-powered)
>>> + - disable-hi-speed : disable USB Hi-Speed support
>>> + - {multi,single}-tt : selects between multi- and
>>> single-transaction-translator
>>> +       (default is multi-tt)
>>> + - disable-eop : disable End of Packet generation in full-speed mode
>>> + - {ganged,individual}-sensing : select over-current sense type in
>>> self-powered
>>> +       mode (default is individual)
>>> + - {ganged,individual}-port-switching : select port power switching mode
>>> +       (default is individual)
>>> + - dynamic-power-switching : enable auto-switching from self- to
>>> bus-powered
>>> +       operation if the local power source is removed or unavailable
>>> + - oc-delay-{100us,4ms,8ms,16ms} : set over current timer delay (default
>>> is 8ms)
>>
>>
>> Make the property value be the time (e.g. oc-delay-us).
>
>
> OK.
>
>
>>
>>> + - compound-device : indicated the hub is part of a compound device
>>> + - port-mapping-mode : enable port mapping mode
>>> + - string-support : enable string descriptor support (required for
>>> manufacturer,
>>> +       product and serial string configuration)
>>> + - non-removable-ports : Should specify the ports which have a
>>> non-removable
>>> +       device connected.
>>> + - sp-disabled-ports : Specifies the ports which will be self-power
>>> disabled
>>> + - bp-disabled-ports : Specifies the ports which will be bus-power
>>> disabled
>>> + - max-sp-power : Specifies the maximum current the hub consumes from an
>>> +       upstream port when operating as self-powered hub including the
>>> power
>>> +       consumption of a permanently attached peripheral if the hub is
>>> +       configured as a compound device. The value is given in mA in a 0
>>> - 500
>>> +       range (default is 2).
>>> + - max-bp-power : Specifies the maximum current the hub consumes from an
>>> +       upstream port when operating as bus-powered hub including the
>>> power
>>> +       consumption of a permanently attached peripheral if the hub is
>>> +       configured as a compound device. The value is given in mA in a 0
>>> - 500
>>> +       range (default is 100).
>>> + - max-sp-current : Specifies the maximum current the hub consumes from
>>> an
>>> +       upstream port when operating as self-powered hub EXCLUDING the
>>> power
>>> +       consumption of a permanently attached peripheral if the hub is
>>> +       configured as a compound device. The value is given in mA in a 0
>>> - 500
>>> +       range (default is 2).
>>> + - max-bp-current : Specifies the maximum current the hub consumes from
>>> an
>>> +       upstream port when operating as bus-powered hub EXCLUDING the
>>> power
>>> +       consumption of a permanently attached peripheral if the hub is
>>> +       configured as a compound device. The value is given in mA in a 0
>>> - 500
>>> +       range (default is 100).
>>> + - power-on-time : Specifies the time it takes from the time the host
>>> initiates
>>> +       the power-on sequence to a port until the port has adequate
>>> power. The
>>> +       value is given in ms in a 0 - 510 range (default is 100ms).
>>
>>
>> Various properties need unit suffixes (see property-units.txt) and
>> either be common properties or need vendor prefixes.
>
>
> Ok. What exactly do you mean with common properties? I don't think it's the
> endianness settings described in common-properties.txt, is it?

No, not common-properties.txt (maybe that needs another name). Simply
documented in a common location that multiple device bindings can
share. So things that would be common to USB devices or USB hubs in
particular.

Looking through the list again, probably just the ones corresponding
to USB descriptors should be common.

> Is "microchip," fine as vendor prefix?

Yes, if that's the correct string for Microchip.

>> This is a lot of properties. Are you really finding a need for all of
>> them? Is this to handle h/w designers too cheap to put down the EEPROM?
>> Maybe better to just define an eeprom property in the format the h/w
>> expects.
>
>
> I need about 15 of these properties. I just exposed them all to dt because I
> thought they could be useful for somebody.
>
> Yes, these are a subset of the settings which can be configured via an
> external EEPROM (By strapping some pins of the hub you can select if it
> loads its configuration from an EEPROM or receives it via SMBus).
>
> My first thought was also to define only a byte array in dt, but IMHO these
> options are much more readable and convenient for everybody. I'd also be
> fine with removing the properties I don't need from dt. But that may lead to
> future patches where somebody needs some of the options not already exposed
> to dt.

Okay. It's really a judgement call. If this is most of the settings,
then it's fine. If it was only a fraction of them, then maybe we'd
want to do just a byte array. Sounds like it is the former.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
