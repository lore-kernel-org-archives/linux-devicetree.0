From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Fri, 20 Jan 2017 10:16:06 +0100
Message-ID: <CACRpkdadBe8Ty6N4DzXpmkLuTxeAGb6bNaZpygvh99cRUZ6y+Q@mail.gmail.com>
References: <20170116132424.7038-1-maxime.ripard@free-electrons.com>
 <CACRpkdbU=DeZx4a8Ax8hh6iv0n1c-6XKVrts1ff=-_E5=_dc8A@mail.gmail.com> <20170119154946.ozuxixafsoqblxvw@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170119154946.ozuxixafsoqblxvw@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 19, 2017 at 4:49 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

>> > +Optional properties:
>> > +  - interrupt-names:
>> > +    * pmu: Power Management Unit interrupt, if implemented in hardware
>>
>> On the MALI-400 MP in the ST-Ericsson DB8500 we have an additional interrupt
>> called "Mali400 combined". This is simply the HW designer's
>> doing an OR over all the 4 IRQ lines. Is this useful to define in the
>> bindings? Then it should be an optional
>
> Do you still have all the other interrupts, or just this combined interrupt?

We have the others too, I guess some HW engineer just thought it'd
be nice to have the combo.

> Either way, that should definitely be part of the binding, but maybe
> as part of the vendor specific binding below?

OK.

>>  * combined: all lines OR:ed together (if available)
>>
>> Also you are defining "resets" below in the examples, should
>> this be listed as an optional property?
>
> In my mind, this is not optional. For some platforms, it's mandatory,
> and for some, it's not there at all. IMO, this should really be a
> mandatory property, but only for the compatibles that use it (just
> like the clocks are).

OK.

Yours,
LInus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
