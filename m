From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: sx150x: use correct registers for reg_sense
 (sx1502 and sx1508)
Date: Fri, 25 Nov 2016 14:40:33 +0100
Message-ID: <CACRpkdb2pJTfL+bmGT9OW84kJaJFF5F=qdHz9vKgG4Y4Mq2KUw@mail.gmail.com>
References: <1480020320-28354-1-git-send-email-peda@axentia.se> <1480020320-28354-2-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1480020320-28354-2-git-send-email-peda@axentia.se>
Sender: linux-gpio-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 24, 2016 at 9:45 PM, Peter Rosin <peda@axentia.se> wrote:

> All other registers on these chips are 8-bit, but reg_sense is 16-bits
> and therefore needs to be moved down one notch.
> This was apparently overlooked in the conversion to regmap, which only
> updated the register locations for the 16-bit chips.
>
> Fixes: 6489677f86c3 ("pinctrl-sx150x: Replace sx150x_*_cfg by means of regmap API")
> Signed-off-by: Peter Rosin <peda@axentia.se>

Patch applied.

Yours,
Linus Walleij
