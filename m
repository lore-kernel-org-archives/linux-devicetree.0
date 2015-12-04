From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 1/2] dt-bindings: GPIO: Add gpio-initval
Date: Fri, 04 Dec 2015 17:39:40 +0100
Message-ID: <1449247180.3451.22.camel@pengutronix.de>
References: <1449234388-4007-1-git-send-email-mpa@pengutronix.de>
	 <1449234388-4007-2-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1449234388-4007-2-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel@pengutronix.de, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Freitag, den 04.12.2015, 14:06 +0100 schrieb Markus Pargmann:
> Add a binding for GPIO initialization.
> 
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

Both patches
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

small nitpick:

> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt | 34 ++++++++++++++++---------
>  1 file changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index 069cdf6f9dac..d11abfa13add 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -155,29 +155,39 @@ gpio-controller@00000000 {
>  	ngpios = <18>;
>  }
>  
> -The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
> -providing automatic GPIO request and configuration as part of the
> -gpio-controller's driver probe function.
> +The GPIO chip may contain GPIO definitions. These define properties for single
> +GPIOs of this controller.
>  
> -Each GPIO hog definition is represented as a child node of the GPIO controller.
> +There are two types of GPIO definitions:
> +
> +- GPIO hogging is a mechanism providing automatic GPIO request and
> +  configuration as part of the gpio-controller driver's probe function. The
> +  GPIO is held until the gpio-controller is removed.
> +- GPIO initialization provides an automatic initialization to known save

safe

regards
Philipp

