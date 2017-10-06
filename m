From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: renesas: eagle: add EtherAVB support
Date: Fri, 6 Oct 2017 12:34:27 +0300
Message-ID: <317baf29-ce3f-38a6-20ca-accd0e34fb25@cogentembedded.com>
References: <20170915194449.538504992@cogentembedded.com>
 <CAMuHMdXQXFuVzwW7G-U7XWZUEj8qFRjtfDQF1+TgyzO0Xb+eYg@mail.gmail.com>
 <c0390fc1-7da4-ac60-afee-97126d1fd372@cogentembedded.com>
 <CAMuHMdVCTORpfKN+GTka_6pT1VWjOneV2GBhGo7Y8DsZYSxdvw@mail.gmail.com>
 <20171005090500.GC26369@verge.net.au>
 <dca19642-e511-5cd5-b7b9-9ed339407ed6@cogentembedded.com>
 <20171006093112.GJ7734@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171006093112.GJ7734@verge.net.au>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

On 10/6/2017 12:31 PM, Simon Horman wrote:

>>>>>>> Define the Eagle board  dependent part of the EtherAVB device node.
>>>>>>> Enable DHCP  and NFS root for the kernel booting.
>>>>>>>
>>>>>>> Based  on the original (and large) patch by Vladimir Barinov.
>>>>>>>
>>>>>>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>>>>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>>>>
>>>>>>
>>>>>>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
>>>>>>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
>>>>>
>>>>> [...]
>>>>>>>
>>>>>>> @@ -43,3 +44,14 @@
>>>>>>>    &scif0 {
>>>>>>>           status = "okay";
>>>>>>>    };
>>>>>>> +
>>>>>>> +&avb {
>>>>>>> +       renesas,no-ether-link;
>>>>>>> +       phy-handle = <&phy0>;
>>>>>>> +       status = "okay";
>>>>>>> +
>>>>>>> +       phy0: ethernet-phy@0 {
>>>>>>> +               rxc-skew-ps = <1500>;
>>>>>>> +               reg = <0>;
>>>>>>
>>>>>>
>>>>>> Any specific reason why you don't want to wire up the interrupt?
>>>>>>
>>>>>>                   interrupt-parent = <&gpio2>;
>>>>>
>>>>>
>>>>>     I thought it's quite obvious -- we don't have GPIOs yet, and GPIOs seem
>>>>> to require PFC.
>>>>
>>>> Of course. And these can be added later.
>>>>
>>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>
>>> Thanks, applied.
>>
>>     Still not seeing any devel branch updates/tags -- have you pushed it?
> 
> Sorry, there was a bit of a delay. But it is there.

    Yeah, I saw it later yesterday, thanks!

MBR, Sergei
