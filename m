From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/3] arm64: dts: meson-gx: add video decoder entry
Date: Mon, 29 Jul 2019 15:05:20 +0200
Message-ID: <0a384af2-9c81-f798-82c0-eae07ed5981c@baylibre.com>
References: <20190726124639.7713-1-mjourdan@baylibre.com>
 <20190726124639.7713-3-mjourdan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190726124639.7713-3-mjourdan@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Jourdan <mjourdan@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 26/07/2019 14:46, Maxime Jourdan wrote:
> Add the base video decoder node compatible with the meson vdec driver,
> for GX* chips.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index 74d03fc706be..86e26ed551e0 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -437,6 +437,20 @@
>  			};
>  		};
>  
> +		vdec: video-codec@c8820000 {
> +			compatible = "amlogic,gx-vdec";
> +			reg = <0x0 0xc8820000 0x0 0x10000>,
> +			      <0x0 0xc110a580 0x0 0xe4>;
> +			reg-names = "dos", "esparser";
> +
> +			interrupts = <GIC_SPI 44 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "vdec", "esparser";
> +
> +			amlogic,ao-sysctrl = <&sysctrl_AO>;
> +			amlogic,canvas = <&canvas>;
> +		};
> +
>  		periphs: periphs@c8834000 {
>  			compatible = "simple-bus";
>  			reg = <0x0 0xc8834000 0x0 0x2000>;
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
