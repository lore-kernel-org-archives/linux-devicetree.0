Return-Path: <SRS0=hkqx=TG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hamsrv800.servertools24.de ([213.238.32.28]:43677 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726296AbfEFTVs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 May 2019 15:21:48 -0400
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add binding for spi-byte LED.
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <CAL_JsqKmKzSw2-mfmBbhpyY=Ku6H7cE2KZrgkcPD7kAS_GqbFw@mail.gmail.com>
 <20190506162848.GA9522@amd>
 <CAL_JsqJerwvjghnuiwndE9Kp_qX5ef-aSa5JcdUAoE6R6YYuYA@mail.gmail.com>
From: Christian Mauderer <oss@c-mauderer.de>
Message-ID: <54199d69-67a9-eb9d-e46d-b3ea43e2e7a3@c-mauderer.de>
Date: Mon, 6 May 2019 21:21:45 +0200
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJerwvjghnuiwndE9Kp_qX5ef-aSa5JcdUAoE6R6YYuYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 06/05/2019 19:44, Rob Herring wrote:
> On Mon, May 6, 2019 at 11:28 AM Pavel Machek <pavel@ucw.cz> wrote:
>>
>> Hi!
>>
>>>> +* Single Byte SPI LED Device Driver.
>>>> +
>>>> +The driver can be used for controllers with a very simple SPI protocol: Only one
>>>> +byte will be sent. The value of the byte can be any value between the off-value
>>>> +and max-value defined in the properties.
>>>> +
>>>> +One example where the driver can be used is the controller in Ubiquiti airCube
>>>> +ISP devices. That LED controller is based on a 8 bit microcontroller (SONiX
>>>> +8F26E611LA) that has been programmed to control the single LED of the device.
>>>
>>> What about power control of the uC?
>>>
>>>> +The controller supports four modes depending on the highest two bits in a byte:
>>>> +One setting for brightness, the other three provide different blink patterns.
>>>
>>> This part seems in no way generic.
>>>
>>> How does one support the blink patterns?
>>>
>>>> +With the leds-spi-byte driver a basic support for the brightness mode of that
>>>> +controller can be easily achieved by setting the minimum and maximum to the
>>>> +brightness modes minimum and maximum byte value.
>>>> +
>>>> +Required properties:
>>>> +- compatible:          Should be "leds-spi-byte".
>>>
>>> Generally, we don't do "generic" bindings like this. The exceptions
>>> are either we have confidence they really can be generic or they where
>>> created before we knew better. A sample size of 1 doesn't convince me
>>> the former is true.
>>>
>>> This comment *only* applies to the binding, not the driver. Specific
>>> bindings can easily be bound to generic drivers.
>>
>> Ok, I'm afraid I caused this. What should the compatible be, then?
> 
> Knowing nothing about the h/w other than the above description:
> ubiquiti,aircube-leds
> 
> Not sure if that's a registered or correct vendor prefix though.
> 
> Rob
> 

Where would such a vendor prefix be registered? Does that mean that only
the vendor is allowed to use it? In that case: How would a reverse
engineered prefix look like?

Regarding the vendor: I wanted to have support for the airCube in
OpenWRT. When I started working with the device I asked Ubiquiti for the
sources (they use a OpenWRT based system). I received more or less the
answer that they don't have an archive but of course would create one.
But they have no ETA for it. The hardware is quite similar to other
boards so after some weeks I just analysed all necessary and did the
port myself instead of fighting with the support. So something like
three months after my question to the support, I finished the patches
and they had been accepted to OpenWRT. Ubiquiti released a GPL archive
(still with some missing parts like U-Boot) about two weeks later. I had
a look at it and they are not using a device tree. So there is no
"official" string that I could deduce from that archive.

Best regards

Christian
