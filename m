From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 8/8] arm64: dts: renesas: eagle: add EtherAVB support
Date: Thu, 5 Oct 2017 20:18:38 +0300
Message-ID: <dca19642-e511-5cd5-b7b9-9ed339407ed6@cogentembedded.com>
References: <20170915194449.538504992@cogentembedded.com>
 <CAMuHMdXQXFuVzwW7G-U7XWZUEj8qFRjtfDQF1+TgyzO0Xb+eYg@mail.gmail.com>
 <c0390fc1-7da4-ac60-afee-97126d1fd372@cogentembedded.com>
 <CAMuHMdVCTORpfKN+GTka_6pT1VWjOneV2GBhGo7Y8DsZYSxdvw@mail.gmail.com>
 <20171005090500.GC26369@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171005090500.GC26369-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Content-Language: en-MW
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/05/2017 12:05 PM, Simon Horman wrote:

>>>>> Define the Eagle board  dependent part of the EtherAVB device node.
>>>>> Enable DHCP  and NFS root for the kernel booting.
>>>>>
>>>>> Based  on the original (and large) patch by Vladimir Barinov.
>>>>>
>>>>> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>>>>
>>>>
>>>>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
>>>>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
>>>
>>> [...]
>>>>>
>>>>> @@ -43,3 +44,14 @@
>>>>>    &scif0 {
>>>>>           status = "okay";
>>>>>    };
>>>>> +
>>>>> +&avb {
>>>>> +       renesas,no-ether-link;
>>>>> +       phy-handle = <&phy0>;
>>>>> +       status = "okay";
>>>>> +
>>>>> +       phy0: ethernet-phy@0 {
>>>>> +               rxc-skew-ps = <1500>;
>>>>> +               reg = <0>;
>>>>
>>>>
>>>> Any specific reason why you don't want to wire up the interrupt?
>>>>
>>>>                   interrupt-parent = <&gpio2>;
>>>
>>>
>>>     I thought it's quite obvious -- we don't have GPIOs yet, and GPIOs seem
>>> to require PFC.
>>
>> Of course. And these can be added later.
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> 
> Thanks, applied.

    Still not seeing any devel branch updates/tags -- have you pushed it?

MBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
