From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: Re: [PATCH 0/5] New Atmel PIO4 pinctrl/gpio driver
Date: Mon, 7 Sep 2015 15:12:10 +0200
Message-ID: <20150907131210.GC32379@odux.rfo.atmel.com>
References: <1439281685-3020-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439281685-3020-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: s.hauer@pengutronix.de, linus.walleij@linaro.org, nicolas.ferre@atmel.com, alexandre.belloni@free-electrons.com, Ludovic Desroches <ludovic.desroches@atmel.com>
List-Id: devicetree@vger.kernel.org

Hi Sascha,

Any comments about this version? Maybe you missed it since you answered
me on the RFC version. Of course I'll do the changes you requested for
the next version (remove gpio_request_*() stuff and add macros for gpio
muxing case).

Thanks

Ludovic

On Tue, Aug 11, 2015 at 10:28:00AM +0200, Ludovic Desroches wrote:
> Hi,
> 
> The Atmel PIO4 controller has been introduced with SAMA5D2 chip family. This
> drivers manages both pinmux/pinconf and gpio stuff. It is inspired by Mediatek
> pinctrl driver.
> 
> Ludovic Desroches (5):
>   pinctrl: introduce driver for Atmel PIO4 controller
>   pinctrl: dt-binding: Add DT binding documentation for Atmel PIO4
>   MAINTAINERS: Add an entry for pinctrl-at91-pio4
>   ARM: at91/dt: sama5d2: add pio controller node
>   ARM: at91/defconfig: sama5: add PIO4 controller support
> 
>  .../bindings/pinctrl/atmel,at91-pio4-pinctrl.txt   |   90 ++
>  MAINTAINERS                                        |    7 +
>  arch/arm/boot/dts/sama5d2.dtsi                     |   14 +
>  arch/arm/mach-at91/Kconfig                         |    1 +
>  drivers/pinctrl/Kconfig                            |   13 +
>  drivers/pinctrl/Makefile                           |    1 +
>  drivers/pinctrl/pinctrl-at91-pio4.c                | 1063 ++++++++++++++++++++
>  7 files changed, 1189 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
>  create mode 100644 drivers/pinctrl/pinctrl-at91-pio4.c
> 
> -- 
> 2.5.0
> 
