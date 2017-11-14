From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: eagle: add EtherAVB pins
Date: Tue, 14 Nov 2017 21:00:21 +0300
Message-ID: <1017d8fb-e353-f212-09a9-a28bf07eddc2@cogentembedded.com>
References: <20171110200714.406365231@cogentembedded.com>
 <CAMuHMdWCj=CjA_zyC1GKr=KEk2CNMAtwvREw25R1uJktZucY4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWCj=CjA_zyC1GKr=KEk2CNMAtwvREw25R1uJktZucY4w@mail.gmail.com>
Content-Language: en-MW
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 11/14/2017 11:44 AM, Geert Uytterhoeven wrote:

>> Add the (previously omitted) EtherAVB pin data to the Eagle board's
>> device tree.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks for your patch!
> 
>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
>> @@ -34,6 +34,9 @@
[...]
>> @@ -53,6 +56,11 @@
>>   };
>>
>>   &pfc {
>> +       avb_pins: avb {
>> +               groups = "avb0_mdio", "avb0_mii";
> 
> Oh no, its'called "avb0_mdio" here, but "avb(0)_mdc" on all other
> R-Car Gen3 SoCs?

    Can you remember the reason? I don;t want to follow the bad example. :-)

> What about "avb0_link", which is connected through "L_LNK"?

    The same as for other gen3 board, the AVB node has renesas,no-ether-link".
I tried to verify that property on Eagle, and left it intact as a result... 
Will re-test removing it once more.

[...]

> Gr{oetje,eeting}s,
> 
>                          Geert

MBR, Sergei
