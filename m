From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: eagle: add EtherAVB pins
Date: Wed, 15 Nov 2017 17:21:07 +0100
Message-ID: <CAMuHMdX8j__iF5xP33Na9pVM1nRWvrE7e68-zg0oE0gE5MOHXw@mail.gmail.com>
References: <20171110200714.406365231@cogentembedded.com> <CAMuHMdWCj=CjA_zyC1GKr=KEk2CNMAtwvREw25R1uJktZucY4w@mail.gmail.com>
 <1017d8fb-e353-f212-09a9-a28bf07eddc2@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1017d8fb-e353-f212-09a9-a28bf07eddc2-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Tue, Nov 14, 2017 at 7:00 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> On 11/14/2017 11:44 AM, Geert Uytterhoeven wrote:
>>> Add the (previously omitted) EtherAVB pin data to the Eagle board's
>>> device tree.

>>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
>>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
>>> @@ -34,6 +34,9 @@
>
> [...]
>>>
>>> @@ -53,6 +56,11 @@
>>>   };
>>>
>>>   &pfc {
>>> +       avb_pins: avb {
>>> +               groups = "avb0_mdio", "avb0_mii";
>>
>>
>> Oh no, its'called "avb0_mdio" here, but "avb(0)_mdc" on all other
>> R-Car Gen3 SoCs?
>
>
>    Can you remember the reason? I don;t want to follow the bad example. :-)

Sorry, I don't know.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
