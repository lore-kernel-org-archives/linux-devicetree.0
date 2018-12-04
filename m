Return-Path: <SRS0=yj3V=ON=gmail.com=marek.vasut@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: can: rcar_canfd: document r8a77965
 support
References: <20181118173201.4645-1-marek.vasut+renesas@gmail.com>
 <20181204225603.GA16478@bogus>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <a2034a8d-a312-928c-e6e7-b026ab34435b@gmail.com>
Date: Wed, 5 Dec 2018 00:44:50 +0100
MIME-Version: 1.0
In-Reply-To: <20181204225603.GA16478@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Marc Kleine-Budde <mkl@pengutronix.de>, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 12/04/2018 11:56 PM, Rob Herring wrote:
> On Sun, Nov 18, 2018 at 06:32:00PM +0100, Marek Vasut wrote:
>> Document the support for rcar_canfd on R8A77965 SoC devices.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Eugeniu Rosca <erosca@de.adit-jv.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Simon Horman <horms+renesas@verge.net.au>
>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>>  .../devicetree/bindings/net/can/rcar_canfd.txt      | 13 +++++++------
>>  1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
>> index ac71daa46195..4720e916fbdd 100644
>> --- a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
>> +++ b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
>> @@ -6,6 +6,7 @@ Required properties:
>>    - "renesas,rcar-gen3-canfd" for R-Car Gen3 compatible controller.
>>    - "renesas,r8a7795-canfd" for R8A7795 (R-Car H3) compatible controller.
>>    - "renesas,r8a7796-canfd" for R8A7796 (R-Car M3-W) compatible controller.
>> +  - "renesas,r8a77965-canfd" for R8A77965 (R-Car M3-N) compatible controller.
>>    - "renesas,r8a77970-canfd" for R8A77970 (R-Car V3M) compatible controller.
>>    - "renesas,r8a77980-canfd" for R8A77980 (R-Car V3H) compatible controller.
>>  
>> @@ -26,12 +27,12 @@ The name of the child nodes are "channel0" and "channel1" respectively. Each
>>  child node supports the "status" property only, which is used to
>>  enable/disable the respective channel.
>>  
>> -Required properties for "renesas,r8a7795-canfd" and "renesas,r8a7796-canfd"
>> -compatible:
>> -In R8A7795 and R8A7796 SoCs, canfd clock is a div6 clock and can be used by both
>> -CAN and CAN FD controller at the same time. It needs to be scaled to maximum
>> -frequency if any of these controllers use it. This is done using the below
>> -properties:
>> +Required properties for "renesas,r8a7795-canfd", "renesas,r8a7796-canfd" and
>> +"renesas,r8a77965-canfd" compatible:
>> +In R8A7795, R8A7796 and R8A77965 SoCs, canfd clock is a div6 clock and can
> 
> Do we have to list the SoCs twice so that the paragraph has to be 
> reformatted every time? Just the compatibles above should be enough.

We don't , but that's about it for the SoCs that need this.

>> +be used by both CAN and CAN FD controller at the same time. It needs to be
>> +scaled to maximum frequency if any of these controllers use it. This is done
>> +using the below properties:
>>  
>>  - assigned-clocks: phandle of canfd clock.
>>  - assigned-clock-rates: maximum frequency of this clock.
>> -- 
>> 2.18.0
>>


-- 
Best regards,
Marek Vasut
