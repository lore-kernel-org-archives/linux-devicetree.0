From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: eagle: add EtherAVB pins
Date: Wed, 15 Nov 2017 23:21:19 +0300
Message-ID: <a65b8740-b133-eb92-5494-fb532554127b@cogentembedded.com>
References: <20171110200714.406365231@cogentembedded.com>
 <CAMuHMdWCj=CjA_zyC1GKr=KEk2CNMAtwvREw25R1uJktZucY4w@mail.gmail.com>
 <1017d8fb-e353-f212-09a9-a28bf07eddc2@cogentembedded.com>
 <CAMuHMdX8j__iF5xP33Na9pVM1nRWvrE7e68-zg0oE0gE5MOHXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdX8j__iF5xP33Na9pVM1nRWvrE7e68-zg0oE0gE5MOHXw@mail.gmail.com>
Content-Language: en-MW
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello!

On 11/15/2017 07:21 PM, Geert Uytterhoeven wrote:

>>>> Add the (previously omitted) EtherAVB pin data to the Eagle board's
>>>> device tree.
> 
>>>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
>>>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
>>>> @@ -34,6 +34,9 @@
>>
>> [...]
>>>>
>>>> @@ -53,6 +56,11 @@
>>>>    };
>>>>
>>>>    &pfc {
>>>> +       avb_pins: avb {
>>>> +               groups = "avb0_mdio", "avb0_mii";
>>>
>>>
>>> Oh no, its'called "avb0_mdio" here, but "avb(0)_mdc" on all other
>>> R-Car Gen3 SoCs?
>>
>>
>>     Can you remember the reason? I don;t want to follow the bad example. :-)
> 
> Sorry, I don't know.

    Hm, you seem to have participated in the related discussions for H2/M3-W...
The reason was that omlu AVB_MDC signal was multiplexed, AVB_MDIO signal (and 
AVB MII signals) was mapped to a dedicated pin without any multiplexing, so 
the "avb_mdc" group initially contained only AVB_MDC.

> Gr{oetje,eeting}s,

MBR, Sergei
