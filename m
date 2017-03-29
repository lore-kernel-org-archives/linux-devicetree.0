From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: pinctrl: Add RZ/A1 bindings doc
Date: Wed, 29 Mar 2017 15:04:48 +0200
Message-ID: <CACRpkdZTH8P53-aa6rJy=pu_btGvn7gZJLvJO2ynaEBdMZvVWA@mail.gmail.com>
References: <1490026491-21742-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490026491-21742-3-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdWT6vJNmMhYzMEqYRbuT=W=ZuND-WfG812LfH0r0AzM_g@mail.gmail.com>
 <20170323160204.GL30223@w540> <CACRpkdYmitsPvv_1bsb-EKkhcWqaKNsLBfxZgf8cjVvcqCpYXA@mail.gmail.com>
 <b9eaac8a63dced229bb152ba412e8ec1@jmondi.org> <CACRpkdbZS72xkHaM5P-Zw==A_V_BxeszLPmc0_Zy0-RRjvAbNA@mail.gmail.com>
 <CAMuHMdXkN91uBTKhz_bveFxOgcyNe0dAbtDEVfHNKdDWNaY3jQ@mail.gmail.com>
 <CACRpkdbT3091MzAQ_hO5Hc9=gQz-eDNCDtEnVG-3G+jJ+eO+Fw@mail.gmail.com> <CAMuHMdX0OdZXYDOZvFutjfBFVd65C567_G+++kHygre4KK+jLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdX0OdZXYDOZvFutjfBFVd65C567_G+++kHygre4KK+jLg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: jacopo <jacopo@jmondi.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 29, 2017 at 1:20 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

>> I do not understand the notion of "flags" here. I hope that is not referring
>
> Flags refers to BI_DIR, SWIO_IN, and SWIO_OUT, from
> https://patchwork.kernel.org/patch/9643047/

Aha I will go in and review that closer because it doesn't seem right.

Sorry for missing it.

>> i2c1_pins_a: i2c1@0 {
>>     pins {
>>         pinmux = <MT8135_PIN_195_SDA1__FUNC_SDA1>,
>>                         <MT8135_PIN_196_SCL1__FUNC_SCL1>;
>
> If we follow this example, then we can list all combinations in
> include/dt-bindings/pinctrl/r7s72100-pinctrl.h, instead of creating the value
> by combining the bits using a macro where we need it in the DTS.
>
> It's gonna be a long list, though...

Size is not the issue, readability is the issue. I don't see why you would
need to list "all combinations" since the trees go through the C preprocessor
so you can use macros and bit | OR to build them?

Yours,
Linus Walleij
