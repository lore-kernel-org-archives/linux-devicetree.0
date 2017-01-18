From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: meson: fix uart_ao_b for GXBB and GXL/GXM
Date: Wed, 18 Jan 2017 13:40:48 -0800
Message-ID: <m2wpdsyrkv.fsf@baylibre.com>
References: <20170115222029.8271-1-martin.blumenstingl@googlemail.com>
        <20170115222029.8271-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170115222029.8271-2-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
        (Martin Blumenstingl's message of "Sun, 15 Jan 2017 23:20:28 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:

> The GXBB and GXL/GXM pinctrl drivers had a configuration which conflicts
> with uart_ao_a. According to the GXBB ("S905") datasheet the AO UART
> functions are:
> - GPIOAO_0: Func1 = UART_TX_AO_A (bit 12), Func2 = UART_TX_AO_B (bit 26)
> - GPIOAO_1: Func1 = UART_RX_AO_A (bit 11), Func2 = UART_RX_AO_B (bit 25)
> - GPIOAO_4: Func2 = UART_TX_AO_B (bit 24)
> - GPIOAO_5: Func2 = UART_RX_AO_B (bit 25)
>
> The existing definition for uart_AO_A already uses GPIOAO_0 and GPIOAO_1.
> The old definition of uart_AO_B however was broken, as it used GPIOAO_0
> for TX (which would be fine) and two pins (GPIOAO_1 and GPIOAO_5) for RX
> (which does not make any sense).
>
> This fixes the uart_AO_B configuration by moving it to GPIOAO_4 and
> GPIOAO_5 (it would be possible to use GPIOAO_0 and GPIOAO_1 in theory,
> but all existing hardware uses uart_AO_A there).
> The fix for GXBB and GXL/GXM is identical since it seems that these
> specific pins are identical on both SoC variants.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

Reviewed-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

> ---
>  drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 7 +++----
>  drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 7 +++----
>  2 files changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> index c3928aa3fefa..e0bca4df2a2f 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> @@ -253,9 +253,8 @@ static const unsigned int uart_tx_ao_a_pins[]	= { PIN(GPIOAO_0, 0) };
>  static const unsigned int uart_rx_ao_a_pins[]	= { PIN(GPIOAO_1, 0) };
>  static const unsigned int uart_cts_ao_a_pins[]	= { PIN(GPIOAO_2, 0) };
>  static const unsigned int uart_rts_ao_a_pins[]	= { PIN(GPIOAO_3, 0) };
> -static const unsigned int uart_tx_ao_b_pins[]	= { PIN(GPIOAO_0, 0) };
> -static const unsigned int uart_rx_ao_b_pins[]	= { PIN(GPIOAO_1, 0),
> -						    PIN(GPIOAO_5, 0) };
> +static const unsigned int uart_tx_ao_b_pins[]	= { PIN(GPIOAO_4, 0) };
> +static const unsigned int uart_rx_ao_b_pins[]	= { PIN(GPIOAO_5, 0) };
>  static const unsigned int uart_cts_ao_b_pins[]	= { PIN(GPIOAO_2, 0) };
>  static const unsigned int uart_rts_ao_b_pins[]	= { PIN(GPIOAO_3, 0) };
>  
> @@ -498,7 +497,7 @@ static struct meson_pmx_group meson_gxbb_aobus_groups[] = {
>  	GPIO_GROUP(GPIOAO_13, 0),
>  
>  	/* bank AO */
> -	GROUP(uart_tx_ao_b,	0,	26),
> +	GROUP(uart_tx_ao_b,	0,	24),
>  	GROUP(uart_rx_ao_b,	0,	25),
>  	GROUP(uart_tx_ao_a,	0,	12),
>  	GROUP(uart_rx_ao_a,	0,	11),
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> index 25694f7094c7..b69743b07a1d 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> @@ -214,9 +214,8 @@ static const unsigned int uart_tx_ao_a_pins[]	= { PIN(GPIOAO_0, 0) };
>  static const unsigned int uart_rx_ao_a_pins[]	= { PIN(GPIOAO_1, 0) };
>  static const unsigned int uart_cts_ao_a_pins[]	= { PIN(GPIOAO_2, 0) };
>  static const unsigned int uart_rts_ao_a_pins[]	= { PIN(GPIOAO_3, 0) };
> -static const unsigned int uart_tx_ao_b_pins[]	= { PIN(GPIOAO_0, 0) };
> -static const unsigned int uart_rx_ao_b_pins[]	= { PIN(GPIOAO_1, 0),
> -						    PIN(GPIOAO_5, 0) };
> +static const unsigned int uart_tx_ao_b_pins[]	= { PIN(GPIOAO_4, 0) };
> +static const unsigned int uart_rx_ao_b_pins[]	= { PIN(GPIOAO_5, 0) };
>  static const unsigned int uart_cts_ao_b_pins[]	= { PIN(GPIOAO_2, 0) };
>  static const unsigned int uart_rts_ao_b_pins[]	= { PIN(GPIOAO_3, 0) };
>  
> @@ -409,7 +408,7 @@ static struct meson_pmx_group meson_gxl_aobus_groups[] = {
>  	GPIO_GROUP(GPIOAO_9, 0),
>  
>  	/* bank AO */
> -	GROUP(uart_tx_ao_b,	0,	26),
> +	GROUP(uart_tx_ao_b,	0,	24),
>  	GROUP(uart_rx_ao_b,	0,	25),
>  	GROUP(uart_tx_ao_a,	0,	12),
>  	GROUP(uart_rx_ao_a,	0,	11),
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
