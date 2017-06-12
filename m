From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 04/13] clk: meson8b: export the USB clocks
Date: Mon, 12 Jun 2017 09:28:32 +0200
Message-ID: <9e75716b-eb9e-0086-5378-69c5542e7a7a@baylibre.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170611101644.28581-5-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170611101644.28581-5-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/11/2017 12:16 PM, Martin Blumenstingl wrote:
> Export the USB related clocks (for the USB controller and the USB2 PHYs)
> so they can be used in the dt-bindings.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  drivers/clk/meson/meson8b.h              | 10 +++++-----
>  include/dt-bindings/clock/meson8b-clkc.h |  5 +++++
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
> index 51c3f6717180..17479c60864d 100644
> --- a/drivers/clk/meson/meson8b.h
> +++ b/drivers/clk/meson/meson8b.h
> @@ -114,12 +114,12 @@
>  #define CLKID_AIU		47
>  #define CLKID_UART1		48
>  #define CLKID_G2D		49
> -#define CLKID_USB0		50
> -#define CLKID_USB1		51
> +/* #define CLKID_USB0 */
> +/* #define CLKID_USB1 */
>  #define CLKID_RESET		52
>  #define CLKID_NAND		53
>  #define CLKID_DOS_PARSER	54
> -#define CLKID_USB		55
> +/* #define CLKID_USB */
>  #define CLKID_VDIN1		56
>  #define CLKID_AHB_ARB0		57
>  #define CLKID_EFUSE		58
> @@ -128,8 +128,8 @@
>  #define CLKID_AHB_CTRL_BUS	61
>  #define CLKID_HDMI_INTR_SYNC	62
>  #define CLKID_HDMI_PCLK		63
> -#define CLKID_USB1_DDR_BRIDGE	64
> -#define CLKID_USB0_DDR_BRIDGE	65
> +/* CLKID_USB1_DDR_BRIDGE */
> +/* CLKID_USB0_DDR_BRIDGE */
>  #define CLKID_MMC_PCLK		66
>  #define CLKID_DVIN		67
>  #define CLKID_UART2		68
> diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
> index f004e6760b5d..04f0d1fcd308 100644
> --- a/include/dt-bindings/clock/meson8b-clkc.h
> +++ b/include/dt-bindings/clock/meson8b-clkc.h
> @@ -24,6 +24,11 @@
>  #define CLKID_SAR_ADC		23
>  #define CLKID_RNG0		25
>  #define CLKID_SDIO		30
> +#define CLKID_USB0		50
> +#define CLKID_USB1		51
> +#define CLKID_USB		55
> +#define CLKID_USB1_DDR_BRIDGE	64
> +#define CLKID_USB0_DDR_BRIDGE	65
>  #define CLKID_SANA		69
>  
>  #endif /* __MESON8B_CLKC_H */
> 


Acked-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
