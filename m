From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2 v5] bus: qcom: add EBI2 device tree bindings
Date: Mon, 5 Sep 2016 23:42:49 +0200
Message-ID: <CACRpkdZCgwK6vMXgu0UFghx0DaKMsnOq+w+jb=VFU8+LKu+B+A@mail.gmail.com>
References: <1473078565-24363-1-git-send-email-linus.walleij@linaro.org> <6058357.4to9qAiSEF@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6058357.4to9qAiSEF@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 5, 2016 at 3:09 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday, September 5, 2016 2:29:24 PM CEST Linus Walleij wrote:
>> +Chip Select                     Physical address base
>> +CS0 GPIO134                     0x1a800000-0x1b000000 (8MB)
>> +CS1 GPIO39 (A) / GPIO123 (B)    0x1b000000-0x1b800000 (8MB)
>> +CS2 GPIO40 (A) / GPIO124 (B)    0x1b800000-0x1c000000 (8MB)
>> +CS3 GPIO133                     0x1d000000-0x25000000 (128 MB)
>> +CS4 GPIO132                     0x1c800000-0x1d000000 (8MB)
>> +CS5 GPIO131                     0x1c000000-0x1c800000 (8MB)
>> +
>
>
>> +- ranges: should be set to:
>> +  ranges = <0 0x0 0x1a800000 0x00800000>,
>> +           <1 0x0 0x1b000000 0x00800000>,
>> +           <2 0x0 0x1b800000 0x00800000>,
>> +           <3 0x0 0x1d000000 0x00800000>,
>> +           <4 0x0 0x1c800000 0x00800000>,
>> +           <5 0x0 0x1c000000 0x00800000>;
>>
>
> The two lists don't seem to match here: why is the CS3 area only
> listed with an 8MB mapping here when the documentation says it's
> 128 MB?

Just my bad because I'm not using it, good catch!

Resending.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
