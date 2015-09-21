From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/7] New Atmel PIO4 pinctrl/gpio driver
Date: Mon, 21 Sep 2015 11:50:48 -0700
Message-ID: <CACRpkdYLbifY9VJK0FFf7xXdMJWstdGP=h5ApBMRyRXZHPDUaw@mail.gmail.com>
References: <1442417823-15850-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1442417823-15850-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 16, 2015 at 8:36 AM, Ludovic Desroches
<ludovic.desroches@atmel.com> wrote:

> The Atmel PIO4 controller has been introduced with SAMA5D2 chip family. This
> drivers manages both pinmux/pinconf and gpio stuff. It is inspired by Mediatek
> pinctrl driver.
>
> Changes from v1:
> - remove some unneeded gpio specific ops (gpio_request, gpio_free,
>   gpio_request_enable, gpio_disable_free and gpio_set_direction).
> - code styling fixes.
> - add sama5d2 pin description and device pin muxing.

Looks Good To Me, and has Sascha's ACKs, so merged patches
1, 2, 3, 4 to the pinctrl tree. Please merge the AT91 DT things into
the AT91 tree.

Yours,
Linus Walleij
