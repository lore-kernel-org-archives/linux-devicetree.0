From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-gx: Add canvas provider node to the vpu
Date: Tue, 15 Jan 2019 10:36:29 +0100
Message-ID: <c7502035-0986-5d7d-b2b9-a35056146310@baylibre.com>
References: <20190114162229.5412-1-mjourdan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190114162229.5412-1-mjourdan@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Jourdan <mjourdan@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14/01/2019 17:22, Maxime Jourdan wrote:
> Allows the vpu driver to optionally use a canvas provider node.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index 44c5c51ff1fa..9b0ac183ee0c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -510,6 +510,7 @@
>  			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +			amlogic,canvas = <&canvas>;
>  
>  			/* CVBS VDAC output port */
>  			cvbs_vdac_port: port@0 {
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
