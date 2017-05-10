From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2 v2] clk: Add bindings for the Gemini Clock Controller
Date: Wed, 10 May 2017 17:47:12 +0200
Message-ID: <CACRpkdbMqwGj3gx1h_GXy1xxkxeEgj6LTy1y8rd04WRorGSymg@mail.gmail.com>
References: <20170508201159.31634-1-linus.walleij@linaro.org>
 <CAL_JsqLAMObobPrBDdA8bjaKTX4rEo2=_qd86ibbA2kQP6AvBg@mail.gmail.com>
 <CACRpkdY+EzbbTy6PzN5-YhCnSxPoKej2z=t-7eC3CPqDa6Q4_w@mail.gmail.com> <CAL_Jsq+WQijqm43U_SzSVzCn6_eeFLjggcWnbwbCpW99ct4XOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+WQijqm43U_SzSVzCn6_eeFLjggcWnbwbCpW99ct4XOQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, openwrt-devel-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 9, 2017 at 4:23 PM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, May 8, 2017 at 4:41 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On Mon, May 8, 2017 at 11:24 PM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>
>>>> +Example:
>>>> +
>>>> +syscon: syscon@40000000 {
>>>> +       compatible = "cortina,gemini-syscon", "cortina,gemini-clock-controller",
>>>> +                    "syscon", "simple-mfd";
>>>
>>> There are no child nodes, so you don't need simple-mfd.
>>
>> The example is taken from an actual device tree (look below),
>> where there are child nodes, I can trim it down.
>>
>>>> +       reg = <0x40000000 0x1000>;
>>>
>>> Looks like you have 2 nodes pointing to the same address with your
>>> reset binding? You shouldn't have overlapping resources. It's allowed
>>> for historical reasons but breaks resource creation in Linux.
>>
>> No... they are all in the same node, just sharing the same
>> resource by way of regmap (syscon).
>
> Okay, then please document at least the parent syscon node in a single
> doc. Splitting it is very confusing.

I'm sorry. :(

I'll patch the document in arm/gemini.txt
where the syscon node is documented, with a single patch adding
both clock and reset bindings.

>>                 syscon: syscon@40000000 {
>>                         compatible = "cortina,gemini-syscon",
>>                                      "cortina,gemini-clock-controller",
>>                                      "cortina,gemini-reset",
>
> This mostly looks fine, but you shouldn't need 3 compatible strings
> for the block.

OK I'll see if I can make it work with just "cortina,gemini-syscon"
and skip the two others.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
