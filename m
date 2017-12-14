From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: Remove leading 0x and 0s from bindings notation
Date: Thu, 14 Dec 2017 12:42:21 -0600
Message-ID: <CAL_JsqJrjb9xDD5b65LXVVroEOGf9R1iAHZXZT0Ym6ApchLeig@mail.gmail.com>
References: <20171214165352.27902-1-malat@debian.org> <98a7dc30-e736-eaf8-204f-2ac2b3ea79b9@gmail.com>
 <1513276199.27409.75.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513276199.27409.75.camel-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Tony Luck <tony.luck-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list:ARM/QUALCOMM SUPP
List-Id: devicetree@vger.kernel.org

On Thu, Dec 14, 2017 at 12:29 PM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
> On Thu, 2017-12-14 at 19:03 +0100, Matthias Brugger wrote:
>>
>> On 12/14/2017 05:53 PM, Mathieu Malaterre wrote:
>> [...]
>> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> > index 26396ef53bde..0446b122a6e2 100644
>> > --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> > +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> > @@ -249,7 +249,7 @@
>> >                     reg = <0 0x10005000 0 0x1000>;
>> >             };
>> >
>> > -           pio: pinctrl@0x10005000 {
>> > +           pio: pinctrl@10005000 {
>> >                     compatible = "mediatek,mt8173-pinctrl";
>> >                     reg = <0 0x1000b000 0 0x1000>;
>> >                     mediatek,pctl-regmap = <&syscfg_pctl_a>;
>>
>> Acked-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Should all of these be fixed?
>
> $ git grep -P "^\s*\w+:\s*[\w\-]+@0[xX]" -- "*.dts*" | wc -l
> 69

Yes, there's patches for all arches.

>
> Is this a pattern that should be added to checkpatch?

No, because dtc provides the warnings.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
