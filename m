From: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] dt: bindings: add bindings for Broadcom bcm43xx sdio devices
Date: Thu, 13 Mar 2014 14:00:41 +0100
Message-ID: <5321ABF9.4090503@broadcom.com>
References: <1392059868-8782-1-git-send-email-arend@broadcom.com> <530D1E69.7010504@wwwdotorg.org> <53218565.6080605@broadcom.com> <53218B9F.7030904@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53218B9F.7030904-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/13/2014 11:42 AM, Tomasz Figa wrote:
> Hi Arend,
> 
> On 13.03.2014 11:16, Arend van Spriel wrote:
>> On 02/25/2014 11:51 PM, Stephen Warren wrote:
>>> On 02/10/2014 12:17 PM, Arend van Spriel wrote:
>>>> The Broadcom bcm43xx sdio devices are fullmac devices that may be
>>>> integrated in ARM platforms. Currently, the brcmfmac driver for
>>>> these devices support use of platform data. This patch specifies
>>>> the bindings that allow this platform data to be expressed in the
>>>> devicetree.
>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/staging/net/wireless/brcm,bcm43xx-fmac.txt
>>>> b/Documentation/devicetree/bindings/staging/net/wireless/brcm,bcm43xx-fmac.txt
>>>>
>>>
>>>> + - compatible : Should be "brcm,bcm43xx-fmac".
>>>> + - wlan-supply : phandle for fixed regulator used to control power for
>>>> +    the device/module.
>>>
>>> Ignoring the fact that perhaps this should just be a GPIO instead and
>>> assuming it actually make sense for this to be a regulator:
>>>
>>> Why "fixed regulator" not just "the regulator". There shouldn't be any
>>> requirement for the power supply to the device to be fixed; the driver
>>> should (a) set the voltage (which will be a no-op for a fixed regulator
>>> already providing that voltage), then (b) enable the regulator. That
>>> would allow a PMIC with programmable voltage to be feeding the device.
>>>
>>> Now, if this property was really intended to control some enable GPIO on
>>> the device, as others have said, this shouldn't be a regulator property
>>> but rather a GPIO property. However, there is definitely some power
>>> supply fed to the device, so you definitely need /some/ supply property
>>> here.
>>>
>>> Aren't there other enable GPIOs required? These should be specified
>>> in DT.
>>>
>>> Doesn't the WiFi chip/module require a (32KHz?) clock? If so, that needs
>>> to be represented in DT. Preferably write the binding to require
>>> clock-names (name-based lookup) rather than just clocks (index-based
>>> lookup).
>>
>> Hi Stephen,
>>
>> Thanks for these comments. While I agree with most of them, I am having
>> some difficulty with the DT concept. Essentially, a DT node describes a
>> part of the system.
> 
> That's correct. A DT node represents a component of a system and its
> contents should contain all resources and other device-specific data
> required for this device to operate or optional.
> 
>> My scope for this change is probably limited wearing
>> my brcmfmac glasses. Am I correct in assuming that a DT node may be
>> processed/used by multiple drivers.
> 
> It may be, but it is usually not. The typical use case for such scheme
> is a bus-like topology, where devices on the bus are sub-nodes of the
> bus controller node and may contain some bus-specific information, such
> as chip select (e.g. SPI), address (e.g. I2C) or maximum bus speed.
> 
>> As an example, the 32 kHz clock is
>> not something brcmfmac cares about. It simple needs to be available and
>> hooked up to the wlan device.
> 
> Not really. The driver should care about any resources needed for the
> device to operate. In this case, a 32 kHz clock even if wired to the
> chip, sometimes is not operational until it gets ungated. This is not an
> artificial example, as on many boards I used to work with the 32 kHz
> clock was driven by a PMIC with clock gating control through I2C, gated
> by default.
> 
> Moreover, (well, 32 kHz might not be the best example) from power saving
> reasons, it might be a good idea to let the driver control the clock and
> gate it whenever it is not necessary.

Hi Tomasz,

Thanks. That clarifies things.

>> The DT should have another node for this
>> clock which a (common) clock driver picks up. So having it referenced in
>> this node is purely informational, right?
> 
> You are confusing here provider with consumer. The bcm43xx chip is
> clearly a consumer of a 32 kHz clock and so its DT node should specify
> this.
> 
> A DT node for a clock, would be a clock provider node and that would be
> handled by common clock framework in case of Linux indeed. A clock
> provider node doesn't have to be limited to a single clock, though. In
> the case I mentioned above, PMIC node would be a clock provider and PMIC
> driver would register necessary clocks in common clock framework.

I see. I figured the provider driver would not do that when the device
tree did not contain a consumer. Either, it is now clear what is
required from brcmfmac driver regarding clocks and gpios. Just still not
sure about the wlan-supply property. Does it depend on the specific
platform whether it is a gpio or regulator, ie. should I support both
(mutual exclusive or not).

Regards,
Arend
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
