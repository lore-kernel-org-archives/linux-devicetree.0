Return-Path: <SRS0=JIIi=LU=bgdev.pl=brgl@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CACRpkdaOU+dumvVsrsjm5C=uo-cKLKqG2iwAwy=Xh9vbjq3UtQ@mail.gmail.com>
References: <20180905132618.31274-1-vincent.whitchurch@axis.com>
 <20180905132618.31274-2-vincent.whitchurch@axis.com> <CACRpkdaOU+dumvVsrsjm5C=uo-cKLKqG2iwAwy=Xh9vbjq3UtQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 6 Sep 2018 13:09:20 +0200
Message-ID: <CAMRc=McbWJdaKbWnoXF7+-TTKA=dkWCnHJmZybcfQOPNcm9q+A@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: gpio: Add binding for gpio-mockup
Content-Type: text/plain; charset="UTF-8"
To: Linus Walleij <linus.walleij@linaro.org>, vincent.whitchurch@axis.com
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rabin Vincent <rabinv@axis.com>, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

2018-09-06 12:16 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
> Hi Vincent, thanks for the patch!
>
> Including Bartosz who is kind of default maintainer for this component.
>
> On Wed, Sep 5, 2018 at 3:26 PM Vincent Whitchurch
> <vincent.whitchurch@axis.com> wrote:
>>
>> This is a dummy GPIO controller which can be used in place of the real
>> hardware GPIO controller (for example, an external GPIO expander) before
>> actual hardware is available.
>>
>> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
>
> This looks generally helpful. I don't know what the DT maintainers
> think, but I am positive, I think rapid prototyping is a valid usecase.
> We used to have the driver for testing only but this usecase is
> just as valid.
>
>> +Required properties:
>> +- compatible: Should contain "gpio-mockup"
>> +- gpio-controller : Marks the device node as a gpio controller.
>> +- #gpio-cells : Should be two.  The first cell is the pin number and
>> +  the second cell is used to specify the gpio polarity:
>> +      0 = active high
>> +      1 = active low
>> +- nr-gpios: The number of dummy GPIOs
>
> For this there is a standardized binding "ngpios" in gpio.txt
> so just use that and reference gpio.txt please.
>
> Yours,
> Linus Walleij

Do we even need DT bindings for this? Device tree bindings mean that
we commit to a stable interface so that once a device with given DT
blob is released, it will work on every future kernel. Also: DT should
only include information about actual HW, not operating system
concepts. Meanwhile this is for testing purposes only and it won't end
up in any actual DT source file upstream.

I like the feature, just don't think this needs a binding document. I
will review the other patch later today.

Also: if you want to get a DT bindings patch merged, you need an Ack
from Rob Herring (Cc'ed now). You'll probably need to resend anyway as
patchwork won't pick up my Cc here.

Best regards,
Bartosz Golaszewski
