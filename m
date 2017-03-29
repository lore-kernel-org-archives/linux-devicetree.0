From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: pinctrl: Add RZ/A1 bindings doc
Date: Wed, 29 Mar 2017 15:10:17 +0200
Message-ID: <CACRpkdb+k82OUbi1y1SNC09asHsNSqbtvCkYyT=1eqjpdMt_cg@mail.gmail.com>
References: <1490026491-21742-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490026491-21742-3-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdWT6vJNmMhYzMEqYRbuT=W=ZuND-WfG812LfH0r0AzM_g@mail.gmail.com>
 <20170323160204.GL30223@w540> <CACRpkdYmitsPvv_1bsb-EKkhcWqaKNsLBfxZgf8cjVvcqCpYXA@mail.gmail.com>
 <b9eaac8a63dced229bb152ba412e8ec1@jmondi.org> <CACRpkdbZS72xkHaM5P-Zw==A_V_BxeszLPmc0_Zy0-RRjvAbNA@mail.gmail.com>
 <CAMuHMdXkN91uBTKhz_bveFxOgcyNe0dAbtDEVfHNKdDWNaY3jQ@mail.gmail.com>
 <CACRpkdbT3091MzAQ_hO5Hc9=gQz-eDNCDtEnVG-3G+jJ+eO+Fw@mail.gmail.com>
 <CAMuHMdX0OdZXYDOZvFutjfBFVd65C567_G+++kHygre4KK+jLg@mail.gmail.com>
 <20170329120530.GB6247@w540> <SG2PR06MB1165276F957CE63DBE0A55268A350@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <SG2PR06MB1165276F957CE63DBE0A55268A350-ESzmfEwOt/xoAsOJh7vwSm0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: jacopo <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 29, 2017 at 2:38 PM, Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:

>> I'm strongly in favour of something like
>>     pinmux = <PIN(1, 4) | FUNC# | FLAGS>, .... ;
>>
>> opposed to
>>     pinmux = <PIN1_4_FUNC#_FLAGS>, ... ;
>
>
> I agree. I like "<PIN(1, 4) | FUNC# | FLAGS>".

I don't know if you have seen the Mediatek things really.
include/dt-bindings/pinctrl/mt6397-pinfunc.h

Example:
#define MT6397_PIN_2_SRCLKEN_PERI__FUNC_GPIO2 (MTK_PIN_NO(2) | 0)

If you prefer to use preprocessor macros or whatever to make the
bitmasks or how you want to organize the constants in your
include files is not my concern, do whatever you seem fit, just
pack it into a 32bit thing somehow which makes sense from a
maintenance point of view.

>> Not only because it will save use from having a loong list(*) of macros
>> that has to be kept up to date when/if new RZ hardware will arrive, but
>> also because of readability and simplicity for down-stream and BSP users.
>> Speaking of which, I would like to know what does Chris think of this.
>
> The list of macros would be very long, especially against the different
> packaging version of the RZ/A1 series. 11 ports, 16-pins for each port, 8 different
> function options for each pin....2 different package/pin variations.
>
> And at the end of the day....there is no benefit for the user over just using
> a macro.

I don't know who has this idea that you could not use macros, certainly
not me. Some misunderstanding must be going on. For what I'm concerned
you can write hex numbers in the pinmux = <0x12345678>;

> The reason for the "FLAGS" is to work around a quirky hardware design (in my opinion).

The flags I don't like at all, and think they should be converted to generic
pin config because they have nothing to do with muxing.

But I will point that out in the specific patch adding them.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
