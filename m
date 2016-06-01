From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 13/13] ARM: dts: blanche: add Ethernet support
Date: Wed, 1 Jun 2016 14:27:57 +0200
Message-ID: <CAMuHMdXUdg8+ux2j5SsthZS6DWZnHfan0jL=PpYEwfnS7fbRkQ@mail.gmail.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
	<1669958.qjJ7i3NBPv@wasted.cogentembedded.com>
	<CAMuHMdU2P6VKXNpEHGOKpyuM45Pk0CuHWngxwu5AYGqYfduXXg@mail.gmail.com>
	<a60346f2-2abb-342b-dd20-38d401c4ceb3@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a60346f2-2abb-342b-dd20-38d401c4ceb3-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Wed, Jun 1, 2016 at 2:16 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> On 6/1/2016 11:22 AM, Geert Uytterhoeven wrote:
>>> --- renesas.orig/arch/arm/boot/dts/r8a7792-blanche.dts
>>> +++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
>>
>>> +       ethernet@18000000 {
>>> +               compatible = "smsc,lan89218", "smsc,lan9115";
>>
>>
>> The "smsc,lan89218" needs to be documented in the device tree bindings.
>
>    Have you looked at those bindings?

Now I did.

>> Google couldn't find any evidence you submitted a patch for that.
>
>    Because the bindings document *any* LAN9115 compatible chip already.

Ah, generic wildcard, not listing valid values. Hence checkpatch complained...

Google predict-while-you-type suggests "lan89218aq"? Should you use that?
BTW, that's why we always want to document all valid values...

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
