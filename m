Return-Path: <SRS0=qRW3=N5=gmail.com=marek.vasut@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: can: rcar_canfd: document r8a77965
 support
References: <20181118173201.4645-1-marek.vasut+renesas@gmail.com>
 <20181118231807.GE2553@kunai>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <9872ca46-7e38-5d45-0d1d-eddfc0f0fa56@gmail.com>
Date: Mon, 19 Nov 2018 00:21:55 +0100
MIME-Version: 1.0
In-Reply-To: <20181118231807.GE2553@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa@the-dreams.de>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 11/19/2018 12:18 AM, Wolfram Sang wrote:
> 
>> +  - "renesas,r8a77965-canfd" for R8A77965 (R-Car M3-N) compatible controller.
> 
> Eeeks, the 'canfd' is a suffix here not a prefix :( Not your issue,
> of course. But Simon, shall we fix that for all CANFD?
> 
>> -Required properties for "renesas,r8a7795-canfd" and "renesas,r8a7796-canfd"
>> -compatible:
>> -In R8A7795 and R8A7796 SoCs, canfd clock is a div6 clock and can be used by both
>> -CAN and CAN FD controller at the same time. It needs to be scaled to maximum
>> -frequency if any of these controllers use it. This is done using the below
>> -properties:
>> +Required properties for "renesas,r8a7795-canfd", "renesas,r8a7796-canfd" and
>> +"renesas,r8a77965-canfd" compatible:
>> +In R8A7795, R8A7796 and R8A77965 SoCs, canfd clock is a div6 clock and can
>> +be used by both CAN and CAN FD controller at the same time. It needs to be
>> +scaled to maximum frequency if any of these controllers use it. This is done
>> +using the below properties:
> 
> I think updating this paragraph does not scale. Maybe we should reformat
> it the way as for plain CAN, so only in the header the new SoC gets
> added? We can fix this incrementally, though, doesn't need to be
> addressed within this patch.

Sure, although I don't expect it to grow much more than this.

-- 
Best regards,
Marek Vasut
