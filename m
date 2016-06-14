From: Rob Herring <robh@kernel.org>
Subject: Re: [v2 PATCH 3/4] Documentation: bindings: add dt documentation for
 cdn DP controller
Date: Tue, 14 Jun 2016 18:12:56 -0500
Message-ID: <20160614231256.GA17242@rob-hp-laptop>
References: <1465810789-22303-1-git-send-email-zyw@rock-chips.com>
 <1465810789-22303-4-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465810789-22303-4-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: dianders@chromium.org, tfiga@chromium.org, heiko@sntech.de, yzq@rock-chips.com, groeck@chromium.org, linux-rockchip@lists.infradead.org, Mark Yao <mark.yao@rock-chips.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 13, 2016 at 05:39:48PM +0800, Chris Zhong wrote:
> This patch adds a binding that describes the cdn DP controller for
> rk3399.
> 
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> 
> ---
> 
> Changes in v2: None
> Changes in v1:
> - add extcon node description
> - add #sound-dai-cells description
> 
>  .../bindings/display/rockchip/cdn-dp-rockchip.txt  | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
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

SoC specific compatible string please.

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

Don't need these with a single port.

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
