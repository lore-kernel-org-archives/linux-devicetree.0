From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] dt-bindings: clock: g12a-aoclk: expose CLKID_AO_CTS_OSCIN
Date: Mon, 1 Apr 2019 10:37:09 +0200
Message-ID: <b6b984ff-6825-1e99-ff5c-9afc4258f0f7@baylibre.com>
References: <20190321092010.14382-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321092010.14382-1-narmstrong@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: jbrunet@baylibre.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 21/03/2019 10:20, Neil Armstrong wrote:
> When submitted v2 of the G12A AO-CLK IDs, the CLKID_AO_CTS_OSCIN was moved
> to the internal non-exported bindings, but this clock is necessary for
> the second AO-CEC-B module since it embeds the 32768Hz dual-divider
> clock generator unlike the AO-CEC-A module.
> 
> Export it back to the public bindings.
> 
> Fixes: be3d960b0aeb ("dt-bindings: clk: add G12A AO Clock and Reset Bindings")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/g12a-aoclk.h          | 1 -
>  include/dt-bindings/clock/g12a-aoclkc.h | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/g12a-aoclk.h b/drivers/clk/meson/g12a-aoclk.h
> index 666b4493822c..a67c8a7cd7c4 100644
> --- a/drivers/clk/meson/g12a-aoclk.h
> +++ b/drivers/clk/meson/g12a-aoclk.h
> @@ -17,7 +17,6 @@
>   * will remain defined here.
>   */
>  #define CLKID_AO_SAR_ADC_DIV	17
> -#define CLKID_AO_CTS_OSCIN	19
>  #define CLKID_AO_32K_PRE	20
>  #define CLKID_AO_32K_DIV	21
>  #define CLKID_AO_32K_SEL	22
> diff --git a/include/dt-bindings/clock/g12a-aoclkc.h b/include/dt-bindings/clock/g12a-aoclkc.h
> index 5ac66a2eee0f..e916e49ff288 100644
> --- a/include/dt-bindings/clock/g12a-aoclkc.h
> +++ b/include/dt-bindings/clock/g12a-aoclkc.h
> @@ -28,6 +28,7 @@
>  #define CLKID_AO_CLK81		15
>  #define CLKID_AO_SAR_ADC_SEL	16
>  #define CLKID_AO_SAR_ADC_CLK	18
> +#define CLKID_AO_CTS_OSCIN	19
>  #define CLKID_AO_32K		23
>  #define CLKID_AO_CEC		27
>  #define CLKID_AO_CTS_RTC_OSCIN	28
> 

Applied to next/headers for Linux 5.2-rc1
