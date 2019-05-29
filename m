Return-Path: <SRS0=6oPw=T5=gmail.com=ian.arkver.dev@kernel.org>
Subject: Re: [PATCH 1/2] media: dt-bindings: Add Intersil ISL7998x DT bindings
References: <20190520201812.7937-1-marex@denx.de>
 <20190528114758.a4oac3zgdy7dkx7k@uno.localdomain>
 <6cd36678-2a2c-2a43-e245-4263c0e0f666@denx.de>
 <20190528151036.nxsh7tjyqrbpbrhy@uno.localdomain>
 <08c1a65e-dcc5-e1ae-053a-823931b9ec15@denx.de>
 <20190529062844.bsdg7u7rgvkcmq6k@uno.localdomain>
 <e481c8a1-a0c8-f0d9-9df7-e016e5c3bc57@denx.de>
From: Ian Arkver <ian.arkver.dev@gmail.com>
Message-ID: <59881e2a-56c2-3801-2058-d939b25d6259@gmail.com>
Date: Wed, 29 May 2019 12:04:14 +0100
MIME-Version: 1.0
In-Reply-To: <e481c8a1-a0c8-f0d9-9df7-e016e5c3bc57@denx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
To: Marek Vasut <marex@denx.de>, Jacopo Mondi <jacopo@jmondi.org>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

On 29/05/2019 11:41, Marek Vasut wrote:
> On 5/29/19 8:28 AM, Jacopo Mondi wrote:
> 
> [...]
> 
>>>>>> [1] https://www.renesas.com/eu/en/products/audio-video/video-decoders-encoders/video-decoders/device/ISL79987.html
>>>>>>
>>>>>>> +Required Properties:
>>>>>>> +- compatible: value should be "isil,isl79987"
>>>>
>>>> And here you might want to have 2 different compatibles for 79987 and
>>>> 79988.
>>>
>>> The 79988 is not supported yet, do we want to have it in the binding doc?
>>>
>>
>> I got mislead by the isl7998x naming scheme you used...
>>
>> I would say that's up to you, the two chips seems very similar,
>> and it might make sense to provide bindings that support both. At the
>> same time, as long as the here defined bindings does not prevent
>> future expansions to include the ISL79988, its support could be safely
>> post-poned. In that case please s/isl7998x/isl79987/ in this document
>> and do not mention BT565 in the description.
> 
> Right
> 
>>> [...]
>>>
>>>>>> I see from the example you only support one output port? How do you
>>>>>> model the input ones.
>>>>>
>>>>> I don't . Do we model analog inputs now somehow ?
>>>>
>>>> I really think so, please see:
>>>> Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
>>>>
>>>> And as an example of a board device tree using connectors to model
>>>> analog input see how the cvbs input on Salvator-X is described:
>>>>
>>>> 	cvbs-in {
>>>> 		compatible = "composite-video-connector";
>>>> 		label = "CVBS IN";
>>>>
>>>> 		port {
>>>> 			cvbs_con: endpoint {
>>>> 				remote-endpoint = <&adv7482_ain7>;
>>>> 			};
>>>> 		};
>>>> 	};
>>>>
>>>> I think you should provide 4 input ports, where to connect input from
>>>> the analog connectors, and derive the number of enabled inputs from
>>>> the number of endpoints connected to an active remote.
>>>
>>> Deriving the number of active physical inputs from some existing binding
>>> makes sense.
>>>
>>> However unlike the adv7482, the isl79987 does not support remapping the
>>> physical inputs to ADCs in the chip. It does support some remapping of
>>> physical inputs to MIPI CSI2 channels, but that's probably not very useful.
>>>
>>
>> I understand, but I will now use against you the argument you have
>> correctly pointed out here below that DT should describe hardware, and
>> the hardware has indeed 4 input ports..
> 
> My question here is whether it makes sense to describe the ports even if
> they cannot be muxed to different ADC. Does it ?

Each input port can be either differential CVBS or single ended with a 
2:1 input select mux. It would be nice to be able to describe this.

You cannot remap the inputs to different ADCs, but you can remap the 
ADCs to different VC IDs using the 
ISL7998x_REG_P5_LI_ENGINE_VC_ASSIGNMENT register. Describing each input 
would proivde somewhere to specify the vc-id.

Regards,
Ian
> 
> [...]
> 
