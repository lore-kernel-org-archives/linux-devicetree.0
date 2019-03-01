Return-Path: <SRS0=uVY8=RE=xs4all.nl=hverkuil@kernel.org>
Subject: Re: [PATCH 1/5] media: dt-bindings: media: rcar-csi2: Add r8a774a1
 support
References: <1536589878-26218-1-git-send-email-biju.das@bp.renesas.com>
 <1536589878-26218-2-git-send-email-biju.das@bp.renesas.com>
 <TYXPR01MB1775F18270FB477D010C180EC0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
 <8a5429a0-b4c5-a208-3e56-406bd031b01b@xs4all.nl>
 <CAMuHMdXOcFaQiLUNiuUS_p5H0r3ZWMrWd09m5xZk4qitvLS25g@mail.gmail.com>
 <3b702231-8d50-8434-177c-716203dac7b2@xs4all.nl>
 <OSBPR01MB21034BCCB73E585F2BC8C03CB8760@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f6a3e336-9d44-aa06-5f92-e08398b6e992@xs4all.nl>
Date: Fri, 1 Mar 2019 14:19:00 +0100
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB21034BCCB73E585F2BC8C03CB8760@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Biju Das <biju.das@bp.renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

Can you do the following:

1) forward both of Rob's replies with his Reviewed-by tag to linux-media,
   that way I have seen it.
2) rebase the patch series and add all Reviewed-by etc. tags and post as
   a v2. I'll pick it up and make sure it will get merged. Not sure if we
   can manage 5.1, but it will certainly get in 5.2.

Regards,

	Hans

On 3/1/19 2:12 PM, Biju Das wrote:
> Hi Hans,
> 
> Thanks for the feedback.
> 
>> -----Original Message-----
>> From: Hans Verkuil <hverkuil@xs4all.nl>
>> Sent: 01 March 2019 13:09
>> To: Geert Uytterhoeven <geert@linux-m68k.org>
>> Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>; Mauro Carvalho
>> Chehab <mchehab@kernel.org>; Biju Das <biju.das@bp.renesas.com>;
>> Niklas Söderlund <niklas.soderlund@ragnatech.se>; linux-
>> media@vger.kernel.org; linux-renesas-soc@vger.kernel.org;
>> devicetree@vger.kernel.org; Simon Horman <horms@verge.net.au>; Geert
>> Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
>> <Chris.Paterson2@renesas.com>; Rob Herring <robh+dt@kernel.org>; Mark
>> Rutland <mark.rutland@arm.com>; Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com>
>> Subject: Re: [PATCH 1/5] media: dt-bindings: media: rcar-csi2: Add r8a774a1
>> support
>>
>> On 3/1/19 1:58 PM, Geert Uytterhoeven wrote:
>>> Hi Hans,
>>>
>>> On Fri, Mar 1, 2019 at 1:55 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>> It looks like this series fell through the cracks.
>>>>
>>>> I looked at it and the main problem is that it is missing a
>>>> Reviewed-by from Rob Herring (devicetree maintainer). It's a bit
>>>> surprising since he is usually fairly prompt.
>>>
>>> He actually did provide his Rb on Sep 17.
>>
>> Hmm, I don't see anything about that in my linux-media archive, and
>> patchwork didn't pick that up either.
>>
>> Was linux-media in the CC list of Rob's reply?
> 
> Yes. Please see below.
> 
>> -----Original Message-----
>> From: Rob Herring <robh@kernel.org>
>> Sent: 17 September 2018 06:45
>> To: Biju Das <biju.das@bp.renesas.com>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>; Mark Rutland
>> <mark.rutland@arm.com>; Biju Das <biju.das@bp.renesas.com>; Niklas
>> Söderlund <niklas.soderlund@ragnatech.se>; linux-media@vger.kernel.org;
>> linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; Simon
>> Horman <horms@verge.net.au>; Geert Uytterhoeven
>> <geert+renesas@glider.be>; Chris Paterson
>> <Chris.Paterson2@renesas.com>; Fabrizio Castro
>> <fabrizio.castro@bp.renesas.com>
>> Subject: Re: [PATCH 1/5] media: dt-bindings: media: rcar-csi2: Add r8a774a1
>> support
>>
>> On Mon, 10 Sep 2018 15:31:14 +0100, Biju Das wrote:
>>> Document RZ/G2M (R8A774A1) SoC bindings.
>>>
>>> The RZ/G2M SoC is similar to R-Car M3-W (R8A7796).
>>>
>>> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>>> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>>> ---
>>>  Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt | 5 +++--
>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Regards,
> Biju
> 
> 
> Renesas Electronics Europe GmbH,Geschaeftsfuehrer/President : Michael Hannawald, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, 40472 Duesseldorf, Germany,Handelsregister/Commercial Register: Duesseldorf, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WEEE reg. no.: DE 14978647
> 
