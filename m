From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: eagle: add EtherAVB pins
Date: Thu, 16 Nov 2017 15:28:38 +0300
Message-ID: <3c89ed4f-cde3-e29c-5513-060216f94c3a@cogentembedded.com>
References: <20171110200714.406365231@cogentembedded.com>
 <CAMuHMdWCj=CjA_zyC1GKr=KEk2CNMAtwvREw25R1uJktZucY4w@mail.gmail.com>
 <1017d8fb-e353-f212-09a9-a28bf07eddc2@cogentembedded.com>
 <CAMuHMdX8j__iF5xP33Na9pVM1nRWvrE7e68-zg0oE0gE5MOHXw@mail.gmail.com>
 <a65b8740-b133-eb92-5494-fb532554127b@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a65b8740-b133-eb92-5494-fb532554127b-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Content-Language: en-MW
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/15/2017 11:21 PM, Sergei Shtylyov wrote:

>>>>> Add the (previously omitted) EtherAVB pin data to the Eagle board's
>>>>> device tree.
>>
>>>>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
>>>>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
>>>>> @@ -34,6 +34,9 @@
>>>
>>> [...]
>>>>>
>>>>> @@ -53,6 +56,11 @@
>>>>>    };
>>>>>
>>>>>    &pfc {
>>>>> +       avb_pins: avb {
>>>>> +               groups = "avb0_mdio", "avb0_mii";
>>>>
>>>>
>>>> Oh no, its'called "avb0_mdio" here, but "avb(0)_mdc" on all other
>>>> R-Car Gen3 SoCs?
>>>
>>>
>>>     Can you remember the reason? I don;t want to follow the bad example. :-)
>>
>> Sorry, I don't know.
> 
>     Hm, you seem to have participated in the related discussions for H2/M3-W...

    H3, of course...

> The reason was that omlu AVB_MDC signal was multiplexed, AVB_MDIO signal (and 

    s/omlu/only/.

> AVB MII signals) was mapped to a dedicated pin without any multiplexing, so 
> the "avb_mdc" group initially contained only AVB_MDC.
> 
>> Gr{oetje,eeting}s,

MBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
