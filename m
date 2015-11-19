From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 08/12] Documentation: dt-bindings: Add bindings for
 rk3288 DW MIPI DSI driver
Date: Thu, 19 Nov 2015 11:19:03 -0600
Message-ID: <20151119171903.GA16682@rob-hp-laptop>
References: <1447904131-29328-1-git-send-email-zyw@rock-chips.com>
 <1447904131-29328-9-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447904131-29328-9-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 19, 2015 at 11:35:26AM +0800, Chris Zhong wrote:
> add device tree bindings for rk3288 specific Synopsys DW MIPI DSI driver
> 
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> 
> ---
> 
> Changes in v3:
> move dw_mipi_dsi_rockchip.txt to bindings/display/rockchip/
> 
> Changes in v2: None
> 
>  .../display/rockchip/dw_mipi_dsi_rockchip.txt      | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
> new file mode 100644
> index 0000000..acd9ec9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
> @@ -0,0 +1,56 @@
> +Rockchip specific extensions to the Synopsys Designware MIPI DSI
> +================================
> +
> +Required properties:
> +- compatible: "rockchip,rk3288-mipi-dsi", "snps,dw-mipi-dsi".
> +- rockchip,grf: this soc should set GRF regs to mux vopl/vopb.
> +- ports: contain a port node with endpoint definitions as defined in [1].
> +  For vopb,set the reg = <0> and set the reg = <1> for vopl.
> +
> +For more required properties, please refer to [2].
> +
> +[1] Documentation/devicetree/bindings/media/video-interfaces.txt
> +[2] Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
> +
> +Example:
> +	mipi_dsi: mipi@ff960000 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "rockchip,rk3288-mipi-dsi", "snps,dw-mipi-dsi";
> +		reg = <0xff960000 0x4000>;
> +		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_MIPI_24M>, <&cru PCLK_MIPI_DSI0>;
> +		clock-names = "ref", "pclk";
> +		rockchip,grf = <&grf>;
> +		status = "okay";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +
> +			mipi_in: port {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				mipi_in_vopb: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&vopb_out_mipi>;
> +				};
> +				mipi_in_vopl: endpoint@1 {
> +					reg = <1>;
> +					remote-endpoint = <&vopl_out_mipi>;
> +				};
> +			};
> +		};
> +
> +		panel {
> +			compatible ="boe,tv080wum-nl0";
> +			reg = <0>;
> +
> +			enable-gpios = <&gpio7 3 GPIO_ACTIVE_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&lcd_en>;
> +			backlight = <&backlight>;
> +			status = "okay";
> +		};
> +	};
> -- 
> 2.6.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
