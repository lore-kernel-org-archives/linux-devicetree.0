From: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/3] clk: vc5: Add structure to describe particular
 chip features
Date: Wed, 5 Apr 2017 18:09:09 +0300
Message-ID: <1ddf7610-035a-eb00-caf7-90f9d25f0172@mentor.com>
References: <1491392819-698-1-git-send-email-alexey_firago@mentor.com>
 <1491392819-698-2-git-send-email-alexey_firago@mentor.com>
 <CAMuHMdXEa=1__WMtsRphKbN6h+jVkP7szudENsM3hvGSzDfbwg@mail.gmail.com>
 <de978809-5bec-d675-1ea3-cc61804e2c61@mentor.com>
 <23dd9324-ee97-633d-129e-6063af757f47@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <23dd9324-ee97-633d-129e-6063af757f47-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Marek,

On 05.04.2017 17:20, Marek Vasut wrote:
>>>> +
>>>> +/* flags to describe chip features */
>>>> +/* chip has built-in oscilator */
>>>> +#define VC5_HAS_INTERNAL_XTAL  BIT(0)
>>>
>>> VC5_HAS_INTERNAL_OSC?
>>
>> I'm fine with renaming it, but shouldn't it be consistent with the rest
>> of the driver (see "internal-xtal", VC5_XTAL*, etc) and IDT datasheet?
>>
>
> Do you have one with internal ring oscillator or with internal xtal ?
> The one I had has internal xtal according to the datasheet.
>

The one I have (5P49V5935) has internal 25MHz crystal according to the 
datasheet.

--
Alexey
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
