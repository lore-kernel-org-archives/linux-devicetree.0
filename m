From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 2/6] ARM64: dts: meson-axg: uart: fix address space range
Date: Fri, 05 Jan 2018 11:30:07 +0100
Message-ID: <1515148207.5048.24.camel@baylibre.com>
References: <20180105095621.196472-1-yixun.lan@amlogic.com>
         <20180105095621.196472-3-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180105095621.196472-3-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2018-01-05 at 17:56 +0800, Yixun Lan wrote:
> The address space range is actually 0x18, fixed here.

Isn't it the same for other meson SoC ? If they are compatible, it should.
Could you please re-submit this change addressing all the required platforms ?

> 
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 1c6002b3fe34..9636a7c5f6ed 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -143,14 +143,14 @@
>  
>  			uart_A: serial@24000 {
>  				compatible = "amlogic,meson-gx-uart";
> -				reg = <0x0 0x24000 0x0 0x14>;
> +				reg = <0x0 0x24000 0x0 0x18>;
>  				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
>  				status = "disabled";
>  			};
>  
>  			uart_B: serial@23000 {
>  				compatible = "amlogic,meson-gx-uart";
> -				reg = <0x0 0x23000 0x0 0x14>;
> +				reg = <0x0 0x23000 0x0 0x18>;
>  				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
>  				status = "disabled";
>  			};
