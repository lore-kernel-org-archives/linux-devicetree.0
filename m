From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 12/20] ARM: dts: uniphier: Add generic compatible
 string for I2C EEPROM
Date: Wed, 7 Jun 2017 14:42:43 +0200
Message-ID: <CABxcv=msBQVW2P+RkcAq+5jhBkMorZvToaGDoLF6rT_knb3qhw@mail.gmail.com>
References: <20170523133448.4794-1-javier@dowhile0.org> <20170523133448.4794-13-javier@dowhile0.org>
 <CAK7LNATDvesYLKimY=aKfT6kAiidq6Ufd=kCWGQcCZ_Xy-27tw@mail.gmail.com>
 <CABxcv=mPzDVTh_ZH1VtuHMUhVrR+hxz8GwcQT38hwJJqHY+fJA@mail.gmail.com> <CAK7LNASBztX033t36vz_MXAgeyHd76roMBtRZ4mi-q9VFB4Lkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNASBztX033t36vz_MXAgeyHd76roMBtRZ4mi-q9VFB4Lkg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Masahiro,

On Wed, Jun 7, 2017 at 3:10 AM, Masahiro Yamada
<yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:

[snip]

>>>
>>> Why didn't you touch
>>> arch/arm/boot/dts/uniphier-ref-daughter.dtsi ?
>>>
>>
>> Because the compatible string "microchip,24lc128" used by the I2C
>> EEPROM node on that DTS is not supported by the
>> drivers/misc/eeprom/at24.c driver (in fact the only occurrence for
>> 24lc128 I see is in that DTS).
>>
>> Maybe is a typo and it should be "microchip,24c128" instead ?
>
> I do not think so.
> I consulted a board developer.
>
> I also see 24LC128 on Microchip web site:
> http://www.microchip.com/wwwproducts/en/24LC128
>

Ah Ok, it was just a wild guess I did since the at24 driver didn't
have support for this chip variant.
My point stands though, this is an unrelated change to the goal of
this patch-series and should be fixed separately.

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
