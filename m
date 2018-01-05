From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 3/6] ARM64: dts: meson-axg: uart: Add the clock info
 description
Date: Fri, 05 Jan 2018 11:29:23 +0100
Message-ID: <1515148163.5048.23.camel@baylibre.com>
References: <20180105095621.196472-1-yixun.lan@amlogic.com>
         <20180105095621.196472-4-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180105095621.196472-4-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2018-01-05 at 17:56 +0800, Yixun Lan wrote:
> Add the clock info description for the EE UART controller.
> 
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 9636a7c5f6ed..f6bf01cfff4b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -146,6 +146,8 @@
>  				reg = <0x0 0x24000 0x0 0x18>;
>  				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
>  				status = "disabled";
> +				clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";

This should squashed with change #1, where you remove amlogic,meson-uartcompatible. 

Otherwise uart is going to be broken between these patches.

>  			};
>  
>  			uart_B: serial@23000 {
> @@ -153,6 +155,8 @@
>  				reg = <0x0 0x23000 0x0 0x18>;
>  				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
>  				status = "disabled";
> +				clocks = <&xtal>, <&clkc CLKID_UART1>, <&xtal>;
> +				clock-names = "xtal", "pclk", "baud";
>  			};
>  		};
>  
