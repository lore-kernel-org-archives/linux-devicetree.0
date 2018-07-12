From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH] ARM: dts: at91: fix typo for PIN_PB22
Date: Thu, 12 Jul 2018 08:30:21 +0200
Message-ID: <20180712063021.h7t424iksdulj74a@M43218.corp.atmel.com>
References: <1531326337-15504-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531326337-15504-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Claudiu,

On Wed, Jul 11, 2018 at 07:25:37PM +0300, Claudiu Beznea wrote:
> Fix typo for PIN_PB22 on TD function.

In fact, this typo is present in several places in this file. It could
be worth fixing all those occurences in a single patch.

Regards

Ludovic

> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  arch/arm/boot/dts/sama5d2-pinfunc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/sama5d2-pinfunc.h b/arch/arm/boot/dts/sama5d2-pinfunc.h
> index e57191fb83de..ac61491c9d7f 100644
> --- a/arch/arm/boot/dts/sama5d2-pinfunc.h
> +++ b/arch/arm/boot/dts/sama5d2-pinfunc.h
> @@ -375,7 +375,7 @@
>  #define PIN_PB22__GPIO			PINMUX_PIN(PIN_PB22, 0, 0)
>  #define PIN_PB22__LCDDAT11		PINMUX_PIN(PIN_PB22, 1, 1)
>  #define PIN_PB22__A11			PINMUX_PIN(PIN_PB22, 2, 1)
> -#define PIN_PB22__TDO			PINMUX_PIN(PIN_PB22, 3, 1)
> +#define PIN_PB22__TD0			PINMUX_PIN(PIN_PB22, 3, 1)
>  #define PIN_PB22__TIOA2			PINMUX_PIN(PIN_PB22, 4, 2)
>  #define PIN_PB22__FLEXCOM3_IO1		PINMUX_PIN(PIN_PB22, 5, 3)
>  #define PIN_PB22__GMDC			PINMUX_PIN(PIN_PB22, 6, 3)
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
