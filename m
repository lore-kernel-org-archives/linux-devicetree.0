Return-Path: <SRS0=U7M/=T4=denx.de=marex@kernel.org>
Subject: Re: [PATCH 1/2] media: dt-bindings: Add Intersil ISL7998x DT bindings
References: <20190520201812.7937-1-marex@denx.de>
 <20190528114758.a4oac3zgdy7dkx7k@uno.localdomain>
 <6cd36678-2a2c-2a43-e245-4263c0e0f666@denx.de>
 <20190528151036.nxsh7tjyqrbpbrhy@uno.localdomain>
From: Marek Vasut <marex@denx.de>
Message-ID: <08c1a65e-dcc5-e1ae-053a-823931b9ec15@denx.de>
Date: Tue, 28 May 2019 19:49:57 +0200
MIME-Version: 1.0
In-Reply-To: <20190528151036.nxsh7tjyqrbpbrhy@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 5/28/19 5:10 PM, Jacopo Mondi wrote:
[...]

>>> From my understanding of the product page, both the ISL79987 and
>>> ILS79988 devices support up to 4 analog inputs, and provide a CSI-2
>>> output and a BT656 output respectively.
>>>
>>> What am I reading wrong ?
>>
>> ISL79987 is analog video to mipi csi2 ; I have this chip.
>> ISL79988 is analog video to bt656 ; I don't have this chip.
>>
> 
> So please change the description to "Analog to MIPI CSI-2/BT565
> decoder"

Done

>>> [1] https://www.renesas.com/eu/en/products/audio-video/video-decoders-encoders/video-decoders/device/ISL79987.html
>>>
>>>> +Required Properties:
>>>> +- compatible: value should be "isil,isl79987"
> 
> And here you might want to have 2 different compatibles for 79987 and
> 79988.

The 79988 is not supported yet, do we want to have it in the binding doc?

[...]

>>> I see from the example you only support one output port? How do you
>>> model the input ones.
>>
>> I don't . Do we model analog inputs now somehow ?
> 
> I really think so, please see:
> Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> 
> And as an example of a board device tree using connectors to model
> analog input see how the cvbs input on Salvator-X is described:
> 
> 	cvbs-in {
> 		compatible = "composite-video-connector";
> 		label = "CVBS IN";
> 
> 		port {
> 			cvbs_con: endpoint {
> 				remote-endpoint = <&adv7482_ain7>;
> 			};
> 		};
> 	};
> 
> I think you should provide 4 input ports, where to connect input from
> the analog connectors, and derive the number of enabled inputs from
> the number of endpoints connected to an active remote.

Deriving the number of active physical inputs from some existing binding
makes sense.

However unlike the adv7482, the isl79987 does not support remapping the
physical inputs to ADCs in the chip. It does support some remapping of
physical inputs to MIPI CSI2 channels, but that's probably not very useful.

> Also, you might want to provide 2 output ports, one CSI-2 and one
> BT565 and parse the right one depending on the compatible string.

The chip only has one physical output port (either CSI2 or parallel) and
DT should model the hardware, so I would expect there to be one output
port per chip ?

> I would also place the input ports last (from port@2 to port@5) so
> that we make easier to support similar chips with more inputs (if
> any).
> 
> That said, I'm no expert of analog video, so others might have
> different opinions :)
> 
> Thanks
>    j
> 
>>
>> --
>> Best regards,
>> Marek Vasut


-- 
Best regards,
Marek Vasut
