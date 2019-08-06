Return-Path: <SRS0=Ydm7=WC=denx.de=marex@kernel.org>
From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] media: dt-bindings: Add Intersil ISL7998x DT bindings
References: <20190520201812.7937-1-marex@denx.de>
 <20190528114758.a4oac3zgdy7dkx7k@uno.localdomain>
 <6cd36678-2a2c-2a43-e245-4263c0e0f666@denx.de>
 <20190528151036.nxsh7tjyqrbpbrhy@uno.localdomain>
 <08c1a65e-dcc5-e1ae-053a-823931b9ec15@denx.de>
 <20190529062844.bsdg7u7rgvkcmq6k@uno.localdomain>
 <e481c8a1-a0c8-f0d9-9df7-e016e5c3bc57@denx.de>
 <59881e2a-56c2-3801-2058-d939b25d6259@gmail.com>
 <acb6c57e-49da-614b-d9fd-833b5eca131c@denx.de>
 <20190529134321.3naykdw4jx5xu3jl@uno.localdomain>
Message-ID: <3a8dc708-a504-714f-8799-7e4622f42d02@denx.de>
Date: Tue, 6 Aug 2019 15:35:41 +0200
MIME-Version: 1.0
In-Reply-To: <20190529134321.3naykdw4jx5xu3jl@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Ian Arkver <ian.arkver.dev@gmail.com>, linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 5/29/19 3:43 PM, Jacopo Mondi wrote:
> HI Marek,

Hi,

> On Wed, May 29, 2019 at 01:09:47PM +0200, Marek Vasut wrote:
>> On 5/29/19 1:04 PM, Ian Arkver wrote:
>>> Hi,
>>>
>>> On 29/05/2019 11:41, Marek Vasut wrote:
>>>> On 5/29/19 8:28 AM, Jacopo Mondi wrote:
>>>>
>>>> [...]
>>>>
>>>>>>>>> [1]
>>>>>>>>> https://www.renesas.com/eu/en/products/audio-video/video-decoders-encoders/video-decoders/device/ISL79987.html
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> +Required Properties:
>>>>>>>>>> +- compatible: value should be "isil,isl79987"
>>>>>>>
>>>>>>> And here you might want to have 2 different compatibles for 79987 and
>>>>>>> 79988.
>>>>>>
>>>>>> The 79988 is not supported yet, do we want to have it in the binding
>>>>>> doc?
>>>>>>
>>>>>
>>>>> I got mislead by the isl7998x naming scheme you used...
>>>>>
>>>>> I would say that's up to you, the two chips seems very similar,
>>>>> and it might make sense to provide bindings that support both. At the
>>>>> same time, as long as the here defined bindings does not prevent
>>>>> future expansions to include the ISL79988, its support could be safely
>>>>> post-poned. In that case please s/isl7998x/isl79987/ in this document
>>>>> and do not mention BT565 in the description.
>>>>
>>>> Right
>>>>
>>>>>> [...]
>>>>>>
>>>>>>>>> I see from the example you only support one output port? How do you
>>>>>>>>> model the input ones.
>>>>>>>>
>>>>>>>> I don't . Do we model analog inputs now somehow ?
>>>>>>>
>>>>>>> I really think so, please see:
>>>>>>> Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
>>>>>>>
>>>>>>>
>>>>>>> And as an example of a board device tree using connectors to model
>>>>>>> analog input see how the cvbs input on Salvator-X is described:
>>>>>>>
>>>>>>>     cvbs-in {
>>>>>>>         compatible = "composite-video-connector";
>>>>>>>         label = "CVBS IN";
>>>>>>>
>>>>>>>         port {
>>>>>>>             cvbs_con: endpoint {
>>>>>>>                 remote-endpoint = <&adv7482_ain7>;
>>>>>>>             };
>>>>>>>         };
>>>>>>>     };
>>>>>>>
>>>>>>> I think you should provide 4 input ports, where to connect input from
>>>>>>> the analog connectors, and derive the number of enabled inputs from
>>>>>>> the number of endpoints connected to an active remote.
>>>>>>
>>>>>> Deriving the number of active physical inputs from some existing
>>>>>> binding
>>>>>> makes sense.
>>>>>>
>>>>>> However unlike the adv7482, the isl79987 does not support remapping the
>>>>>> physical inputs to ADCs in the chip. It does support some remapping of
>>>>>> physical inputs to MIPI CSI2 channels, but that's probably not very
>>>>>> useful.
>>>>>>
>>>>>
>>>>> I understand, but I will now use against you the argument you have
>>>>> correctly pointed out here below that DT should describe hardware, and
>>>>> the hardware has indeed 4 input ports..
>>>>
>>>> My question here is whether it makes sense to describe the ports even if
>>>> they cannot be muxed to different ADC. Does it ?
>>>
>>> Each input port can be either differential CVBS or single ended with a
>>> 2:1 input select mux. It would be nice to be able to describe this.
>>
>> Where do you see that ?
>>
>>> You cannot remap the inputs to different ADCs, but you can remap the
>>> ADCs to different VC IDs using the
>>> ISL7998x_REG_P5_LI_ENGINE_VC_ASSIGNMENT register. Describing each input
>>> would proivde somewhere to specify the vc-id.
>>
>> I think Jacopo mentioned above the input muxing and the MIPI CSI2 VC
>> muxing are two separate things. But I have to wonder, do we have a way
>> of muxing the VCs in the DT or via the media controller yet ?
> 
> I'm not sure I get what you mean with "input muxing", do you mean
> controlling which input is directed to which ADC ?

