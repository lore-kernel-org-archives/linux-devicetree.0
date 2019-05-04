Return-Path: <SRS0=CHRc=TE=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
References: <20190504122825.11883-1-list@c-mauderer.de>
 <4889e87a-5c7a-da74-bff6-c20fd07ea0f4@gmail.com>
 <0175bf00-f2eb-98c7-ce0b-d9a2858872e7@c-mauderer.de>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <5cc8907f-5cb4-e8b4-7309-cc446ef5bde7@gmail.com>
Date: Sat, 4 May 2019 22:01:54 +0200
MIME-Version: 1.0
In-Reply-To: <0175bf00-f2eb-98c7-ce0b-d9a2858872e7@c-mauderer.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Christian Mauderer <list@c-mauderer.de>, oss@c-mauderer.de, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 5/4/19 9:48 PM, Christian Mauderer wrote:
> On 04/05/2019 21:34, Jacek Anaszewski wrote:
>> Hi Christian,
>>
>> Thank you for the patch.
> 
> Hello Jacek,
> 
> thank you for your time to review it.

You're welcome.

>>
>> On 5/4/19 2:28 PM, list@c-mauderer.de wrote:
>>> From: Christian Mauderer <oss@c-mauderer.de>
>>>
>>> This patch adds the binding documentation for the LED controller found
>>> in Ubiquity airCube ISP devices.
>>>
>>> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
>>> ---
>>>
>>> I tested the patches with a 4.14 and a 4.19 kernel on the current
>>> OpenWRT.
>>> Although I didn't get the kernel running due to file system problems
>>> they build
>>> fine with a 5.1-rc7.
>>>
>>> I shortly described the protocol of the controller in a comment in the
>>> driver
>>> file in the second patch.
>>>
>>> Checkpatch gives the following warning for both patches:
>>>
>>>     WARNING: added, moved or deleted file(s), does MAINTAINERS need
>>> updating?
>>>
>>> To be honest: I don't know what to do with it. Please excuse my
>>> ignorance here.
>>> It's the first driver that I want to add to the Linux kernel.
>>
>> You can add yourself as a maintainer of this driver, but it is customary
>> rather for more complex drivers.
> 
> I would like to follow the best practice here. So if you say that for
> this simple driver it's not usual, I won't add me. Except if you think
> it is useful to have someone to blame for it ;-)

People will always have your email in the driver, so I'd ignore
that warning as Pavel already proposed.

>>> Please point me to some documentation if I did miss some big points for
>>> submitting patches.
>>>
>>>
>>>    .../bindings/leds/leds-ubnt-spi.txt           | 49 +++++++++++++++++++
>>>    1 file changed, 49 insertions(+)
>>>    create mode 100644
>>> Documentation/devicetree/bindings/leds/leds-ubnt-spi.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-ubnt-spi.txt
>>> b/Documentation/devicetree/bindings/leds/leds-ubnt-spi.txt
>>> new file mode 100644
>>> index 000000000000..ab1478cdc139
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-ubnt-spi.txt
>>> @@ -0,0 +1,49 @@
>>> +Binding for the controller based LED found in Ubiquity airCube ISP
>>> and most
>>> +likely some other Ubiquity devices.
>>> +
>>> +The protocol of the controller is quite simple. Only one byte will be
>>> sent. The
>>> +value of the byte can be between the ubnt-spi,off_bright value and the
>>> +ubnt-spi,max_bright value.
>>> +
>>> +The driver maybe can be used for other devices with a similar
>>> protocol too.
>>> +
>>> +Required properties:
>>> +- compatible:        Should be "ubnt,spi-led".
>>> +- spi-max-frequency:    Should be <100000> for this device.
>>> +
>>> +Optional sub-node properties:
>>> +- ubnt-spi,off_bright:    The value that will be sent if the LED
>>> should be
>>> +            switched off. Default value is 0.
>>> +- ubnt-spi,max_bright:    Value for the maximum brightness. Default
>>> value for that
>>> +            is 63.
>>> +- label:        A label for the LED. If one is given, the LED will be
>>> +            named "ubnt-spi:<label>" or "ubnt-spi::" otherwise.
>>> +
>>> +Being a SPI device this driver should be a sub-node of a SPI
>>> controller. The
>>> +controller only supports one LED. For consistence with other
>>> controllers, the
>>> +LED is defined as a sub-node.
>>> +
>>> +Example for the airCube ISP (with SPI controller matching that device):
>>> +
>>> +led_spi {
>>> +    compatible = "spi-gpio";
>>> +    #address-cells = <1>;
>>> +    #size-cells = <0>;
>>> +
>>> +    gpio-sck = <&gpio 3 GPIO_ACTIVE_HIGH>;
>>> +    gpio-mosi = <&gpio 2 GPIO_ACTIVE_HIGH>;
>>> +    cs-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
>>> +    num-chipselects = <1>;
>>
>> SPI node implementation is out of LED bindings scope.
>> Here you're showing spi-gpio configuration, but people are free to use
>> hardware SPI module if available on the platform of their choice.
>>
>> Effectively, please remove above led_spi node. You can compare other SPI
>> based LED bindings, e.g.:
>>
>> Documentation/devicetree/bindings/leds/leds-cr0014114.txt
> 
> Reason behind adding it was that most likely the controller is only
> useful for that device. Of course that's no longer true together with
> the suggestion from Pavel Machek to make it more generic.
> 
> I'll follow your suggestion.

Thank you.
>>> +    led_ubnt@0 {
>>
>> s/led_usbnt/led-controller/
>>
>>> +        compatible = "ubnt,spi-led";
>>> +        reg = <0>;
>>> +        spi-max-frequency = <100000>;
>>> +
>>> +        led {
>>> +            label = "system";
>>
>> In label we expect "color:function" pattern. If section is to be left
>> empty than just leave it blank, e.g.:
>>
>>              label = ":system"
>>
>> But, is this LED function name telling something useful?
>> What is the actual function of this LED?
> 
> The LED is a white one. It's the only LED of a WLAN access point. There
> are not even any network LEDs. Ubiquiti uses it to show some system
> states with different pulsing patterns during boot. After that it's
> always on.
> 
> In OpenWRT it maybe could also show some network traffic (blinking
> between dim and bright). But that's user configurable. My plan was to
> just let it dim when the system is booted.

Thank you for this explanation.

>>
>> I work for some time on LED unification patch set and there is
>> a patch with common LED function names [0], but there is nothing
>> suitable for access points. There is "wlan", but is is rather for
>> wifi dongle LEDs (side note: "wifi" seems to be more ubiquitous,
>> so I will probably go for it finally).
>>
>> So, maybe we for access points "wifi-ap" would work?
>> i.e. I propose the label in the form:
>>
>>              label  = ":wifi-ap"
>>
> 
> I wasn't aware of that list. Maybe "power" or even better "status" would
> match the function.

Hmm, I've just found out that there are two "wlan-ap" occurrences in
the existing mainline bindings, so I propose to follow that.

> Should I add the color too? So "white:status"?

Yes, why not if it is known. So, having the above I propose:

		label = "white:wlan-ap";

>>
>>> +            /* keep the LED slightly on to show powered device */
>>> +            ubnt-spi,off_bright = /bits/ 8 <4>;
>>> +        };
>>> +    };
>>> +};
>>>
>>
>> [0] https://www.spinics.net/lists/kernel/msg3103824.html
>>
> 

-- 
Best regards,
Jacek Anaszewski
