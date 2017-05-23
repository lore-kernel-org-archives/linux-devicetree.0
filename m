From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [DT Question] "simple-mfd" DT binding
Date: Tue, 23 May 2017 10:21:49 +0900
Message-ID: <CAK7LNAQ+DimarhHJOg=BqbH+EB19s+wgtRqJ8-XuLKW6_0FFaQ@mail.gmail.com>
References: <CAK7LNARQmfX+3RwFgwtvf2Qu79XNX1zh0O741-pPFWS6npytLw@mail.gmail.com>
 <CACRpkdY88Zdp2zqabWPfYPnTwSzYuCqSQHQg9vF_+Zd=TFOvaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdY88Zdp2zqabWPfYPnTwSzYuCqSQHQg9vF_+Zd=TFOvaA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lee, Linus,

Thanks for your comments!

2017-05-22 17:43 GMT+09:00 Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> On Mon, May 22, 2017 at 3:29 AM, Masahiro Yamada
> <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
>
>> Because "simple-bus" indicates that child nodes are
>> simply memory mapped, but the node "register-bit-led"
>> can not be memory-mapped.
>> So, "simple-mfd" can not be replaced "simple-bus" here.
>
> Yeah... just like Lee points out, you are spot on, this is exactly
> the reason why we created "simple-mfd" in the first place
> IIRC.

OK, Linux treats simple-bus and simple-mfd in the same way
as far as I see drivers/of/platform.c

Perhaps, can we document the difference between simple-bus and
simple-mfd clearly?
For example, "Unlike simple-bus, it is legitimate that simple-mfd has
subnodes without reg property"


I think this is typical when "simple-mfd" is used together with "syscon".
The child devices will use regmap of the parent node.
I'd like to be sure this is valid usage.


-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
