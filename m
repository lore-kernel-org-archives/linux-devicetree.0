Return-Path: <SRS0=f1WY=PK=skidata.com=prvs=898d4ecf4=Richard.Leitner@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: usb251xb: add documentation for
 data lane swapping
References: <20181219145941.5173-1-m.felsch@pengutronix.de>
 <20181228234525.GA30428@bogus>
 <20181231110514.e3lrninzybg5vhvw@pengutronix.de>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <dfcbf6ae-be39-ec8c-9018-05221372098c@skidata.com>
Date: Wed, 2 Jan 2019 06:44:51 +0100
MIME-Version: 1.0
In-Reply-To: <20181231110514.e3lrninzybg5vhvw@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh@kernel.org>
Cc: fancer.lancer@gmail.com, kernel@pengutronix.de, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

On 31/12/2018 12:05, Marco Felsch wrote:
> Hi,
> 
> On 18-12-28 17:45, Rob Herring wrote:
>> On Wed, Dec 19, 2018 at 03:59:40PM +0100, Marco Felsch wrote:
>>> Add optional binding to allow USB differential-pair (D+/D-) data lane
>>> swapping. The swapping can be specified for each port separately,
>>> default is no swapping.
>>>
>>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>>> ---
>>>   Documentation/devicetree/bindings/usb/usb251xb.txt | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
>>> index 168ff819e827..aec93a92870d 100644
>>> --- a/Documentation/devicetree/bindings/usb/usb251xb.txt
>>> +++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
>>> @@ -64,6 +64,8 @@ Optional properties :
>>>    - power-on-time-ms : Specifies the time it takes from the time the host
>>>   	initiates the power-on sequence to a port until the port has adequate
>>>   	power. The value is given in ms in a 0 - 510 range (default is 100ms).
>>> + - sw-dx-lanes-ports : Specifies the ports which will swap the differential-pair
>>> +	(D+/D-), default is not-swapped.
>>
>> Perhaps 'swap-dx-ports' would be a more obvious name.
> 
> What you think about 'swap-dx-lanes' since it has nothing to do with
> port swapping, it's rather swapping port properties internally.

I'd also prefer 'swap-dx-lanes'. For me it's short and clear.

The only downside is that the feature is called "PORT SWAP" in the
datasheet. Therefore you should maybe mention it in a comment somewhere
in the code so people know what to look for in the datasheet?

regards;Richard.L
