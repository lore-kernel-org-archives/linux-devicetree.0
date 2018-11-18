Return-Path: <SRS0=qRW3=N5=gmail.com=marek.vasut@kernel.org>
Subject: Re: [PATCH] dt-bindings: can: rcar_can: document r8a77990 support
References: <20181118173056.4591-1-marek.vasut+renesas@gmail.com>
 <20181118231428.GD2553@kunai>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <f45e099c-fd4f-0c12-dbde-6b4988f5ff9a@gmail.com>
Date: Mon, 19 Nov 2018 00:22:58 +0100
MIME-Version: 1.0
In-Reply-To: <20181118231428.GD2553@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa@the-dreams.de>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 11/19/2018 12:14 AM, Wolfram Sang wrote:
> On Sun, Nov 18, 2018 at 06:30:56PM +0100, Marek Vasut wrote:
>> Document the support for rcar_can on R8A77990 SoC devices.
>> Add R8A77990 to the list of SoCs which require the "assigned-clocks"
>> and "assigned-clock-rates" properties.
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
>>  Documentation/devicetree/bindings/net/can/rcar_can.txt | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/can/rcar_can.txt b/Documentation/devicetree/bindings/net/can/rcar_can.txt
>> index 9936b9ee67c3..d962138d5b50 100644
>> --- a/Documentation/devicetree/bindings/net/can/rcar_can.txt
>> +++ b/Documentation/devicetree/bindings/net/can/rcar_can.txt
>> @@ -16,6 +16,7 @@ Required properties:
>>  	      "renesas,can-r8a7795" if CAN controller is a part of R8A7795 SoC.
>>  	      "renesas,can-r8a7796" if CAN controller is a part of R8A7796 SoC.
>>  	      "renesas,can-r8a77965" if CAN controller is a part of R8A77965 SoC.
> 
> I was wondering why you didn't have a patch adding support for R8A77965.
> I see it is already added here but can't find a tree where this line
> exists (no linus/master or renesas-drivers/master). Did you maybe forgot
> to send out a patch?

Try and grep for 'renesas,rcar-gen3-can' , the drivers are in
drivers/net/can/rcar/ . They both match on the generic compatible.

-- 
Best regards,
Marek Vasut
