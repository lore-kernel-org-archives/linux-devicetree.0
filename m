From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 0/7] add support for SAM9X60 pin controller
Date: Fri, 8 Feb 2019 13:07:56 +0100
Message-ID: <CACRpkdasSzX8gxW1dDjkeTyT6RAYFhrwSPGdwmrKEaabEFgG4Q@mail.gmail.com>
References: <1549531468-1676-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549531468-1676-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu.Beznea@microchip.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <Nicolas.Ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <Ludovic.Desroches@microchip.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 7, 2019 at 10:24 AM <Claudiu.Beznea@microchip.com> wrote:

> From: Claudiu Beznea <claudiu.beznea@microchip.com>
>
> This series adds drive strenght and slew rate support for SAMX60's pin
> controller. For drive strenght we could have 2 values: low, high.
> For slew rate we could have 2 values: enable, disabled.
>
> Besides this I took the chance and adapt the documentation for at91 pinctrl
> driver.
>
> Changes in v3:
> - fix checkpatch.pl warning on DBG_SHOW_FLAG_MASKED() macro in patch 1/7
> - add Ack-by tag

All 7 patches applied for kernel v5.1.

Yours,
Linus Walleij
