From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 4/5] arm64: dts: rockchip: add rk3399 mipi nodes
Date: Sun, 06 Aug 2017 15:55:50 +0200
Message-ID: <1762581.zRg8RSfhNk@phil>
References: <1500301019-9960-1-git-send-email-jacob-chen@iotwrt.com> <1500301019-9960-5-git-send-email-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500301019-9960-5-git-send-email-jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, 17. Juli 2017, 22:16:58 CEST schrieb Jacob Chen:
> Add an mipi node, and also add mipi endpoints to vopb and vopl
> output port nodes.
> 
> Signed-off-by: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 44 ++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index c0371af..5c5c9d9 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -1475,6 +1475,11 @@
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  
> +			vopl_out_mipi: endpoint@0 {
> +				reg = <0>;
> +				remote-endpoint = <&mipi_in_vopl>;
> +			};
> +
>  			vopl_out_edp: endpoint@1 {
>  				reg = <1>;
>  				remote-endpoint = <&edp_in_vopl>;
> @@ -1516,6 +1521,11 @@
>  				remote-endpoint = <&edp_in_vopb>;
>  			};
>  
> +			vopb_out_mipi: endpoint@1 {
> +				reg = <1>;
> +				remote-endpoint = <&mipi_in_vopb>;
> +			};
> +
>  		};
>  	};
>  
> @@ -1531,6 +1541,40 @@
>  		status = "disabled";
>  	};
>  
> +	mipi_dsi: mipi@ff960000 {
> +		compatible = "rockchip,rk3399-mipi-dsi", "snps,dw-mipi-dsi";
> +		reg = <0x0 0xff960000 0x0 0x8000>;
> +		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru SCLK_MIPIDPHY_REF>, <&cru PCLK_MIPI_DSI0>,
> +			 <&cru SCLK_DPHY_TX0_CFG>;
> +		clock-names = "ref", "pclk", "phy_cfg";
> +		power-domains = <&power RK3399_PD_VIO>;
> +		rockchip,grf = <&grf>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;

I've dropped these, as the ports node does not need a regs property.
Similar to edp and hdmi.

> +		status = "disabled";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;

dropped this reg as well - see above

and applied the rest for 4.14


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
