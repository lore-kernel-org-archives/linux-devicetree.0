From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: pinctrl: Add RZ/A1 bindings doc
Date: Wed, 29 Mar 2017 09:35:17 +0200
Message-ID: <CAMuHMdXkN91uBTKhz_bveFxOgcyNe0dAbtDEVfHNKdDWNaY3jQ@mail.gmail.com>
References: <1490026491-21742-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490026491-21742-3-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdWT6vJNmMhYzMEqYRbuT=W=ZuND-WfG812LfH0r0AzM_g@mail.gmail.com>
 <20170323160204.GL30223@w540> <CACRpkdYmitsPvv_1bsb-EKkhcWqaKNsLBfxZgf8cjVvcqCpYXA@mail.gmail.com>
 <b9eaac8a63dced229bb152ba412e8ec1@jmondi.org> <CACRpkdbZS72xkHaM5P-Zw==A_V_BxeszLPmc0_Zy0-RRjvAbNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbZS72xkHaM5P-Zw==A_V_BxeszLPmc0_Zy0-RRjvAbNA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: jacopo <jacopo@jmondi.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Wed, Mar 29, 2017 at 4:30 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Mar 28, 2017 at 4:38 PM,  <jacopo@jmondi.org> wrote:
>>> The fact that historically all the early adopters of pinctrl in device
>>> tree
>>> have these funky custom bindings is unfortunate but just something
>>> that we need to live with.
>>
>> To avoid any confusion, please bear with me and clarify this once and for
>> all,
>> since I'm not certain I fully got you here.
>>
>> Are you suggesting:
>>
>> 1) Use "pins" property with the currently implemented ABI (which slightly
>> differs
>>    from the standard documented one as explained above. Not sure it is fine
>> overriding
>>    it or not)
>
> Correction: you should be using the property "pinmux", because you
> are setting group and function at the same time.

OK.

> See for example:
> include/dt-bindings/pinctrl/mt65xx.h
>
> And how that is used in:
> arch/arm/boot/dts/mt2701-pinfunc.h
> arch/arm/boot/dts/mt2701-evb.dts
>
> The docs are here:
> Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt

All of the above pack the information for a pin into a single 32-bit integer.
Is that what you want us to use, too?
Currently we use two integers: 1) pin index, and 2) function/flags combo.

> I'm sorry that "pinmux" is not part of the generic documentation, it'd be
> great if you would like to add it with a patch.

That would mean pinmux could be an array of single values, or tuples.
Is that OK?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
