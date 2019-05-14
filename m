From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: g12a: set uart_ao clocks
Date: Tue, 14 May 2019 12:22:32 +0200
Message-ID: <8e6fb5af-e158-d2a3-5c28-8360a03711db@baylibre.com>
References: <20190514094537.8765-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514094537.8765-1-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14/05/2019 11:45, Jerome Brunet wrote:
> Now that the AO clock controller is available, make the uarts of the
> always-on domain claim the appropriate peripheral clock.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index b2f08fc96568..ca01064a771a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -708,7 +708,7 @@
>  					     "amlogic,meson-ao-uart";
>  				reg = <0x0 0x3000 0x0 0x18>;
>  				interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
> -				clocks = <&xtal>, <&xtal>, <&xtal>;
> +				clocks = <&xtal>, <&clkc_AO CLKID_AO_UART>, <&xtal>;
>  				clock-names = "xtal", "pclk", "baud";
>  				status = "disabled";
>  			};
> @@ -718,7 +718,7 @@
>  					     "amlogic,meson-ao-uart";
>  				reg = <0x0 0x4000 0x0 0x18>;
>  				interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
> -				clocks = <&xtal>, <&xtal>, <&xtal>;
> +				clocks = <&xtal>, <&clkc_AO CLKID_AO_UART2>, <&xtal>;
>  				clock-names = "xtal", "pclk", "baud";
>  				status = "disabled";
>  			};
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
