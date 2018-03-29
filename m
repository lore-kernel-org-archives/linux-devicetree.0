Return-Path: <SRS0=RDcm=GT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:50205 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751325AbeC2Sz3 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 29 Mar 2018 14:55:29 -0400
Subject: Re: [PATCH 1/2] dt-bindings: Add vendor prefix and docs for CR0014114
References: <20180326121506.9528-1-oleg@kaa.org.ua>
 <20180327164903.6307-1-oleg@kaa.org.ua>
 <66fb58b2-2ae7-8edf-6c48-0f78f82c31a2@gmail.com>
 <005611b1-b821-93d2-4bb5-c3f12b4fc937@kaa.org.ua>
 <83ebdd21-ed70-666d-0d20-093ff52a208b@gmail.com>
 <60ba4d40-42f3-66f9-0001-b19b57f5d1a4@kaa.org.ua>
 <d253fd08-3226-f2d9-aebf-2c2a52e27d58@gmail.com>
From: Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <d4bb7fda-3e31-1fdf-567b-945563d4e3e2@kaa.org.ua>
Date: Thu, 29 Mar 2018 21:56:52 +0300
MIME-Version: 1.0
In-Reply-To: <d253fd08-3226-f2d9-aebf-2c2a52e27d58@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 28.03.18 23:23, Jacek Anaszewski wrote:
> On 03/28/2018 09:48 PM, Oleh Kravchenko wrote:
>>
>>
>> On 28.03.18 22:21, Jacek Anaszewski wrote:
>>> On 03/28/2018 08:36 AM, Oleh Kravchenko wrote:
>>>> Hello Jacek,
>>>>
>>>> On 27.03.18 23:58, Jacek Anaszewski wrote:
>>>>>> +Example
>>>>>> +-------
>>>>>> +
>>>>>> +led-controller@0 {
>>>>>> +	compatible = "crane,cr0014114";
>>>>>> +	reg = <0>;
>>>>>> +	spi-max-frequency = <50000>;
>>>>>> +	#address-cells = <1>;
>>>>>> +	#size-cells = <0>;
>>>>>> +
>>>>>> +	led@0 {
>>>>>> +		reg = <0>;
>>>>>> +		label = "cr0:red:coin";
>>>>>> +	};
>>>>>> +	led@1 {
>>>>>> +		reg = <1>;
>>>>>> +		label = "cr0:green:coin";
>>>>>> +	};
>>>>>> +	led@2 {
>>>>>> +		reg = <2>;
>>>>>> +		label = "cr0:blue:coin";
>>>>>> +	};
>>>>>> +	led@3 {
>>>>>> +		reg = <3>;
>>>>>> +		label = "cr1:red:bill";
>>>>>> +	};
>>>>>> +	led@4 {
>>>>>> +		reg = <4>;
>>>>>> +		label = "cr1:green:bill";
>>>>>> +	};
>>>>>> +	led@5 {
>>>>>> +		reg = <5>;
>>>>>> +		label = "cr1:blue:bill";
>>>>>> +	};
>>>>>
>>>>> Why cr0 and cr1? It should be cr0014114 to stick to the
>>>>> current LED naming pattern <devicename:colour:function>.
>>>>>
>>>>> Nonetheless, we lately came to the conclusion that devicename
>>>>> segment is redundant in LED class device name, so until we change
>>>>> LED naming convention officially, let's remove devicename segment
>>>>> at least from DT and prepend the label with "cr0014114" in the driver.
>>>>>
>>>>> Please compare how it is approached in [0] (not merged yet).
>>>>>
>>>>
>>>> It's just example.
>>>> But anyway our applications works with LEDs by numbers.
>>>>
>>>> Using function names instead numbers will increase code complexity,
>>>> so we use numbers :)
>>>
>>> This is LED class device naming convention in mainline and examples
>>> also must stick to it to keep the things consistent.
>>>
>>> Please switch labels so that they matched the pattern
>>>
>>> label = "color:function";
>>
>>> Why cr0 and cr1? It should be cr0014114 to stick to the
>>> current LED naming pattern <devicename:colour:function>.
>>
>> So how it should be? I'm confused :(
> 
> You seem to have overlooked second part of my previous message:
> 
> "
> Nonetheless, we lately came to the conclusion that devicename
> segment is redundant in LED class device name, so until we change
> LED naming convention officially, let's remove devicename segment
> at least from DT and prepend the label with "cr0014114" in the driver.
> 
> Please compare how it is approached in [0] (not merged yet).
> "
> 
> Please note that DT label is not intended to be used as-is
> for LED class device name, but it's been frequently abused so.
> 
> Here is the example of how you could modify your code:
> 
> DT:
> 
> led@0 {
> 	reg = <0>;
> 	label = "red:coin";
> };
> 
> LED class driver:
> 
> #include <uapi/linux/uleds.h>
> 
> 
> struct cr0014114_led {
>         char                    name[LED_MAX_NAME_SIZE];
>         struct cr0014114        *priv;
>         struct led_classdev     ldev;
>         u8                      brightness;
> };
> 
> 
> static int cr0014114_probe_dt(struct cr0014114 *priv)
> {
> ...
> const char *str;
> ...
> device_for_each_child_node(priv->dev, child)
> {
> ...
> if (fwnode_property_read_string(child, "label", &str))
> 	snprintf(led->name, sizeof(led->name), "cr0014114::"),
> else
> 	snprintf(led->name, sizeof(led->name), "cr0014114:%s", str),
> 
> 
> I hope it makes all clear now.

I would like to keep current implementation.
This is acceptable?

-- 
Best regards,
Oleh Kravchenko

