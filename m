From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] pinctrl: meson: gxl: add the missing PWM pin definitions
Date: Thu, 23 Mar 2017 09:46:34 +0100
Message-ID: <CACRpkdYYWut2aJMj1kVxisfcyur5BT9i9zSzYd8FVU9DY6taKQ@mail.gmail.com>
References: <20170304212318.27076-1-martin.blumenstingl@googlemail.com>
 <20170318122736.11592-1-martin.blumenstingl@googlemail.com> <20170318122736.11592-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170318122736.11592-2-martin.blumenstingl@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 18, 2017 at 1:27 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> This adds support for the missing PWM pins on Meson GXL SoCs, namely:
> - PWM_A
> - PWM_B
> - PWM_C
> - PWM_F (GPIOX_7 and GPIOCLK_1 can be selected as output)
> - PWM_AO_A (GPIOAO_3 and GPIOAO_8 can be selected as output)
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Patch applied.

Yours,
Linus Walleij
