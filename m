From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH v2 0/7] add support for SAM9X60 pin controller
Date: Wed, 6 Feb 2019 09:56:59 +0100
Message-ID: <20190206085659.5rjaz73hb25smpbz@M43218.corp.atmel.com>
References: <1548951466-26297-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548951466-26297-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu Beznea - M18063 <Claudiu.Beznea@microchip.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Nicolas Ferre - M43238 <Nicolas.Ferre@microchip.com>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 31, 2019 at 05:18:00PM +0100, Claudiu Beznea - M18063 wrote:
> From: Claudiu Beznea <claudiu.beznea@microchip.com>

Minor comment for patch 1.

Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com> for the
whole series.

> 
> This series adds drive strenght and slew rate support for SAMX60's pin
> controller. For drive strenght we could have 2 values: low, high.
> For slew rate we could have 2 values: enable, disabled.
> 
> Besides this I took the chance and adapt the documentation for at91 pinctrl
> driver.
> 
> Changes in v2:
> - s/microchip,sam9x60-pictrl/microchip,sam9x60-pinctrl in patches 3/7, 5/7
> 
> Claudiu Beznea (7):
>   pinctrl: at91: add option to use drive strength bits
>   pinctrl: at91: add drive strength support for SAM9X60
>   pinctrl: at91: add compatibles for SAM9X60 pin controller
>   dt-bindings: add documentation for banks
>   dt-bindings: add bindings for SAM9X60
>   pinctrl: at91: add slewrate support for SAM9X60
>   dt-bindings: add documentation for slew rate
> 
>  .../bindings/pinctrl/atmel,at91-pinctrl.txt        |  27 ++++-
>  drivers/pinctrl/pinctrl-at91.c                     | 134 +++++++++++++++++++--
>  drivers/pinctrl/pinctrl-at91.h                     |   3 +
>  include/dt-bindings/pinctrl/at91.h                 |   4 +
>  4 files changed, 155 insertions(+), 13 deletions(-)
> 
> -- 
> 2.7.4
> 
