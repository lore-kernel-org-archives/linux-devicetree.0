From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: meson: meson-gxl: add the pwm_ao_b pin
Date: Thu, 26 Jan 2017 15:41:33 +0100
Message-ID: <CACRpkdbt5anOFUgw9C_H6Q0rvMxuyH2q1p+EeX+sf1Ei8HR==w@mail.gmail.com>
References: <20170122210528.892-1-martin.blumenstingl@googlemail.com> <20170122210528.892-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170122210528.892-3-martin.blumenstingl@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 22, 2017 at 10:05 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> This adds support for the pwm_ao_b pin. Unfortunately the registers for
> the pwm_ao pins are not documented at all. The source for the pwm_ao_b
> pin from this patch is the Khadas VIM GPL kernel source, which sets bit
> 3 and unsets bits 4 and 31 to enable the PWM LEDs.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

This patch applied to the pin control tree with Kevin's ACK.

Yours,
Linus Walleij
