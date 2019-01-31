From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH 5/7] dt-bindings: add bindings for SAM9X60
Date: Thu, 31 Jan 2019 13:36:30 +0100
Message-ID: <20190131123630.opxm5saomkp3b55h@M43218.corp.atmel.com>
References: <1548937733-20189-1-git-send-email-claudiu.beznea@microchip.com>
 <1548937733-20189-6-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548937733-20189-6-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu Beznea - M18063 <Claudiu.Beznea@microchip.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Nicolas Ferre - M43238 <Nicolas.Ferre@microchip.com>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 31, 2019 at 01:29:40PM +0100, Claudiu Beznea - M18063 wrote:
> From: Claudiu Beznea <claudiu.beznea@microchip.com>
> 
> Add device tree binding for SAM9X60 pin controller.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
> index 40e33dfc36fd..c2d51ed86d47 100644
> --- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
> @@ -19,7 +19,7 @@ such as pull-up, multi drive, etc.
>  
>  Required properties for iomux controller:
>  - compatible: "atmel,at91rm9200-pinctrl" or "atmel,at91sam9x5-pinctrl"
> -		or "atmel,sama5d3-pinctrl"
> +		or "atmel,sama5d3-pinctrl" or "microchip,sam9x60-pictrl"

Typo s/microchip,sam9x60-pictrl/microchip,sam9x60-pinctrl

>  - atmel,mux-mask: array of mask (periph per bank) to describe if a pin can be
>    configured in this periph mode. All the periph and bank need to be describe.
>  
> @@ -117,7 +117,8 @@ Some requirements for using atmel,at91rm9200-pinctrl binding:
>  4. The gpio controller must be describe in the pinctrl simple-bus.
>  
>  For each bank the required properties are:
> -- compatible: "atmel,at91sam9x5-gpio" or "atmel,at91rm9200-gpio"
> +- compatible: "atmel,at91sam9x5-gpio" or "atmel,at91rm9200-gpio" or
> +  "microchip,sam9x60-gpio"
>  - reg: physical base address and length of the controller's registers
>  - interrupts: interrupt outputs from the controller
>  - interrupt-controller: marks the device node as an interrupt controller
> -- 
> 2.7.4
> 
