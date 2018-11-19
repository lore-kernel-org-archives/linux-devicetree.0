Return-Path: <SRS0=BGVs=N6=gmail.com=marek.vasut@kernel.org>
Subject: Re: [PATCH] dt-bindings: can: rcar_can: document r8a77990 support
References: <20181118173056.4591-1-marek.vasut+renesas@gmail.com>
 <20181118231428.GD2553@kunai>
 <f45e099c-fd4f-0c12-dbde-6b4988f5ff9a@gmail.com>
 <CAMuHMdXHK-asgL-9-PTjjYG1gA21qcxaTGy7H13BXVhdrw7u+Q@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <0b9a2baa-da8b-595c-6d93-7d1f3b82d769@gmail.com>
Date: Mon, 19 Nov 2018 15:19:18 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXHK-asgL-9-PTjjYG1gA21qcxaTGy7H13BXVhdrw7u+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 11/19/2018 10:38 AM, Geert Uytterhoeven wrote:
> Hi Marek, Wolfram,

Hi,

> On Mon, Nov 19, 2018 at 12:46 AM Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 11/19/2018 12:14 AM, Wolfram Sang wrote:
>>> On Sun, Nov 18, 2018 at 06:30:56PM +0100, Marek Vasut wrote:
>>>> Document the support for rcar_can on R8A77990 SoC devices.
>>>> Add R8A77990 to the list of SoCs which require the "assigned-clocks"
>>>> and "assigned-clock-rates" properties.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
>>>> --- a/Documentation/devicetree/bindings/net/can/rcar_can.txt
>>>> +++ b/Documentation/devicetree/bindings/net/can/rcar_can.txt
>>>> @@ -16,6 +16,7 @@ Required properties:
>>>>            "renesas,can-r8a7795" if CAN controller is a part of R8A7795 SoC.
>>>>            "renesas,can-r8a7796" if CAN controller is a part of R8A7796 SoC.
>>>>            "renesas,can-r8a77965" if CAN controller is a part of R8A77965 SoC.
>>>
>>> I was wondering why you didn't have a patch adding support for R8A77965.
>>> I see it is already added here but can't find a tree where this line
>>> exists (no linus/master or renesas-drivers/master). Did you maybe forgot
>>> to send out a patch?
>>
>> Try and grep for 'renesas,rcar-gen3-can' , the drivers are in
>> drivers/net/can/rcar/ . They both match on the generic compatible.
> 
> Marek: I think you misunderstood Wolfram's question.
> He asked about the DT bindings, not about the driver.

Ha, yes, I think I did.

> Wolfram: Eugenu's commit 4f145f14f6b98b5a ("dt-bindings: can:
> rcar_can: document r8a77965 support") is in next as of next-20181115 .
> However, it's not part of linux-can-next. Seems to be destined for v4.20 as
> a fix.
I'm always building on top of next, so that's why I didn't quite
understand the question.

-- 
Best regards,
Marek Vasut