Yes

> I don't have the
> chip manual, but according to what you and Ian said this is not
> possible.

Correct. You can only remap ADC output(s) to different MIPI CSI2 VC(s).

> Selecting which input video stream is directed to which CSI-2 virtual
> channel in the output CSI-2 stream is not possible in mainline. There
> are patches in development that would allow you to do so, but their
> design is not fully finalized yet. They would, in any case, require
> you to have one sink pad for each input port

Right, and the iMX6 CSI2 driver which I use for development doesn't
support that yet either.

>, and while you could
> register as many pads as it is specified in your custom property,
> you would loose the notion of which input is connected to which port
> ie. when a single input (isil,num-inputs=1) is connected to an input
> port which is not the first one (anyway, quickly looking at 2/2 it
> seems to me you only register a single source pad for this device).
> 
> The DT bindings layout is an orthogonal problem though. My opinion is
> that as the chip has 4 available input connections it should have 4
> input ports in the bindings definition, and for each one you would
> register a sink pad.

Who would be the source for such an input "sink" pad though ? I looked
at
Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt,
as you suggested above, but this is for video _OUTPUT_ devices, not
input devices, so that's likely not what I want.

> Only the actually connected ones should be present
> in the DTS, so that the driver knows which input port is active and,
> once something that allows you to control VC will land in mainline,
> it will let you tell something like "I want the video stream
> received on the input port@2 sent in virtual channel x in the output
> CSI-2 stream", but again this is quite an orthogonal issue. Sure thing
> is that with the current design and implementation, which afaict does
> not provides any sink pad, this is frowned upon (but you can then say
> 'who cares, since it's not here yet' :)

Fine, so let's ignore this for now.

> Or what Ian said, if you can model a connector that provides 2 single
> ended inputs, each connected to an input port and muxed internally by
> the chip, you could only do that if you have numbered input ports I
> guess. Nobody requires you support any of these, but at least bindings
> should be defined in a future proof way, to avoid later changes to the
> ABI.

Well, if endpoint 0 is the MIPI CSI2 output, then you can always add
more endpoints (1..4) for the analog inputs . In this way , the bindings
are already future-proof.

Or shall the input ports come first (as endpoints 0..3) and be followed
by the MIPI CSI2 output (4) ? If so, that would make counting the
(varying number of) inputs a bit cumbersome in the driver.

> Anyway, you had my opinion, multiple times already, and as I'm not in
> any position to judge if something is acceptable for merge or not,
> I'll now get quiet hoping that this prolonged email exchange drags in
> opinion from more experienced people to tell you which direction you
> should take and if what you have here is fine already or not :)
> 
> Cheers
>    j
> 
>>
>> --
>> Best regards,
>> Marek Vasut

-- 
Best regards,
Marek Vasut
