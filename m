From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [v1 PATCH 3/4] Documentation: bindings: add dt documentation for
 cdn DP controller
Date: Mon, 6 Jun 2016 09:28:42 -0500
Message-ID: <20160606142842.GA18768@rob-hp-laptop>
References: <1464966911-18949-1-git-send-email-zyw@rock-chips.com>
 <1464966911-18949-4-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464966911-18949-4-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 03, 2016 at 11:15:10PM +0800, Chris Zhong wrote:
> This patch adds a binding that describes the cdn DP controller for
> rk3399.
> 
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> ---
> 
> Changes in v1:
> - add extcon node description
> - add #sound-dai-cells description
> 
>  .../bindings/display/rockchip/cdn-dp-rockchip.txt  | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
> new file mode 100644
> index 0000000..4a66fc3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
> @@ -0,0 +1,62 @@
> +Rockchip RK3399 specific extensions to the cdn Display Port
> +================================
> +
> +Required properties:
> +- compatible: must be "rockchip,cdn-dp"
> +
> +- reg: physical base address of the controller and length
> +
> +- clocks: from common clock binding: handle to dp clock.
> +
> +- clock-names: from common clock binding:
> +	       Required elements: "core_clk" "pclk" "spdif"
> +
> +- rockchip,grf: this soc should set GRF regs, so need get grf here.
> +
> +- ports: contain a port nodes with endpoint definitions as defined in
> +	 Documentation/devicetree/bindings/media/video-interfaces.txt.
> +	 contained 2 endpoints, connecting to the output of vop.
> +
> +- phys: from general PHY binding: the phandle for the PHY device.
> +
> +- extcon: extcon specifier for the Power Delivery
> +
> +- #sound-dai-cells = it must be 1 if your system is using 2 DAIs: I2S, SPDIF
> +
> +-------------------------------------------------------------------------------
> +
> +Example:
> +	cdn_dp: dp@fec00000 {
> +		compatible = "rockchip,cdn-dp";
> +		reg = <0x0 0xfec00000 0x0 0x100000>;
> +		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_DP_CORE>, <&cru PCLK_DP_CTRL>,
> +			 <&cru SCLK_SPDIF_REC_DPTX>;
> +		clock-names = "core_clk", "pclk", "spdif";
> +		phys = <&tcphy0>;
> +		extcon = <&fusb1>;
> +		rockchip,grf = <&grf>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		#sound-dai-cells = <1>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +
> +			dp_in: port {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				dp_in_vopb: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&vopb_out_dp>;
> +				};
> +
> +				dp_in_vopl: endpoint@1 {
> +					reg = <1>;
> +					remote-endpoint = <&vopl_out_dp>;
> +				};
> +			};
> +		};
> +	};
> -- 
> 2.6.3
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
