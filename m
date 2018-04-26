From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: mcp23s08: Clarify gpiospec flags
 cell usage
Date: Fri, 27 Apr 2018 00:48:36 +0200
Message-ID: <CACRpkdYsiDhNcOwRnza1UjQ_wSfewS05nTHO0fiyuAnEMAM4Pw@mail.gmail.com>
References: <20180411214257.14902-1-rjpdasilva@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180411214257.14902-1-rjpdasilva@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Silva <rjpdasilva@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 11, 2018 at 11:42 PM, Ricardo Silva <rjpdasilva@gmail.com> wrote:

> The pinctrl-mcp23s08 driver doesn't provide a specific gpiospec
> of_xlate() function, causing the gpiolib-of's of_gpio_simple_xlate()
> function to be used instead, which takes the gpiospec's second cell as
> the flags specifier according to 'include/dt-bindings/gpio/gpio.h'.
>
> The pinctrl-mcp23s08 bindings document was mentioning that the flags
> were unused, which is not accurate because values in that second cell
> are indeed used by the gpiolib-of's of_gpio_simple_xlate() for
> configuring the gpio (e.g. its polarity).
>
> This way, replace the "flags currently unused" reference in the
> dt-bindings document with references to the appropriate files specifying
> the possible flag values and gpiospec description.
>
> CC: devicetree@vger.kernel.org
> Signed-off-by: Ricardo Silva <rjpdasilva@gmail.com>

Patch applied with Rob's review tag.

Yours,
Linus Walleij
