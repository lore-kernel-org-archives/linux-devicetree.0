From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH 3/7] pinctrl: at91: add compatibles for SAM9X60 pin
 controller
Date: Thu, 31 Jan 2019 13:33:10 +0100
Message-ID: <20190131123310.wwikkuiniqlcg445@M43218.corp.atmel.com>
References: <1548937733-20189-1-git-send-email-claudiu.beznea@microchip.com>
 <1548937733-20189-4-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548937733-20189-4-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu Beznea - M18063 <Claudiu.Beznea@microchip.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Nicolas Ferre - M43238 <Nicolas.Ferre@microchip.com>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 31, 2019 at 01:29:33PM +0100, Claudiu Beznea - M18063 wrote:
> From: Claudiu Beznea <claudiu.beznea@microchip.com>
> 
> Add compatibles for SAM9X60 pin controller.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  drivers/pinctrl/pinctrl-at91.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> index 46443b97d811..5456a2692b8c 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -1215,6 +1215,7 @@ static const struct of_device_id at91_pinctrl_of_match[] = {
>  	{ .compatible = "atmel,sama5d3-pinctrl", .data = &sama5d3_ops },
>  	{ .compatible = "atmel,at91sam9x5-pinctrl", .data = &at91sam9x5_ops },
>  	{ .compatible = "atmel,at91rm9200-pinctrl", .data = &at91rm9200_ops },
> +	{ .compatible = "microchip,sam9x60-pictrl", .data = &sam9x60_ops },

Typo s/microchip,sam9x60-pictrl/microchip,sam9x60-pinctrl

>  	{ /* sentinel */ }
>  };
>  
> @@ -1757,6 +1758,7 @@ static const struct gpio_chip at91_gpio_template = {
>  static const struct of_device_id at91_gpio_of_match[] = {
>  	{ .compatible = "atmel,at91sam9x5-gpio", .data = &at91sam9x5_ops, },
>  	{ .compatible = "atmel,at91rm9200-gpio", .data = &at91rm9200_ops },
> +	{ .compatible = "microchip,sam9x60-gpio", .data = &sam9x60_ops },
>  	{ /* sentinel */ }
>  };
>  
> -- 
> 2.7.4
> 
