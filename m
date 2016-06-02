From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 13/13] ARM: dts: blanche: add Ethernet support
Date: Fri, 3 Jun 2016 00:33:05 +0300
Message-ID: <3097ebac-9d5a-8e71-ee64-f3f4629c1785@cogentembedded.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <1669958.qjJ7i3NBPv@wasted.cogentembedded.com>
 <CAMuHMdU2P6VKXNpEHGOKpyuM45Pk0CuHWngxwu5AYGqYfduXXg@mail.gmail.com>
 <a60346f2-2abb-342b-dd20-38d401c4ceb3@cogentembedded.com>
 <CAMuHMdXUdg8+ux2j5SsthZS6DWZnHfan0jL=PpYEwfnS7fbRkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXUdg8+ux2j5SsthZS6DWZnHfan0jL=PpYEwfnS7fbRkQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 06/01/2016 03:27 PM, Geert Uytterhoeven wrote:

>>>> --- renesas.orig/arch/arm/boot/dts/r8a7792-blanche.dts
>>>> +++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
>>>
>>>> +       ethernet@18000000 {
>>>> +               compatible = "smsc,lan89218", "smsc,lan9115";
>>>
>>>
>>> The "smsc,lan89218" needs to be documented in the device tree bindings.
>>
>>    Have you looked at those bindings?
>
> Now I did.
>
>>> Google couldn't find any evidence you submitted a patch for that.
>>
>>    Because the bindings document *any* LAN9115 compatible chip already.
>
> Ah, generic wildcard, not listing valid values. Hence checkpatch complained...

    Note that it doesn't complain about "smsc,lan9220" though that is only 
mentioned in the example.

> Google predict-while-you-type suggests "lan89218aq"? Should you use that?

    No, my googling shows that the suffix can be different, and the Microchip 
(the new owner?) has it without the suffix on their site.

> BTW, that's why we always want to document all valid values...

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei
