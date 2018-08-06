Return-Path: <SRS0=yPZG=KV=mentor.com=Vladimir_Zapolskiy@kernel.org>
Subject: Re: [PATCH 04/14] arm64: dts: renesas: r8a7795-es1: ulcb-kf: Use
 "renesas,ulcb" compatible
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <20180804231114.21420-5-erosca@de.adit-jv.com> <1889610.CmbOguoUMH@avalon>
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <5e95f9de-7111-53bc-dc2a-ba79f5075336@mentor.com>
Date: Mon, 6 Aug 2018 16:53:08 +0300
MIME-Version: 1.0
In-Reply-To: <1889610.CmbOguoUMH@avalon>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Magnus Damm <damm+renesas@opensource.se>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-renesas-soc@vger.kernel.org, Eugeniu Rosca <erosca@de.adit-jv.com>, Eugeniu Rosca <rosca.eugeniu@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Laurent,

[Adding Rob and DT ML]

On 08/06/2018 01:42 PM, Laurent Pinchart wrote:
> Hi Eugeniu,
> 
> Thank you for the patch.
> 
> On Sunday, 5 August 2018 02:11:04 EEST Eugeniu Rosca wrote:
>> Following the recent change in dt-bindings [1], switch from
>> "renesas,h3ulcb" to "renesas,ulcb" compatible string.
>>
>> [1] Documentation/devicetree/bindings/arm/shmobile.txt
>>
>> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
>> ---
>>  arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts
>> b/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts index
>> 06deb67c36c8..7a5b1dc64090 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts
>> +++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-ulcb-kf.dts
>> @@ -14,6 +14,6 @@
>>
>>  / {
>>  	model = "Renesas H3ULCB Kingfisher board based on r8a7795 ES1.x";
>> -	compatible = "shimafuji,kingfisher", "renesas,h3ulcb",
>> +	compatible = "shimafuji,kingfisher", "renesas,ulcb",
>>  		     "renesas,r8a7795";
> 
> This is unrelated to your patch, but due to the reason explained in my review 
> of 02/14, I think "shimafuji,kingfisher" should include the SoC name.
> 
> This brings up the topic of how to describe boards that are made of an SoC 
> "module" board plugged into an expansion "motherboard".
> 

Diving into (probably shatteredly recollected by me) history, a board
'compatible' property appears as a handle to deal with incomplete board
description represented in DTB, so that arch code or drivers can catch on it
and fill some board specific missing parts in runtime, commonly the related
code takes a shape of quirks.

If we accept it, SoC specific drivers would take their interest in SoC model
and revision, and out-of-SoC/platform/board drivers and legacy arch board
code can look at a PCB board model variant. Note that for both separated
but comparably large and important pieces of board/platform knowledge there
is a single compatible property in use, namely the compatible property of
the root node. Also note that both ePAPR and Devicetree Specification describe
'compatible' property of the root node as a special one, as "a list of
platform architectures with which this platform is compatible".

In my opinion a better board representation would be to add a 'soc' device
node as a child of the root node, and the former one has its own fixed
compatible property, but a protocol based on such view has to be agreed
and accepted firstly, and it falls into "forever unrealistic tasks" category.

Today the SoC part of compatible property value is still in active use, and
PCB\SoC part is almost abandoned, so I would propose to diminish the asset
of the latter. Since both board/platform descriptions are alloyed in one
list of values, I'd like to see a better description of acceptable values
of 'compatible' property of the root node.

The common practice is to put SoC specific values into the right tail,
and place (kind of optional) board specific values on the left, let's
continue to follow it, but unrestrict SoC agnostic string names of boards
and further board extensions, if PCB\SoC (or PCB\PCB for extension boards)
are about identical. Anyway those values are mainly unused nowadays, so
nothing is lost but another dimension in board/platform description and
naming is avoided. I do understand that likely most of PCBs are very SoC
centric, and the proposal shared above should not be considered as a rule,
but rather as a reasonable and valid exception.

--
Best wishes,
Vladimir
